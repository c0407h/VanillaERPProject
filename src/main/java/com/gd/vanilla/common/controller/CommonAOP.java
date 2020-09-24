package com.gd.vanilla.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

@Aspect
public class CommonAOP {

	/*
	 * Pointcut : loginCheckAop
	 * 범위 : 모든 컨트롤러에서 로그인, 로그아웃과 Ajax제외
	 * 용도 : 비로그인 시 접근불가
	 */
	@Pointcut("execution(* com.gd.vanilla..*Controller.*(..))"
			+ "&&!execution(* com.gd.vanilla..*Controller.common*(..))"
			+ "&&!execution(* com.gd.vanilla..*Controller.*Ajax*(..))")
	public void loginCheckAOP() {}
	
	@Around("loginCheckAOP()")
	public ModelAndView loginCheckAOP(ProceedingJoinPoint joinPoint) throws Throwable {
		ModelAndView mav = new ModelAndView();
		
		//Request 객체 취득
		HttpServletRequest request
			= ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		//Session 취득
		HttpSession session = request.getSession();
		
		if(session.getAttribute("sEmplyNo") != null) {
			mav = (ModelAndView) joinPoint.proceed(); //기존 이벤트 처리 행위를 이어서 진행
		} else {
			mav.setViewName("redirect:login");
		}
		
		return mav;
	}
	
}












