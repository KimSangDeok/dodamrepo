<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    

<link rel="stylesheet" type="text/css" href="/manage/style.css" />
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="/reservationCss/bootstrap.css">
<!-- <link rel="stylesheet" href="/customer-css/profile.css"> -->

<!-- Begin 멀티스텝 링크 -->
<link href="/register/css/jquery-multi-step-form.css" media="screen"
	rel="stylesheet" type="text/css">
<!--  End 멀티스텝 링크 -->
	
	
<!-- Begin 고객등록팝업 css -->
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
	height: 400px;
	width: 50%;
	display: none;
	border: 1px solid #ccc;
	background: #fff;
	border-radius: 5px;
	box-shadow: 0px 0px 6px 2px #ccc;
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

</style>	
<!-- End 고객등록팝업 css -->	


<!-- Begin 메인 스타일 -->
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
<!--End 메인 스타일 -->

	<!-- Begin 이미지 업로드 -->
 	<link rel="stylesheet" type="text/css" href="/upload/UnoDropZone.css">
    <script src="/upload/UnoDropZone.js"></script>
    <script>
        var MyObject = {
            foo: function (uplaodCont) {
                console.log('calling foo');
                console.log('uplaodCont:');
                console.log(uplaodCont);
                $('#callbackmsg').html('Call MyObject.foo() function at:' + new Date())
            }
        };

        $(document).ready(function () {
            UnoDropZone.init();
        });
    </script>
<!-- End 이미지 업로드 -->    



		<!-- Begin 검색 스타일 -->
		<style>
		body {
			background-color: white;
			font-family: 'Roboto';
		}
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
<!--  End 검색 스타일  -->

<!-- 왼쪽메뉴스크립트 -->
<script type="text/javascript" src="/manage/modernizr.custom.79639.js"></script>
<noscript><link rel="stylesheet" type="text/css" href="/manage/noJS.css" /></noscript> 


<!-- 팝업js -->
<script src="/js/jquery.popitup.js"></script>
<!-- 고객동물 모달창 스크립트 -->
<script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js"
	type="text/javascript"></script>
<script src="/register/js/jquery-multi-step-form.js"
	type="text/javascript"></script>
<!-- 검색창 js -->
<!-- <script src="/search-js/search.js"></script> -->

	
	
<script>
$(document).ready(function(){
   
   $('.header').addClass('hide');
});


//Begin 고객등록 모달팝업 

function monjinOpen() {
			var byensu = window.innerWidth/2;
			$('.popit-wrapper-chase').popitup({
				widthSet : window.innerWidth*0.8+'',
				chase : false
			});
}
//End 모달팝업
</script>


<script>
	
  /*Begin 고객등록 페이지 전환코딩 */
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
  //End 모달 팝업 페이지 전환
  </script>

<!-- Begin 특정 번호로 검색하여 정보를 가져오는 함수 -->
<script>

