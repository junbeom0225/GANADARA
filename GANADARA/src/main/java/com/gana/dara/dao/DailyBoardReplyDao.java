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
			
			//´ñ±Û ¸ñ·Ï
			public List<MentoAnswerDto> replyList(int db_no);
			//´ñ±Û µî·Ï
			public int replyInsert(MentoAnswerDto madto);
			// ´ñ±Û °¹¼ö
			public int replyCount() throws Exception;
			//´ñ±Û ¼öÁ¤
			public int replyUpdate(MentoAnswerDto madto);
			//´ñ±Û »èÁ¦
			public int replyDelete(int ma_no);	

}

