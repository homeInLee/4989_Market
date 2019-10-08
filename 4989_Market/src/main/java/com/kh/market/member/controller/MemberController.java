package com.kh.market.member.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import com.kh.market.common.model.vo.Paging;
import com.kh.market.member.model.service.MemberService;
import com.kh.market.member.model.vo.Member;
import com.kh.market.message.model.service.MessageService;


@Controller
@RequestMapping("/member")
@SessionAttributes(names= "memberLoggedIn")
public class MemberController {
	@Autowired
	MemberService memberService;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	@Autowired
	MessageService messageService;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	@RequestMapping("/memberEnroll.do")
	public void memberEnroll() {
		logger.debug("회원가입 페이지");
		//member/memberEnroll -> ViewNameTranslator view단을 자동으로 찾음.
	}
	@RequestMapping("memberEnrollEnd.do")
	public String memberEnrollEnd(@RequestParam String sido, @RequestParam String gugun,Member member, Model model) {
		
		logger.debug("회원가입 처리요청");
		//0.비밀번호 암호화
		String rawPassword = member.getMemberPassword();
		logger.debug("암호화전: "+rawPassword);
		String encodedPassword = passwordEncoder.encode(rawPassword);
		logger.debug("암호화전: "+encodedPassword);
		//member객체 대임
		member.setMemberPassword(encodedPassword);
		member.setMemberAddress(sido+" "+gugun+" "+member.getMemberAddress());
		int	result = memberService.insertMember(member);
        model.addAttribute("msg", result>0?"회원가입성공":"회원가입실패");
        model.addAttribute("loc", "/");
		//2.view단처리
		
		return "common/msg";
	}
	@RequestMapping(value="/memberLogin.do", method=RequestMethod.POST)
	public ModelAndView memberLogin(@RequestParam String memberId, @RequestParam String password, ModelAndView mav, HttpServletRequest request) {
		logger.info("로그인 요청");
		logger.info(passwordEncoder.encode(password));
		//1.업무로직: 회원정보 가져오기
		Member member = memberService.selectOneMember(memberId);
		String referer = request.getHeader("referer");
		String origin = request.getHeader("Origin");
		String url = request.getRequestURL().toString();
		String uri = request.getRequestURI();
		int idx = referer.indexOf(request.getContextPath())+request.getContextPath().length();
		String loc = referer.substring(idx);
		
		logger.info("loc="+loc);
		
		String msg = "";
		//아이디가 존재하지 않는 경우
		if(member == null) {
			msg = "아이디가 존재하지 않습니다.";
		}
		else if(member.getMemberDeltype().equals("Y")) {
			msg = "삭제된 아이디 입니다.";
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
		mav.addObject("loc",loc);
		mav.setViewName("common/msg");
		return mav;
	}
	@RequestMapping(value="/memberLogout.do",method=RequestMethod.GET)
	public String memberLogout(SessionStatus sessionStatus, HttpServletRequest request) {
		logger.debug("로그아웃 요청");
		if(!sessionStatus.isComplete())
			sessionStatus.setComplete();
		String referer = request.getHeader("referer");
		String origin = request.getHeader("Origin");
		String url = request.getRequestURL().toString();
		String uri = request.getRequestURI();
		int idx = referer.indexOf(request.getContextPath())+request.getContextPath().length();
		String loc = referer.substring(idx);
		logger.info("referer="+referer);
		logger.info("origin="+origin);
		logger.info("url="+url);
		logger.info("uri="+uri);
		logger.info("idx="+idx);
		logger.info("loc="+loc);
		
		return "redirect:"+loc;
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
	public String memberView(@RequestParam String memberId,Model model) {
			logger.info("memberId"+memberId);
			Member member = memberService.selectOneMember(memberId);			
			model.addAttribute("member", member);
			return "member/memberView";
	}

	@RequestMapping("/memberUpdate.do")
	public String memberUpdate(@RequestParam String memberId, Model model) {
		logger.debug("회원수정 요청");
		Member member = memberService.selectOneMember(memberId);
		model.addAttribute("member", member);
		return "member/memberUpdate";
	}
	@RequestMapping(value="memberUpdateEnd.do",method=RequestMethod.POST)
	public String memberUpdateEnd(Member member, Model model, @RequestParam("loginId") String loginId) {
		logger.info("member="+member);
		Member memberLoggedIn = memberService.selectOneMember(loginId);
		logger.info("memberLoggedIn="+memberLoggedIn);
		int result = 0;
		if(member.getMemberId().equals(memberLoggedIn.getMemberId()) || memberLoggedIn.getMemberId().equals("admin")) {
			result = memberService.memberUpdate(member);			
		}
		model.addAttribute("msg", result>0?"성공적으로 변경되었습니다.":"변경이 실패하였습니다.");
		model.addAttribute("loc", "/member/memberView.do?memberId="+member.getMemberId());
		model.addAttribute("memberLoggedIn", memberLoggedIn);
		logger.info("memberLoggedIn="+memberLoggedIn);
		return "common/msg";
	}
	@RequestMapping(value="memberDelete.do", method={RequestMethod.POST})
	public String memberDelete(SessionStatus sessionStatus, Model model, @RequestParam("loginId") String loginId, @RequestParam String memberId) {
		Member memberLoggedIn = memberService.selectOneMember(loginId);
		Member member = memberService.selectOneMember(memberId);
		int result = 0;
		if(member.getMemberId().equals(memberLoggedIn.getMemberId()) || memberLoggedIn.getMemberId().equals("admin")) {
			if(member.getMemberDeltype().equals("N")) {
				result = memberService.memberDelete(member);							
				model.addAttribute("msg", result>0?"성공적으로 삭제되었습니다.":"삭제가 실패하였습니다.");
			}
			else {
				result = memberService.memberDeleteCancle(member);
				model.addAttribute("msg", result>0?"성공적으로 복구되었습니다.":"복구가 실패하였습니다.");
			}
		}
		if(!memberLoggedIn.getMemberId().equals("admin")) {
			if(result>0) {
				if(!sessionStatus.isComplete())
					sessionStatus.setComplete();								
				model.addAttribute("loc", result>0?"/":"/member/memberView.do?memberId="+member.getMemberId());			
			}
			model.addAttribute("loc","/member/memberView.do?memberId="+member.getMemberId());			
		}
		else {
			model.addAttribute("loc", "/member/memberView.do?memberId="+member.getMemberId());
		}
		logger.info("memberLoggedIn.getMemberId()="+memberLoggedIn.getMemberId());
		logger.info("member.getMemberId()="+member.getMemberId());
		model.addAttribute("memberLoggedIn", memberLoggedIn);
		return "common/msg";
	}
	
	@ResponseBody
	@RequestMapping("/editAddressEnd.do")
	public int editAddressEnd(@RequestParam String memberId,
					 			 @RequestParam String address,
					 			 Model model
								) {
		logger.info("실행되었다");
		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberAddress(address);
		logger.info(memberId);
		logger.info(address);
		
		int result = memberService.updateAddress(m);
		
		
		logger.info("result= {}",result);
		
		
		
		return result;
	}
	
	@RequestMapping("/memberList.do")
	public String memberList(Model model, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) {
		int listCnt = memberService.memberListCnt();
		Paging paging = new Paging();
		paging.pageInfo(page, range, listCnt);
		List<Member> mList = memberService.memberList(paging);
        model.addAttribute("paging", paging);
		model.addAttribute("mList", mList);
		return "member/memberList";
	}
}










