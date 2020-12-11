<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Writting Practice</h1>

	<form action="insertres" method="post">
		<table border="1">
			<tr hidden>
				<th>writer</th>   <!-- login한 사람이니가 안보이고 login정보에서 member_no가져옴 -->
				<td><input type="text" name="member_no" value="${login.member_no }" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>title</th>
				<td><input type="text" name="db_title"/></td>
			</tr>
			<tr>
				<th>content</th>
				<td><textarea rows="10" cols="60" name="db_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="completed"/>
					<input type="button" value="list" onclick="location.href='list.do'"/>
				</td>
			</tr>
		</table>
	
	</form>
</body>
</html>