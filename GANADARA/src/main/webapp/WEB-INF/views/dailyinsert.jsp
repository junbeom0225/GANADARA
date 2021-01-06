<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
#main {
	height: 100em;
}

div {
	position: relative;
}

#title {
	position: relative;
	margin-left: 2em;
	padding: 0;
}

h2 {
	margind-bottom: 0;
	padding-bottom: 0;
}

#title00 {
	padding-top: 1em;
	margin-bottom: 0;
	padding-bottom: 0;
}

#explain {
	color: white;
	margin: 0;
	padding: 0;
}

#play {
	position: absolute;
	width: 4em;
	margin-left: 20em;
	margin-top: 6em;
}

button {
	margin-left: 50em;
	margin-top: 30em;
	width: 15em;
}

#img2 {
	position: relative;
	width: 100% l height:100%;
}

#num01, #num02 {
	width: 15%;
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
	margin-left: 11em;
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

#thumbnails {
	width: 100%;
	height: 650px;
	margin-right: 2em;
	margin-top: 2em;
	margin-bottom: 1em;
}

#box {
	position: relative;
	width: 100%;
	height: 100%;
	background: #2c2c32;
	border-radius: 2em;
}

.words {
	margin: 5em;
	border: 1px dotted white;
	height: 25em;
	border-radius: 1em;
}

.para {
	margin: 2em;
}
</style>

<title>첨삭글 등록</title>
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
						<h2 id="title00">글쓰기 연습</h2>
						<a id="explain" style="font-size: large;"></a>
					</div>

					<form action="insertres.do" method="post">
						<table border="1">
							<tr>
								<th>writer</th>
								<!-- login한 사람이니가 안보이고 login정보에서 member_no가져옴 login.member_no -->
								<td><input type="text" name="member_no"
									value="${login.member_no }" readonly="readonly" /></td>
							</tr>
							<tr>
								<th>title</th>
								<td><input type="text" name="db_title" /></td>
							</tr>
							<tr>
								<th>content</th>
								<td><textarea rows="10" cols="60" name="db_content"></textarea></td>
							</tr>
							<tr>
								<td colspan="2" align="right"><input type="submit"
									value="completed" /> <input type="button" value="list"
									onclick="location.href='./list.do'" /></td>
							</tr>
						</table>

					</form>


				</div>

			</div>

		</div>
	</div>



	<%@ include file="../../resources/css/footer_pop.jsp"%>

</body>
</html>




























