<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
				"member_pw" : member_pw
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
				url:"ajaxlogin.do",
				data: JSON.stringify(loginValue),	// 1. 이걸 통해 json 형태의 문자열로 바꾸고
				contentType: "application/json",	// 2. 이렇게 쓰기만 하면 알아서 json 형태로 컨트롤러로 들어감
				dataType: "json",
				success: function(msg){
					if (msg.check == true) {
							location.href="main.do"; //menubar.jsp /
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

	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" id="member_email" /></td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td><input type="password" id="member_pw" /></td>
		</tr>
		
		<tr>
			<td colspan="2" align="right">
			<input type="button" value="login" onclick="login();" />
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="left" id="loginChk"></td>
		</tr>
	</table>

</body>
</html>