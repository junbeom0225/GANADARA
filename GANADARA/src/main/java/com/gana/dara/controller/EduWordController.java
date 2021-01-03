package com.gana.dara.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gana.dara.biz.EduWordBiz;
import com.gana.dara.dto.EduWordDto;
import com.gana.dara.dto.MemberDto;

@Controller
public class EduWordController {
	
	@Autowired
	private EduWordBiz biz;
	
	@RequestMapping("eduWord.do")
	public String eduWord(Model model, int edu_no, HttpSession session) {
		MemberDto dto = (MemberDto)session.getAttribute("login");
		if (dto == null) {
			return "redirect:/login.do";
		}
		
		model.addAttribute("eduWordList",biz.selectList(edu_no));
		return "eduword";
	}
	
	@RequestMapping("eduSpeak.do")
	public String edusSpeak(Model model, int edu_no, HttpSession session) {
		MemberDto res = (MemberDto)session.getAttribute("login");
		if (res == null) {
			return "redirect:/login.do";
		}
		
		List<EduWordDto> list = biz.selectList(edu_no);
		EduWordDto dto = list.get(0);
//		System.out.println("edu_no: " + dto.getEdu_no());
//		System.out.println("edu_grade: " + dto.getEdu_grade());
//		System.out.println("edu_level: " + dto.getEw_level());
		
		model.addAttribute("eduWordList", list);
		model.addAttribute("dto", dto);
		return "eduspeak";
	}

}
