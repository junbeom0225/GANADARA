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
<script type="text/javascript" src="http://d3js.org/d3.v5.js"></script>
<style type="text/css">

</style>
</head>
<body>

	<section id="section1">
		<div id="donut" class="section">	
			<h1>통계 페이지: 국적별 회원 수 </h1>
			<input type="hidden" id="Asia" value="${condto.countAsia }">
			<input type="hidden" id="Europe" value="${condto.countEurope }">
			<input type="hidden" id="Africa" value="${condto.countAfrica }">
			<input type="hidden" id="NorthAmerica" value="${condto.countNorthAmerica }">
			<input type="hidden" id="Australia" value="${condto.countAustralia }">
			<input type="hidden" id="Antarctica" value="${condto.countAntarctica }">
			
			<canvas id="myChart" width="300" height="200"></canvas>
		</div>
	</section>
	<section id="section2">
		<div id="line" class="section">
			<h1>통계페이지 : 일별 가입 회원 수 </h1>
			
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
</script>
</body>
</html>