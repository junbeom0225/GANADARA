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
            amount: money,
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
</head>
<body>

	
		
	
		
	<label class="box-radio-input">
	<input type="radio" name="cp_item" value="50">
	<span>1개월(50원)</span>
	</label>
	
    <label class="box-radio-input">
    <input type="radio" name="cp_item" value="100">
    <span>3개월(100원)</span></label>
    
    <label class="box-radio-input">
    <input type="radio" name="cp_item" value="150">
    <span>5개월(150원)</span></label>
		
	
	<div id="pay_button_div">
		<input type="button" value="결제하기"  onclick="charge_kakao();"/>
	</div>
	
	

</body>
</html>