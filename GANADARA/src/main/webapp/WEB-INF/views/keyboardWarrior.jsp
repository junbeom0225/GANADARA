<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/hangul-js" type="text/javascript"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		//단문 메뉴 슬라이드
		$("#shortmenu").click(function(){
			var submenu = $(this).next("ul");
			
			if( submenu.is(":visible")){
				submenu.slideUp();
			}else{
				submenu.slideDown();
			}
		});
		
		
		
		
	});
</script>
</head>
<body>
	<div>
		<ul>
			<li>
				<p id="shortmenu">단문</p>
				<ul style="display: none;">
					<li><a href="shortall.do">모든문장</a></li>
					<li><a href="shorttitle.do?st_title=S">속담</a></li>
					<li><a href="shorttitle.do?st_title=M">명언</a></li>
				</ul>
			</li>
			<li>장문</li>
			<li><a href="keygame.do">타자게임</a></li>
		</ul>
	</div>
</body>
</html>