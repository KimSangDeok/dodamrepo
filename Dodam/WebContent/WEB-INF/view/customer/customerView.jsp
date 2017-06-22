<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" type="text/css" href="/manage/style.css" />
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="/reservationCss/bootstrap.css">
<link rel="stylesheet" href="/customer-css/profile.css">
<!-- 멀티스텝 링크 -->
<link href="/register/css/jquery-multi-step-form.css" media="screen"
	rel="stylesheet" type="text/css">
	<style>
/* z-index 값이 작을 수록 아래에 깔리고, 높을 수록 위로 나온다. */
.main {
	z-index: 2;
}

.container {
	z-index: 1;
}
.avatar {
	margin-top: 10px;
	height: 100px;
	width: 100px;
	-webkit-border-radius: 50px;
	-moz-border-radius: 50px;
	-ms-border-radius: 50px;
	border-radius: 50px;
	background: #cca343;
}

.modal-content {
	left: -100px;
	width: 300px;
}

.block2 {
	width: 800px;
}

.modal-content a {
	color: #686868;
}

.title {
	font-size: 15pt;
}
</style>
	
	
		<!-- search style -->
		<style>
		body {
			background-color: white;
			font-family: 'Roboto';
		}
/* 		input { */
/* 			margin: 50px auto; */
/* 		} */
		.form-control {
			height: 30px;
			width: 250px;
			margin-left: 410px;
			margin-top: -400px;
		}
		
		.line {
			margin-top: -50px;
		}
		
		.tablecontainer {
			margin-left: 10px;
			margin-right: 0px;
			max-width: 500px;
		}
		
		.col-md-6 {
			width: 130%;
		}
		</style> 
<script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js"
	type="text/javascript"></script>		
<script type="text/javascript" src="/manage/modernizr.custom.79639.js"></script>
<noscript><link rel="stylesheet" type="text/css" href="/manage/noJS.css" /></noscript> 

<!-- 고객동물 모달창 스크립트 -->
<script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js"
	type="text/javascript"></script>
<script src="/register/js/jquery-multi-step-form.js"
	type="text/javascript"></script>

	
	
<script>
$(document).ready(function(){
   
   $('.header').addClass('hide');
});
</script>

<script>
    $(function(){
    	
    	
    	$('#registerDiv').click(function(){
    			$('#step').show();
    			$('#step').css('style','{z-index:-10; top:500px; left:200px;}');
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
			<section class="main">
				<div class="wrapper-demo">
					<div id="dd" class="wrapper-dropdown-3" tabindex="1">
						<span>고객관리</span>
						<ul class="dropdown">						
							<li><div id="registerDiv"><a href="#"><i class="icon-envelope icon-large"></i>고객등록</a></div></li>
							<li><a href="/mpay/mpayView2.dodam"><i class="icon-truck icon-large"></i>고객수정</a></li>
							<li><a href="/mpay/mpayView3.dodam"><i class="icon-plane icon-large"></i>고객검색</a></li>
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
						// ****페이지 이동 소스
						location.href = $(this).find('a').attr('href');
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

<!--  메인부분 -->		
		<div id="containers" style="min-width: 310px; height: 400px; margin: 0 auto">
		<!-- 프로필 부분 -->
		

<div style=" max-width: 30% ; float: right; ">
<div id="block2" class="modal-content" style="margin-left: 30px;" >
	<table>
		<tr>
			<td><a class="title">반려 동물 목록</a>
<!-- 			<input class="filter-box" type="text" data-filter-options='{ "filterTarget":"#block2 .user2  p.name ", "filterHide":"#block2 .user2 ", "shouldHide": true }'> -->
<!-- 		    </input> -->
		    </td>
		</tr>
	</table>
    <br/>
    <ul class="modal-user-index group">
        <li class="group">
            <a class="modal-user-link group" >
                <div class="user2">
                    <img class="avatar" src="/images/토이푸들.png"></img>
                    <p class="name">
                        연이
                    </p>
                </div>
                <!-- 동물정보div -->
                <div style="margin-left: 20px;">
               		<a >
                        나이 <input type="text" value="4개월"/>
                    </a><br/>
                    <a>
                        성별 <input type="text" value="암컷"/>
                    </a>
                </div>
            </a>
        </li>
        <li class="group">
            <a class="modal-user-link group" >
                <div class="user2">
                    <img class="avatar" src="/images/강아지1.jpg" alt="Medium"></img>
                    <p class="name">
                        콩이
                    </p>
                </div>
                <!-- 동물정보div -->
                <div style="margin-left: 20px;">
               		<a >
                        나이 <input type="text" value="8개월"/>
                    </a><br/>
                    <a>
                        성별 <input type="text" value="암컷"/>
                    </a>
                </div>
            </a>
        </li>
        <li class="group">
            <a class="modal-user-link group" >
                <div class="user2">
                    <img class="avatar" src="/images/강아지2.jpg" alt="Missing"></img>
                    <p class="name">
                        땅이
                    </p>
                </div>
                <!-- 동물정보div -->
                <div style="margin-left: 20px;">
               		<a>
                        나이 <input  type="text" value="12개월"/>
                    </a><br/>
                    <a>
                        성별 <input type="text" value="수컷"/>
                    </a>
                </div>
            </a>
        </li>
    </ul>
 </div>
 </div>
		<div  style=" max-width: 30%; float:right; " >
	<div id="block1" class="modal-content" >
	<table>
		<tr>
			<td><a class="title">보호자 목록</a>
    		</td>
		</tr>
	</table>
    <br/>
    <ul class="modal-user-index group">
        <li class="group">
            <a class="modal-user-link group">
                <div class="user">
                    <img class="avatar" src="/images/보검이.jpg" alt="Medium"></img>
                    <p class="name">
                        보검오빠
                    </p>
                    <p>
                       bou@gmail.com
                    </p>
                </div>
                <!-- 고객정보div -->
                <div style="margin-left: 20px;">
               		<a >
                        휴대전화 <input style="background-color: #fda699" type="text" value="010-1111-2222"/>
                    </a><br/>
                    <a>
                        우편번호 <input style="background-color: #fda699"type="text" value="서울시 강남구"/>
                    </a>
                </div>
            </a>
        </li>
        <li class="group">
            <a class="modal-user-link group" >
                <div class="user">
                    <img class="avatar" src="/images/보검.jpg" alt="Medium"></img>
                    <p class="name">
                        박보검
                    </p>
                    <p>
                       bogum@gmail.com
                    </p>
                </div>
                 <!-- 고객정보div -->
                <div class="p" style="margin-left: 20px;">
               		<a >
                        휴대전화  <input style="background-color: #fda699" type="text" value="010-1111-2222"/>
                    </a><br/>
                    <a>
                        우편번호  <input style="background-color: #fda699" type="text" value="010-1111-2222"/>
                    </a>
                    <br/>
                </div>
            </a>
        </li>
    </ul>
</div>
</div>
		</div>
		
		<div id="step" style="display: none;">
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
		
		
		<!-- table 코딩 -->
		<div class="tablecontainer">
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
		
		

</div>