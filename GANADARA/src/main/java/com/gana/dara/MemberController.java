package com.gana.dara;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gana.dara.biz.MemberBiz;
import com.gana.dara.dto.MemberDto;

@Controller
public class MemberController {

	@Autowired
	private MemberBiz biz;
	
	//로그인 페이지로 이동
	@RequestMapping("/login.do")
	public String loginForm() {
		return "login";
	}
	
	//ajax 로그인
	@RequestMapping(value="/ajaxlogin.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> ajaxLogin(@RequestBody MemberDto dto, HttpSession session){
		
		MemberDto res = biz.Login(dto);
		
		boolean check = false;
		if (res != null) {
			session.setAttribute("login", res);
			check = true;
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
		return map;
	}
	
	// 메인페이지로 이동
	@RequestMapping("/main.do")
	public String mainForm() {
		// MemberDto dto = (MemberDto) session.getAttribute("login"); 이거 안해도 됨
		return "menubar";
	}
	
	// 관리자 페이지로 이동
	@RequestMapping("/admin.do")
	public String adminForm() {
		return "admin";
	}
	
	@RequestMapping("/register.do")
	public String register() {
		return "register";
	}
	
	//회원가입 중 member_email(아이디) 중복 체크
	@ResponseBody
	@RequestMapping(value = "/IdCheck.do", method = RequestMethod.GET)
	public int IdCheck(@RequestParam("member_email") String member_email) {
		
		System.out.println(member_email);
		int res = biz.IdCheck(member_email);
		System.out.println(res);
		return res;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/NicCheck.do", method = RequestMethod.GET)
	public int NicCheck(@RequestParam("member_nic") String member_nic) {
		
		System.out.println(member_nic);
		int res = biz.NicCheck(member_nic);
		System.out.println(res);
		return res;
		
	}
	
	@RequestMapping("/registerRes.do")
	public @ResponseBody String regist(MemberDto dto) {
		
		
		System.out.println(dto.getMember_email());
		int res = biz.MemberJoinInsert(dto);
		
		if (res > 0) {
			return "<script>alert('GANADARA 회원가입이 완료되었습니다!'); location.href='login.do';</script>";
		} else {
			return "<script>alert('데이터 전송에 실패하였습니다.'); location.href='login.do';</script>";
		}
		
	}
	
}
