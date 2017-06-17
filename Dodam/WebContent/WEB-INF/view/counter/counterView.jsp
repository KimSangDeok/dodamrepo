<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>beautyView</title>
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
					<a href="/stay/stayView.dodam">입원/호텔</a>
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
    
 
  </div>
  <!-- End Container -->
  
  
</div>
<!-- End Wrapper --> 

<script type="text/javascript" src="/style/js/scripts.js"></script>
</body>
</html>