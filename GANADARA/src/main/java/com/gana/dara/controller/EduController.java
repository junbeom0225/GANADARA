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

	@RequestMapping("videostudy.do")
	public String videostudy() {
		return "videostudy";
	}
	
	@RequestMapping("eduword.do")
	public String eduword() {
		return "eduword";
	}
	@RequestMapping("eduspeak.do")
	public String eduspeak() {
		return "eduspeak";
	}
	@RequestMapping("edupractice.do")
	public String edupractice() {
		return "edupractice";
	}
	@RequestMapping("eduhome.do")
	public String eduhome() {
		return "eduhome";
	}
	@RequestMapping("eduword_demo.do")
	public String eduword_demo() {
		return "eduword_demo";
	}
	@RequestMapping("eduspeak_demo.do")
	public String eduspeak_demo() {
		return "eduspeak_demo";
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
