<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<title>♡도♡담♡도♡담♡에 오♡신♡것♡을♡환♡영♡합♡니♡다♡</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/maincss/css/main.css" />		
		<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="/css/reset.css"> <!--CSS reset-->
	<link rel="stylesheet" href="/css/style.css"> <!--Resource style  -->

		
<!-- 테이블부분-->
<link rel="stylesheet" href="/css/bootstrap.css">
        <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<!-- 		<script type="text/javascript" async="" src="http://www.google-analytics.com/ga.js"></script><script src="http://pagead2.googlesyndication.com/pub-config/r20160913/ca-pub-2783044520727903.js"></script> -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="/goodsexcel/src/jquery.table2excel.js"></script>
<!-- 테이블부분 끝-->
		<!-- 스마트 메뉴 관련 시작 -->
		<!-- SmartMenus core CSS (required) -->
		<link href="/css/sm-core-css.css" rel="stylesheet" type="text/css" />
		
		<!-- "sm-mint" menu theme (optional, you can use your own CSS, too) -->
		<link href="/css/sm-mint.css" rel="stylesheet" type="text/css" />
		
	
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
			
		<!-- Main bar-->
			<div id="main" style="text-align:center">		
			<nav class="cd-stretchy-nav">
		<a class="cd-nav-trigger" href="#0" style="background:#ffb700">
			
			<span aria-hidden="true"></span>
		</a>
		<ul>
			<li><a href="#0" style="color: #000000;text-decoration: none;"><span>고객관리</span></a></li>
			<li><a href="/goods/goodsShow.dodam" style="color: #000000;text-decoration: none;"><span>재고관리</span></a></li>
			<li><a href="#0" style="color: #000000;text-decoration: none;"><span>운영관리</span></a></li>
			<li><a href="#0" style="color: #000000;text-decoration: none;"><span>매출관리</span></a></li>
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
			 <div >
<!-- 가운데 구분 줄 -->    	
    	<div class="hr1"  style="margin-top:50px"></div>
<!-- goods화면의 sidemenu 시작-->
<div>
<div style="float:left">
<span>
				<link rel="stylesheet" type="text/css" href="/manage/style.css" />
				      <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css' />
				<script type="text/javascript" src="/manage/modernizr.custom.79639.js"></script>
				<noscript><link rel="stylesheet" type="text/css" href="/manage/noJS.css" /></noscript> 
					<section class="main">
						<div class="wrapper-demo">
							<div id="dd" class="wrapper-dropdown-3" tabindex="1">
								<span>Transport</span>
								<ul class="dropdown">
									<li><a href="#">Classic mail</a></li>
									<li><a href="#">UPS Delivery</a></li>
									<li><a href="#">Private jet</a></li>
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
</span>
<!-- goods화면의 sidemenu 끝 -->	
</div>		

<!-- 테이블 div-->
<div style="float:left;padding-left:50px;">
    <h1>재고현황</h1>
    	     
<!-- 상품구분 셀렉트 박스 -->   	
    	<div style="float:left;width:1000px;">
    	<div style="float:left;padding-right:30px;padding-top:20px;">
    		<div style="float:left;">
    		<label style="font-size:15px;padding-right:10px;">상품구분</label>
    		</div>
    		<div style="float:left;">
    		<select>
    			<option></option>
    			<option>전체</option>
    			<option>용품</option>
    		</select>
    		</div>
    	</div>
<!-- 재고 상태 셀렉트 박스 -->    		
    		<div style="float:left;padding-right:30px;padding-top:20px;">
    		<div style="float:left;">
    		<label style="font-size:15px;padding-right:10px;padding-top:5px;padding-left:20px;">재고상태</label>
    		</div>
    		<div style="float:left;">
    		<select>
    			<option></option>
    			<option>전체</option>
    			<option>용품</option>
    		</select>
    		</div>
    		</div>
 <!-- 유효기간 셀렉트 박스 -->   		
    		<div style="float:left;padding-top:20px;">
    		<div style="float:left; width: 33%;">
    		<label style="font-size:15px;padding-right:10px;padding-top:5px;padding-left:20px;">유효기간</label>
		    </div>		
		    		<div style="float:left; width: 33%;">
		    		<select style="text-align:center">
		    			<option></option>
		    			<%for(int i=0; i<31; i++) {%>
		    			<option><%=i%></option>
		    			<%} %>
		    		</select> 
		    		</div>
		    		<div style="float:left; width: 33%;">
		    		<label style="font-size:15px;padding-right:10px;padding-top:5px;padding-left:10px;">일 미만</label>  		
    				</div>
    		</div>
    		
    		    		
