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

import com.gana.dara.biz.ShortBiz;
import com.gana.dara.dto.CalDto;

@Controller
public class KeyBoardController {

@Autowired
private ShortBiz biz;


@RequestMapping("/keyboard.do")
public String list(Model model) {
	
	return "keyboardWarrior";
}


@RequestMapping("/shortall.do")
public String ShortList(Model model) {
	model.addAttribute("listAll",biz.ShortList());
	return "student_kwshort";
}

@RequestMapping("/shorttitle.do")
public String Shorttitle(Model model,String st_title) {
	model.addAttribute("listAll",biz.selectTitle(st_title));
	return "student_kwshort";
}
@RequestMapping("/keygame.do")
public String KeyGame(Model model) {
	return "student_tajagame";
}
@RequestMapping("/keypop.do")
public String KeyPop(Model model) {
	return "gamepopup";
}


}
