<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#userinfo{float: left; font-size : 30px; }
	#gamebody{background-color: #E56D29; width: 1200px; height: 700px; margin-left: 150px;}
	#textbox{width:100%; height:95%; position:  relative;}
	#inputbox{text-align: center; border-top-style: solid; border-top-color: black; padding-top: 5px;}
	#buttonbox{display:inline-block}
	#startbox{position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 10000;}
	
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<body>
	<aside id="userinfo">
		<div id="score"></div>
		<div id="life"></div>
	</aside>
	<input type="hidden" id="level">
	<div id="gamebody">
		<!-- 여기에 단어들 뿌려줄것이다 -->
		<div id="textbox"></div>
		<div id="startbox">
				<button style="font-size: 60px; text-align: center;" id="gamestart">게임시작</button>
			</div>
		<div id="inputbox">
			<div id="buttonbox">
				<input type="text" id="inputtext">
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	
	var level = "";
	
	// 팝업창 가운데로 위치지정해줄 값
	var popleft = (document.body.offsetWidth /2) - (400 / 2);
	var poptop = (window.screen.height /2) - (400 /2);
	
	window.open('keypop.do','GAMELEVEL','width=400, height=400, left ='+popleft+',top='+poptop);

	// 단어리스트
	var wordlist = ["자바", "파이썬", "몽고디비", "고구마", "사과", "바나나", "경복궁", "제이쿼리", "스프링", "스프링부트",
        "자바스크립트", "오라클디비", "마이에스큐엘", "톰캣", "이클립스", "마이바티스", "포도", "아메리카노", "바닐라라떼", "헤이즐럿아메리카노"
        ];
	
	// taja의 각 글자마다 top을 주기위한 배열 초기화 (글자를 내려오게 하기 위해 style 의 top을 이용할 것입니다)
    var plusTop = new Array(wordlist.length);
    for (let i = 0; i < plusTop.length; i++) {
        plusTop[i] = 0;
    }

	
	var wordObj = [];
	
	var textboxs = document.getElementById("textbox");
	
	var life = 0;
	// 라이프
	var lifeDiv = document.getElementById("life");
	lifeDiv.innerHTML = "LIFE : "+life;
	// 점수
	var score = 0;
	var scoreDiv = document.getElementById("score");
	scoreDiv.innerHTML = "SOCRE : "+score;
	// wordlist index 변수
	var wlidx = 0; 
	
	// 게임시작시 난이도에 따른 라이프 지급
	$("#gamestart").click(function(){
		level = $("#level").val();
		if( level == "T"){
			life = 3;
		}else if( level == "M"){
			life = 5;
		}else if(level == "L"){
			life = 7;
		}
		lifeDiv.innerHTML = "LIFE : "+life;
	});
	
	function drawWord(){
		
		var randomPick = 0;
        var temp = null;

        // 랜덤으로 taja배열을 섞어주기 위한 for문
        for (let i = 0; i < wordlist.length; i++) {
            randomPick = Math.round(Math.random() * (wordlist.length - 1));
            temp = wordlist[randomPick];
            wordlist[randomPick] = wordlist[i];
            wordlist[i] = temp;
        }
		
		var leftWidth = Math.round(Math.random() * 1200);
		var wordDiv = document.createElement("div");
		
		var drawInterval = setInterval(function () {
			
			var leftWidth = Math.round(Math.random() * 1200);
			var tajaDiv = document.createElement("div");
			tajaDiv.classList.add("tajaWord");
			tajaDiv.style.width = "200px";
			tajaDiv.style.height = "30px";
			tajaDiv.style.position = "absolute";
			tajaDiv.style.textAlign = "center";
			tajaDiv.innerHTML = wordlist[wlidx++];
			textboxs.appendChild(tajaDiv);
			
			if(leftWidth + 200 >= textboxs.offsetWidth) {
				tajaDiv.style.left = (leftWidth - 200) +"px";
			}else{
				tajaDiv.style.left = leftWidth + "px";
			}
			
			wordObj.push(tajaDiv);
			
			if(wordObj.length === wordlist.length){
				clearInterval(drawInterval);
			}
			
		}, 1500);
		
	}
	
	function downWord(){
		
		setInterval(function (){
			for (let i = 0; i < wordlist.length; i++){
				if(i < wordObj.length){
					wordObj[i].style.top = plusTop[i] + "px";
					// div 바닥에 닿았을때 제거 하고 life 감소
					if(plusTop[i] + 30 >= textboxs.offsetHeight){
						if(textboxs.contains(wordObj[i])){
							textboxs.removeChild(wordObj[i]);
							life--;
							lifeDiv.innerHTML = "LIFT : "+ life;
							
							// life 소진되었을때
							if (life === 0){
								alert("GAME OVER");
								alert('');
								location.reload();
							}
							
							if(wordObj.length == wordlist.length){
								if(!textboxs.hasChildNodes()){
									alert("Clear!!");
									location.reload();
								}
							}
						}
					}
					if(level == "T"){
						plusTop[i] += 40;
					}else if(level == "M"){
						plusTop[i] += 25;
					}else if(level == "L"){
						plusTop[i] += 10;
					}
				}
			}
		}, 800);
		
	}
	
	var inputText = document.getElementById("inputtext");
	inputText.addEventListener("keydown", function(e){
		
		if(e.keyCode === 13){
			for(let i = 0; i < wordObj.length; i++){
				
				if(inputText.value === wordObj[i].innerHTML){
					textboxs.removeChild(wordObj[i]);
					score += 200;
					scoreDiv.innerHTML = "SCORE : " + score;
					
					if(wordObj.length === wordlist.length){
						if(!textboxs.hasChildNodes()){
							alert("Clear!!");
							alert("점수 : " +score);
							location.reload();
						}
					}
				}
			}
			inputText.value = "";
		}
		
	});
	
	var count = 0;
	
	// 시작하기
    var gameStart = document.getElementById("gamestart");
    gameStart.addEventListener("click", function () {
    	$("#startbox").remove();
        // 버튼을 눌렀을 때마다 메서드가 실행되므로 최초 1회만 실행되도록 count변수로 막아주었습니다.
        if (count === 0) {
        	drawWord();
        	downWord();
        }
        count++;
    });

</script>
</html>