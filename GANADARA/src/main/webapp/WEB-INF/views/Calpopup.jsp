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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	
	$.datepicker.setDefaults({
    	dateFormat: 'yy-mm-dd',	//날짜 포맷이다. 보통 yy-mm-dd 를 많이 사용하는것 같다.
	    prevText: '이전 달',	// 마우스 오버시 이전달 텍스트
    	nextText: '다음 달',	// 마우스 오버시 다음달 텍스트
    	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
    	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더 중 월 표시를 위한 부분
    	dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
    	dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
    	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분
    	showMonthAfterYear: true,	// true : 년 월  false : 월 년 순으로 보여줌
    	showOtherMonths: true, // true: 다른 달 보여주기
    	yearSuffix: '년',
    	changeYear: true,	// 콤보박스로 년 선택
    	chageMonth: true,	// 콤보박스로 월 선택
    	
	});
	$("#startdate").datepicker();	//datapicker 적용
	$("#lastdate").datepicker();
	
	$("#startdate").datepicker('setDate','today');	//초기값 설정
	$("#lastdate").datepicker('setDate','today');
	
	$.fn.serializeObject = function(){
		var o = {};
		var a = this.serializeArray();
		$.each(a, function(){
			var name = $.trim(this.name),
			value = $.trim(this.value);
			
			if(o[name]) {
				if(!o[name].push) {
					o[name] = [o[name]];
				}
				o[name].push(value || '');
			} else {
				o[name] = value || '';
			}
			
		});
		return o;
	};
	
	$("#schedule").click(function(){
		
		var scheduleData = JSON.stringify($('form#scheduleData').serializeObject());
		
		$.ajax({
			data: scheduleData,
			url : "scheduleinsert.do",
			type: "POST",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				opener.parent.location.reload();
				window.close();
			}
		});
		
	});
	
});

</script>
<body>
<div>
	<div>
		<h1>일정 추가</h1>
	</div>
	<div>
		<form id="scheduleData">
			<div>
				<h3>제목</h3>
			</div>
			<div>
				<input type="text" placeholder="제목을 작성하세요" name="cal_title">
			</div>
			<div>
				<h3>시작일</h3>
			</div>
			<div>
				<input type="text" id="startdate" name="cal_mdate">
			</div>
			<div>
				<h3>종료일</h3>
			</div>
			<div>
				<input type="text" id="lastdate" name="cal_regdate">
			</div>
			<div>
				<h3>일정</h3>
			</div>
			<div>
				<textarea rows="5" cols="20" placeholder="일정을 작성하세요" name="cal_content"></textarea>
			</div>
		</form>
		<button type="button" id="schedule">작성</button>
		
	</div>
</div>

</body>
</html>