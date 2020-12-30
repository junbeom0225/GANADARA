package com.gana.dara.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gana.dara.biz.AdminStatisticsBiz;
import com.gana.dara.biz.MatchingMentoBiz;
import com.gana.dara.dto.AgeDto;
import com.gana.dara.dto.ConDto;
import com.gana.dara.dto.DayCountDto;
import com.gana.dara.dto.MemberDto;

@Controller
@RequestMapping("/admin.do/page")
public class AdminController {

	@Autowired
	private AdminStatisticsBiz asbiz;
	@Autowired
	private MatchingMentoBiz mbiz;
	
	
	
	@GetMapping("/count")
	public String count(Model model, HttpSession session) {
		MemberDto dto = (MemberDto)session.getAttribute("login");
		ConDto condto = new ConDto(asbiz.countAsia(), asbiz.countEurope(), asbiz.countAfrica(), asbiz.countNorthAmerica(), asbiz.countAustralia(), asbiz.countAntarctica());
	//	DayCountDto daydto = new DayCountDto(asbiz.countDay1(), asbiz.countDay2(), asbiz.countDay3(), asbiz.countDay4());
		AgeDto agedto = new AgeDto(asbiz.countAge10(), asbiz.countAge20(), asbiz.countAge30(), asbiz.countAge40(), asbiz.countAge50(), asbiz.countAge60());
		//System.out.println("condto가 만들어졌을까?" + condto);
		model.addAttribute("condto", condto);
	//	model.addAttribute("daydto", daydto);
		model.addAttribute("agedto", agedto);
		return "adminStatistics";
		
		
	}
	
	@GetMapping("/mento")
	public String mentoMatching(Model model) {
	
		model.addAttribute("list", mbiz.matchingMento());
		return "adminMatchingMento";
	}
	
	@GetMapping("/updateMento")
	public String mentoUpdate(int member_no, Model model, HttpSession session) {
		MemberDto dto = (MemberDto)session.getAttribute("login");
		model.addAttribute("dto", mbiz.selectOne(member_no));
		model.addAttribute("list", mbiz.matchingMento());
		return "adminMentoUpdate";
	}
	
	@PostMapping("/resMento")
	public String mentoRes(int member_no, int mento_no, HttpSession session) {
		MemberDto dto = (MemberDto)session.getAttribute("login");
		System.out.println("dto확인:"+dto);
		dto.setMember_no(member_no);
		dto.setMento_no(mento_no);
		int result = mbiz.updateMento(dto);
		if(result>0) {
			 session.setAttribute("login", dto);
			return "redirect:./mento";
		}
		return "redirect:./updateMento?member_no="+member_no;
	}
	
	
	
}
