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
			
			//��� ���
			public List<MentoAnswerDto> replyList(int db_no);
			//��� ���
			public int replyInsert(MentoAnswerDto madto);
			// ��� ����
			public int replyCount() throws Exception;
			//��� ����
			public int replyUpdate(MentoAnswerDto madto);
			//��� ����
			public int replyDelete(int ma_no);	

}

