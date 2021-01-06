<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/assets/main.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<%@ include file="../../resources/css/header-admin.jsp"%>

	<!-- Sidebar -->
	<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
 		 <button class="w3-bar-item w3-button w3-large" onclick="w3_close()"></button>
  		 <a href="count" class="w3-bar-item w3-button" style="color:black">통계페이지</a>
  		 <a href="mento" class="w3-bar-item w3-button" style="color:black">멘토관리 페이지</a>
  		 <a href="#" class="w3-bar-item w3-button" style="color:black">1:1채팅</a>
  		 <button class="w3-bar-item w3-button w3-large" onclick="w3_close()">Close &times;</button>
	</div>
	<div id="main">
		<div class="w3-teal">
		  <button id="openNav" class="w3-button w3-teal w3-xlarge" onclick="w3_open()">&#9776;</button>
		  <div class="w3-container">
		    <h1>Admin Update Meto Page</h1>
		  </div>
	</div>

	<form action="./resMento" method="post">
		<input type="hidden" name="member_no" value="${dto.member_no }"/>
		<table border="1">
			<tr>
				<th>NO</th>
				<td>${dto.member_no }</td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td>${dto.member_email }</td>
			</tr>
			<tr>
				<th>MENTO</th>
				<td>
					<select name="mento_no" style="color:black">
						<option value="--선택--" selected="selected">--선택--</option>
						<c:forEach var="ldto" items="${list }">
							<c:if test="${ldto.member_daily == 'N' && ldto.member_role == 'MENTO' }">
								<option value="${ldto.member_no }">${ldto.member_no }</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr colspan="2" align="right">
				<td>
					<input type="submit" value="멘토선택"/>
					<input type="button" value="취소" onclick="location.href='./mento'"/>
				</td>
			</tr>
		</table>
	</form>
<script>
	function w3_open() {
		  document.getElementById("main").style.marginLeft = "15%";
		  document.getElementById("mySidebar").style.width = "15%";
		  document.getElementById("mySidebar").style.display = "block";
		  document.getElementById("openNav").style.display = 'none';
		}
		function w3_close() {
		  document.getElementById("main").style.marginLeft = "0%";
		  document.getElementById("mySidebar").style.display = "none";
		  document.getElementById("openNav").style.display = "inline-block";
		}
	</script>
<%@ include file="../../resources/css/footer_pop.jsp"%>
</body>
</html>