package com.gana.dara.biz;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.gana.dara.dto.MemberDto;

@Service("mail")
public class UserMailSendService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private MemberBiz biz;
	
	// *1 이메일 난수 만드는 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// *2 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;
		//*3 매개 변수를 넣어 자신이 원하는 사이즈의 난수를 만든다
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	// 회원가입 발송 이메일(인증키 발송)
	public void mailSendWithUserKey(String e_mail, String member_email, HttpServletRequest request) {
		String key = getKey(false, 20);
		//biz.GetKey(member_email, key);
		



}
}

