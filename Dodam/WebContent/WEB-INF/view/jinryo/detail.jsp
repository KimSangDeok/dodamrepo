<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jinryoView</title>
<link rel="shortcut icon" type="image/x-icon" href="/style/images/favicon.png" />
<link rel="stylesheet" type="text/css" href="/style.css" media="all" />
<link rel="stylesheet" type="text/css" href="/style/color/red.css" media="all" />
<link rel="stylesheet" type="text/css" media="screen" href="/style/css/prettyPhoto.css"  />
<link rel="stylesheet" type="text/css" href="/style/type/museo.css" media="all" />
<link rel="stylesheet" type="text/css" href="/style/type/ptsans.css" media="all" />
<link rel="stylesheet" type="text/css" href="/style/type/charis.css" media="all" />
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="style/css/ie7.css" media="all" />
<![endif]-->
<!--[if IE 8]>
<link rel="stylesheet" type="text/css" href="style/css/ie8.css" media="all" />
<![endif]-->
<!--[if IE 9]>
<link rel="stylesheet" type="text/css" href="style/css/ie9.css" media="all" />
<![endif]-->
<script type="text/javascript" src="/style/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="/style/js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="/style/js/transify.js"></script>
<script type="text/javascript" src="/style/js/jquery.aw-showcase.js"></script>
<script type="text/javascript" src="/style/js/jquery.jcarousel.js"></script>
<script type="text/javascript" src="/style/js/carousel.js"></script>
<script type="text/javascript" src="/style/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="/style/js/jquery.superbgimage.min.js"></script>
<script type="text/javascript" src="/style/js/jquery.slickforms.js"></script>
<script type="text/javascript">
jQuery(document).ready(function($){
	$('.forms').dcSlickForms();
});
</script>
<script type="text/javascript">

$(document).ready(function()
{
	$("#showcase").awShowcase(
	{
		content_width:			900,
		content_height:			400,
		auto:					true,
		interval:				3000,
		continuous:				false,
		arrows:					true,
		buttons:				true,
		btn_numbers:			true,
		keybord_keys:			true,
		mousetrace:				false, /* Trace x and y coordinates for the mouse */
		pauseonover:			true,
		stoponclick:			false,
		transition:				'fade', /* hslide/vslide/fade */
		transition_delay:		0,
		transition_speed:		500,
		show_caption:			'onload' /* onload/onhover/show */
	});
});

</script>

</head>


<!-- Begin myScript -->


<!-- End myScript --> 
<body>





<!-- Fullscreen backgrounds -->
<div id="thumbs">
<!-- <a href="style/images/art/bg1.jpg">1</a> -->
<!-- <a href="style/images/art/bg2.jpg">2</a> -->
<!-- <a href="style/images/art/bg3.jpg">3</a> -->
<!-- <a href="style/images/art/bg4.jpg">4</a> -->
<!-- <a href="style/images/art/bg5.jpg">5</a> -->
<a href="/style/images/art/bg6.jpg">6</a>
</div>

<div id="superbgimage">
	<div class="scanlines"></div>
</div>
<!-- End Fullscreen backgrounds -->


<!-- Begin Wrapper -->
<div id="wrapper">

<!--   <div id="header"> -->
<!--   </div> -->
   
  <div class="clear"></div>
  <div class="login">로그인
  	<div class="goods"><a href ="/">재고관리</a></div>
  </div>
 
  <!-- Begin Menu -->
  <div id="menu" class="menu opacity">
  
 			 <ul>
				<li class="">
					<a href="#">예약</a>
				</li>
				<li class="">
					<a href="#">접수</a>
				</li>
				<li class="">
					<a href="#">홈</a>
				</li>
				<li class="">
					<a href="#">진료</a>
				</li>
				<li class="">
					<a href="#">입원/호텔</a>
				</li>
				<li class="">
					<a href="#">미용</a>
				</li>
				<li class="">
					<a href="#">수납</a>
				</li>						
			</ul>
			
   	 <br style="clear: left" />
    
    <!-- search  -->
	  		<div id="wrapper">
	
				<div id="search">											
						검색 &nbsp;&nbsp; 
						<input class="form-text" name="search" size="32" maxlength="64" />
						<input class="form-submit"  type="submit" value="검색하기" />																	
			 	</div>
			 	
	 	 	</div>
	 	 				
  </div>
  <!-- End Menu --> 
  
  
  
  <!-- Begin Container -->
  <div id="container" class="opacity"> 

			<div>
				<div>
					<div style="width: 800px; float: left;">
						<h3>진료차트</h3>
					</div>
					<div style="width: 400px; float: right;">
						<div class="buttons" style="float: right;">
							<a href="/jinryo/jinryoView.dodam" class="button green">목록보기</a>
						</div>
					</div>
					<div style="clear: both;">
						<hr>
					</div>
				</div>
			</div>
			<div>
				<div style=" width: 400px; height: 500px; float: left;">
					<div class="one-half">
				        <div class="info-box">문진표</div>
				        <div class="info-box">검사기록</div>
				        <div class="info-box">증상</div>
				        <div class="info-box">진단명</div>
				        <div class="info-box">처치/처방</div>
				        <div class="info-box">결제 내역</div>
				    </div>
				</div>
				
				<div style=" width: 800px; height: 500px; float: left;">
					<h2>문진표</h2>
					<h4>문진 내요오오옹로로로롱</h4>
					<hr>
					
					<h2>검사 기록</h2>
					<h4>검사 기록 내요오오옹로로로롱</h4>
					<hr>
					
					<h2>증상</h2>
					<h4>증상 내요오오옹로로로롱</h4>
					<hr>
					
					<h2>진단명</h2>
					<h4>진단명 내요오오옹로로로롱</h4>
					<hr>
					
					<h2>처치/처방</h2>
					<h4>처치/처방 내요오오옹로로로롱</h4>
					<hr>
					
					<h2>결제내역</h2>
					<h4>결제내역 내요오오옹로로로롱</h4>
					<hr>
				</div>
			</div>
		</div>
  
  <!-- End Container -->
  
  
</div>
<!-- End Wrapper --> 

<script type="text/javascript" src="/style/js/scripts.js"></script>
</body>
</html>