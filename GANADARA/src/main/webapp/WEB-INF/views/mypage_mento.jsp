<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>${login.member_email }님 환영합니다. 마이페이지 입니다.</h4>
	<a href="updateview.do">회원정보수정</a>
	<a href="dailypay.do">첨삭회원 관리</a>
	<input type="hidden" value="${login.member_no }">
	<script type="text/javascript">
	alert()
	</script>

</body>
</html>