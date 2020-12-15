package com.gana.dara.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gana.dara.biz.DailyBoardReplyBiz;
import com.gana.dara.dto.MentoAnswerDto;
@Controller
@RequestMapping("dara/comment")
public class DailyBoardReplyController {

	@Autowired
	private DailyBoardReplyBiz replybiz;
	
	// 댓글 리스트 
		@RequestMapping("/replylist.do")
		@ResponseBody
		private List<MentoAnswerDto> replyList(MentoAnswerDto madto, Model model) throws Exception{
			System.out.println("controller 여기까진 왔나?");
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
			System.out.println("댓글 등록???");
			return replybiz.replyInsert(replydto);
		}
		// 댓글 수정
		@RequestMapping("/replyupdate.do")
		@ResponseBody
		private int replyUpdate(@RequestParam int ma_no, @RequestParam String ma_content) throws Exception{
			MentoAnswerDto madto = new MentoAnswerDto();
			madto.setMa_no(ma_no);
			madto.setMa_content(ma_content);
			System.out.println("댓글 수정???");
			return replybiz.replyUpdate(madto);
			
		}
		
		// 댓글 삭제
		@RequestMapping("/replydelete.do")
		@ResponseBody
		private int replyDelete(int ma_no) throws Exception{
			System.out.println("삭제 제대로 들어오나?"+ ma_no);
			
			return replybiz.replyDelete(ma_no);
		}
}
