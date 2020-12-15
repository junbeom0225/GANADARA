package com.gana.dara.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gana.dara.biz.DailyBoardReplyBiz;
import com.gana.dara.biz.DailyBoardBiz;
import com.gana.dara.dto.DailyBoardDto;
import com.gana.dara.dto.MentoAnswerDto;

@Controller
public class DailyBoardController {

	@Autowired
	private DailyBoardBiz dailybiz;
	
	@Autowired
	private DailyBoardReplyBiz replybiz;
	
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
	
	@RequestMapping("/insertres.do")
	public String insertres(DailyBoardDto dto) {
		int res = dailybiz.insert(dto);
		if(res>0) {
			return "redirect:list.do";
		}
		return "redirect:insertform.do";
	}
	
	@RequestMapping("/detail.do")
	public String detail(int db_no,int member_no, Model model) {
		/*if(member_no == login.member_no)
		
		*/
		model.addAttribute("dbdto", dailybiz.selectOne(db_no));
	
		return "dailydetail";
	}
	
	@RequestMapping("/updateform.do")
	public String updateForm(Model model, int db_no) {
		model.addAttribute("dbdto", dailybiz.    selectOne(db_no));
		
		return "dailyupdate";
	}
	@RequestMapping("/updateres.do")
	public String updatRes(DailyBoardDto dbdto) {
		int res = dailybiz.update(dbdto);
		if(res>0) {
			return "redirect:detail.do?db_no="+dbdto.getDb_no();
		}
		return "redirect:updateform.do?db_no="+dbdto.getDb_no();
	}
	@RequestMapping("/delete.do")
	public String delete(int db_no) {
		int res = dailybiz.delete(db_no);
		if(res>0) {
			return "redirect:list.do";
		}
		return "redirect:detail.do?db_no="+db_no;
	}
	
	
	
/*	
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter(); 							
		String res = "<script>alert('"+msg+"'); location.href='"+url+"';</script>";
		
		out.print(res);
	}
	*/
}
