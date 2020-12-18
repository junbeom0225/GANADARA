<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Daily Writting Board [UPDATE]</h1>
	<form action="updateres.do" method="post">
		<input type="hidden" name="db_no" value="${dbdto.db_no }"> 
		<table border="1">
			<tr>
				<th>writer</th>
				<td>${dbdto.member_no }</td>
			</tr>
			<tr>
				<th>title</th>
				<td><input type="text" name="db_title" value="${dbdto.db_title }"/></td>
			</tr>
			<tr>
				<th>content</th>
				<td><textarea rows="10" cols="60" name="db_content">${dbdto.db_content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="modify"/>
					<input type="button" value="cancel" onclick="location.href='list.do'"/>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>