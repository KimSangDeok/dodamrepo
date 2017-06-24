<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<link rel="stylesheet" href="/jinryoCss/css/bootstrap.css">

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
	height: 90%;
	display: none;
	border: 1px solid #ccc;
	background: #fff;
	border-radius: 5px;
	box-shadow: 0px 0px 6px 2px #ccc;
}

.popit-content {
/* 	padding: 20px; */
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

<!-- 팝업js -->
<script src="/js/jquery.popitup.js"></script>

<script>
$(document).ready(function(){
	
	//동그라미 숨기기
	$('.header').addClass('hide');
});

//문진표 오픈

function popupOpen(divId) {
			var byensu = window.innerWidth/2;
// 			alert(window.innerWidth/2);

			$('#'+divId).popitup({
				widthSet : window.innerWidth*0.8+'',
				chase : false
			});
}
</script>

<div class="body" style="padding-top: 5%;">
	<!-- Begin btn Group -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">
							<span class="glyphicon glyphicon-bookmark"></span> 진료 차트
						</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-12 col-md-12">
								<a href="javascript:popupOpen('monjinPopup')" class="btn btn-default btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-list-alt"></span> <br />문진표</a> 
								<a href="javascript:popupOpen('symptomPopup')" class="btn btn-primary btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-bookmark"></span> <br />증상</a> 
								<a href="#" class="btn btn-success btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-signal"></span> <br />진단명</a> 
								<a href="#" class="btn btn-info btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-comment"></span> <br />처치/처방</a> 
								<a href="#" class="btn btn-danger btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-comment"></span> <br />추가 진료</a>
							</div>
						</div>
						<br/>
						<div class="row">
							<div class="col-xs-12 col-md-12">
								<a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-user"></span> <br />혈액검사</a> 
								<a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-file"></span> <br />바이탈</a> 
								<a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-picture"></span> <br />X-ray</a> 
								<a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-tag"></span> <br />CT결과</a> 
								<a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-tag"></span> <br />심전도 검사</a>
							</div>
						</div>
						<br/>
						<a href="#" class="btn btn-success btn-lg btn-block" role="button"><span class="glyphicon glyphicon-globe"></span>진료완료</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End btn Group -->
	
	<!-- Begin monjin popup content -->
	<div id="monjinPopup" class="popit-wrapper popit-wrapper-chase" style="left: 0px; opacity: 0;">
	
		<div class="popit-content" style=" width:70%; height:5%; float: right;">
			<button id="popupCloseBtn" type="button" class="popitup-close close">
				<span class="glyphicon glyphicon-remove-circle"></span>
			</button>
		</div>
		<!-- ------------------------------------------------------------------------------------------------------- -->
		<div class="popit-content" style="border-right: 1px solid #ccc; width:30%; height:100%; float: left; padding-top:2.8%">
			<div class="popit-header">
				
				<h4 class="popit-title">분류</h4>
			</div>
			<!-- 팝업창 바디부분 -->
			<iframe src="/jinryo/monjinType.dodam" width="100%" height="90%" style="padding-top: 15px;"></iframe>
		</div>
		<!-- ------------------------------------------------------------------------------------------------------- -->
		<div class="popit-content" style="border-bottom: 1px solid #ccc; width:70%; height:80%; float: left;">
			<div class="popit-header">
				
				<h4 class="popit-title">질문</h4>
			</div>
			<!-- 팝업창 바디부분 -->
			<div class="popit-body" id="bodycontainer">
				<!--1번줄 -->
				<div class="content-wrapper">
					<div>
						<label>가려움은?</label> <input type="text"/>
					</div>
				</div>
				<!--2번줄 -->
				<div class="content-wrapper">
					<div>
						<label>백신 접종은 몇사까지 되어있습니까?</label><select><option>1차</option><option>2차</option></select>
					</div>
				</div>
			</div>
			<!-- 팝업창 바디 끝 -->
			
		</div>
		<!-- ------------------------------------------------------------------------------------------------------- -->
		<div class="popit-content" style=" width:70%; height:15%; float: right;">
			<div class="popit-footer" style="float: right">
				<button type="button" class="btn btn-default popitup-close">취소</button>
				<button type="button" class="btn btn-primary">등록</button>
			</div>
			
		</div>
	</div>
	<!-- End monjin popup content -->
	
</div>
<!-- End body -->