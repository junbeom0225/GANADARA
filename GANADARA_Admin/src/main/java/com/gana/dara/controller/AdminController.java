package com.gana.dara.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gana.dara.biz.AdminStatisticsBiz;
import com.gana.dara.biz.MatchingMentoBiz;
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
	public String count(Model model) {
		ConDto condto = new ConDto(asbiz.countAsia(), asbiz.countEurope(), asbiz.countAfrica(), asbiz.countNorthAmerica(), asbiz.countAustralia(), asbiz.countAntarctica());
		DayCountDto daydto = new DayCountDto(asbiz.countDay1(), asbiz.countDay2(), asbiz.countDay3(), asbiz.countDay4());
		
		//System.out.println("condto가 만들어졌을까?" + condto);
		model.addAttribute("condto", condto);
		model.addAttribute("daydto", daydto);
		return "adminStatistics";
		
		
	}
	
	@GetMapping("/mento")
	public String mentoMatching(Model model) {
		
		model.addAttribute("list", mbiz.matchingMento());
		return "adminMatchingMento";
	}
	
	@GetMapping("/updateMento")
	public String mentoUpdate(int member_no, Model model) {
		
		model.addAttribute("dto", mbiz.selectOne(member_no));
		model.addAttribute("list", mbiz.matchingMento());
		return "adminMentoUpdate";
	}
	
	@PostMapping("/resMento")
	public String mentoRes(int member_no, int mento_no) {
		MemberDto dto = new MemberDto();
		dto.setMember_no(member_no);
		dto.setMento_no(mento_no);
		int res = mbiz.updateMento(dto);
		if(res>0) {
			return "redirect:./mento";
		}
		return "redirect:./updateMento?member_no="+member_no;
	}
	
	
	
}
