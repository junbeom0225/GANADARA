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

	<h1>데일리 첨삭 게시판</h1>
	
	<table border="1">
		<col width="50"/>
		<col width="100"/>
		<col width="500"/>
		<col width="200"/>
		<col width="100"/>
		<tr>
			<th>NO</th>
			<th>writer</th>
			<th>title</th>
			<th>date</th>
			<th>correction check</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<th colspan="5">------There is no written article------</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.db_no }</td>
						<td>${dto.member_no }</td>
						<td><a href="detail.do?db_no=${dto.db_no }&member_no=${dto.member_no}">${dto.db_title }</a></td>
						<td><fmt:formatDate value="${dto.db_date }" pattern="yyyy-MM-dd"/></td>
						<td>${dto.db_answer }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="5">
				<input type="button" value="WRITE" onclick="href.location='insertform.do'"/>
			</td>
		</tr>
	</table>


</body>
</html>