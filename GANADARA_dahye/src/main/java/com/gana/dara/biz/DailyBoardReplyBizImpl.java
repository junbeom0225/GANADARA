package com.gana.dara.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gana.dara.dao.DailyBoardReplyDao;
import com.gana.dara.dto.MentoAnswerDto;

@Service
public class DailyBoardReplyBizImpl implements DailyBoardReplyBiz {

	@Autowired
	private DailyBoardReplyDao replydao;
	
	//´ñ±Û ¸ñ·Ï
	@Override
	public List<MentoAnswerDto> replyList(int db_no) {
		
		return replydao.replyList(db_no);
	}
    
	//´ñ±Û µî·Ï
	@Override
	public int replyInsert(MentoAnswerDto madto) {
		
		return replydao.replyInsert(madto);
	}

	//´ñ±Û °¹¼ö
	@Override
	public int replyCount() throws Exception {
		
		return replydao.replyCount();
	}
	// ´ñ±Û ¼öÁ¤
	@Override
	public int replyUpdate(MentoAnswerDto madto) {
		
		return replydao.replyUpdate(madto);
	}
	//´ñ±Û »èÁ¦ 
	@Override
	public int replyDelete(int ma_no) {
		
		return replydao.replyDelete(ma_no);
	}
	
	
	
	
/*
	@Override
	public int mentoInsertAnswer(MentoAnswerDto madto) {
		
		return answerdao.mentoInsertAnswer(madto);
	}

	@Override
	public int memberInsertAnswer(MentoAnswerDto madto) {
		
		return answerdao.memberInsertAnswer(madto);
	}

	@Override
	public int replyInsert(MentoAnswerDto madto) {
		return replydao.replyInsert(madto);
	}
	
	@Override
	public int replyUpdate(MentoAnswerDto madto) {
		
		return replydao.replyUpdate(madto);
	}

	@Override
	public int replyDelete(int ma_no) {
		
		return replydao.replyDelete(ma_no);
	}
	
	@Override
	public void replyInsert(MentoAnswerDto madto) {
		replydao.replyInsert(madto);
	}

	@Override
	public void replyUpdate(MentoAnswerDto madto) {
		
		replydao.replyUpdate(madto);
	}

	@Override
	public void replyDelete(MentoAnswerDto madto) {
		
		replydao.replyDelete(madto);
	}
	@Override
	public MentoAnswerDto replySelectOne(int ma_no) {
		return replydao.replySelectOne(ma_no);
	}
	*/
	
	
}
