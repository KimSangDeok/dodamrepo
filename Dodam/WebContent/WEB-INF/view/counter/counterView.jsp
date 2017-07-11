<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<!-- 부트스트랩 공통!! -->
<link rel="stylesheet" href="/css/bootstrap.css" />

<!-- 접수화면css -->
<link rel="stylesheet" href="/countercss/counter.css" />

<!-- navAccordion플러그인 -->
<script src="/countercss/navAccordion.min.js"></script>

<!-- 팝업 -->
<script src="/js/jquery.popitup.js"></script>

<style>
.outer-wrap {
    width: 40%;
    border: 1px solid #EAEAEA;
    float: left;
    margin-left: 17.5%;
    margin-top: 2%;
    border-radius: 5px;
    margin-bottom: 10%;
}
</style>
<!-- Begin popup css -->
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
/* 	height: 90%; */
	display: none;
	border: 1px solid #ccc;
	background: #fff;
	border-radius: 5px;
	box-shadow: 0px 0px 6px 2px #ccc;
}

.popit-content {
/* 	padding: 20px; */
    margin-top: 10px
}

.popit-header {
	border-bottom: 1px solid #ccc;
}

.popit-body {
	padding: 40px 0;
    width: 250px;
    height: 250px;
    position: relative;
    overflow: hidden;
    left: 0px;
}

