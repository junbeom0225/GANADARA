package com.gana.dara.dao;

import java.util.List;

import com.gana.dara.dto.MentoAnswerDto;


public interface DailyBoardReplyDao {
	
		String NAMESPACE = "dailyreply.";
			
			
		//	public int mentoInsertAnswer(MentoAnswerDto madto);
		//	public int memberInsertAnswer(MentoAnswerDto madto);
		//	public int replyInsert(MentoAnswerDto madto);
		//  public int replyUpdate(MentoAnswerDto madto);
		//  public int replyDelete(int ma_no);
		//	public void replyInsert(MentoAnswerDto madto);
		//	public void replyUpdate(MentoAnswerDto madto);
		//	public void replyDelete(MentoAnswerDto madto);
		//	public MentoAnswerDto replySelectOne(int ma_no);
			
			//댓글목록
			public List<MentoAnswerDto> replyList(int db_no);
			//댓글 등록
			public int replyInsert(MentoAnswerDto madto);
			// 댓글 
			public int replyCount() throws Exception;
			//댓글 수정
			public int replyUpdate(MentoAnswerDto madto);
			//댓글 삭제
			public int replyDelete(int ma_no);	

}

