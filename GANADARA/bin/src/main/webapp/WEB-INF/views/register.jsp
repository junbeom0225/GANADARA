<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
//기능은 id / css는 class 속성 / 파라미터는 name

//member_email(아이디) 정규식 - 특수문자 가능(-_) / 중앙에 @ 필수 / .뒤에 2~3 글자 필요
var idJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

//member_pw 정규식 - A~Z, a~z, 0~9로 시작하는 4~12자리 비밀번호
var pwJ = /^[A-Za-z0-9]{4,12}$/; 

//휴대폰 번호 정규식
var phoneJ = /^\d{3}-\d{3,4}-\d{4}$/;

//생년월일 8자리 정규식
var birthJ = /^(?:[1-2]{1}(?:[0-9]{3})(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;
//생년월일 6자리 정규식
//var birthJ = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;

	
	$(document).ready(function(){
		//member_email(아이디) 유효성 검사
		$("#member_email").blur(function() {
			var member_email = $('#member_email').val();
			$.ajax({
				url : "${pageContext.request.contextPath}/IdCheck.do?member_email="+ member_email,
				type : 'get',
				success : function(data) {
					console.log("1 = 아이디존재 / 0 = 없음 : "+ data);	
					if (data > 0) {	
							// 0 이상이면 아이디가 중복
							$("#id_check").text("사용중인 아이디입니다 :p");
							$("#id_check").css("color", "red");
							$("#submit").attr("disabled", true);
						} else {

							if(idJ.test(member_email)){
								// 0 이하이면 아이디 길이 / 문자열 검사
								$("#id_check").text("");
								$("#submit").attr("disabled", false);
					
							} else if(member_email == ""){
								
								$('#id_check').text('아이디를 입력해 주세요 :)');
								$('#id_check').css('color', 'red');
								$("#submit").attr("disabled", true);				
								
							} else {
								$('#id_check').text("아이디를 이메일 형식으로 입력해 주세요 :)");
								$('#id_check').css('color', 'red');
								$("#submit").attr("disabled", true);
							}
							
						}	
						
					}, error : function() {
							console.log("실패");
					}
				});
			});
	
	
	//member_pw 유효성 검사
	$('#member_pw').blur(function(){
		var member_pw = $('#member_pw').val();
		
		if(pwJ.test($('#member_pw').val())){
			$("#pw_check").text('');
			$("#submit").attr("disabled", false);
		} else if(member_pw == "") {
			$('#pw_check').text('비밀번호를 입력해 주세요 :)');
			$('#pw_check').css('color', 'red');
			$("#submit").attr("disabled", true);	 
		} else {
			$('#pw_check').text('숫자 or 문자로만 4~12자리 입력:)');
			$('#pw_check').css('color', 'red');
			$("#submit").attr("disabled", true);
		}
	});
	
	//비밀번호 일치 확인
	$('#member_pw2').blur(function(){
		var member_pw2 = $('#member_pw2').val();
		if($('#member_pw').val() != $(this).val()){
			$('#pw_check2').text('비밀번호가 일치하지 않습니다 :)');
			$('#pw_check2').css('color', 'red');
			$("#submit").attr("disabled", true);
		} else if(member_pw2 == "") {
			$('#pw_check2').text('비밀번호를 다시 입력해 주세요 :)');
			$('#pw_check2').css('color', 'red');
			$("#submit").attr("disabled", true);	 
		} else {
			$("#pw_check2").text('');
			$("#submit").attr("disabled", false);
		}
	});
	
	//닉네임 유효성검사
	$("#member_nic").blur(function() {
		var member_nic = $('#member_nic').val();
		$.ajax({
			url : "${pageContext.request.contextPath}/NicCheck.do?member_nic="+ member_nic,
			type : 'get',
			success : function(data) {
				console.log("0 이상 닉네임 존재 / 0 = 없음 : "+ data);	
				if (data > 0) {	
						$("#nic_check").text("사용중인 닉네임입니다 :p");
						$("#nic_check").css("color", "red");
						$("#submit").attr("disabled", true);
					} else {
						if(member_nic == ""){
							$('#nic_check').text('닉네임를 입력해 주세요 :)');
							$('#nic_check').css('color', 'red');
							$("#submit").attr("disabled", true);				
						} else {
							$("#nic_check").text('');
							$("#submit").attr("disabled", false);
						}
					}	
				}, error : function() {
						console.log("실패");
				}
			});
		});
	
	//member_name(영문이름) 공백
	$('#member_name').blur(function(){
		if($(this).val() == "") {
			$('#name_check').text('영문이름을 입력해 주세요 :)')
			$('#name_check').css('color', 'red');
			$("#submit").attr("disabled", true);
		} else {
			$("#name_check").text('');
			$("#submit").attr("disabled", false);
		}
	});
	
	
	//member_tel 유효성 검사
	$('#member_tel').blur(function(){
		var member_tel = $('#member_tel').val();
		if(phoneJ.test($(this).val())){
			$("#phone_check").text('');
			$("#submit").attr("disabled", false);
		} else if(member_tel == "") {
			$('#phone_check').text('전화번호를 입력해 주세요 :)');
			$('#phone_check').css('color', 'red');
			$("#submit").attr("disabled", true);	 
		} else {
			$('#phone_check').text('전화번호를 확인해 주세요 :)');
			$('#phone_check').css('color', 'red');
			$("#submit").attr("disabled", true);
		}
	});
	
	// member_birth 유효성 검사
	$('#member_birth').blur(function(){
		var member_birth = $('#member_birth').val();
	
		if(birthJ.test($('#member_birth').val())){
			$('#birth_check').text('');
			$("#submit").attr("disabled", false);
		} else if(member_birth == "") {
			$('#birth_check').text('생년월일를 입력해 주세요 :)');
			$('#birth_check').css('color', 'red');
			$("#submit").attr("disabled", true);	
		} else {
			$('#birth_check').text('8자리 생년월일을 입력해 주세요:)');
			$('#birth_check').css('color', 'red');
			$("#submit").attr("disabled", true);
		}
	
	});
	
});
</script>
</head>
<body>

	<form action="registerRes.do" method="post">
		<div class="form-group">
			<label for="member_email">아이디</label>
				<div class="form">
					<input type="email" class="regist_form" id="member_email" name="member_email" required="required" placeholder="gana@dara.com"/>
					<div class="check_font" id="id_check"></div>
				</div>
		</div>

		<div class="form-group"> 
			<label for="member_pw">비밀번호</label>
				<div class="form">
					<input type="password" class="regist_form" id="member_pw" name="member_pw" placeholder="Password" />
					<div class="check_font" id="pw_check"></div>
				</div>
		</div>
		
		<div class="form-group"> 
			<label for="member_pw">비밀번호 확인</label>
				<div class="form">
					<input type="password" class="regist_form" id="member_pw2" name="member_pw2" placeholder="Password Confirm" />
					<div class="check_font" id="pw_check2"></div>
				</div>
		</div>
	
		<div class="form-group">
			<label for="member_name">영문이름</label>
				<div class="form">
					<input type="text" class="regist_form" id="member_name" name="member_name" required="required" placeholder="Name" />
					<div class="check_font" id="name_check"></div>
				</div>
		</div>
		
		<div class="form-group">
			<label for="member_nic">닉네임</label>
				<div class="form">
					<input type="text" class="regist_form" id="member_nic" name="member_nic" required="required" placeholder="Nickname">
					<div class="check_font" id="nic_check"></div>
				</div>
		</div>

		<div class="form-group">
			<label for="member_tel">전화번호</label>
				<div class="form">
					<input type="tel" class="regist_form" id="member_tel" name="member_tel" placeholder="Phone Number" placeholder="010-0000-0000">
					<div class="check_font" id="phone_check"></div>
			</div>
		</div>
		
		<div class="form-group">
			<label for="member_birth">생년월일</label>
				<div class="form">
					<input type="text" class="regist_form" id="member_birth" name="member_birth" placeholder="ex) 19931212">
					<div class="check_font" id="birth_check"></div>
				</div>
		</div>
		
		<div class="form-group">
			<label for="member_con">국적</label>
				<div class="form">
					<select name="member_con" class="regist_form">
						<option value="ASIA">ASIA</option>
						<option value="EUROPE">EUROPE</option>
						<option value="AFRICA">AFRICA</option>
						<option value="NORTH AMERICA">NORTH AMERICA</option>
						<option value="AUSTRALIA">AUSTRALIA</option>
						<option value="ANTARCTICA">ANTARCTICA</option>
					</select>
				</div>
		</div>
		
		<div class="form-group">
			<label for="member_role">등급</label>
				<div class="form">
					<input type="radio" class="regist_form"  id="member_role" name="member_role" value="USER">학생
					<input type="radio" class="regist_form" id="member_role" name="member_role" value="MENTO">멘토
				</div>
		</div>
		
		<div>
			<button type="submit" name="register" id="submit">회원가입하기</button>
		</div>
	</form>

</body>
</html>