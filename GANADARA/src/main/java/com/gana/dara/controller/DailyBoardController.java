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
		
		// ������ �� ����� �۾��� �������� �Ѿ�� ���� ���� ����� ���� �������� �Ѿ��
		/* MemberDto login = (MemberDto)session.getAttribute("login");
		   String member_daily = login.getMember_daily();
		   if(member_daily.equals("Y")){
		      return "dailyinsert";   //? �̰� �´��� �𸣰ڴ�. 
		   else{
		   // alert â���� ����������-���� �������� ���� �ϱ�!
		   	  return "<script>alert(\"���� �������ּ���!Please, You have to pay first.\"); 
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
