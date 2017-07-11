<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- 회원가입 화면 -->
<link rel="stylesheet" type="text/css" href="/noticecss/notice.css" />

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Scripts -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript" src="/js/paginathing.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<!-- 상단메뉴 -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="/main/main.dodam">도담도담</a>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse">
				<div class="row">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/main/main.dodam">HOME</a></li>
						<li><a href="/main/main.dodam">로그인</a></li>
						<li><a href="/main/join.dodam">회원가입</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>


	<!-- 공지사항리스트전체화면 -->
	<div class="contentwrap">
		<article class="container">
			<div class="page-header">
				<h1>공지사항</h1>
			</div>
			<br />

				<!-- 공지사항리스트 -->
				<div class="container notice">
				<h1 class="title">공지사항</h1>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
						<c:when test="${listModel == null}">
            				<tr><td colspan='4'>등록된 게시물이 없습니다.</td></tr>
       					</c:when>
       					<c:otherwise>
           					<c:forEach items="${listModel}" var="a" >
								<tr>
									<td>${a.notice_num}</td>
									<td><a href="noticedetail.dodam?notice_num=${a.notice_num}">${a.notice_title}</a></td>
									<td>${a.notice_regdate}</td>
									<td>${a.notice_hits}</td>
								</tr>
							</c:forEach>
        				</c:otherwise>
						</c:choose>
						</tbody>
					</table>
					
					<a href="noticewrite.dodam" class="btn btn-default pull-right">글쓰기</a>
					<div class="text-center">
						<ul class="pagination">
							<li><a href="#">1</a>
						</ul>
					
					</div>
				</div>
		</article>
	</div>


</body>
</html>