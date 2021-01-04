<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="./resources/css/assets/memberupdate.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

//member_pw 정규식 - A~Z, a~z, 0~9로 시작하는 4~12자리 비밀번호
var pwJ = /^[A-Za-z0-9]{4,12}$/; 

//휴대폰 번호 정규식
var phoneJ = /^\d{3}-\d{3,4}-\d{4}$/;

//생년월일 8자리 정규식
var birthJ = /^(?:[1-2]{1}(?:[0-9]{3})(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;
//생년월일 6자리 정규식
//var birthJ = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;


$(document).ready(function(){

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
<body id="top" class="is-preload">
	<!-- Banner -->
	<!--
				To use a video as your background, set data-video to the name of your video without
				its extension (eg. images/banner). Your video must be available in both .mp4 and .webm
				formats to work correctly.
			-->
	<!-- Header -->
	<header id="header">
		<a class="logo" href="index.jsp">home</a>
		<nav>
			<a href="#menu">Menu</a>
		</nav>
	</header>

	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="eduhome.do">한국어학습</a></li>
			<li><a href="#">글쓰기첨삭</a></li>
			<li><a href="#">타자연습</a></li>
			<li><a href="mypage.do">마이페이지</a></li>
			<li><a href="logout.do">로그아웃</a></li>
		</ul>
	</nav>
	<br/>
	<br/>
	<br/>

<!-- String member_name, String member_nic, String member_email, String member_pw, 
	String member_tel, String member_birth, String member_con, String member_role, 
	String member_daily -->
	<form action="update.do" method="post">
		<div class="form-group">
		
				<label for="member_email">아이디</label>
				<div class="form">
					<input type="text" id="member_email" name="member_email" value="${login.member_email }" readonly="readonly"/>
				</div>
			<br/>
				<label for="member_pw">비밀번호</label>
				<div class="form">
					<input type="password" id="member_pw" name="member_pw" />
					<div class="check_font" id="pw_check"></div>
				</div>
			<br/>
				<label for="member_pw2">비밀번호 확인</label>
				<div class="form">
					<input type="password" id="member_pw2" name="member_pw2" />
					<div class="check_font" id="pw_check2"></div>
				</div>
			<br/>
				<label for="member_name">영문이름</label>
				<div class="form">
					<input type="text" id="member_name" name="member_name" value="${login.member_name }"/>
					<div class="check_font" id="name_check"></div>
				</div>
			<br/>
				<label for="member_nic">닉네임</label>
				<div class="form">
					<input type="text" id="member_nic" name="member_nic" value="${login.member_nic }" readonly="readonly"/>
				</div>
			<br/>
				<label for="member_tel">전화번호</label>
				<div class="form">
					<input type="text" id="member_tel" name="member_tel" value="${login.member_tel }" />
					<div class="check_font" id="phone_check"></div>
				</div>
			<br/>
				<label for="member_birth">생년월일</label>
				<div class="form">
					<input type="text" id="member_birth" name="member_birth" value="${login.member_birth }" />
					<div class="check_font" id="birth_check"></div>
				</div>
			<br/>
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
			<br/>
				<label for="member_role">가입 정보</label>
				<div class="form">
					<input type="text" id="member_role" name="member_role" value="${login.member_role }" readonly="readonly"/>
				</div>
			<br/>
				<label for="member_daily">첨삭 서비스 이용여부</label>
				<div class="form">
					<input type="text" id="member_daily" name="member_daily" value="${login.member_daily }" readonly="readonly"/>
				</div>
			<br/>
				<div>
					<input type="submit" value="수정" />
					<input type="button" value="취소" onclick="location.href='mainform.do'" />
				</div>
		</div>
	</form>
	<br/>
	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<h2>가나다라마바사아자차카타파하</h2>
			<p>가나다라 한국어 학습은 최희선, 황다혜, 최소연, 황다혜, 박준범, 박건웅을 도움으로 제작되었습니다만, 제작물
				중 저작권은..아무것도 우리에게 없어요. 파이널 도대체 언제 끝날까요. 메리크리스마스...</p>

			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon fa-envelope"><span
						class="label">Email</span></a></li>
			</ul>
			<p class="copyright">
				&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>.
				Images: <a href="https://unsplash.com/">Unsplash</a>. Videos: <a
					href="http://coverr.co/">Coverr</a>.
			</p>
		</div>
	</footer>
	
	<!-- Scripts -->
	<script src="resources/js/assets/breakpoints.min.js"></script>
	<script src="resources/js/assets/jquery.min.js"></script>
	<script src="resources/js/assets/jquery.scrolly.min.js"></script>
	<script src="resources/js/assets/jquery.poptrox.min.js"></script>
	<script src="resources/js/assets/skel.min.js"></script>
	<script src="resources/js/assets/util.js"></script>
	<script src="resources/js/assets/main.js"></script>
	<script src="resources/js/assets/browser.min.js"></script>
</body>
</html>