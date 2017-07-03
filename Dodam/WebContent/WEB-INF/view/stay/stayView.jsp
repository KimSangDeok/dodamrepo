<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	
		
		<!-- 부트스트랩 공통!! -->
	    <link rel="stylesheet" href="/css/bootstrap.css" />
		
		<!-- begin : 팝업 style과 script!! -->
		<style>
		.popit-wrapper {
			display: none;
			border: 1px solid #ccc;
			background: #fff;
			border-radius: 5px;
			box-shadow: 0px 0px 6px 2px #ccc;
			height:600px;
			top:300px;
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
		</style>
		<script src="/js/jquery.popitup.js"></script>
		<!-- begin : 팝업 -->

		<!-- begin : colorPicker -->
		<link rel="stylesheet" href="/css/stay/color-picker.css" />
		<script src="/css/stay/color-picker.js"></script>
		<!-- end : colorPicker -->


<!-- 입원 및 병원실을 보여주는 화면 stayView.jsp 입니다. -->
<div class="body">

	<!-- begin : 입원 및 호텔 추가 팝업내용 -->
	<div class="popit-wrapper popit-wrapper-chase" style="left: 0px; opacity: 0;">
	<div class="popit-content">
		<div class="popit-header">
	    <h4 class="popit-title">입원장 및 호텔방 추가</h4>
	    </div><br/>
	
		<!-- 팝업창 바디부분 -->
		<div class="popit-body" id="bodycontainer">
		<div class="content-wrapper">
	  
	  	<div>
	  	<label>이름</label>
	  	<input type="text" class="ar_name"/>
	  	</div>
	
	    <div>
	  	<label>분류</label>
	  	<select class="ar_type">
			<option value="입원">입원</option>	  	
			<option value="호텔">호텔</option>	  	
	  	</select>
	  	
	  	</div>      

	    <div>
	  	<label>색상</label>
			<fieldset class="color-picker">
				<select class="format">
					<option selected>Hex</option>
					<option>RGB</option>
					<option>HSL</option>
				</select>
				<input class="color" type="text" value="#2ae7ea" />
				<div class="spectrum">
					<div>
						<div class="pin"></div>
					</div>
				</div>
				<input class="luminosity" type="range" min="0" max="100" />
			</fieldset>
	  	</div>
	  	
	  	<div>
	  	<label>가격</label>
	  	<input type="text" class="ar_price"/>
	  	</div>      

	  	</div>
		</div><br/>
		<!-- 팝업창 바디 끝 -->
		
		<div class="popit-footer" style="float:right">
			<button type="button" class="btn btn-default popitup-close">취소</button>
			<button type="button" class="btn btn-primary popitup-register">등록</button>
		</div>
	</div>
	</div>
	<!-- end : 입원 및 호텔 추가 팝업내용 -->





	<!-- begin : 입원 호텔, '추가', '저장' 버튼 -->
	<div class="row">
		<form method='get' action="/beauty/beautyCam.dodam">
		<div class="col-lg-12">
		<a class="btn btn-sm btn-primary btn-chase" href="javascript:void(0);" role="button">입원장 및 호텔 추가</a>
		<a class="registerbeauty" href="javascript:registerBeauty()">저장</a> 

		</div>
		</form>
	</div>
	<script type="text/javascript" src="/beautymodal/rmodal.js"></script>
	<!-- end : 입원 호텔, '추가', '저장' 버튼 -->


</div>



<script type="text/javascript">
$(document).ready(function() {
	
	// colorpicker가 hsl값만 보이게 하려고 combobox 숨김..ㅎㅎㅎ
	$('.format').hide();	
		
	
	// 입원장 및 호텔 추가 이벤트 : 팝업 키자
	$('.btn-sm').bind('click', function(){
		if($(this).hasClass('btn-chase')){
			$('.popit-wrapper-chase').popitup({
				chase: false
			});
		}				        
	});	
    
	// 팝업창에서, 등록 DB에 넣자! 
	$('.popitup-register').bind('click', function(){
		alert('등록들옥');
		alert($('.ar_name').val());
		alert($('.ar_type option:selected').val());
		alert($('.color').val());
		alert($('.ar_price').val());
		
		// animalroom 테이블에 입원장 및 호텔방 데이터를 생성하자.
		$.ajax({
			url : "/stay/newAnimalRoom.dodam",
			type : 'get',
			data : {'ar_name':$('.ar_name').val(), 'ar_type':$('.ar_type option:selected').val(), 'ar_color' : $('.color').val(), 'ar_price':$('.ar_price').val()},
			dataType : 'json',
    		success : function(data){

    		},
    		error:function(request, status,error){
    			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		})
		
		
		
		
	})



});
</script>