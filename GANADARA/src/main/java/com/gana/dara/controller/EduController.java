package com.gana.dara.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gana.dara.biz.EduBiz;
import com.gana.dara.dto.EduDto;

@Controller
public class EduController {
	
	@Autowired
	private EduBiz biz;

	
	@RequestMapping("eduPractice.do")
	public String eduPractice() {
		return "edupractice";
	}
	@RequestMapping("eduhome.do")
	public String eduhome() {
		return "eduhome";
	}
	@RequestMapping("eduDetail.do")
	public String eduDetail(Model model, String edu_grade) {
		model.addAttribute("videoList", biz.selectList(edu_grade));
		
//		for(EduDto dto : biz.selectList(edu_grade)) {
//			System.out.println(dto.getEdu_level());
//		}
		return "edudetail";
	}
	
}
