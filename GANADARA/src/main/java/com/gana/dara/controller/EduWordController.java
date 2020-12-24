package com.gana.dara.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gana.dara.biz.EduWordBiz;
import com.gana.dara.dto.EduWordDto;

@Controller
public class EduWordController {
	
	@Autowired
	private EduWordBiz biz;
	
	@RequestMapping("eduWord.do")
	public String eduWord(Model model, int edu_no) {
		model.addAttribute("eduWordList",biz.selectList(edu_no));
		return "eduword";
	}
	
	@RequestMapping("eduSpeak.do")
	public String edusSpeak(Model model, int edu_no) {
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
