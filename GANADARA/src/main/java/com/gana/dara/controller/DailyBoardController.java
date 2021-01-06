package com.gana.dara.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gana.dara.biz.DailyBoardReplyBiz;
import com.gana.dara.biz.DailyBoardBiz;
import com.gana.dara.dto.DailyBoardDto;
import com.gana.dara.dto.MemberDto;
import com.gana.dara.dto.MentoAnswerDto;

@Controller

public class DailyBoardController {

	@Autowired
	private DailyBoardBiz dailybiz;
	
	@Autowired
	private DailyBoardReplyBiz replybiz;
	
	@RequestMapping("/list.do")
	public String selectList(Model model, HttpSession session) {
		MemberDto dto = (MemberDto)session.getAttribute("login");
		if(dto == null) {
			// login 안했으면 login 페이지로 먼저 가기! 
			return "redirect:/login.do";
		}else {
			model.addAttribute("list", dailybiz.selectList());
			return "dailyboard";
		}
		
	}
	
	@RequestMapping("/insertform.do")
	public String insertform(HttpSession session, Model model) {
		MemberDto dto = (MemberDto)session.getAttribute("login");
		String member_daily = dto.getMember_daily();
		//System.out.println(member_daily);
		if(member_daily.equals("Y")) {
			model.addAttribute("login", dto);
			return "dailyinsert";  //여기까진 확인! 
		}else {
			// 
			model.addAttribute("msg", "Please, You have to pay first");
			model.addAttribute("url", "/mypage.do");
			return "redirect";
		}
		
	}
	
	@RequestMapping("/insertres.do")
	public String insertres(DailyBoardDto dto, HttpSession session) {
		
		int res = dailybiz.insert(dto);
		if(res>0) {
			return "redirect:list.do";
		}
		return "redirect:./insertform.do";
	}
	
	@RequestMapping("/detail.do")
	public String detail(int db_no,int member_no, Model model, HttpSession session) {
		MemberDto dto = (MemberDto)session.getAttribute("login");
		int login_memberno = dto.getMember_no();
	//	System.out.println("넘어온 db_no:"+ db_no);
	//	System.out.println("넘어온 member_no:"+member_no);
	//	System.out.println("로그인한 member_no:"+login_memberno);
		MemberDto mento = dailybiz.mento_no(db_no);
		int mento_no = mento.getMento_no();
	//	System.out.println("mento_no 확인: "+ mento_no);
	//	System.out.println("member_no 확인 : "+ member_no);
	//	System.out.println("login member_no 확인:" + login_memberno);
		if(member_no == login_memberno || login_memberno == mento_no) {  // 해당 글의 멘토이거나 글쓴이일 때, 글을 볼 수 있다. 
			model.addAttribute("dbdto", dailybiz.selectOne(db_no));
			return "dailydetail_original"; // 확인
		}else {
			// 확인!
			model.addAttribute("msg", "해당 글을 볼 수 없습니다.");
			model.addAttribute("url", "/list.do");
			return "redirect";
		}
		
	}
	
	@RequestMapping("/updateform.do")
	public String updateForm(Model model, int db_no, HttpSession session, int member_no) {
		MemberDto dto = (MemberDto)session.getAttribute("login");
		if(dto.getMember_no() == member_no) {
			model.addAttribute("dbdto", dailybiz.selectOne(db_no));
			model.addAttribute("login", dto);
			return "dailyupdate";
		}
		model.addAttribute("msg", "해당 글을 수정할 수 없습니다.");
		model.addAttribute("url", "/detail.do?db_no="+db_no+"&member_no="+member_no);
		return "redirect";
	}
	@RequestMapping("/updateres.do")
	public String updatRes(DailyBoardDto dbdto) {
		
		//System.out.println(dbdto.getMember_no()+" : member_no 확인");
		int res = dailybiz.update(dbdto);
		//System.out.println(res+": res 확인");
		if(res>0) {
			return "redirect:detail.do?db_no="+dbdto.getDb_no()+"&member_no="+dbdto.getMember_no();
		}
		return "redirect:./updateform.do?db_no="+dbdto.getDb_no();
	}
	@RequestMapping("/delete.do")
	public String delete(int db_no, HttpSession session, int member_no, Model model) {
		MemberDto dto = (MemberDto)session.getAttribute("login");
		if(dto.getMember_no() == member_no) {
			int res = dailybiz.delete(db_no);
			if(res>0) {
				return "redirect:list.do"; // 확인
			}else {
				return "redirect:detail.do?db_no="+db_no+"&member_no="+member_no; // 만약 db나 dao에서 에러나면 
			}
		}
		// 확인
		model.addAttribute("msg", "해당 글을 삭제할 수 없습니다.");
		model.addAttribute("url", "/detail.do?db_no="+db_no+"&member_no="+member_no);
		return "redirect";
	}
	
	// 멘토 - 첨삭학생 관리
	@RequestMapping("/studentList.do")
	public String studentList(Model model, int member_no) {
		System.out.println(member_no);
		List<MemberDto> list = dailybiz.studentList(member_no);
		model.addAttribute("list", list);
		for(MemberDto dto : list) {
			System.out.println("controller: " + dto.getMember_no());
		}
		return "studentlist";
	}

	
	
//----------------------------------------댓글 ajax -----------------------------------------------------	
	// 댓글 목록
			@RequestMapping("/replylist.do")
			@ResponseBody
			private List<MentoAnswerDto> replyList(MentoAnswerDto madto, Model model) throws Exception{
				return replybiz.replyList(madto.getDb_no());
			}
			// 댓글 등록
			@RequestMapping("/replyinsert.do")
			@ResponseBody
			private int replyInsert(MentoAnswerDto madto) throws Exception{
				MentoAnswerDto replydto = new MentoAnswerDto();
				replydto.setDb_no(madto.getDb_no());
				replydto.setMa_writer(madto.getMa_writer());
				replydto.setMa_content(madto.getMa_content());
					
				int updatedb_no = replydto.getDb_no();
				System.out.println("댓글달린 글번호:"+updatedb_no);
				
				int res = replybiz.replyInsert(replydto);
				if(res>0) {
					dailybiz.update_dailyanswer(updatedb_no);
					System.out.println(dailybiz.update_dailyanswer(updatedb_no));
				}
			//	return replybiz.replyInsert(replydto);
				System.out.println(res+"res확인:controller");
				return res;
			}
			// 댓글 수정
			@RequestMapping("/replyupdate.do")
			@ResponseBody
			private int replyUpdate(@RequestParam int ma_no, @RequestParam String ma_content) throws Exception{
				MentoAnswerDto madto = new MentoAnswerDto();
				madto.setMa_no(ma_no);
				madto.setMa_content(ma_content);
				
				return replybiz.replyUpdate(madto);
				
			}
			
			// 댓글 삭제
			@RequestMapping("/replydelete.do")
			@ResponseBody
			private int replyDelete(int ma_no) throws Exception{
				
				return replybiz.replyDelete(ma_no);
			}
	
	
/*	
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter(); 							
		String res = "<script>alert('"+msg+"'); location.href='"+url+"';</script>";
		
		out.print(res);
	}
	*/
}
