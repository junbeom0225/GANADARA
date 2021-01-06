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
<style type="text/css">
 body {
      margin: 0;
    }
 table{
 	position: relative;
 	top: 30px;
 }
</style>
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
		    <h1>Admin Matching Meto Page</h1>
		  </div>
	</div>

	<table border="1">
		<col width="100"/>
		<col width="300"/>
		<col width="500"/>
		<col width="100"/>
		<col width="100"/>
	
		<tr>
			<th><div align="center">NO</div></th>
			<th><div align="center">NAME</div></th>
			<th><div align="center">EMAIL</div></th>
			<th><div align="center">PAY</div></th>
			<th><div align="center">MENTO</div></th>
			<th><div align="center">멘토지정</div></th>
		</tr>
			
			<c:forEach var="dto" items="${list }">
				<c:if test="${dto.member_daily == 'Y'}">
					<tr align="center">
						<td>${dto.member_no }</td>
						<td>${dto.member_name }</td>
						<td>${dto.member_email }</td>
						<td>${dto.member_daily }</td>
						<td>${dto.mento_no }</td>
						<td>
							<input type="button" value="변경" onclick="location.href='./updateMento?member_no=${dto.member_no}'"/>
						</td>
					</tr>
				</c:if>
			</c:forEach>	
		
	</table>
		<!-- Scripts -->
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