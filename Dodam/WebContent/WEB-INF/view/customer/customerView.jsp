<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" href="/customer-css/profile.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css"
	integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd"
	crossorigin="anonymous">





<!-- search style -->
<style>
body {
	background-color: white;
	font-family: 'Roboto';
}
/*     .container { margin:150px auto;} */
input {
	margin: 50px auto;
}

.form-control {
	height: 30px;
	width: 250px;
	margin-left: 200px;
	margin-top: 100px;
}

.line {
	margin-top: -50px;
}

.container {
	margin-left: 200px;
	margin-right: 0px;
	max-width: 500px;
}

.col-md-6 {
	width: 130%;
}
</style>

<!--     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.js"></script> -->
<script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js"
	type="text/javascript"></script>
<script src="/register/js/jquery-multi-step-form.js"
	type="text/javascript"></script>
<link href="/register/css/jquery-multi-step-form.css" media="screen"
	rel="stylesheet" type="text/css">
<script>
    $(function(){
    	
    	$('#registerDiv').click(function(){
    			$('#total').show();
    			$('#total').css('style','{z-index:-10; top:200px; left:200px;}');
			$.multistepform({
				container : 'multistepform-example-container',
				form_method : 'GET'
			});
    	});
    	
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
<div class="body">
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
									<li><a href="#"><i class="icon-envelope icon-large"></i>고객검색</a></li>
									<li><div id="registerDiv"><a href="#"><i class="icon-truck icon-large"></i>고객등록</a></div></li>
									<li><a href="#"><i class="icon-plane icon-large"></i>Private jet</a></li>
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
		<!-- table 코딩 -->
		<div class="container">
			<div class="line">
				<input type="text" class="form-control" placeholder="Search..."
					id="search_field">
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
							<td>서울시</td>
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
								<br />
								<h2>박보검</h2>
							</header>
							<a href="#" class="image full"> <img src="/images/보검.jpg"
								alt="">
							</a>
							<ul class="contact">
								<li><span class="icon fa-home"></span> 휴대전화 <span><input
										type="text" value="010-1111-2222" /></span></li>
								<li><span class="icon fa-home"></span> 주소 <span><input
										type="text" value="서울시 구로구 가리봉동" /></span></li>
								<li><span class="icon fa-home"></span> 이메일 <span><input
										type="text" value="bogum@namver.com" /></span></li>

							</ul>
						</section>
					</div>


					<div class="animaltext">
						<section class="section2">
							<header>
								<h2>반려동물 목록</h2>

								<caption>
									<h>연이</h>
								</caption>

							</header>
							<a href="#" class="image full"> <img src="/images/토이푸들.png"
								alt=""></a>
							<ul class="contact">
								<li><span class="icon fa-home"></span> 나이 <span><input
										type="text" value="8개월" /></span></li>
								<li><span class="icon fa-home"></span> 성별 <span><input
										type="text" value="암컷" /></span></li>
								<li><span class="icon fa-home"></span> 질병 <span><input
										type="text" value="눈병" /></span></li>

							</ul>
						</section>
					</div>


				</div>

				<!--     	<hr style="border-bottom: thin; border-bottom-style: dotted;"> -->

			</div>
		</div>
		<!-- end of profile -->
	</div>




	<!-- 		<div id="total" style="display:none;"> -->
	<div id="total" style="display: none;">
		<h1 style="margin: 150px auto 50px auto" align="center"></h1>
		<div id="multistepform-example-container">
			<div class="form">
				<form action="">
					<h2 class="fs-title">Step 1. 고객 등록</h2>
					<h3 class="fs-subtitle">Please register your infromation</h3>
					<input type="text" name="customerNum" placeholder="1077"> <input
						type="text" name="name" placeholder="보호자"> <input
						type="text" name="address" placeholder="서울 구로구">
					<textarea name="memo" placeholder="memo"></textarea>
					<input type="button" name="next" class="next button" value="Next">
				</form>
			</div>
			<div class="form">
				<form action="">
					<h2 class="fs-title">Step 2. 동물 등록</h2>
					<h3 class="fs-subtitle">Please register your animal's picture</h3>

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
	</div>
</div>
