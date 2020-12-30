package com.gana.dara.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gana.dara.dto.MentoAnswerDto;

@Repository
public class DailyBoardReplyDaoImpl implements DailyBoardReplyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//´ñ±Û Á¶È¸
	@Override
	public List<MentoAnswerDto> replyList(int db_no) {
		List<MentoAnswerDto> replylist = new ArrayList<MentoAnswerDto>();
		try {
			replylist = sqlSession.selectList(NAMESPACE+"replylist", db_no);
		} catch (Exception e) {
			System.out.println("[error] replyList:dao");
			e.printStackTrace();
		}
		
		return replylist;
	}

	@Override
	public int replyInsert(MentoAnswerDto madto) {
		int res = 0;
		res = sqlSession.insert(NAMESPACE+"replyinsert", madto);
		return res;
	}

	@Override
	public int replyCount() throws Exception {
		int res = 0;
		res = sqlSession.selectOne(NAMESPACE+"replycount");
		return res;
	}

	@Override
	public int replyUpdate(MentoAnswerDto madto) {
		int res = 0;
		res = sqlSession.update(NAMESPACE+"replyupdate", madto);
		return res;
	}

	@Override
	public int replyDelete(int ma_no) {
		int res = 0;
		res = sqlSession.delete(NAMESPACE+"replydelete", ma_no);
		return res;
	}
	
	
	/*
	@Override
	public int mentoInsertAnswer(MentoAnswerDto madto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"mentoinsert", madto);
		} catch (Exception e) {
			System.out.println("[error] mentoinsert:dao");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int memberInsertAnswer(MentoAnswerDto madto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"memberinsert", madto);
		} catch (Exception e) {
			System.out.println("[error] mentoinsert:dao");
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int replyInsert(MentoAnswerDto madto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"replyinsert", madto);
		} catch (Exception e) {
			System.out.println("[error] replyInsert:dao");
			e.printStackTrace();
		}
		
		return res;
	}

	
	
	@Override
	public int replyUpdate(MentoAnswerDto madto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE+"replyupdate", madto);
		} catch (Exception e) {
			System.out.println("[error] updateReply:dao");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int replyDelete(int ma_no) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE+"replydelete", ma_no);
		} catch (Exception e) {
			System.out.println("[error] deleteReply:dao");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public void replyInsert(MentoAnswerDto madto) {
		sqlSession.insert(NAMESPACE+"replyinsert", madto);
	}

	@Override
	public void replyUpdate(MentoAnswerDto madto) {
		sqlSession.update(NAMESPACE+"replyupdate", madto);
	}
	
	@Override
	public void replyDelete(MentoAnswerDto madto) {
		sqlSession.delete(NAMESPACE+"replydelete", madto);
	}

	@Override
	public MentoAnswerDto replySelectOne(int ma_no) {
		return sqlSession.selectOne(NAMESPACE+"replyselectOne", ma_no);
	}
	*/
	
}
