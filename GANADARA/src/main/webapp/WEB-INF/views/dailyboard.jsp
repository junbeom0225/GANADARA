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
							<col width="50"/>
							<col width="100"/>
							<col width="500"/>
							<col width="200"/>
							<col width="100"/>
							<tr>
								<th>NO</th>
								<th>writer</th>
								<th>title</th>
								<th>date</th>
								<th>correction check</th>
							</tr>
							<c:choose>
								<c:when test="${empty list}">
									<tr>
										<th colspan="5">------There is no written article------</th>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="dto" items="${list }">
										<tr>
											<td>${dto.db_no }</td>
											<td>${dto.member_no }</td>
											<td><a href="detail.do?db_no=${dto.db_no }&member_no=${dto.member_no}">${dto.db_title }</a></td>
											<td><fmt:formatDate value="${dto.db_date }" pattern="yyyy-MM-dd"/></td>
											<td>${dto.db_answer }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<tr>
								<td colspan="5">
									<input type="button" value="WRITE" onclick="location.href='./insertform.do'"/>
								</td>
							</tr>
						</table>
								
					
				</div>

			</div>

		</div>
	</div>
	
	<%@ include file="../../resources/css/footer_pop.jsp"%>

</body>
</html>




























