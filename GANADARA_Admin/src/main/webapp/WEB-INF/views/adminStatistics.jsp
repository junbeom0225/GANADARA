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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<style type="text/css">
.container{
	display: flex;
	justy-content : center;
	width : 300px;
	height: 300px;
	margin-top: 20px;
	flex-wrap : wrap;
}
</style>
</head>
<body>

	<section id="section1">
		<div id="donut" class="section">	
			<input type="hidden" id="Asia" value="${condto.countAsia }"/>
			<input type="hidden" id="Europe" value="${condto.countEurope }"/>
			<input type="hidden" id="Africa" value="${condto.countAfrica }" />
			<input type="hidden" id="NorthAmerica" value="${condto.countNorthAmerica }" />
			<input type="hidden" id="Australia" value="${condto.countAustralia }" />
			<input type="hidden" id="Antarctica" value="${condto.countAntarctica }" />
		</div>
		<div class="container">
					<canvas id="myChartOne" class="item"></canvas>
		</div>
	</section>
	
	<section id="section3">
		<div id="" class="section">	
			<input type="hidden" id="age10" value="${agedto.countAge10}"/>
			<input type="hidden" id="age20" value="${agedto.countAge20 }"/>
			<input type="hidden" id="age30" value="${agedto.countAge30 }" />
			<input type="hidden" id="age40" value="${agedto.countAge40 }" />
			<input type="hidden" id="age50" value="${agedto.countAge50 }" />
			<input type="hidden" id="age60" value="${agedto.countAge60 }" />
		</div>
		<div class="container">
					<canvas id="myChartThree" class="item"></canvas>
		</div>
	</section>	
<script>
	let countAsia = document.getElementById('Asia').value;
	let countEurope = document.getElementById('Europe').value;
	let countAfrica = document.getElementById('Africa').value;
	let countNorthAmerica = document.getElementById('NorthAmerica').value;
	let countAustralia = document.getElementById('Australia').value;
	let countAntarctica = document.getElementById('Antarctica').value;
	
	let myChartOne = document.getElementById('myChartOne').getContext('2d');
	let chartOne = new Chart(myChartOne, {
	    // The type of chart we want to create
	    type: 'doughnut',

	    // The data for our dataset
	    data: {
	        labels: ['Asia', 'Europe', 'Africa', 'NorthAmerica', 'Australia', 'Antarctica'],
	        datasets: [{
	            label: '국가별 회원 수',
	            data: [countAsia, countEurope, countAfrica, countNorthAmerica, countAustralia, countAntarctica],
	        	backgroundColor: ['#cd5d7d','#ffe3d8', '#437783', '#cae4db', '#0a043c' ,'#a7c5eb' ]
	        }]
	    },
	    options : {
	    	title : {
	    		display : true,
	    		text : '국적별 회원 수',
	    		fontSize : 15,
	    		fontColor : 'skyblue',
	    		position : 'bottom'
	    	},
	    	legend : {
	    		display : true,
	    		position : 'right'
	    	}
	    }
	});

	//일별 가입자 수 
	

	// 연령대별 차트
	let countAge10 = document.getElementById('age10').value;
	let countAge20 = document.getElementById('age20').value;
	let countAge30 = document.getElementById('age30').value;
	let countAge40 = document.getElementById('age40').value;
	let countAge50 = document.getElementById('age50').value;
	let countAge60 = document.getElementById('age60').value;
	
	let myChartThree = document.getElementById('myChartThree').getContext('2d');
	let chartThree = new Chart(myChartThree, {
	    // The type of chart we want to create
	    type: 'bar',

	    // The data for our dataset
	    data: {
	        labels: ['10대', '20대', '30대', '40대', '50대', '60대이상'],
	        datasets: [{
	            label: '연령별 회원 수',
	            data: [countAge10, countAge20, countAge30, countAge40, countAge50, countAge60],
	            backgroundColor: [
	            	'#bb2205', '#f6830f', '#0e918c', 'skyblue', '#d2d3c9', '#c0e218'
	            ]
	           
	        }]
	    },
	    options : {
	    	title: {
	    		display : true,
	    		text: '연령별 회원 수',
	    		fontSize: 15,
	    		fontColor: 'red',
	    		position: 'bottom'
	    	},
	    	legend: {
	    		display: false
	    	}
	    }
	});
</script>
</body>
</html>