<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- circle  -->
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/assets/css/main.css" />	

<title>Insert title here</title>

<style>
* {
margin: 0;
padding: 0;
}
html {
height: 100%;
background: white;
/* background: linear-gradient(rgba(196, 102, 0, 0.2), rgba(155, 89, 182, 0.2)); */
}
body {
font-family: arial, verdana;
}
</style>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.js"></script>
<script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js" type="text/javascript"></script>
<script src="js/jquery-multi-step-form.js" type="text/javascript"></script>
<link href="css/jquery-multi-step-form.css" media="screen" rel="stylesheet" type="text/css">

		
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
			<header id="header" class='header hide'>
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

			<div style="margin-top:35px">
			<nav id="main-nav" role="navigation">
				<ul id="main-menu" class="sm sm-mint">
					<li><a href="/reservation/reserView.dodam"><font size="5em">예약</font></a></li>
					<li><a href="/counter/counterView.dodam"><font size="5em">접수</font></a></li>
					<li><a href="/jinryo/jinryoView.dodam"><font size="5em">진료</font></a></li>
					<li><a href="#"><font size="5em">입원/호텔</font></a>
						<ul>
							<li><a href="/stay/stayView.dodam">입원 및 호텔하기</a></li>
							<li><a href="#">입원 및 호텔 카메라 보여주기</a></li>
						</ul>
					</li>	
					<li><a href="/beauty/beautyView.dodam"><font size="5em">미용</font></a></li>
					<li><a href="/payment/paymentView.dodam"><font size="5em">수납</font></a></li>
				</ul>
			</nav>
			
			
			<!-- 여기 부분이 실질적으로 코딩하는 부분입니다~~~ div의 테두리는 지금 보기 편하기 위한 부분이고, 나중에 지울껍니다~~ -->
		<div style="border:1px solid red">
			
			<h1 style="margin: 150px auto 50px auto" align="center"></h1>
			<div id="multistepform-example-container">
<!-- 				<ul id="multistepform-progressbar"> -->
<!-- 					<li class="active">Customer step</li> -->
<!-- 					<li>Animal step</li> -->
<!-- 					<li>Save information</li> -->
<!-- 				</ul> -->
				<div class="form">
					<form action="">
						<h2 class="fs-title">Step 1. 고객 등록</h2>
						<h3 class="fs-subtitle">Please register your infromation</h3>
						<input type="text" name="customerNum" placeholder="1077">
						<input type="text" name="name" placeholder="보호자"> <input
							type="text" name="address" placeholder="서울 구로구">
						<textarea name="memo" placeholder="memo"></textarea>
						<input type="button" name="next" class="next button" value="Next">
					</form>
				</div>
				<div class="form">
					<form action="">
						<h2 class="fs-title">Step 2. 동물 등록</h2>
						<h3 class="fs-subtitle">Please register your animal's picture</h3>



						<!--  파일 업로드 코딩 -->

						<input type="text" name="number" placeholder="32571"> <input
							type="text" name="animalname" placeholder="이름"> <input
							type="text" name="animaltype" placeholder="품종"> <input
							type="text" name="color" placeholder="피모색">

						<div>

							<h1>담당자</h1>
							<select>
								<option style="display: none">담당자</option>
								<optgroup label="진료담당자">
									<option>박보검</option>
									<option>송중기</option>
								</optgroup>
								<optgroup label="미용담당자">
									<option>현아</option>
									<option>경리</option>
								</optgroup>
							</select>
						</div>
						<textarea name="memo" placeholder="memo"></textarea>
						<input type="button" name="previous" class="previous button"
							value="Previous"> <input type="button" name="next"
							class="next button" value="Next">
					</form>
				</div>
				<div class="form">
					<form action="">
						<h2 class="fs-title">저장</h2>
						<h3 class="fs-subtitle">check your information</h3>

						<input type="button" name="previous" class="previous button"
							value="Previous"> <input type="button" name="submit"
							class="next button" value="Save">
					</form>
				</div>
			</div>
			<script>
				$(document).ready(function() {
					$.multistepform({
						container : 'multistepform-example-container',
						form_method : 'GET',
					})
				});
			</script>

			<script type="text/javascript">
				var _gaq = _gaq || [];
				_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
				_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
				_gaq.push([ '_trackPageview' ]);

				(function() {
					var ga = document.createElement('script');
					ga.type = 'text/javascript';
					ga.async = true;
					ga.src = ('https:' == document.location.protocol ? 'https://ssl'
							: 'http://www')
							+ '.google-analytics.com/ga.js';
					var s = document.getElementsByTagName('script')[0];
					s.parentNode.insertBefore(ga, s);
				})();
			</script>

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
<!-- 			<script src="/assets/js/jquery.min.js"></script> -->
			<script src="/assets/js/skel.min.js"></script>
			<script src="/assets/js/util.js"></script>
			<script src="/assets/js/main.js"></script>
				 
	
</body>
</html>