<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#speech{width: 500px; height: 500px; border: 1px solid black;}
.words{margin:2%;}

</style>
</head>
<body>

	<h2>말하기 연습</h2>
	<p>Speech Practice</p>
	
	<div id="speech">
		<div class="words"></div>
		<script src="${pageContext.request.contextPath }/resources/js/app_speech.js"></script>
	</div>

</body>
</html>