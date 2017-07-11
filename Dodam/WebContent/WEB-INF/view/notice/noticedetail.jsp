<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- 회원가입 화면 -->
<link rel="stylesheet" type="text/css" href="/noticecss/noticedetail.css" />

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Scripts -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
function move_Action( url ){
	document.move.action = url;
	document.move.submit();

}
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


	<!-- 공지사항전체화면 -->
	<div class="contentwrap">
		<article class="container">
			<div class="page-header">
				<h1>공지사항</h1>
			</div>
			<br />

			<!-- 공지사항 상세정보 -->
			<div class="container notice">
				<h1 class="title">공지사항</h1>
				<table class="table">
					<tbody>
						<tr>
							<th>글번호</th>
							<td style="width: 264px;">${model.notice_num}</td>
							<th>작성자</th>
							<td>관리자</td>
						</tr>

						<tr>
							<th>작성일</th>
							<td>${model.notice_regdate}</td>
							<th>조회수</th>
							<td>${model.notice_hits}</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3">${model.notice_title}</td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="editReadWrap">
									${model.notice_content }
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<a href="delete_ok.dodam?notice_num=${param.notice_num}" class="btn btn-default pull-right" >삭제</a>
				<a class="btn btn-default pull-right" onclick="move_Action('noticeedit.dodam')">수정</a>
				<a href="noticeList.dodam" class="btn btn-default pull-right">목록</a>
			</div>
			<!-- 공지사항 상세정보end -->
			
		</article>
	</div>
<!-- 수정/삭제/답변/목록으로  이동할때 가지고 갈 Form -->
<form name="move"  method="post">
  <input type="hidden" name="notice_num" value="${param.notice_num}"/>
</form>

</body>
</html>