package com.kh.market.common.aop;

import java.util.Map;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.member.model.vo.Member;

@Component
@Aspect
public class LoginLoggerAspect {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Pointcut("execution(* com.kh.spring.member..*memberLogin(..))")
	public void pointcut() {}
	
	@AfterReturning(pointcut="pointcut()", returning="returnObj")
	public void advice(JoinPoint joinPoint, Object returnObj) {
		logger.debug("returnObj={}",returnObj);
		//returnObj=ModelAndView: reference to view with name 'common/msg'; model is 
//		{memberLoggedIn=Member [memberId=abcde, password=$2a$10$5h/Vbz/nVT5DgnNd/Y78GOy5iLLgIKXmyNI0nf2oPauJ5vEfTsHTS, memberName=아무개, gender=M, age=25, email=abcde@naver.com, phone=01012341234, address=서울시 강남구, hobby=[운동, 등산, 독서], enrollDate=2019-08-30], 
//		msg=로그인 성공!, loc=/}
		
		ModelAndView mav = (ModelAndView)returnObj;
		Map<String, Object> model = mav.getModel();
		if(model.containsKey("memberLoggedIn")) {
			Member memberLoggedIn = (Member)model.get("memberLoggedIn");
			logger.info("[{}]이 로그인 하셨습니다.", memberLoggedIn.getMemberId());
		}
	}
}
