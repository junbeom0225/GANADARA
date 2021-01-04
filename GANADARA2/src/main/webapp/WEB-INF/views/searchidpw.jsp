<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	function search_check(num) {
		if (num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";	
		} else {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
		}
	}
	
	/////////모///달///기///능///////////
	// 1. 모달창 히든 불러오기
	$('#searchBtn').click(function() {
		$('#background_modal').show();
	});
	// 2. 모달창 닫기 버튼
	$('.close').on('click', function() {
		$('#background_modal').hide();
	});
	// 3. 모달창 위도우 클릭 시 닫기
	$(window).on('click', function() {
		if (event.target == $('#background_modal').get(0)) {
            $('#background_modal').hide();
         }
	});
	
	// 아이디 & 스토어 값 저장하기 위한 변수
	var idV = "";
	// 아이디 값 받고 출력하는 ajax
	var idSearch_click = function(){
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/user/userSearch?inputName_1="
					+$('#inputName_1').val()+"&inputPhone_1="+$('#inputPhone_1').val(),
			success:function(data){
				if(data == 0){
					$('#id_value').text("회원 정보를 확인해주세요!");	
				} else {
					$('#id_value').text(data);
					// 아이디값 별도로 저장
					idV = data;
				}
			}
		});
	}


	
});
</script>
</head>
<body>
	<h3>아이디/비밀번호 찾기</h3>
	<div>
		<input type="radio" id="search_1" name="search_total" onclick="search_check(1)" checked="checked"> 
			<label for="search_1">아이디 찾기</label>
	</div>

	<div>
		<input type="radio"id="search_2" name="search_total" onclick="search_check(2)"> 
			<label for="search_2">비밀번호 찾기</label>
	</div>

	<div id="searchI">
		<div class="form-group">
			<label for="member_nic">닉네임</label>
			<div>
				<input type="text" id="member_nic" name="member_nic" placeholder="ex) 하늘다람쥐">
			</div>
		</div>
		<div class="form-group">
			<label class="" for="member_tel">휴대폰번호</label>
			<div>
				<input type="text" id="member_tel" name="member_tel" placeholder="ex) 010-7777-9999">
			</div>
		</div>
		<div>
			<button id="searchBtn" type="button" onclick="idSearch_click()"
				class="">확인</button>
			<a href="${pageContext.request.contextPath}">취소</a>
		</div>
	</div>
	
	<div id="searchP" style="display: none;">
		<div>
			<label class="" for="member_email">아이디</label>
			<div>
				<input type="email" id="member_email"
					name="member_email" placeholder="ex) gana@dara.com">
			</div>
		</div>
		<div>
			<label for="member_birth">생년월일</label>
			<div>
				<input type="text"  id="member_birth"
					name="member_birth" placeholder="ex) E-mail@gmail.com">
			</div>
		</div>
		<div>
			<button id="searchBtn2" type="button">확인</button>
			<a href="${pageContext.request.contextPath}">취소</a>
		</div>
	</div>



</body>
</html>