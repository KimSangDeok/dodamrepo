<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/logincss/css/main.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/logincss/bootstrap-theme.css">


<script language="JavaScript">
var page,wid,hit,nam;
function win2(page,nam,wid,hit){
var windo=eval('window.open("'+page+'","'+nam+'","location=no,status=no,toolbar=no,resizable=no,scrollbars=no, menubar=no,width='+wid+',height='+hit+',left=720, top=300, width=450, height=313")');
}
</script>

<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/logincss/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>
<script>
	function check() {
		if (document.form.per_id.value == "") {
			alert("ID를 입력하세요.")
			document.form.per_id.focus();
			return false;
		}

		if (document.form.per_pass.value == "") {
			alert("패스워드를 입력하세요.")
			document.form.per_pass.focus();
			return false;
		}

		document.form.submit();//전송

	}
</script>
<script type="text/javascript">
$(function(){
	var news_string = ${resultNews};		// controller에서 받아온 뉴스(string형태)를 잘 가져옴.
	//console.log(news_string.items);
	var news_json = news_string.items;		// news_string에서 뉴스만 있는 'items'만 가져오면 json 형태로 받아짐
	//console.log(news_json.length);
	
	for(var i=0; i<news_json.length; i++){
		console.log(i);
		console.log(news_json[i].title);
		console.log(news_json[i].link);
		
		// 타이틀과, link를 가져와 주자!!!
		$('#demo1').append(		
			"<li class='news-item'>"+
			"<a href="+
			news_json[i].link+
			" target='_blank'>"+	// target='_blank'는 새로운 창으로 띄우게 할려는 속성!!!
			news_json[i].title+
			"</a>"+
			"</li>"
		)
	}
	
	// 뉴스목록
	$("#demo1").bootstrapNews({
        newsPerPage: 10,
        autoplay: false
    });
	
	// 공지사항목록
	$("#demo2").bootstrapNews({
        newsPerPage: 10,
        autoplay: false
    });

})
</script>
<title>로그인메인</title>
</head>
<body class="index">
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header" class="alt">
		<h1 id="logo">
			<a href="main.dodam">도담도담</a>
		</h1>

		</header>

		<!-- Banner -->
		<section id="banner">
		<div class="inner">
			<header>
			<h2>Login</h2>
			</header>
			<form name="form" action="login.dodam" method="post" onSubmit="return check()">
			<p>
				<strong>ID</strong><input type="text" name="per_id">
				<strong>PASSWORD</strong><input type="password" name="per_pass"></p>
				<footer>
				<ul class="buttons vertical">
					<li><input type="submit" name="Submit" value="로그인"></li>
					<li><a href="join.dodam" class="button fit scrolly">회원가입</a></li>
					<li><a href="javascript:win2('idpw_find.dodam', '')" class="button fit scrolly">아이디/비밀번호 찾기</a></li>
				</ul>
				</footer>
				</form>
		</div>

		</section>

		<!-- Main -->

		<article id="main"> 
				<div class="container" style="width:93%">
					<!-- <div class="row"> -->

					<div class="col-md-6 news">
						<div class="panel panel-default">
							<div class="panel-heading">
								<span class="glyphicon glyphicon-list-alt"></span>
								<a href=""><b>News</b></a>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-xs-12">
										<ul id="demo1">
										<!-- ****뉴스가 들어가는 부분입니다**** -->
										<!-- ****controller에서 뉴스를 가져와서 스크립트에서 append 시켰어여****-->
										</ul>
									</div>
								</div>
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
					
					<div class="col-md-6 notice">
						<div class="panel panel-default">
							<div class="panel-heading">
								<span class="glyphicon glyphicon-list-alt"></span>
								<a href="/notice/noticeList.dodam"><b>Notice</b></a>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-xs-12">
										<ul id="demo2">
										<c:choose>
											<c:when test="${resultNotice == null}">
											<li class="news-item">공지사항이 없습니다.
											</li>
											</c:when>
											<c:otherwise>
											<c:forEach items="${resultNotice}" var="notice">
												<li class="news-item"><a href="/notice/noticedetail.dodam?notice_num=${notice.NOTICE_NUM}">${notice.NOTICE_TITLE}</a></li>
											</c:forEach>
											</c:otherwise>
										</c:choose>	
										</ul>
									</div>
								</div>
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
				</div>
		</article>



		<!-- Footer -->
		<footer id="footer">

		<ul class="icons">
			<li><a href="#" class="icon circle fa-twitter"><span
					class="label">Twitter</span></a></li>
			<li><a href="#" class="icon circle fa-facebook"><span
					class="label">Facebook</span></a></li>
			<li><a href="#" class="icon circle fa-google-plus"><span
					class="label">Google+</span></a></li>
			<li><a href="#" class="icon circle fa-github"><span
					class="label">Github</span></a></li>
			<li><a href="#" class="icon circle fa-dribbble"><span
					class="label">Dribbble</span></a></li>
		</ul>

		<ul class="copyright">
			<li>&copy; Untitled</li>
			<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
		</ul>

		</footer>

	</div>
</body>
</html>