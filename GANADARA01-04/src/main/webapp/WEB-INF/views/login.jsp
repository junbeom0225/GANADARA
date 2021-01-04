<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="./resources/css/assets/login.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	$(function(){
		$("#loginChk").hide();
	});
	
	function login(){
		
		var member_email = $("#member_email").val().trim();
		var member_pw = $("#member_pw").val().trim();
		
		//object! 자바 스크립트 가서 확인
		var loginValue = {
				"member_email" : member_email,
				"member_pw" : member_pw,
		};
		
		console.log(member_email);
		console.log(member_pw);
		
		//JSON.stringify: json object -> string 
		//JSON.parse: json 형태의 string -> object
		
		if (member_email == null || member_email == "" || member_pw == null || member_pw == "") {
			alert("ID 또는 PW를 확인해 주세요");
		} else {
			$.ajax({
				type:"post",
				url: "ajaxlogin.do",
				data: JSON.stringify(loginValue),	// 1. 이걸 통해 json 형태의 문자열로 바꾸고
				contentType: "application/json",	// 2. 이렇게 쓰기만 하면 알아서 json 형태로 컨트롤러로 들어감
				dataType: "json",
				success: function(msg){
					if (msg.check == true) {
						location.href="main.do"
					} else {
						$("#loginChk").show();
						$("#loginChk").html("ID 또는 PW가 잘못되었습니다").css("color", "red");
					}
				},
				error: function(){
					alert("통신 실패");
				}
			});
		}
		
	}

</script>
</head>
<body>
	<div class="sidenav">
         <div class="login-main-text">
            <h2>GANADARA<br> Login Page</h2>
            <p>Login or register from here to access.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form>
                  <div class="form-group">
                     <label>아이디</label>
                     <input type="text" id="member_email" name="member_email" class="form-control" placeholder="Id">
                  </div>
                  <div class="form-group">
                     <label>비밀번호</label>
                     <input type="password" id="member_pw" name="member_pw" class="form-control" placeholder="Password">
                  </div>
                  <table>
                  <tr>
         			<td colspan="2" align="left" id="loginChk"></td>
      			  </tr>
                  </table>
                  
                  <button type="button" class="btn btn-black" onclick="login();">Login</button>
                  <button type="button" class="btn btn-secondary" onclick="location.href='register.do'">Register</button>
                  <a href="idpwsearch.do">아이디/비밀번호 찾기</a>
                  
                  <!-- 네이버 로그인 화면으로 이동 시키는 URL -->
				  <!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
				
                <div id="naver_id_login" style="text-align:center"><a href="${url}" onclick="location.href='naver.do'">
				<img width="223" src="./resources/css/images/naver_White.PNG" onclick="location.href='naver.do'" />
				</a></div>
				
				 <div id="google_id_login" style="text-align: center">
    				<a href="${google_url}">구글 로그인</a>
    			 </div>
               </form>
               
              
				
            </div>
         </div>
      </div>

	
	

</body>
</html>