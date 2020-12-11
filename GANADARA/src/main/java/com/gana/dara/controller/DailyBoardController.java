package com.gana.dara.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gana.dara.biz.DailyBoardBiz;

@Controller
public class DailyBoardController {

	@Autowired
	private DailyBoardBiz dailybiz;
	
	@RequestMapping("/list.do")
	public String selectList(Model model) {
		
		model.addAttribute("list", dailybiz.selectList());
		
		return "dailyboard";
	}
	
	@RequestMapping("/insertform.do")
	public String insertform() {
		
		// 결제를 한 사람만 글쓰기 페이지로 넘어가고 결제 안한 사람은 결제 페이지로 넘어가기
		/* MemberDto login = (MemberDto)session.getAttribute("login");
		   String member_daily = login.getMember_daily();
		   if(member_daily.equals("Y")){
		      return "dailyinsert";   //? 이게 맞는지 모르겠다. 
		   else{
		   // alert 창띄우고 마이페이지-결제 페이지로 가게 하기!
		   	  return "<script>alert(\"먼저 결제해주세요!Please, You have to pay first.\"); 
		   	  			+"location.href=\"/pay.do\";</script>"; 
		*/
		return "dailyinsert";
	}
/*	
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter(); 							
		String res = "<script>alert('"+msg+"'); location.href='"+url+"';</script>";
		
		out.print(res);
	}
	*/
}
