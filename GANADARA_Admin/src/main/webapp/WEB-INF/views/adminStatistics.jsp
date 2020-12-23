<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<style type="text/css">
body, ul, h2 {
	margin: 0;
	padding: 0;
}
li {
	list-style-type: none;
}
body{
	background-color: #fff;
	color: black;
}
.section2{
	display: flex;
	justify-content: center;
}

.wrapper{
	width: 500px;
	margin: 50px; auto;
		
}
.graph li{
	margin: 10px 0;
	background-color: #333;
	border-radius: 5px;
	position: relative;
}
.graph li h2{
	padding: 5px 10px 2px;
	font-size: 15px;
	background-color: #222;
	border-bottom: 1px solid #666;
}
.graph li strong {
	background-color: #666;
	overflow: hidden;
	line-height: 33px;
	font-size: 14px;
	display: block;
	text-align: right;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	box-shadow: inset -5px -5px 5px rgba(0,0,0,0.3);
	wi
}




</style>
</head>
<body>

	<section id="section1">
		<div id="donut" class="section">	
			<h1>통계 페이지: 국적별 회원 수 </h1>
			<input type="hidden" id="Asia" value="${condto.countAsia }"/>
			<input type="hidden" id="Europe" value="${condto.countEurope }"/>
			<input type="hidden" id="Africa" value="${condto.countAfrica }" />
			<input type="hidden" id="NorthAmerica" value="${condto.countNorthAmerica }" />
			<input type="hidden" id="Australia" value="${condto.countAustralia }" />
			<input type="hidden" id="Antarctica" value="${condto.countAntarctica }" />
		</div>
		<canvas id="myChart" width="300" height="200"></canvas>
	</section>
	<section id="section2">
		<div id="line" class="section2">
			<h1><strong>통계페이지 : 일별 가입 회원 수</strong></h1>
		 	
			<input type="hidden" id="day1" value="${daydto.countDay1 }"/>
			<input type="hidden" id="day2" value="${daydto.countDay2 }" />
			<input type="hidden" id="day3" value="${daydto.countDay3 }" />
			<input type="hidden" id="day4" value="${daydto.countDay4 }" /> 
		
			<div class="wrapper">
				<ul class="graph">
					<li class="day1"><h2>12월18일</h2><strong>0명</strong></li>
					<li class="day2"><h2>12월19일</h2><strong>0명</strong></li>
					<li class="day3"><h2>12월21일</h2><strong>0명</strong></li>
					<li class="day4"><h2>12월22일</h2><strong>0명</strong></li>
				</ul>
			</div>	
		</div>	 
	</section>	
<script>
	var countAsia = document.getElementById('Asia').value;
	var countEurope = document.getElementById('Europe').value;
	var countAfrica = document.getElementById('Africa').value;
	var countNorthAmerica = document.getElementById('NorthAmerica').value;
	var countAustralia = document.getElementById('Australia').value;
	var countAntarctica = document.getElementById('Antarctica').value;
	
	var ctx = document.getElementById('myChart').getContext('2d');
	var chart = new Chart(ctx, {
	    // The type of chart we want to create
	    type: 'doughnut',

	    // The data for our dataset
	    data: {
	        labels: ['Asia', 'Europe', 'Africa', 'NorthAmerica', 'Australia', 'Antarctica'],
	        datasets: [{
	            label: '국가별 회원 수',
	            backgroundColor: ['#F9D2A5', '#2F4662', '#303847', '#E4AFB8', '#F3D2D7', '#EFE5E1'],
	            hoverBackgroundColor: ['#EBEBE9', '#EBEBE9', '#EBEBE9', '#EBEBE9', '#EBEBE9', '#EBEBE9'],
	            hoverBorderColor: "rgba(234, 236, 244, 1)",
	            data: [countAsia, countEurope, countAfrica, countNorthAmerica, countAustralia, countAntarctica]
	        }]
	    },

	    // Configuration options go here
	    options: {
	    	maintainAspectRatio: false,
	    	tooltips: {
	    		 	backgroundColor: "rgb(255,255,255)",
	    	        bodyFontColor: "#858796",
	    	        borderColor: '#dddfeb',
	    	        borderWidth: 1,
	    	        xPadding: 25,
	    	        yPadding: 15,
	    	        displayColors: false,
	    	        caretPadding: 10,
	    	},
	    	cutoutPercentage: 40,
	    },
	});

	//일별 가입자 수 
	var countday1 = document.getElementById('day1').value;
	var countday2 = document.getElementById('day2').value;
	var countday3 = document.getElementById('day3').value;
	var countday4 = document.getElementById('day4').value;
	
	
	
	var data = [
		{'day': '1218', 'count': countday1, 'color': '#00b6f5'},
		{'day': '1219', 'count': countday2, 'color': '#ffc763'},
		{'day': '1221', 'count': countday3, 'color': '#ff55a9'},
		{'day': '1222', 'count': countday4, 'color': '#f790ff'}
	];
	$('.graph li').each(function(index){

		var color = data[index].color;
		$(this).children('h2').css('color', color).text(data[index].day);
		
		var bar = $(this).children('strong');
		bar.css('background-color', color);
		bar.delay(10*index).animate({'width': data[index].count + '%'}, {
			duration: 1000,
			step: function(now){
				$(this).text(Math.round(now));
			}
		});
	});

</script>
</body>
</html>