<!-- 재고 검색 텍스트 및 버튼 -->
    		<div style="float:right;padding-top:20px;padding-right:50px">
				<form class="forms" method="get">
					<div style="float:left;padding-top:10px;padding-right:10px">
	        		<input type="text" name="name" value="" class="goods-input">
	        		</div>
	        		<div style="float:left">
	       			<button type="submit" class="btn btn-danger">검색</button>
	       			</div>
	       		</form>
    		</div>   			
    	</div>
<!-- 가운데 구분 줄 -->    	
    	<div class="hr1"></div>


	<table class="table" id="table2excel">
      <thead>
        <tr class="noExl">
       	  <th>
       	   #
          </th>
          <th>
          	구분
          </th>
          <th>
          	품목명
          </th>
          <th>
          	용도
          </th>
          <th>
          	가격
          </th>
          <th>
          	입고날짜
          </th>
          <th>
          	수량
          </th>
        </tr>
      </thead>
      <tbody>
        <tr class="active">
          <td>1</td>
          <td>1</td>
          <td>1</td>
          <td>1</td>
          <td>1</td>
          <td>1</td>
          <td>1</td>
        </tr>
        <tr>
          <td>2</td>
          <td>2</td>
          <td>2</td>
          <td>2</td>
          <td>2</td>
          <td>2</td>
          <td>2</td>         
        </tr>
        <tr class="success">
          <td>3</td>
          <td>3</td>
          <td>3</td>
          <td>3</td>
          <td>3</td>
          <td>3</td>
          <td>3</td>
        </tr>
        <tr>
          <td>4</td>
          <td>4</td>
          <td>4</td>
          <td>4</td>
          <td>4</td>
          <td>4</td>
          <td>4</td>
        </tr>
        <tr class="info">
          <td>5</td>
          <td>5</td>
          <td>5</td>
          <td>5</td>
          <td>5</td>
          <td>5</td>
          <td>5</td>
        </tr>
        <tr>
          <td>6</td>
          <td>6</td>
          <td>6</td>
          <td>6</td>
          <td>6</td>
          <td>6</td>
          <td>6</td>
        </tr>
        <tr class="warning">
          <td>7</td>
          <td>7</td>
          <td>7</td>
          <td>7</td>
          <td>7</td>
          <td>7</td>
          <td>7</td>
        </tr>
        <tr>
          <td>8</td>
          <td>8</td>
          <td>8</td>
          <td>8</td>
          <td>8</td>
          <td>8</td>
          <td>8</td>
        </tr>
        <tr class="danger">
          <td>9</td>
         <td>9</td>
         <td>9</td>
         <td>9</td>
         <td>9</td>
         <td>9</td>
         <td>9</td>
        </tr>
      </tbody>
    </table>
    	<div style="float:right">
        <button id="btnexport"class="btn btn-success">Export</button>
        </div>
</div>
<!-- 테이블 div 끝 -->

</div>		

<script>
			
			$(function() {
				$("#btnexport").click(function(){
				$("#table2excel").table2excel({
					exclude: ".noExl",
    				name: "Excel Document Name"
				}); 
				 });
			});
		</script><script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
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
			<!-- jquery가 겹쳐서 -->
<!-- 			<script src="/js/jquery.min.js"></script> -->
			<script src="/js/skel.min.js"></script>
			<script src="/js/util.js"></script>
			<script src="/js/main.js"></script>
	</body>
</html>