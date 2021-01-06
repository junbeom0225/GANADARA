package com.gana.dara.controller;

import java.io.IOException; 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gana.dara.biz.MemberBiz;
import com.gana.dara.biz.NaverLoginBO;
import com.gana.dara.biz.PwSha256;
import com.gana.dara.dto.MemberDto;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class MemberController {

	@Autowired
	private MemberBiz biz;
	
	 /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
    
    @Autowired
    private GoogleConnectionFactory googleConnectionFactory;

    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;
    /*
    @Autowired
	private UserMailSendService mailsender;
	*/

	//로그인 페이지로 이동
	@RequestMapping(value = "/login.do")
	public String loginForm(Model model, HttpSession session, HttpServletRequest request ) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=Yjif4Qr8Rs_4vqQfOexM&redirect_uri=http%3A%2F%2Flocalhost%3A8787%2Fdara%2Fcallback.do&state=9ebbd50c-07fd-461b-aa1a-7173b3a3199b
        //redirect_uri=http://localhost:8787/dara/callback.do
        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);
        
    	/* 구글code 발행 */
      	OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();

        /* 로그인페이지 이동 url생성 */
      	String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
      	
      	//구글
      	model.addAttribute("google_url", url);
		
		return "login";
	}
	
	//ajax 로그인
	@RequestMapping(value="/ajaxlogin.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> ajaxLogin(@RequestBody MemberDto dto, HttpSession session){
		
		System.out.println(dto.getMember_email() + "ajaxlogin");
		System.out.println(dto.getMember_pw() + "ajaxlogin");
		
		//String member_pw = dto.getMember_pw();
		//dto.setMember_pw(PwSha256.encrypt(dto.getMember_pw()));
		
		System.out.println("암호화 후 : " + dto.getMember_pw());
		
		MemberDto res = biz.Login(dto);
		
		boolean check = false;
		
		if (res != null) {
			session.setAttribute("login", res);
			session.setMaxInactiveInterval(-1);
			
			check = true;
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
		return map;
	}
	
	
	
	   
	//네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
    throws IOException, org.json.simple.parser.ParseException {
    	
    	 System.out.println("여기는 callback");
         OAuth2AccessToken oauthToken;
         oauthToken = naverLoginBO.getAccessToken(session, code, state);
    	
    	
    	//1. 로그인 사용자 정보를 읽어온다. String 형식의 json 데이터
        apiResult = naverLoginBO.getUserProfile(oauthToken);	
    		
        System.out.println(apiResult);
       
        /** apiResult json 구조
        {"resultcode":"00",
        "message":"success",
        "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M",
        "email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
        **/
        
        //2. String형식인 apiResult를 json형태로 바꿈
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(apiResult);
        JSONObject jsonObj = (JSONObject) obj;
        
        //3. 데이터 파싱
        //Top레벨 단계 _response 파싱
        JSONObject response_obj = (JSONObject)jsonObj.get("response");
        //response의 nickname값 파싱
        String member_email = (String)response_obj.get("email");
        String member_nic = (String)response_obj.get("nickname");
        String member_name = (String)response_obj.get("name");
        
        MemberDto res = new MemberDto();
        res.setMember_email(member_email);
        res.setMember_nic(member_nic);
        res.setMember_name(member_name);
     
        String member_role = biz.MemberRole(member_email);
        System.out.println(member_role);
        res.setMember_role(member_role);
        
        if (biz.IdCheck(member_email) > 0) {
        	System.out.println(member_role + "idcheck");
        	
        	session.setAttribute("login", res);
        	session.setMaxInactiveInterval(-1);
        	model.addAttribute("result", apiResult);
        	System.out.println(res.getMember_role()+"callback.do");
        	return "redirect:/main.do";
        } else {
        	int snsres = biz.SnsLogin(res);
        	if (snsres > 0) {
        		System.out.println("db등록완료");
        		session.setAttribute("login", res);
            	session.setMaxInactiveInterval(-1);
        		model.addAttribute("result", apiResult);
        		return "redirect:/main.do";
        	}
        }
        
        model.addAttribute("result", apiResult);
        session.setAttribute("login", res);
    	session.setMaxInactiveInterval(-1);
    	
        /* 네이버 로그인 성공 페이지 View 호출 */
        return "redirect:/main.do";
    }
    
	//로그아웃
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		MemberDto dto = (MemberDto)session.getAttribute("login");
		if (dto == null) {
			return "redirect:/login.do";
		}
		
		session.invalidate();
		
		return "../../index";
	}
	
	// 메인페이지로 이동
	@RequestMapping("/main.do")
	public String mainForm(HttpSession session) {
		MemberDto dto = (MemberDto)session.getAttribute("login");
		
		System.out.println(dto.getMember_role()+ "main.do");
		
		if (dto.getMember_role().equals("USER") || dto.getMember_role().equals("MENTO")) {
			return "../../index";
		} else {
			return "redirect:http://localhost:1234";
		}
	}
	
	// 회원 정보 수정 화면 요청
		@RequestMapping("/updateview.do")
		public String updateview(HttpSession session) {
			MemberDto dto = (MemberDto)session.getAttribute("login");
			return "memberupdate";
		}
		
	// 회원 정보 수정
		@RequestMapping("/update.do")
		public String update(HttpSession session, MemberDto dto) {
			//HttpSession session, MemberDto dto
			//MemberDto dtoo = (MemberDto)session.getAttribute("login");
			
			int res = biz.MemberUpdate(dto);
			if (res > 0) {
				session.setAttribute("login", dto);
				return "../../index";
			} else {
				return "redirect:/updateview.do";
			}
		}
	
	
	
	// 회원가입 폼으로 이동
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
	
	//회원가입 중 member_nic 중복 체크
	@ResponseBody
	@RequestMapping(value = "/NicCheck.do", method = RequestMethod.GET)
	public int NicCheck(@RequestParam("member_nic") String member_nic) {
		
		System.out.println(member_nic);
		int res = biz.NicCheck(member_nic);
		System.out.println(res);
		return res;
		
	}
	
	@RequestMapping("/registerRes.do")
	public String regist(MemberDto dto, HttpServletRequest request) {
		
			//System.out.println(dto.getMember_email());
			//System.out.println("암호화 전 : " + dto.getMember_pw());
			
			//String encryPassword = PwSha256.encrypt(dto.getMember_pw());
			//dto.setMember_pw(encryPassword);
			
			//System.out.println("암호화 후 : " + dto.getMember_pw());
			
			//mailsender.mailSendWithUserKey(dto.getMember_email(), dto.getMember_email(), request);
			int res = biz.MemberJoinInsert(dto);
			
			if (res > 0) {
				return "redirect:/login.do";
			} else {
				return "../../index";
			}
			
		
	}
	
	
	// 데일리 서비스 페이지로 이동
	@RequestMapping("/dailypay.do")
	public String dailyPay(HttpSession session) {
		MemberDto dto = (MemberDto)session.getAttribute("login");
		
		return "dailypay";
	}
	
	// 카카오 결제
	@RequestMapping("/kakao.do")
	   public Map<String, Boolean> Kakao(HttpSession session) {
	      MemberDto res = (MemberDto)session.getAttribute("login");
	      
	      String member_email = res.getMember_email();
	      int result = biz.DailyService(member_email);
	      
	      System.out.println(result);
	      System.out.println("kakao" + res.getMember_email());
	      
	      boolean check = false;
	      
	      if(result > 0) {
	         session.setAttribute("login", res);
	         check = true;
	         System.out.println("결제 후 : " + res.getMember_daily()); 
	      } 
	      
	      Map<String, Boolean> map = new HashMap<String, Boolean>();
	      map.put("check", check);
	      
	      return map;
	      
	   }
	
	//마이페이지로 이동
	@RequestMapping("/mypage.do")
	public String mypage(HttpSession session) {
		MemberDto dto = (MemberDto)session.getAttribute("login");
		if (dto == null) {
			return "redirect:/login.do";
		} else if (dto.getMember_role().equals("USER")) {
			return "mypage";
		} else if(dto.getMember_role().equals("MENTO")){
			return "mypage_mento";
		}
		return "redirect:http://localhost:1234";
	}
	
//	// 멘토 - 첨삭학생 관리
//	@RequestMapping("studentList.do")
//	public String studentList(Model model, int member_no) {
//		System.out.println(member_no);
//		List<MemberDto> list = biz.studentList(member_no);
//		model.addAttribute("list", list);
//		for(MemberDto dto : list) {
//			System.out.println("controller: " + dto.getMember_role());
//		}
//		return "studentlist";
//	}
	
}

























