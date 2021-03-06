<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

	<head>
		<title>DodamDodam project</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" type="text/css" href="style.css" />
	
	</head>
	
	
	
	<body>
	
	
		<!-- Header 로그인화면 전 시작화면 -->
			<header id="header" class='header'>
				<div class="inner">
					<div class="content">
						<h1>DodamDodam</h1>
						<h2>건강하고 예쁘게 자라주렴</h2>
						<a href="#" class="button big alt"><span>도담도담한 시작</span></a>
					</div>
					<a href="#" class="button hidden"><span>start</span></a>
				</div>
			</header>



<!-- menubar 메뉴 처리 부분 -->
		<div id="menubar">
			<ul>
				<li class="first active">
					<a href="#">Home</a>
				</li>
				<li>
					<a href="#">예약</a>
				</li>
				<li>
					<a href="#">진료</a>
				</li>
				<li>
					<a href="#">입원&호텔</a>
				</li>
				<li>
					<a href="#">미용</a>
				</li>
				<li>
					<a href="#">수납</a>
				</li>
				
<!-- 				<li class="last"> -->
<!-- 					<a href="#">Contact</a> -->
<!-- 				</li> -->
			</ul>
			<br class="clear" />
			
			<!-- search 검색부분 -->
	  		<div id="wrapper">
	
				<div id="search">
					<form action="" method="post">
						<div>
					
						도담도담 &nbsp;&nbsp; <input class="form-text" name="search" size="32" maxlength="64" />
						<input class="form-submit"  type="submit" value="상세검색" />
						</div>
					</form>
				</div>
	 	 	</div>
		</div>



<!--  -->
		<!-- Main 메인처리할 부분 -->
			<div id="main">
			
				<div id="mainbox">
				
				
				</div>
				
				
			</div>

		<!-- Footer -->
			<footer id="footer">
				<a href="#" class="info fa fa-info-circle"><span>About</span></a>
				<div class="inner">
					<div class="content">
						<h3>This is Footer</h3>
						<p>In tempor porttitor nisl non elementum. Nulla ipsum ipsum, feugiat vitae vehicula vitae, imperdiet sed risus. Fusce sed dictum neque, id auctor felis. Praesent luctus sagittis viverra. Nulla erat nibh, fermentum quis enim ac, ultrices euismod augue. Proin ligula nibh, pretium at enim eget, tempor feugiat nulla.</p>
					</div>
					<div class="copyright">
						<h3>Follow me</h3>
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
						</ul>
						&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com/">Unsplash</a>.
					</div>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>