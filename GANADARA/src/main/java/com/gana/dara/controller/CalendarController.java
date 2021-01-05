package com.gana.dara.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gana.dara.biz.CalBiz;
import com.gana.dara.dto.CalDto;

@Controller
public class CalendarController {
	@Autowired
	private CalBiz biz;
	
	
	@RequestMapping("/calendar.do")
	public String Calendar(Model model) {
		
		model.addAttribute("list", biz.CalList());
		
		return "student_calendar";
	}
	@RequestMapping("/calpop.do")
	public String Calpop(Model model) {
		return "Calpopup";
	}

	@ResponseBody
	@RequestMapping(value ="/scheduleinsert.do", method= RequestMethod.POST)
	public Map<Object, Object> scheduleInsert(@RequestBody CalDto dto) throws Exception{
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		biz.insert(dto);
		
		return map;
	}
	
}
