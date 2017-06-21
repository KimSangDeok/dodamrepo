<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>매출관리 화면입니다</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/maincss/css/main.css" />		
		<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="/css/reset.css"> <!--CSS reset-->
	<link rel="stylesheet" href="/css/style.css"> <!--Resource style  -->
	
<script async src="https://production-assets.codepen.io/assets/embed/ei.js"></script>
	
	

		
		<!-- 스마트 메뉴 관련 시작 -->
		<!-- SmartMenus core CSS (required) -->
		<link href="/css/sm-core-css.css" rel="stylesheet" type="text/css" />
		
		<!-- "sm-mint" menu theme (optional, you can use your own CSS, too) -->
		<link href="/css/sm-mint.css" rel="stylesheet" type="text/css" />
		
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
		<script type="text/javascript" src="/js/jquery.js"></script>
		
		<!-- SmartMenus jQuery plugin -->
		<script type="text/javascript" src="/js/jquery.smartmenus.js"></script>
		
		 <!-- Modernizr -->
		<script src="/js/modernizr.js"></script>
<!-- 		<script src="/js/jquery-2.1.4.js"></script> -->
		<script src="/js/popmenumain.js"></script> <!--Resource jQuery-->
		
		
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
			
			
			
			
			
			<nav class="cd-stretchy-nav">
		<a class="cd-nav-trigger" href="#0" style="background:#ffb700">
			Menu
			<span aria-hidden="true"></span>
		</a>

		<ul>
			<li><a href="/customer/customerView.dodam" style="color: #000000;text-decoration: none;"><span>고객관리</span></a></li>
			<li><a href="#0" style="color: #000000;text-decoration: none;"><span>재고관리</span></a></li>
			<li><a href="#0" style="color: #000000;text-decoration: none;"><span>운영관리</span></a></li>
			<li><a href="/mpay/mpayView.dodam" style="color: #000000;text-decoration: none;"><span>매출관리</span></a></li>
		</ul>
		<span aria-hidden="true" class="stretchy-nav-bg" style="background:#ffb700;"></span>
	</nav>
			
			
			
			
			

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
			 <div>
<span>
			<!-- manage화면의 menu 시작-->
				<link rel="stylesheet" type="text/css" href="/manage/style.css" />
				      <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css' />
				<script type="text/javascript" src="/manage/modernizr.custom.79639.js"></script>
				<noscript><link rel="stylesheet" type="text/css" href="/manage/noJS.css" /></noscript> 
					<section class="main">
						<div class="wrapper-demo">
							<div id="dd" class="wrapper-dropdown-3" tabindex="1">
								<span>Transport</span>
								<ul class="dropdown">
									<li><a href="/mpay/mpayView"><i class="icon-envelope icon-large"></i>시간대별 접수고객</a></li>
									<li><a href="/mpay/mpayView2"><i class="icon-truck icon-large"></i>매출 액 및 매출 건수</a></li>
									<li><a href="/mpay/mpayView3"><i class="icon-plane icon-large"></i>매출 내용 분석</a></li>
								</ul>
							</div>
						​</div>
					</section>			 
				<script type="text/javascript">
				
				function DropDown(el) {
					this.dd = el;
					this.placeholder = this.dd.children('span');
					this.opts = this.dd.find('ul.dropdown > li');
					this.val = '';
					this.index = -1;
					this.initEvents();
				}
				DropDown.prototype = {
					initEvents : function() {
						var obj = this;
				
						obj.dd.on('click', function(event){
							$(this).toggleClass('active');
							return false;
						});
				
						obj.opts.on('click',function(){
							var opt = $(this);
							obj.val = opt.text();
							obj.index = opt.index();
							obj.placeholder.text(obj.val);
						});
					},
					getValue : function() {
						return this.val;
					},
					getIndex : function() {
						return this.index;
					}
				}
				
				$(function() {
				
					var dd = new DropDown( $('#dd') );
				
					$(document).click(function() {
						// all dropdowns
						$('.wrapper-dropdown-3').removeClass('active');
					});
				
				});
				
				</script>
				<!-- manage화면의 menu 끝 -->
				
				
				
</span>
				

			 
				 
				 
				 
				 
				 
				
				
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
			<!-- jquery가 겹쳐서 -->
<!-- 			<script src="/js/jquery.min.js"></script> -->
			<script src="/js/skel.min.js"></script>
			<script src="/js/util.js"></script>
			<script src="/js/main.js"></script>

	</body>
</html>