<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
div{position: relative;}
#title {
	position: relative;
	margin-left: 2em;
	padding: 0;
}
h2{margind-bottom:0; padding-bottom:0;}
#title00{padding-top: 1em; margin-bottom:0; padding-bottom:0;}
#explain {color: white; margin:0; padding:0;}
#play {
	position: absolute;
	width: 4em;
	margin-left: 20em;
	margin-top: 6em;
}
button {margin-left: 50em; margin-top: 30em; width: 15em; }
#img2 {
	position: relative;
	width: 100% l height:100%;
}


#num01, #num02 {
	width:15%;
	position: absolute;
	border-radius: 10%;
	border: 13px solid #f5f5f5;
	background: #f5f5f5;
	color: black;
	display: inline-block;
	padding-top: 1%;
	padding-bottm: 2%;
	font-size: xxx-large;
	font-weight: 900;
	text-align: center;
}

#num01 {
	margin-left: 11em ;
	margin-top: 2em;
}

#num02 {
	margin-left: 17em;
	margin-top: 2em;
}

#play:hover {
	cursor: pointer;
}

#num01:hover, #num02:hover {
	color: #9d7ed0;
	cursor: pointer;
}

button:hover {
	cursor: pointer;
}

.num {
	color: white;
}

.on {
	color: red;
}

#thumbnails{width: 100%; height: 600px; margin-right:2em; margin-top: 2em; margin-bottom:1em; }
#box{position: relative; width:100%; height:100%; background: #2c2c32; border-radius: 2em;}
.words{margin:5em; border: 1px dotted white; height: 25em; border-radius: 1em;}
.para{margin: 2em;}
</style>

<title>단어연습</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="resources/css/assets/eduwords.css" />
</head>
<body id="top" class="is-preload">
	<%@ include file="../../resources/css/header.jsp"%>



	<!-- Main -->
	<div id="main">
		<div class="inner">

			<!-- Boxes -->
			<div id="thumbnails">
			
				<div id="box">
					<div id="title">
						<h2 id="title00">첨삭 관리</h2>
							<a id="explain" style="font-size: large;"></a>	
					</div>
					<table border="1">
		<tr>
			<th>writer</th>
			<td>${dbdto.member_no }</td>
		</tr>
		<tr>
			<th>title</th>
			<td>${dbdto.db_title }</td>
		</tr>
		<tr>
			<th>content</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${dbdto.db_content}</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="modify" onclick="location.href='./updateform.do?db_no=${dbdto.db_no}'"/>
				<input type="button" value="delete" onclick="location.href='./delete.do?db_no=${dbdto.db_no}&member_no=${dbdto.member_no }'"/>
				<input type="button" value="list" onclick="location.href='/dara/dailyBoard/list.do'"/>
			</td>
		</tr>
	</table>
	<div class="container">
        <label for="content">comment</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="db_no" value="${dbdto.db_no}"/>
               <input type="text" name="ma_writer" class="form-control"/>
               <textarea rows="10" cols="50" name="ma_content" placeholder="내용을 입력하세요." class="form-control" id="content"></textarea>
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    
    <div class="container">
        <div class="commentList"></div>
    </div>
	
<script type="text/javascript">
	var db_no = '${dbdto.db_no}';
	$('[name=commentInsertBtn]').click(function(){
		var insertData = $('[name=commentInsertForm]').serialize();
		commentInsert(insertData); 
	});

	//댓글 목록
	function commentList(){
		$.ajax({
			url : 'replylist.do',
			type : 'get',
			data : {'db_no':db_no},
			success : function(data){
				var a = '';
				$.each(data, function(key, value){
					a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
	                a += '<div class="commentInfo'+value.ma_no+'">'+'댓글번호 : '+value.ma_no+' / 작성자 : '+value.ma_writer;
	                a += '<button onclick="commentUpdate('+value.ma_no+',\''+value.ma_content+'\');"> 수정 </button>';
	                a += '<button onclick="commentDelete('+value.ma_no+');"> 삭제 </button> </div>';
	                a += '<div class="commentContent'+value.ma_no+'"> <textarea rows="70" cols="50"> 내용 : '+value.ma_content +'</textarea>';
	                a += '</div></div>';
				});
				$(".commentList").html(a);
			}
		});
	}
	
	//댓글 등록
	function commentInsert(insertData){
    $.ajax({
        url : 'replyinsert.do',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=ma_content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(ma_no, ma_content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="ma_content_'+ma_no+'" value="'+ma_content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+ma_no+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+ma_no).html(a);
    
}
 
	//댓글 수정
	function commentUpdateProc(ma_no){
	    var updateContent = $('[name=ma_content_'+ma_no+']').val();
	    
	    $.ajax({
	        url : 'replyupdate.do',
	        type : 'post',
	        data : {'ma_content' : updateContent, 'ma_no' : ma_no},
	        success : function(data){
	            if(data == 1) {
	            	console.log(data);
	                alert('댓글이 수정되었습니다.');
	            	commentList(db_no); //댓글 수정후 목록 출력 
	            }
	        }
	    });
	}
	 
	//댓글 삭제 
	function commentDelete(ma_no){
	    $.ajax({
	        url : 'replydelete.do',
	        type : 'get',
	        data : {'ma_no' : ma_no},
	        success : function(data){
	        	console.log(data);
	            if(data == 1) {
	            	commentList(db_no); //댓글 삭제후 목록 출력 
	            	
	            }
	        }
	    });
	}
	 
	 
	 
	 
	$(document).ready(function(){
	    commentList(); //페이지 로딩시 댓글 목록 출력 
	});



</script> 
								
					
				</div>

			</div>

		</div>
	</div>
	
	
	
	<%@ include file="../../resources/css/footer_pop.jsp"%>

</body>
</html>




