function showList(cus_tel){
	
	$.ajax({
		url : "/customer/infoSearchbyTel.dodam",
		type : 'get',
		data : {"cus_tel":cus_tel},
		dataType : "json",
		success : function(data){
// 			alert('data :'+data);
			$('#gender').val(data[0].animal_gender)
		},
		 error:function(request, status,error){
             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
	})
}
</script>

<div class="body">
<!-- Begin  왼쪽 메뉴바 -->
			<section class="main">
				<div class="wrapper-demo">
					<div id="dd" class="wrapper-dropdown-3" tabindex="1">
						<span>고객관리</span>
						<ul class="dropdown">						
							<li><div id="registerDiv"><a href="javascript:monjinOpen()"><i class="icon-envelope icon-large"></i>고객등록</a></div></li>
							<li><a href="/customer/editCustomer.dodam"><i class="icon-truck icon-large"></i>고객수정</a></li>
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
<!-- End  왼쪽 메뉴바 -->

<!-- Begin 메인부분 -->		
		<div id="containers" style="min-width: 310px; height: 400px; margin: 0 auto">
		
		<!--Begin 고객 & 동물 부분 -->

<div style=" max-width: 30% ; float: right; ">
<div id="block2" class="modal-content" style="margin-left: 30px;" >
	<table>
		<tr>
			<td><a class="title">반려 동물 목록</a>
		    </td>
		</tr>
	</table>
    <br/>
    <ul class="modal-user-index group">
        <li class="group">
            <a class="modal-user-link group" >
                <div class="user2">
                    <img id="avatar" class="avatar" src="/images/토이푸들.png"></img>
                    <p class="name">
                        연이
                    </p>
                </div>
                <!-- 동물정보div -->
                <div style="margin-left: 20px;">
               		<a >
                        나이 <input id="age" type="text" value="4개월"/>
                    </a><br/>
                    <a>
                        성별 <input id="gender" type="text" value=""/>
                    </a>
                    <br/>
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
                    <br/>
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
                    <br/>
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
            <a class="modal-user-link group" >
                <div class="user">
                    <img class="avatar" src="/images/보검.jpg" alt="Medium"></img>
                    <p class="name">
                        박보검
                    </p>
                </div>
                 <!-- 고객정보div -->
                <div class="p" style="margin-left: 20px;">
               		<a >
                        휴대전화  <input style="background-color: #fda699" type="text" value=""/>
                    </a><br/>
                    <a>
                        우편번호  <input style="background-color: #fda699" type="text" value=""/>
                    </a>
                    <br/>
                    <a>
                        주소 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input style="background-color: #fda699" type="text" value=""/>
                    </a>
                    <br/>
                    <a >
                         첫 방문일   <input style="background-color: #fda699" type="text" value=""/>
                    </a>
                    <br/>
                </div>
            </a>
        </li>
    </ul>
</div>
</div>
		</div>
		
		
<!-- Begin 팝업 내용 -->
	<div class="popit-wrapper popit-wrapper-chase" style="left: 0px; opacity: 0;  ">
	
		<div class="popit-content" style=" width:100%; height:5%;">
			<button id="popupCloseBtn" type="button" class="popitup-close close">
				<span class="">X</span>
			</button>
		</div>
		<!-- ------------------------------------------------------------------------------------------------------- -->
		
		<div id="step" >
		<div id="multistepform-example-container"  >
			<div id="firstpopup" style=" margin-left:50px; width:80%; height:65%; ">
				<form id="firstform" >
					<h2 class="fs-title">Step 1. 고객 등록</h2>
					<h3 class="fs-subtitle">Please register your infromation</h3>
					
					<div class="file-upload" data-input-name="input1" style="float: left;"></div>
					<input type="text" name="customerNum" placeholder="1077"><br/> 
					<input type="text" name="name" placeholder="보호자"> <br/>
					<input type="text" name="address" placeholder="서울 구로구"><br/><br/>
					<textarea name="memo" placeholder="memo"></textarea><br/>
					<input type="button" name="next" class="next button1" value="Next">
					</div>

					
					
					
				</form>
			</div>
			
			</div>
			<div class="popit-content1" style=" margin-left:50px; width:80%; height:65%; ">
			
			<div id="secondpopup">
				<form id="secondform">
					<h2 class="fs-title">Step 2. 동물 등록</h2>
					<h3 class="fs-subtitle">Please register your animal's picture</h3>
	
					<div class="file-upload" data-input-name="input1" style="float: left;"></div>
					<input type="text" name="number" placeholder="32571"><br/>
					<input type="text" name="animalname" placeholder="이름"><br/>
					<input type="text" name="animaltype" placeholder="품종"><br/>
					<input type="text" name="color" placeholder="피모색"><br/>

					<div>

						<select style="margin-left: 35px;">
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
					<textarea style="margin-left: 100px;" name="memo" placeholder="memo"></textarea><br/><br/>
					<input id="previous1" type="button" name="previous" class="previous button"
						value="Previous"> <input type="button" name="next"
						class="next button2" value="Next">
				</form>
			</div>
			</div>
			
			<div class="popit-content2" style="; width:80%; height:65%; margin-left: 50px;">
			<div id="lastpopup" >
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
	<!-- End 팝업 내용  -->
	
	
		<!--Begin table 코딩 -->
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
								<th>전화번호</th>
								<th>주소</th>
								<th>첫방문일</th>
							</tr>
						</thead>
					<c:choose>
						<c:when test="${listModel == null}">
							<tr><td colspan='7'>등록된 고객이 없습니다.</td></tr>
						</c:when>
						
						<c:otherwise>
						<c:forEach items="${listModel}" var ="a">
						<tr ondblclick="javascript:showList('${a.cus_tel}')"  height="25" 
							onMouseOver="this.style.background='pink'"
							onMouseOut="this.style.background='white'" >
							
							<td>${a.cus_name}</td>
							<td>${a.cus_tel}</td>
							<td>${a.cus_addr}</td>
							<td>${a.cus_firstdate}</td>
<%-- 							<td>${a.cus_tel}</td> --%>
							
						</c:forEach>
					  </c:otherwise>	
					 </c:choose> 
					</table>
				</div>
			</div>
		</div>

		<!-- End 테이블 코딩  -->
		
		<!--Begin 검색 테이블  -->
  <script src="/search-js/search.js"></script>
  
    <script type="text/javascript">

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
	
<!-- End 검색 테이블 -->	
		
		

</div>