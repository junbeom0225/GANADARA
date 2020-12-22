package com.gana.dara;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
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
	
}
