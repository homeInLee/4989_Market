package com.kh.market.member.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.member.model.vo.Member;
import com.kh.market.member.model.service.MemberService;


@Controller
@RequestMapping("/member")
@SessionAttributes("memberLoggedIn")
public class MemberController {
	@Autowired
	MemberService memberService;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	@RequestMapping("/memberEnroll.do")
	public void memberEnroll() {
		logger.debug("회원가입 페이지");
		//member/memberEnroll -> ViewNameTranslator view단을 자동으로 찾음.
	}
	@RequestMapping("memberEnrollEnd.do")
	public String memberEnrollEnd(Member member, Model model) {
		
		logger.debug("회원가입 처리요청");
		//0.비밀번호 암호화
		String rawPassword = member.getMemberPassword();
		logger.debug("암호화전: "+rawPassword);
		String encodedPassword = passwordEncoder.encode(rawPassword);
		logger.debug("암호화전: "+encodedPassword);
		//member객체 대임
		member.setMemberPassword(encodedPassword);
		
		//1.비지니스로직
		int result = memberService.insertMember(member);
		//2.view단처리
		model.addAttribute("msg", result>0?"회원가입성공":"회원가입실패");
		model.addAttribute("loc", "/");
		
		return "common/msg";
	}
	@RequestMapping(value="/memberLogin.do", method=RequestMethod.POST)
	public ModelAndView memberLogin(@RequestParam String memberId, @RequestParam String password, ModelAndView mav) {
		logger.debug("로그인 요청");
		logger.debug(passwordEncoder.encode(password));
		//1.업무로직: 회원정보 가져오기
		Member member = memberService.selectOneMember(memberId);
		String msg = "";
		//아이디가 존재하지 않는 경우
		if(member == null) {
			msg = "아이디가 존재하지 않습니다.";
		}
		else {
			//2.로그인성공
			if(passwordEncoder.matches(password, member.getMemberPassword())) {
				msg = "로그인 성공!";
				//memberLoggedIn 세션 속성에 지정
				//model에 지정된 속성은 requestScope속성에 담김
				mav.addObject("memberLoggedIn", member);
			}
			//3.비밀번호가 틀린 경우
			else {
				msg = "비밀번호가 일치하지 않습니다.";
			}
		}
		mav.addObject("msg",msg);
		mav.addObject("loc","/");
		mav.setViewName("common/msg");
		return mav;
	}
	@RequestMapping("/memberLogout.do")
	public String memberLogout(SessionStatus sessionStatus) {
		logger.debug("로그아웃 요청");
		if(!sessionStatus.isComplete())
			sessionStatus.setComplete();
		
		
		return "redirect:/";
	}
	@ResponseBody
	@RequestMapping("/checkIdDuplicate.do")
	public Map<String,Object> checkIdDuplicate(@RequestParam String memberId, @ModelAttribute("memberLoggedIn") Member memberLoggedIn) {
		logger.debug("id중복체크:@ResponseBody이용방식");
		
		boolean isUsable = memberService.selectOneMember(memberId)==null?true:false;
		Map<String, Object> map = new HashMap<>();
		map.put("isUsable",isUsable);
		map.put("hello", new Date());
		map.put("memberLoggedIn", memberLoggedIn);
		return map;
	}
	@RequestMapping("/memberView.do")
	public ModelAndView memberView(@RequestParam String memberId,ModelAndView mav) {
		mav.addObject("memberId",memberId);
		mav.setViewName("review/reviewMain");
		return mav;
	}
	
	
}
