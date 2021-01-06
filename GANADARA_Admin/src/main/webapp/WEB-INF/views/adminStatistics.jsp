<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<link rel="stylesheet" href="resources/css/assets/main.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
body{margin:0}

#box{
 display: flex;
 flex-direction: row;
 justify-content: space-between;
}
.chartOne{

	width: 1000px;
	height:800px;
}
.container1{
	margin-left: 50px;
	margin-top: 20px;
	width: 580px;
	height:400px;
	border: solid 1px;
	border-color: #fff;
	border-radius: 30px;
	position: relative;
	left: 100px;
	top: 50px;
	display: inline-block;
}
.container2{
	margin-right: 50px;
	margin-top: 20px;
	width: 500px;
	height:400px;
	border: solid 1px;
	border-color: #fff;
	border-radius: 30px;
	position: relative;
	right: 100px;
	top: 50px;
	display: inline-block;
}
.item{
	position: relative;
	top: 100px;
}
#myChartOne{
	position: relative;
	left: -70px;
}
#myChartThree{
	position: relative;
	right: -20px;
	top: 20px;
}
</style>
</head>
<body>
<%@ include file="../../resources/css/header-admin.jsp"%>

	<!-- Sidebar -->
	<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
 		 <button class="w3-bar-item w3-button w3-large" onclick="w3_close()"></button>
  		 <a href="count" class="w3-bar-item w3-button" style="color:black">통계페이지</a>
  		 <a href="mento" class="w3-bar-item w3-button" style="color:black">멘토관리 페이지</a>
  		 <a href="#" class="w3-bar-item w3-button" style="color:black">1:1채팅</a>
  		 <button class="w3-bar-item w3-button w3-large" onclick="w3_close()">Close &times;</button>
	</div>
	<div id="main">
		<div class="w3-teal">
		  <button id="openNav" class="w3-button w3-teal w3-xlarge" onclick="w3_open()">&#9776;</button>
		  <div class="w3-container">
		    <h1>Admin Statistics Page</h1>
		  </div>
	</div>
  	


	
 <div id="box">
	<section id="section1">
		<div id="donut" class="section">	
			<input type="hidden" id="Asia" value="${condto.countAsia }"/>
			<input type="hidden" id="Europe" value="${condto.countEurope }"/>
			<input type="hidden" id="Africa" value="${condto.countAfrica }" />
			<input type="hidden" id="NorthAmerica" value="${condto.countNorthAmerica }" />
			<input type="hidden" id="Australia" value="${condto.countAustralia }" />
			<input type="hidden" id="Antarctica" value="${condto.countAntarctica }" />
		</div>
		<div class="chartOne">	
			<div class="container1">
						<canvas id="myChartOne" class="item" style="height:40vh; width:40vw"></canvas>
			</div>
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
		<div class="container2">
					<canvas id="myChartThree" class="item" style="height:50vh; width:30vw">></canvas>
		</div>
	</section>	
 </div>
	
	
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
	    	responsive: false,
	    	title : {
	    		display : true,
	    		text : '국적별 회원 수',
	    		fontSize : 15,
	    		fontColor : '#fff',
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
	    	 responsive: false,
	    	 scales: {  // x, y축 옵션
	    		yAxes:[{
	    			ticks: {
	    				beginAtZero: true // y축의 값이 0부터 시작
	    			}
	    		}] 
	    	 },
	    	title: {
	    		display : true,
	    		text: '연령별 회원 수',
	    		fontSize: 15,
	    		fontColor: '#fff',
	    		position: 'bottom'
	    	},
	    	legend: {
	    		display: false
	    	}
	    }
	});
</script>
<script>
	function w3_open() {
		  document.getElementById("main").style.marginLeft = "15%";
		  document.getElementById("mySidebar").style.width = "15%";
		  document.getElementById("mySidebar").style.display = "block";
		  document.getElementById("openNav").style.display = 'none';
		}
		function w3_close() {
		  document.getElementById("main").style.marginLeft = "0%";
		  document.getElementById("mySidebar").style.display = "none";
		  document.getElementById("openNav").style.display = "inline-block";
		}
	</script>
<%@ include file="../../resources/css/footer_pop.jsp"%>
	
</body>
</html>