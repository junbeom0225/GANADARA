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
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/main.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/locales-all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/main.min.js"></script>

<script>

  document.addEventListener('DOMContentLoaded', function() {
	var today = new Date();
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      initialDate: today,
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      selectable: true,
      locale:"ko",
      events: [
    	<c:forEach items="${list }" var="dto">
    	  {	
    		  groupId: "${dto.cal_no}",
    		  title: "${dto.cal_title}",
    		  start: "${dto.cal_mdate}",
    		  end: "${dto.cal_regdate}"
    		  
    	  },
		</c:forEach>
    	  {
    		  title: 'default',
    		  start: today,
    		  end: today
    	  }
    	  
      ]
      
    });

    calendar.render();
  });

</script>
<script type="text/javascript">
	var memberno = ${login.member_no };
	function calInsert(){
		var url = "calpop.do?member_no="+memberno;
		var name = "calendarinsert";
		var option ="width= 500, height= 600, left= 200, top= 100";
		
		window.open(url,name,option)
	}
	function calDelete(){
		var url = "caldelete.do?member_no="+memberno;
		var name = "calendardelete";
		var option ="width= 500, height= 600, left= 200, top= 100";
		window.open(url,name,option)
	}
</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

.add-button {
  	top: 5px;
  	right: 230px;
  	background: #2C3E50;
  	border: 0;
  	color: white;
  	height: 35px;
  	border-radius: 3px;
  	width: 157px;
  }
  #insertbutton {
  	position: relative;
  	
  }
  
.fc-col-header-cell.fc-day.fc-day-sat .fc-col-header-cell-cushion { color:#0000FF; }
.fc-col-header-cell.fc-day.fc-day-sun .fc-col-header-cell-cushion { color:#FF0000; }
.fc-daygrid-day.fc-day.fc-day-sat.fc-day-past .fc-daygrid-day-number { color:#0000FF; }     /* 토요일 */
.fc-daygrid-day.fc-day.fc-day-sun.fc-day-past .fc-daygrid-day-number { color:#FF0000; }    /* 일요일 */
.fc-daygrid-day.fc-day.fc-day-sat.fc-day-future .fc-daygrid-day-number { color:#0000FF; }     /* 토요일 */
.fc-daygrid-day.fc-day.fc-day-sun.fc-day-future .fc-daygrid-day-number { color:#FF0000; } 
</style>
<body id="top" class="is-preload">
<%@ include file="../../resources/css/header.jsp"%>
	<!-- Main -->
	<div id="main">
		<div class="inner">
	<div id="calendar"></div>
	<div id="insertbutton">
		<button class="add-button" type="button" onclick="calInsert();">일정 추가</button>
		<button class="add-button" type="button" onclick="calDelete();">일정 삭제</button>
	</div>
</div>
</div>
<%@ include file="../../resources/css/footer.jsp"%>
</body>
</html>