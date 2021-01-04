<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
$(document).ready(function() {
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
});

function search_check(num) {
	if (num == '1') {
		document.getElementById("searchP").style.display = "none";
		document.getElementById("searchI").style.display = "";	
	} else {
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
}

//아이디 & 스토어 값 저장하기 위한 변수
var idV = "";



var idC = {
	"member_name" : member_name,
	"member_tel" : member_tel,
};
// 아이디 값 받고 출력하는 ajax
function idSearch_click(){
	var member_name = $("#member_name").val().trim();
	var member_tel = $("#member_tel").val().trim();

	if (member_name == null || member_name == "" || member_tel == null || member_tel == "") {
		alert("이름과 전화번호를 확인해 주세요");
	} else {
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/idsearch.do?member_name="
					+$('#member_name').val()+"&member_tel="+$('#member_tel').val(),
			success:function(data){
				if(data.check == 0){
					$('#id_value').text("회원 정보를 확인해주세요!");	
				} else {
					$('#id_value').text(data);
					// 아이디값 별도로 저장
					idV = data;
				}
		}
	});
	}
}

</script>
</head>
<body>
<%@ include file="/WEB-INF/views/userIdSearchModal.jsp" %>
<div class="full">
		<div class="container">
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-white">
					<h3>아이디/비밀번호 찾기</h3>
					<p>인증된 이메일만 정보 찾기가 가능합니다 :)</p>
				</div>
				
				<div style="margin-bottom: 10px;">
					<input type="radio" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label for="search_1">아이디 찾기</label>
				</div>
				<div>
					<input type="radio" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label for="search_2">비밀번호 찾기</label>
				</div>
				
				<div id="searchI">
					<div class="form-group">
						<label for="inputName_1">이름</label>
						<div>
							<input type="text" id="member_name" name="member_name" placeholder="ex) Sejong">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPhone_1">휴대폰번호</label>
						<div>
							<input type="text" id="member_tel" name="member_tel" placeholder="ex) 010-7777-9999">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn" type="button" onclick="idSearch_click()">확인</button>
					<a href="${pageContext.request.contextPath}">취소</a>
					</div>
				</div>
				
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="inputId" name="inputId_2" placeholder="ex) godmisu">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="inputEmail_2"	name="inputEmail_2" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn2" type="button" class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>


</html>