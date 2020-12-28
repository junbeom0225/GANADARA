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

	<h1>ADIN UPDATE MENTO PAGE</h1>
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
					<select name="mento_no">
						
						
						
					</select>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>