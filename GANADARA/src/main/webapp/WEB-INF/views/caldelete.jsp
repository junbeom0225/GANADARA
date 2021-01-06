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

<body>
<table border="1">
<tr>
	<td>제목</td>
	<td>시작일</td>
	<td>종료일</td>
	<td>삭제버튼</td>
</tr>
<c:forEach items="${list }" var="dto">
<tr>
	<td>${dto.cal_title }</td>
	<td>${dto.cal_mdate }</td>
	<td>${dto.cal_regdate }</td>
	<td><button class="calbutton" value="${dto.cal_no }">삭제</button></td>
</tr>

</c:forEach>
</table>
</body>
<script type="text/javascript">

$(".calbutton").click(function(){
	var calno = $(this).attr("value");
	console.log(calno);
	
	$.ajax({
		url : "calbutton.do",
		type: "POST",
		data : {"calno" : calno},
		success : function(data){
			opener.parent.location.reload();
			location.reload()
			alert("삭제되었습니다.");
			
		},
		error: function(){
			alert("실패하였습니다.");
		}
	});
	
	
});


</script>
</html>