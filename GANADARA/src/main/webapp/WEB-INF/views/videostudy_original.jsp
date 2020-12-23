<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
#nav { 
	font-family:'arial';
	width: 220px;
	height: 800px;		
	float: left; 
}
#nav ul{ width:100%; margin:0; padding:0; }
#nav ul.menu li{ position:relative; float:left; width:100%; list-style-type:none; font-size:20px;}
#nav ul.menu li a{ display:block; width:100%; height:100%; line-height:50px; text-indent:10px; color:#000; font-weight:bold; text-decoration:none; }
#nav ul.menu li a:hover{ background:#eee; }
#nav ul.menu li .sub a{ position:relative; float:left; display:block; width:100%; z-index:999; background:#ccc; }
#nav ul.menu li .sub a:hover{ background:#444; color:#fff; }

#iframe{
	width: 915px;
	height: 515px;		
	padding: 0px 0px 300px 0px; 	
}

</style>

<title>Insert title here</title>
</head>
<body>
<%@ include file="../../resources/css/header.jsp"%>

	<div id="nav">
		<ul class="menu">
		  	<li><a href="#">입문</a>
		   		<ul class="sub">
				    <li><a data-url="https://www.youtube.com/embed/77YDmSbbYqU">입문_1차 한글소개 - 학습</a></li>
				    <li><a data-url="https://www.youtube.com/embed/7JZKxnVrt88">입문_2차 모음 - 학습</a></li>
				    <li><a data-url="https://www.youtube.com/embed/r0gpBIsAF-c">입문_3차 자음 - 학습</a></li>
				    <li><a data-url="https://www.youtube.com/embed/3mAXRZrWPeg">입문_4차 받침 - 학습</a></li>
				    <li><a data-url="https://www.youtube.com/embed/950CBBcx7PY">입문_5차 띄어쓰기 - 학습</a></li>
		   		</ul>
		  	</li>
	 	</ul>
	 	<ul class="menu">
		 	<li><a href="#">초급 1</a>
		 		<ul class="sub">
		 			<li><a data-url="https://www.youtube.com/embed/oVaZ5T-1c1Y">초급_1차 어휘학습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/LHd2U9DWay0">초급_2차 문법학습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/FodWMWpO2Ng">초급_3차 문법연습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/Y9k-CEy07Ig">초급_4차 문법학습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/45ZmkAVUdF0">초급_5차 어휘학습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/PB59yRn_7L0">초급_6차 문법학습</a></li>
		 		</ul>
		 	</li>
	 	</ul>
	 	<ul class="menu">
		 	<li><a href="#">초급 2</a>
		 		<ul class="sub">
		 			<li><a data-url="https://www.youtube.com/embed/5ehF2-awFm0">초급_1차 문법학습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/4qYWjAaYtWw">초급_2차 문법연습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/nDdrO-CAdBA">초급_3차 문법학습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/vMDN8AA9b-c">초급_4차 문법연습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/x8_2ju6LrEQ">초급_5차 어휘학습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/ssHzZso1n-8">초급_6차 문법연습</a></li>
		 		</ul>
		 	</li>
	 	</ul>
	</div>
	
	<fieldset id="field">
	<h2>동영상 강의</h2>
	<div id="boardview">
		<iframe id="iframe" name="myframe" frameBorder="0" cc_load_policy="1" algin="center"></iframe>
	</div>
	</fieldset>
	
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#nav ul.sub").hide();
		$("#nav ul.menu li").click(function(){
			$("ul",this).slideToggle("fast");
		});
	});
	
	$(document).ready(function(e) {
		/* a요소를 클릭 했을 시 */
		$('a').click(function(){
		/* iframe 요소의 src 속성값을 a 요소의 data-url 속성값으로 변경 */ 
		    $('#iframe').attr('src',$(this).attr('data-url'));
		    })
	});
</script>

<%@ include file="../../resources/css/footer.jsp"%>

</body>
</html>