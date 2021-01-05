<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input {
	width: 300px;
}
</style>
<script src="https://unpkg.com/hangul-js" type="text/javascript"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
//정확도
var accuracy;
//시간
var timeresult;			
//타자속도/점수
var keyscore;

	$(function() {
		
		
		//입력시부터 엔터누를때 까지의 시간입니다.
		$("#firstinput").one("keydown", function() {
			// 입력시 시간
			const starttime = new Date();

			$("#fourthinput").keydown(function(key) {
				if (key.keyCode == 13) {
					//엔터키 누를때 시간
					const endtime = new Date();
					// 경과 시간 1000으로 나눠서 초로 나타냄
					timeresult = (endtime - starttime) / 1000;
					keyresult();
				}
			});
		});
		
		$("#firstinput").keydown(function(key){
			if(key.keyCode ==13){
			   	$("#secondinput").focus();
			}
		});
		$("#secondinput").keydown(function(key){
			if(key.keyCode ==13){
				$("#thirdinput").focus();
			}
		});
		$("#thirdinput").keydown(function(key){
			if(key.keyCode ==13){
				$("#fourthinput").focus();
			}
		});
	});
	// input value 가져와서 계산
	function keyresult() {
		var fl = Hangul.disassemble($("#firstline").val());
		var fi = Hangul.disassemble($("#firstinput").val());
		
		var count = 0;
		
		for(var i = 0; i < fi.length; i++){
			
			try {
					if( fl[i] == fi[i]){
						count += 1;
					}
				} catch (e) {
					e.pass;
				}
			
		}
		
		var sl = Hangul.disassemble($("#secondline").val());
		var si = Hangul.disassemble($("#secondinput").val());
		
		var Scount = 0;
		
		for(var i = 0; i < si.length; i++){
			
			try {
					if( sl[i] == si[i]){
						Scount += 1;
					}
				} catch (e) {
					e.pass;
				}
			
		}
		
		var tl = Hangul.disassemble($("#thirdline").val());
		var ti = Hangul.disassemble($("#thirdinput").val());
		
		var Tcount = 0;
		
		for(var i = 0; i < ti.length; i++){
			
			try {
					if( tl[i] == ti[i]){
						Tcount += 1;
					}
				} catch (e) {
					e.pass;
				}
			
		}
		
		var fol = Hangul.disassemble($("#fourthline").val());
		var foi = Hangul.disassemble($("#fourthinput").val());
		
		var Fcount = 0;
		
		for(var i = 0; i < foi.length; i++){
			
			try {
					if( fol[i] == foi[i]){
						Fcount += 1;
					}
				} catch (e) {
					e.pass;
				}
			
		}
		//정확도
		accuracy = (((count / fl.length) + (Scount / sl.length) + (Tcount / tl.length) + (Fcount / fol.length)) * 100) / 4;
		//타자속도/점수
		keyscore = (count + Scount + Tcount + Fcount) / timeresult * 60;
		
		alert("정확도:"+accuracy+" 타수:"+keyscore+" 시간:"+timeresult);
		
	}
	
</script>
</head>
<body>
	<div>
			<c:forEach items="${listAll }" var="dto" end="0" step="1" >
			<input type="text" maxlength="50" id="firstline" readonly="readonly" value="${dto.st_content}"></br>
			<input type="text" maxlength="50" id="firstinput" autofocus="autofocus"></br>
			</c:forEach>
			<c:forEach items="${listAll }" var="dto" begin="1" end="1" step="1" >
			<input type="text" maxlength="50" id="secondline" readonly="readonly" value="${dto.st_content }"></br>
			<input type="text" maxlength="50" id="secondinput" value=""></br>
			</c:forEach>
			<c:forEach items="${listAll }" var="dto" begin="2" end="2" step="1" >
			<input type="text" maxlength="50" id="thirdline" readonly="readonly" value="${dto.st_content }"></br>
			<input type="text" maxlength="50" id="thirdinput" value=""></br>
			</c:forEach>
			<c:forEach items="${listAll }" var="dto" begin="3" end="3" step="1" >
			<input type="text" maxlength="50" id="fourthline" readonly="readonly" value="${dto.st_content }"></br>
			<input type="text" maxlength="50" id="fourthinput" value=""></br>
			</c:forEach>
	</div> 

</body>
</html>