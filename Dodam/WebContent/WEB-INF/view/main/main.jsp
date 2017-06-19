<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>Radius by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/assets/css/main.css" />
		
		
		<!-- 스마트 메뉴 관련 시작 -->
		<!-- SmartMenus core CSS (required) -->
		<link href="/style/css/sm-core-css.css" rel="stylesheet" type="text/css" />
		
		<!-- "sm-mint" menu theme (optional, you can use your own CSS, too) -->
		<link href="/style/css/sm-mint.css" rel="stylesheet" type="text/css" />
		
		<!-- #main-menu config - instance specific stuff not covered in the theme -->
		<!-- Put this in an external stylesheet if you want the media query to work in IE8 (e.g. where the rest of your page styles are) -->
		<style type="text/css">
			@media (min-width: 768px) {
				#main-nav {
					line-height: 0;
					text-align: center;
				}
				#main-menu {
					display: inline-block;
				}
			}
		</style>
		
		<!-- jQuery -->
		<script type="text/javascript" src="/style/js/jquery.js"></script>
		
		<!-- SmartMenus jQuery plugin -->
		<script type="text/javascript" src="/style/js/jquery.smartmenus.js"></script>
		
		<!-- SmartMenus jQuery init -->
		<script type="text/javascript">
			$(function() {
				$('#main-menu').smartmenus({
					subMenusSubOffsetX: 6,
					subMenusSubOffsetY: -8
				});
			});
		</script>
		<!-- 스마트 메뉴 관련 끝 -->
		
		
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
			
		<!-- Main -->
			<div id="main" style="text-align:center">


			<nav id="main-nav" role="navigation">
				<ul id="main-menu" class="sm sm-mint">
					<li><a href="/reservation/reserView.dodam">예약</a></li>
					<li><a href="/counter/counterView.dodam">접수</a></li>
					<li><a href="/jinryo/jinryoView.dodam">진료</a></li>
					<li><a href="#">입원/호텔</a>
						<ul>
							<li><a href="/stay/stayView.dodam">입원 및 호텔하기</a></li>
							<li><a href="#">입원 및 호텔 카메라 보여주기</a></li>
						</ul>
					</li>	
					<li><a href="/beauty/beautyView.dodam">미용</a></li>
					<li><a href="/payment/paymentView.dodam">수납</a></li>
				</ul>
			</nav>
				
				 
			 <!-- 여기 부분이 실질적으로 코딩하는 부분입니다~~~ div의 테두리는 지금 보기 편하기 위한 부분이고, 나중에 지울껍니다~~ -->
			 <div style="border:1px solid red">
			 코딩을 작성하세요~~~
								 
			 
			 </div>
			 
				 
				
				
			</div>

		<!-- Footer -->
			<footer id="footer">
				<a href="#" class="info fa fa-info-circle"><span>About</span></a>
				<div class="inner">
					<div class="content">
						<h3>Vestibulum hendrerit tortor id gravida</h3>
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
			<script src="/assets/js/jquery.min.js"></script>
			<script src="/assets/js/skel.min.js"></script>
			<script src="/assets/js/util.js"></script>
			<script src="/assets/js/main.js"></script>

	</body>
</html>