<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Admin Matching Meto Page</h1>
	<table border="1">
		<col width="100"/>
		<col width="300"/>
		<col width="500"/>
		<col width="100"/>
		<col width="100"/>
		
		<tr>
			<th>NO</th>
			<th>NAME</th>
			<th>EMAIL</th>
			<th>PAY</th>
			<th>MENTO</th>
			<th>멘토지정</th>
		</tr>
		<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.member_no }</td>
				<td>${dto.member_name }</td>
				<td>${dto.member_email }</td>
				<td>${dto.member_daily }</td>
				<td>${dto.mento_no }</td>
				<td><input type="button" value="변경" onclick="location.href='./updateMento?member_no=${dto.member_no}'"/>
			</tr>
		</c:forEach>	
	</table>
	

</body>
</html>