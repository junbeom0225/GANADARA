<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
#banner{background-image: url("resources/img/assets/beginner_banner.png");}}

</style>

<title>한국어학습</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="resources/css/assets/basic.css" />
</head>
<body id="top" class="is-preload">
<%@ include file="../../resources/css/header.jsp"%>

	<section id="banner" data-video="resources/img/assets">
		<div class="inner">
			<div id="h">
			<p></p>
			</div>
			<a href="#main" class="more">Learn More</a>
		</div>
	</section>
	
	<!-- Main -->
	<div id="main">
		<div class="inner">

			<!-- Boxes -->
			<div class="thumbnails">
			
			
			<c:choose>
				<c:when test="${empty videoList }">
					<p>연결 오류 입니다. 다시 시도해 주세요. </p>
				</c:when>
				<c:otherwise>
					<c:forEach items="${videoList }" var="dto">
						<input type="hidden" id="edu_grade" value="${dto.edu_grade }">  
						<div class="box">
							<a href="${dto.edu_url }" class="image fit"></a>
							<div class="inner">
							<input type="hidden" name="edu_no" value="${dto.edu_no }">
								<h3>${dto.edu_level}. ${dto.edu_title }</h3>
								<p>${dto.edu_detail }</p>
								<a href="${dto.edu_url }" class="button fit" data-poptrox="youtube,800x400">강의 듣기</a>
								<a href="#" class="button style2 fit">단어 연습</a>
								<a href="#" class="button style3 fit">발음 연습</a>
							</div>
						</div>
					
					</c:forEach>
				</c:otherwise>
			</c:choose>				
				
			</div>

		</div>
	</div>
<%@ include file="../../resources/css/footer_pop.jsp"%>

</body>
</html>




























