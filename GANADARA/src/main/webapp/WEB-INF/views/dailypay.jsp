<%@page import="com.gana.dara.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% MemberDto dto = (MemberDto)session.getAttribute("login"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
    function charge_kakao() {
        // getter
        var kakaoValue = {
        		
        }
        
        var IMP = window.IMP;
        IMP.init('imp63376280');
        var money = $('input[name="cp_item"]:checked').val();
        console.log(money);

        IMP.request_pay({
            pg: 'kakao',
            merchant_uid: 'merchant_' + new Date().getTime(),

            name: '주문명 : GANADARA 데일리 서비스 결제',
            amount: 100,
            buyer_email: '${login.member_email }',
            buyer_name: '${login.member_name }',
            buyer_tel: '${login.member_tel }'
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '결제 금액 : ' + rsp.paid_amount;
                
                $.ajax({
                    type: "GET", 
                    url: "kakao.do", //충전 금액값을 보낼 url 설정
                    data: {
                    	
                    	imp_uid : rsp.imp_uid
                    },
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
            document.location.href="main.do"; //alert창 확인 후 이동할 url 설정
        });
    };
</script>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="resources/css/assets/dailypay.css" />
</head>
<body id="top" class="is-preload">

	<!-- Banner -->
	<!--
				To use a video as your background, set data-video to the name of your video without
				its extension (eg. images/banner). Your video must be available in both .mp4 and .webm
				formats to work correctly.
			-->
	<!-- Header -->
	<header id="header">
		<a class="logo" href="index.jsp">home</a>
		<nav>
			<a href="#menu">Menu</a>
		</nav>
	</header>

	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="main.do">메인으로</a></li>
			<li><a href="updateview.do">회원정보수정</a></li>
			<li><a href="dailypay.do">데일리 서비스 결제</a></li>
			<li><a href="mypage.do">마이페이지</a></li>
			<li><a href="logout.do">로그아웃</a></li>
		</ul>
	</nav>
	
	<section id="banner" data-video="resources/img/assets">
		<div class="inner">
			<div id="h">
				<h1>가나다라</h1>
				<p>
					 데일리 서비스는 글의 구조(Structure), 내용(Content), 문법(Grammar), 어휘(Word Choice)에 대한 
					  <br /> 상세 코멘트를 받을 수 있는 서비스입니다. <br />
					  
				</p>
			</div>
			<a href="#main" class="more">Learn More</a>
		</div>
	</section>
	
	<!-- Main -->
	<div id="main">
		<div class="inner">
	
		<table>
			<col width="150px">
			<col width="300px">
			<col width="150px">
			<tr>
				<td>데일리 첨삭 서비스</td>
				<td id="second-td">원어민 선생님에게 첨삭을 받아보세요~! <br/>
				검증된 원어민 선생님이 회원님의 에세이를 1:1 첨삭하고 평가하므로 글쓰기에 대한 최적의 피드백을 얻을 수 있습니다. </td>
				<td align=right id="cp_item" value="100">100원</td>
			</tr>
		</table>

	
	<div id="pay_button_div">
		<input type="button" value="결제하기"  onclick="charge_kakao();"/>
	</div>
	
	</div>

	</div>
	
	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<h2>가나다라마바사아자차카타파하</h2>
			<p>가나다라 한국어 학습은 최희선, 황다혜, 최소연, 황다혜, 박준범, 박건웅을 도움으로 제작되었습니다만, 제작물
				중 저작권은..아무것도 우리에게 없어요. 파이널 도대체 언제 끝날까요. 메리크리스마스...</p>

			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon fa-envelope"><span
						class="label">Email</span></a></li>
			</ul>
			<p class="copyright">
				 &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>.
				Images: <a href="https://unsplash.com/">Unsplash</a>. Videos: <a
					href="http://coverr.co/">Coverr</a>.
			</p>
		</div>
	</footer>

	<!-- Scripts -->
	<script src="resources/js/assets/breakpoints.min.js"></script>
	<script src="resources/js/assets/jquery.min.js"></script>
	<script src="resources/js/assets/jquery.scrolly.min.js"></script>
	<script src="resources/js/assets/jquery.poptrox.min.js"></script>
	<script src="resources/js/assets/skel.min.js"></script>
	<script src="resources/js/assets/util.js"></script>
	<script src="resources/js/assets/main.js"></script>
	<script src="resources/js/assets/browser.min.js"></script>

</body>
</html>