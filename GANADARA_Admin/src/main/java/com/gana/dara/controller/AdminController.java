package com.gana.dara.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gana.dara.biz.AdminStatisticsBiz;
import com.gana.dara.dto.ConDto;

@Controller
@RequestMapping("/admin/page")
public class AdminController {

	@Autowired
	private AdminStatisticsBiz asbiz;
	
	@GetMapping("/count")
	public String countAsia(Model model) {
		ConDto condto = new ConDto(asbiz.countAsia(), asbiz.countEurope(), asbiz.countAfrica(), asbiz.countNorthAmerica(), asbiz.countAustralia(), asbiz.countAntarctica());
		System.out.println("condto가 만들어졌을까?" + condto);
		model.addAttribute("condto", condto);
		return "adminStatistics";
		
		
	}
	
	
	
}