.popit-body p { 
display:table;
} 
.popit-footer{ margin-bottom:20px;
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
<!-- End popup 스타일-->

<script>
 	$(function(){
 		$("#doctor_name").val("<%= session.getAttribute( "doctorname" ) %>");
 		$("#cus_name").val("<%= session.getAttribute( "cusname" ) %>");
 		$("#animal_name").val("<%= session.getAttribute( "animalname" ) %>");
 		$("#ssanimal_num").val("<%=session.getAttribute("animalnum")%>");
 		$("#ssrsvt_dt").val("<%=session.getAttribute("rsvtdt")%>");
//  		alert($("#ssrsvt_dt").val());
 		$("#conterComplete").click(function(){
 			$("#formcounter").submit();
 		});
 		
 		$("#jinryotype").css("background-color","");
 		
	});
</script>

<!-- 바디 시작 -->
<div class="body">




	<!-- 여기 부분이 실질적으로 코딩하는 부분입니다~~~ div의 테두리는 지금 보기 편하기 위한 부분이고, 나중에 지울껍니다~~ -->
	<div>
		<!-- 가운데 구분 줄 -->
		<div class="hr1" style="margin-top: 50px"></div>

		<h1
			style="font-weight: bolder; margin-left: 5%; margin-top: 0.5%; font-size: 200%; text-align: left;">접수</h1>

		<!-- 전체접수창 -->
		<div class="outer-wrap">

			<!-- 접수메뉴 -->
			<div class="demenu">
				<a class="add addpop" href="javascript:void(0);" role="button">
				<img class="addimg" alt="접수추가" src="/countercss/add.png"></a>
					<a href=""><img class="re" alt="새로고침" src="/countercss/refresh.png"></a>
			</div>

			<!-- Navigation -->
			<nav class="mainNav">
			
				<!-- 진료접수목록 -->
				<ul style="text-align: left;">
					<li><a>원장실<input type="text" value="2" readonly="readonly"></a>
						<ul>
							<li>
								<!-- 접수정보 -->
								<div class="rcvdiv">
									<div class="ldiv">
										<label>연이(Toy Poodle)</label> 
										<label><strong>김우석</strong></label>
									</div>
									<div class="cdiv">
										<label style="font-size: 130%;">일반</label> <label>12:33:27</label>
									</div>
									<div class="rdiv">
										<a class="add addpop edit" href="javascript:void(0);" role="button">
										<img alt="수정" src="/countercss/red_edit.png">
										</a>
										<a class="del" href="" role="button">
										<img alt="삭제" src="/countercss/red_del.png">
										</a>
									</div>
								</div>
							</li>
							<li>
								<div class="rcvdiv">
									<div class="ldiv">
										<label>연이(Toy Poodle)</label> <label><strong>김우석</strong>
											귀진료</label>
									</div>
									<div class="cdiv">
										<label style="font-size: 130%;">일반</label> <label>12:33:27</label>
									</div>
									<div class="rdiv">
										<a class="add addpop edit" href="javascript:void(0);" role="button">
										<img alt="수정" src="/countercss/red_edit.png">
										</a>
										<a class="del" href="" role="button">
										<img alt="삭제" src="/countercss/red_del.png">
										</a>
									</div>
								</div>
							</li>
						</ul></li>
					
					<li><a>태블릿<input type="text" value="0" disabled="disabled"></a></li>
					<li><a>진료실<input type="text" value="0" disabled="disabled"></a></li>
					<li><a>진료실2<input type="text" value="1"
							disabled="disabled"></a>
						<ul>
							<li>
								<div class="rcvdiv">
									<div class="ldiv">
										<label>연이(Toy Poodle)</label> <label><strong>김우석</strong>
											귀진료</label>
									</div>
									<div class="cdiv">
										<label style="font-size: 130%;">일반</label> <label>12:33:27</label>
									</div>
									<div class="rdiv">
										<a class="add addpop edit" href="javascript:void(0);" role="button">
										<img alt="수정" src="/countercss/red_edit.png">
										</a>
										<a class="del" href="" role="button">
										<img alt="삭제" src="/countercss/red_del.png">
										</a>
									</div>
								</div>
							</li>
						</ul></li>
					<li><a>회의실<input type="text" value="0" disabled="disabled"></a></li>
					<li><a>수술실<input type="text" value="0" disabled="disabled"></a></li>
					<li><a>입원실<input type="text" value="0" disabled="disabled"></a></li>
					<li><a>검사실<input type="text" value="0" disabled="disabled"></a></li>
					<li><a>접수실<input type="text" value="1" disabled="disabled"></a>
						<ul>
							<li>
								<div class="rcvdiv">
									<div class="ldiv">
										<label>연이(Toy Poodle)</label> <label><strong>김우석</strong>
											귀진료</label>
									</div>
									<div class="cdiv">
										<label style="font-size: 130%;">일반</label> <label>12:33:27</label>
									</div>
									<div class="rdiv">
										<a class="add addpop edit" href="javascript:void(0);" role="button">
										<img alt="수정" src="/countercss/red_edit.png">
										</a>
										<a class="del" href="" role="button">
										<img alt="삭제" src="/countercss/red_del.png">
										</a>
									</div>
								</div>
							</li>
						</ul></li>
					<li><a>미용실<input type="text" value="1" disabled="disabled"></a>
						<ul>
							<li>
								<div class="rcvdiv">
									<div class="ldiv">
										<label>연이(Toy Poodle)</label> <label><strong>김우석</strong>
											귀진료</label>
									</div>
									<div class="cdiv">
										<label style="font-size: 130%;">일반</label> <label>12:33:27</label>
									</div>
									<div class="rdiv">
										<a class="add addpop edit" href="javascript:void(0);" role="button">
										<img alt="수정" src="/countercss/red_edit.png">
										</a>
										<a class="del" href="" role="button">
										<img alt="삭제" src="/countercss/red_del.png">
										</a>
									</div>
								</div>
							</li>
						</ul></li>
				</ul>
			</nav>

			<!-- 팝업열리는 부분 -->
			<form id="formcounter" action="/counter/counterInsert.dodam" method="post">
	<div id="Popup" class="popit-wrapper popit-wrapper-chase" style="  left: 0px;opacity: 0;">		
		<!-- 팝업 열리는 부분  -->
		<input type="hidden" id="ssanimal_num" name="animal_num" value="">
		<input type="hidden" id="ssrsvt_dt" name="rsvt_dt" value="">
		
		<div class="popit-content">
			<div class="popit-header">
						<h4 class="popit-title">도담도담-접수</h4>
					</div>
			<div class="popit-body">							
				<p>
					<label>담당자 이름</label>
					<input class="form-control J_Message" type="text" id="doctor_name" name="doctor_name"
					style="back-ground: rgba(229, 179, 179, 0.075);margin-left: 20px;width:200px" placeholder="담당자 이름"  readonly="readonly">
				</p>
				<p>
					<label>보호자 이름</label>
					<input class="form-control J_Message" type="text" id="cus_name" name="cus_name"
					style="back-ground: rgba(229, 179, 179, 0.075);margin-left: 20px;width:200px" placeholder="보호자 이름"  readonly="readonly">
				</p>
				<p><label>동물 이름</label>
					<input class="form-control J_Message" type="text" id="animal_name" name="animal_name"
					style="back-ground: rgba(229, 179, 179, 0.075);margin-left: 20px;width:200px" placeholder="동물이름"  readonly="readonly">
				</p>											
										
			</div>
		</div>
		<!-- 팝업 end -->
		
		<!-- Begin 아랫쪽 버튼 -->
		<div class="popit-content" style=" width:70%; height:10% ;  margin-left:15%;">
			<div class="popit-footer" >
				<button type="button" class="btn btn-default popitup-close">취소</button>
				<button type="button" id="conterComplete" class="btn btn-primary">접수</button>
			</div>
		</div>
		<!-- End 아랫쪽 버튼 -->
		
	</div>
	</form>
	<!-- End 팝업 -->

		</div>
		<!-- 전체접수창 end -->
		
		<!-- 접수대기자 화면 -->
		<div class="sidebargroup">
			<div class="sidebar">
				<div class="sidebar-box">
					<h3>접수 대기자</h3>
					<hr>
					<div class="cat-list">
						<ul>
							<c:set var='i' value='0'/> 	
							<c:forEach items="${counterlist}" var="c">
							<c:set var='i' value='${i+1}'/>
								<li id="jinryotype"><a href="#" value="${i}">${i}. 담당의 : ${c.doctor_name}<br />환자명 : ${c.animal_name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- 접수대기자 화면 end -->







<!-- 상품추가 스크립트 -->
<script>			
	jQuery(document).ready(function() {

	//Accordion Nav
	jQuery('.mainNav').navAccordion({
		expandButtonText : '<i class="fa fa-plus"></i>', //Text inside of buttons can be HTML
		collapseButtonText : '<i class="fa fa-minus"></i>',
		buttonPosition : 'left',
		buttonWidth : '5%',
	}, function() {
		console.log('Callback')
	});
	
	//접수추가
	$('.add').bind('click', function() {

		if ($(this).hasClass('addpop')) {
			$('.popit-wrapper-chase').popitup({
				chase : false
			});
		}
	});

});

</script>

	

<script type="text/javascript">

	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-36251023-1']);
	_gaq.push(['_setDomainName', 'jqueryscript.net']);
	_gaq.push(['_trackPageview']);

	(function() {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	});

</script>

	</div>
</div>
