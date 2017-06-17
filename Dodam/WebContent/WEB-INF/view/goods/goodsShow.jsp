<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>goodsShow</title>
<link rel="shortcut icon" type="image/x-icon" href="/style/images/favicon.png" />
<link rel="stylesheet" type="text/css" href="/style/css/goods/goods.css" media="all" />
<link rel="stylesheet" type="text/css" href="/style/color/red.css" media="all" />
<link rel="stylesheet" type="text/css" media="screen" href="/Dodam/style/css/prettyPhoto.css"  />
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


<!-- Wrapper 시작 -->
<div id="wrapper">

<!--   <div id="header"> -->
<!--   </div> -->
   
  <div class="clear"></div>
  <div class="login">로그인
  	<div class="goods"><a href ="/goods/goodsShow.dodam">재고관리</a></div>
  </div>
 
  <!-- 메뉴 시작 -->
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
    
    <!-- 검색  -->
	  		<div id="wrapper">
	
				<div id="search">											
						검색 &nbsp;&nbsp; 
						<input class="form-text" name="search" size="32" maxlength="64" />
						<input class="form-submit"  type="submit" value="검색하기" />																	
			 	</div>
			 	
	 	 	</div>
	 	 				
  </div>
  <!-- 메뉴 끝 --> 
  
  
  
<!-- Container 시작 -->
  <div id="container" class="opacity"> 
    <div class="content" style="width:1300px">

<!-- 왼쪽 사이드 바 -->    	
    	<div class="goodsSidebar">
    		<div class="sidebar-box">
    			<h4 style="text-align: center">도담도담-재고관리</h4>
    			<div class="hr1"></div>
    			<ul class="latest-posts">
    				<li><a>재고 현황</a></li>
    				<li><a>입출고 내역</a></li>
    			</ul>
    		</div>
    	</div>
    	<h2 style="padding-top:10px; text-indent:100px;width:1300px;">재고 현황</h2>		
<!-- 상품구분 셀렉트 박스 -->   	
    	<div style="padding-left:200px; margin-top:20px;margin-bottom:40px">
    		<div style="float:left;padding-right:30px;">
    		<label style="font-size:15px;padding-right:10px;padding-top:5px;padding-left:20px;">상품구분</label>
    		<select>
    			<option></option>
    			<option>의약품</option>
    			<option>용품</option>
    		</select>
    		</div>
<!-- 재고 상태 셀렉트 박스 -->    		
    		<div style="float:left;padding-right:30px;">
    		<label style="font-size:15px;padding-right:10px;padding-top:5px;padding-left:20px;">재고상태</label>
    		<select>
    			<option></option>
    			<option>전체</option>
    			<option>용품</option>
    		</select>
    		</div>
 <!-- 유효기간 셀렉트 박스 -->   		
    		<div style="float:left">
    		<label style="font-size:15px;padding-right:10px;padding-top:5px;padding-left:20px;">유효기간</label>
    		<select  style="text-align:center">
    			<option></option>
    			<%for(int i=0; i<31; i++) {%>
    			<option><%=i%></option>
    			<%} %>
    		</select>   		
    		</div>
    		<label style="font-size:15px;padding-right:10px;padding-top:5px;padding-left:10px;">일 미만</label>
    		    		
<!-- 재고 검색 텍스트 및 버튼 -->
    		<div style="float:right">
			<form class="forms" method="get">
        		<input type="text" name="name" value="" class="goods-input">
       			<input type="submit" value="검색" name="submit" class="goods-submit">
       		</form>
    		</div>   			
    	</div>
<!-- 가운데 구분 줄 -->    	
    	<div class="hr1" style="margin-left:200px"></div>

<!-- 재고 테이블 -->    
	<div style="padding-left:200px; margin-top:20px;margin-bottom:40px">
	<table>
        <tbody>
        <tr>
          <th>
          <h4 style="text-align:center">구분</h4>
          </th>
          <th>
          <h4 style="text-align:center">품목명</h4>
          </th>
          <th>
          <h4 style="text-align:center">용도</h4>
          </th>
          <th>
          <h4 style="text-align:center">가격</h4>
          </th>
          <th>
          <h4 style="text-align:center">입고날짜</h4>
          </th>
          <th>
          <h4 style="text-align:center">수량</h4>
          </th>
        </tr>
        <tr>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        </tr>
      </tbody>
      </table>
      </div>
			
    </div>
 
  </div>
  <!-- Container 끝 -->
  
  
</div>
<!-- Wrapper 끝 --> 

<script type="text/javascript" src="/style/js/scripts.js"></script>
</body>
</html>