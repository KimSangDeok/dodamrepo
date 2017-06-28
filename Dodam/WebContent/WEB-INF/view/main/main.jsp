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

<script src="/logincss/js/jquery.min.js"></script>
<script src="/logincss/js/jquery.dropotron.min.js"></script>
<script src="/logincss/js/jquery.scrolly.min.js"></script>
<script src="/logincss/js/jquery.scrollgress.min.js"></script>
<script src="/logincss/js/skel.min.js"></script>
<script src="/logincss/js/util.js"></script>

<!-- <script src="index.js"></script> -->

<!-- <link href="site.css" rel="stylesheet" type="text/css" /> -->
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
		<section id="banner"> <!--
						".inner" is set up as an inline-block so it automatically expands
						in both directions to fit whatever's inside it. This means it won't
						automatically wrap lines, so be sure to use line breaks where
						appropriate (<br />).
					-->
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

		<article id="main"> <section class="wrapper style1 container special"> <br />
		<br />
		<div class="row">
<!-- 			<div class="6u 12u(narrower) news"> -->
				<div class="container">
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
<%-- 									<c:forEach items="${bookList}" var ="b"> --%>
										<ul id="demo1">
											<li class="news-item">Curabitur porttitor ante eget
												hendrerit adipiscing. Maecenas at magna accumsan, rhoncus
												neque id, fringilla dolor. <a href="#">Read more...</a>
											</li>
											<li class="news-item">Curabitur porttitor ante eget
												hendrerit adipiscing. Maecenas at magna accumsan, rhoncus
												neque id, fringilla dolor. <a href="#">Read more...</a>
											</li>
											<li class="news-item">Praesent ornare nisl lorem, ut
												condimentum lectus gravida ut. Ut velit nunc, vehicula
												volutpat laoreet vel, consequat eu mauris. <a href="#">Read
													more...</a>
											</li>
											<li class="news-item">Nunc ultrices tortor eu massa
												placerat posuere. Vivamus viverra sagittis nunc. Nunc et
												imperdiet magna. Mauris sed eros nulla. <a href="#">Read
													more...</a>
											</li>
											<li class="news-item">Morbi sodales tellus sit amet leo
												congue bibendum. Ut non mauris eu neque fermentum pharetra.
												<a href="#">Read more...</a>
											</li>
											<li class="news-item">In pharetra suscipit orci sed
												viverra. Praesent at sollicitudin tortor, id sagittis magna.
												Fusce massa sem, bibendum id. <a href="#">Read more...</a>
											</li>
											<li class="news-item">Maecenas nec ligula sed est
												suscipit aliquet sed eget ipsum. Suspendisse id auctor nibh.
												Ut porttitor volutpat augue, non sodales odio dignissi id. <a
												href="#">Read more...</a>
											</li>
											<li class="news-item">Onec bibendum consectetur diam,
												nec euismod urna venenatis eget. Cras consequat convallis
												leo. <a href="#">Read more...</a>
											</li>
										</ul>
<%-- 										</c:forEach> --%>
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
								<a href=""><b>Notice</b></a>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-xs-12">
										<ul id="demo2">
											<li class="news-item">Curabitur porttitor ante eget
												hendrerit adipiscing. Maecenas at magna accumsan, rhoncus
												neque id, fringilla dolor. <a href="#">Read more...</a>
											</li>
											<li class="news-item">Curabitur porttitor ante eget
												hendrerit adipiscing. Maecenas at magna accumsan, rhoncus
												neque id, fringilla dolor. <a href="#">Read more...</a>
											</li>
											<li class="news-item">Praesent ornare nisl lorem, ut
												condimentum lectus gravida ut. Ut velit nunc, vehicula
												volutpat laoreet vel, consequat eu mauris. <a href="#">Read
													more...</a>
											</li>
											<li class="news-item">Nunc ultrices tortor eu massa
												placerat posuere. Vivamus viverra sagittis nunc. Nunc et
												imperdiet magna. Mauris sed eros nulla. <a href="#">Read
													more...</a>
											</li>
											<li class="news-item">Morbi sodales tellus sit amet leo
												congue bibendum. Ut non mauris eu neque fermentum pharetra.
												<a href="#">Read more...</a>
											</li>
											<li class="news-item">In pharetra suscipit orci sed
												viverra. Praesent at sollicitudin tortor, id sagittis magna.
												Fusce massa sem, bibendum id. <a href="#">Read more...</a>
											</li>
											<li class="news-item">Maecenas nec ligula sed est
												suscipit aliquet sed eget ipsum. Suspendisse id auctor nibh.
												Ut porttitor volutpat augue, non sodales odio dignissi id. <a
												href="#">Read more...</a>
											</li>
											<li class="news-item">Onec bibendum consectetur diam,
												nec euismod urna venenatis eget. Cras consequat convallis
												leo. <a href="#">Read more...</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
					<!-- </div> -->
				</div>

<!-- 			</div> -->
		</div>
		
		</section> </article>



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