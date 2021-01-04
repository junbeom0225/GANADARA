package com.gana.dara.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gana.dara.biz.EduBiz;
import com.gana.dara.dto.EduDto;
import com.gana.dara.dto.MemberDto;

@Controller
public class EduController {
	
	@Autowired
	private EduBiz biz;

	
	@RequestMapping("eduPractice.do")
	public String eduPractice(HttpSession session) {
		MemberDto dto = (MemberDto)session.getAttribute("login");
		if (dto == null) {
			return "redirect:/login.do";
		}
		
		return "edupractice";
	}
	@RequestMapping("eduhome.do")
	public String eduhome(HttpSession session) {
		MemberDto dto = (MemberDto)session.getAttribute("login");
		if (dto == null) {
			return "redirect:/login.do";
		}
		
		return "eduhome";
	}
	@RequestMapping("eduDetail.do")
	public String eduDetail(Model model, String edu_grade, HttpSession session) {
		MemberDto dto = (MemberDto)session.getAttribute("login");
		if (dto == null) {
			return "redirect:/login.do";
		}
		
		model.addAttribute("videoList", biz.selectList(edu_grade));
		
//		for(EduDto dto : biz.selectList(edu_grade)) {
//			System.out.println(dto.getEdu_level());
//		}
		return "edudetail";
	}
	
	@RequestMapping("mentoStudent.do")
	public String mentoStudent(Model model, int member_no) {
		return "mentoStudent";
	}
	
}
