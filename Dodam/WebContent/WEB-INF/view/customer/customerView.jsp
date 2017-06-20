<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>도담도담에 오신것을 환영합니다</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
		
  		
		<link rel="stylesheet" href="/maincss/css/main.css" />		
		<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="/css/reset.css"> <!--CSS reset-->
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/customer-css/profile.css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css"
		integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
		
		
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
		
		
		
		<!-- search style -->
    <style>
    body { background-color: white; font-family:'Roboto';}
/*     .container { margin:150px auto;} */
    input { margin:50px auto;}
    .form-control {
	height: 30px;
	width: 250px;
	margin-left: 200px;
	margin-top: 100px;
}
.line{
margin-top:-50px;

}
.container{margin-left:200px;
			margin-right:0px;
			max-width: 500px;}
			
.col-md-6{
width: 130%;	
}

	
    </style>
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
			

			<div style="margin-top:100px">
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
			 

<!-- table 코딩 -->

<div class="container">
<div class="line">
	<input type="text" class="form-control" 
	placeholder="Search..." id="search_field">
</div>
  <div class="row">
    <div class="col-md-6">

    <table id="myTable" class="table table-inverse">
      <thead>
        <tr class="myHead">
          <th>고객명</th>
          <th>주소</th>
          <th>전화번호</th>
        </tr>
      </thead>
      <tr>
        <td>박보검</td>
        <td>서울시 </td>
        <td>010-1111-2222</td>
      </tr>
      <tr>
        <td>지창욱</td>
        <td>인천 광역시</td>
         <td>010-1111-2223</td>
      </tr>
      <tr>
        <td>송중기</td>
        <td>미국</td>
         <td>010-1111-2224</td>
      </tr>
      <tr>
        <td>이민호</td>
        <td>뉴질랜드</td>
         <td></td>
      </tr>
      <tr>
        <td>5</td>
        <td>Dalton</td>
         <td></td>
      </tr>
      <tr>
        <td>6</td>
        <td>Bobby</td>
         <td></td>
      </tr>

    </table>
</div>
  </div>
</div>


<!-- end of table -->

<!-- 프로필 코딩 -->
<div class="containers">
    <div class="register">
      <div class="photo">
      	 
      	<div class="customertext">
      	<section class="section1">
      	<header>
      	<br/>
      	<h2>박보검</h2>
      	</header>
      	<a href="#" class="image full">
      	<img src="/images/보검.jpg" alt=""> </a>
      	<ul class="contact">
      	<li><span class="icon fa-home"></span> 
      	휴대전화 <span><input type="text" value="010-1111-2222"/></span>  </li>
      	<li><span class="icon fa-home"></span> 
      	주소 <span><input type="text" value="서울시 구로구 가리봉동"/></span>  </li>
      	<li><span class="icon fa-home"></span> 
      	이메일 <span><input type="text" value="bogum@namver.com"/></span>  </li>
      	
      	  </ul>
      	  </section>
      	  </div>
      	  
      	  
      	  <div class="animaltext" >
      	  <section class="section2">
      	<header>
      	<h2>반려동물 목록</h2>
		
      	<caption><h>연이</h></caption>
      	
      	</header>
      	<a href="#" class="image full">
      	<img src="/images/토이푸들.png" alt=""></a>
      	<ul class="contact">
      	<li><span class="icon fa-home"></span> 
      	나이 <span><input type="text" value="8개월"/></span>  </li>
      	<li><span class="icon fa-home"></span> 
      	성별 <span><input type="text" value="암컷"/></span>  </li>
      	<li><span class="icon fa-home"></span> 
      	질병 <span><input type="text" value="눈병"/></span>  </li>
      	
      	  </ul>
      	  </section>
      	  </div>
      	  
      	
      </div>
      
<!--     	<hr style="border-bottom: thin; border-bottom-style: dotted;"> -->
    	
    </div>
</div>
<!-- end of profile -->
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
			<!-- jquery가 겹쳐서 -->
<!-- 			<script src="/js/jquery.min.js"></script> -->
			<script src="/js/skel.min.js"></script>
			<script src="/js/util.js"></script>
			<script src="/js/main.js"></script>
			<script src="/search-js/search.js"></script>

	</body>
</html>