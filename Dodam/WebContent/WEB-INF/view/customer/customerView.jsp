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
	
<!-- 팝업 css -->
<style type="text/css">
@media ( min-width:768px) {
	#main-nav {
		line-height: 0;
		text-align: center;
	}
	#main-menu {
		display: inline-block;
	}
}

.popit-wrapper {
 	max-width:500px; 
	height: 90%;
	width: 50%;
	display: none;
	border: 1px solid #ccc;
	background: #fff;
	border-radius: 5px;
	box-shadow: 0px 0px 6px 2px #ccc;
}

.popit-content1 {
	padding: 20px;
}
.popit-content2 {
	padding: 20px;
}
.popit-content {
	padding: 20px;
}

.popit-header {
	border-bottom: 1px solid #ccc;
}

.popit-body {
	padding: 20px 0;
	width: 300px;
	height: 300px;
	position: relative;
	overflow: hidden;
}

.popitup-overlay {
	background: #000;
/* 	background: #F47265; */
	position: fixed;
	z-index: 9999;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	opacity: 0.5;
}
.margin-top-40 {
	margin-top: 40px;
}

.list-group-item {
	border: 0;
}

#popupCloseBtn{
	height: 0.85em;
}

/*모달창 스크립트*/
</style>	
	
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


<!-- 팝업js -->
<script src="/js/jquery.popitup.js"></script>
<!-- 고객동물 모달창 스크립트 -->
<script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js"
	type="text/javascript"></script>
<script src="/register/js/jquery-multi-step-form.js"
	type="text/javascript"></script>

	
	
<script>
$(document).ready(function(){
   
   $('.header').addClass('hide');
});


//문진표 오픈

function monjinOpen() {
			var byensu = window.innerWidth/2;
//			alert(window.innerWidth/2);
			$('.popit-wrapper-chase').popitup({
				widthSet : window.innerWidth*0.8+'',
				chase : false
			});
}
</script>
<script>
	
  /* 고객등록 페이지 전환코딩 */
  $(function(){
  	
  	$('#firstpopup').show();
		$('.popit-content1').hide();
		$('.popit-content2').hide();
		
  	$('.button1').click(function(){
  		$('#firstpopup').hide();
  		$('.popit-content1').show();
  		$('.popit-content2').hide();
  	});
  	
  	$('#previous1').click(function(){
  		$('#firstpopup').show();
  		$('.popit-content1').hide();
  		$('.popit-content2').hide();
  	});
  	
  	$('.button2').click(function(){
  		$('#firstpopup').hide();
  		$('.popit-content1').hide();
  		$('.popit-content2').show();
  	})
  
  	$('#previous2').click(function(){
  		$('#firstpopup').hide();
  		$('.popit-content1').show();
  		$('.popit-content2').hide();
  	});
  	
  	$('#save').click(function(){
  		$('.popitup-overlay').css('display','none');
  		$('.popit-wrapper-chase').hide();
  	  	$('#firstpopup').show();
		$('.popit-content1').hide();
		$('.popit-content2').hide();
  	});
  });
  
  </script>



<div class="body">
			<section class="main">
				<div class="wrapper-demo">
					<div id="dd" class="wrapper-dropdown-3" tabindex="1">
						<span>고객관리</span>
						<ul class="dropdown">						
							<li><div id="registerDiv"><a href="javascript:monjinOpen()"><i class="icon-envelope icon-large"></i>고객등록</a></div></li>
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
		
		
		<!-- Begin popup content -->
	<div class="popit-wrapper popit-wrapper-chase" style="left: 0px; opacity: 0; max-width: 500px; ">
	
		<div class="popit-content" style=" width:100%; height:5%;">
			<button id="popupCloseBtn" type="button" class="popitup-close close">
				<span class="">X</span>
			</button>
		</div>
		<!-- ------------------------------------------------------------------------------------------------------- -->
		
		<div id="step" >
		<h1 style="margin: 150px auto 50px auto" align="center"></h1>
		<div id="multistepform-example-container">
			<div id="firstpopup" class="form" >
				<form id="firstform">
					<h2 class="fs-title">Step 1. 고객 등록</h2>
					<h3 class="fs-subtitle">Please register your infromation</h3>
					<input type="text" name="customerNum" placeholder="1077"><br/> 
					<input type="text" name="name" placeholder="보호자"> <br/>
					<input type="text" name="address" placeholder="서울 구로구"><br/>
					<textarea name="memo" placeholder="memo"></textarea><br/>
					<input type="button" name="next" class="next button1" value="Next">
				</form>
			</div>
			
			</div>
			<div class="popit-content1" style=" margin-left:50px; width:80%; height:65%; ">
			
			<div id="secondpopup" class="form">
				<form id="secondform">
					<h2 class="fs-title">Step 2. 동물 등록</h2>
					<h3 class="fs-subtitle">Please register your animal's picture</h3>

					<input type="text" name="number" placeholder="32571"><br/>
					<input type="text" name="animalname" placeholder="이름"><br/>
					<input type="text" name="animaltype" placeholder="품종"><br/>
					<input type="text" name="color" placeholder="피모색"><br/>

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
					<textarea name="memo" placeholder="memo"></textarea><br/>
					<input id="previous1" type="button" name="previous" class="previous button"
						value="Previous"> <input type="button" name="next"
						class="next button2" value="Next">
				</form>
			</div>
			</div>
			
			<div class="popit-content2" style="; width:80%; height:65%; margin-left: 50px;">
			<div id="lastpopup" class="form">
				<form id="lastform">
					<h2 class="fs-title">저장</h2>
					<h3 class="fs-subtitle">check your information</h3>

					<input id="previous2" type="button" name="previous" class="previous button"
						value="Previous"> 
					<input id="save" type="button" name="submit" class="next button" value="Save">
				</form>
			</div>
			</div>
			
		</div>
	</div>
		<!-- ------------------------------------------------------------------------------------------------------- -->
	<!-- End popup content -->
	
	
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