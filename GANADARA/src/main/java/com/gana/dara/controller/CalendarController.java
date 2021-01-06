package com.gana.dara.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gana.dara.biz.CalBiz;
import com.gana.dara.dto.CalDto;
import com.gana.dara.dto.MemberDto;

@Controller
public class CalendarController {
	@Autowired
	private CalBiz biz;
	
	
	@RequestMapping("/calendar.do")
	public String Calendar(Model model, int member_no, HttpSession session) {
		
		MemberDto dto = (MemberDto)session.getAttribute("login");
		if (dto == null) {
			return "redirect:/login.do";
		}
		
		model.addAttribute("list", biz.CalList(member_no));
		//model.addAttribute("member_no", member_no);
		
		return "student_calendar";
	}
	@RequestMapping("/calpop.do")
	public String Calpop(Model model, int member_no) {
		model.addAttribute("member_no", member_no);

		
		return "Calpopup";
	}

	@ResponseBody
	@RequestMapping(value ="/scheduleinsert.do", method= RequestMethod.POST)
	public Map<Object, Object> scheduleInsert(@RequestBody CalDto dto) throws Exception{
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		biz.insert(dto);
		
		return map;
	}
	@RequestMapping("caldelete.do")
	public String CalDelete(Model model,int member_no) {
		model.addAttribute("list", biz.CalList(member_no));
		
		return "caldelete";
	}
	
	@ResponseBody
	@RequestMapping("/calbutton.do")
	public Map<Object, Object> caldelete(@RequestParam("calno") int calno) throws Exception{
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		biz.delete(calno);
		System.out.println(calno);
		return map;
	}
	
	
}
