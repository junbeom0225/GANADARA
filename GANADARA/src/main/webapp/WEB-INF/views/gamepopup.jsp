<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		opener.focus();
		
		
		
	});

function levelsend(){
	$("#level", parent.opener.document).val($(':radio[name="levelchoice"]:checked').val())
	alert($(':radio[name="levelchoice"]:checked').val());
	window.close();
}

</script>
<body>
	<h2>자랑하기는 level 상 만 가능합니다!</h2>
	<h3>level을 누르시면 게임으로 넘어갑니다</h3>
	
	LEVEL<br>
	<input type="radio" name="levelchoice" value="T">상
	<input type="radio" name="levelchoice" value="M">중
	<input type="radio" name="levelchoice" value="L">하
	<button onclick="levelsend()">확인</button>

</body>
</html>