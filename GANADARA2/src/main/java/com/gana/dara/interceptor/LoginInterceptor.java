package com.gana.dara.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.gana.dara.dto.MemberDto;



public class LoginInterceptor extends HandlerInterceptorAdapter {

	//preHandle -> 컨트롤러 실행 전에 실행
	//postHandle -> 컨트롤러 실행 후에 실행
 @Override
 public boolean preHandle(HttpServletRequest req,
    HttpServletResponse res, Object obj) throws Exception {
  
	 HttpSession session = req.getSession();
	 MemberDto member = (MemberDto)session.getAttribute("member");
  
  //로그인하지 않았거나 member_role이 User인 계정이 관리자 페이지에 접근하려고 하면 로그인 창으로 이동
  
  if(member == null || member.getMember_role() == "USER") {
   res.sendRedirect("/login.do");
   return false;
  }
  
  return true;
 }
 
 // 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
 @Override
 public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
         ModelAndView modelAndView) throws Exception {
     super.postHandle(request, response, handler, modelAndView);
 }     
}