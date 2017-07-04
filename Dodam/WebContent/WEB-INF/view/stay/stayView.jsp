<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- c태그를 사용하기 위해 taglib를 적어야 한다. -->
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
		input[type="button"]{
			padding-left: 0;
			padding-right: 0;
		
		}

		</style>
		<script src="/js/jquery.popitup.js"></script>
		<!-- begin : 팝업 -->

		<!-- begin : colorPicker -->
		<link rel="stylesheet" href="/css/stay/color-picker.css" />
		<script src="/css/stay/color-picker.js"></script>
		<!-- end : colorPicker -->
		
		<!-- begin : 입원장 !!drag!! javascript와 css -->
        <link rel="stylesheet" href="/css/stay/styles.css" media="screen" title="no title" charset="utf-8">
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
        <script src="/css/stay/multidraggable.js" charset="utf-8"></script>
		<!-- end : 입원장 !!drag!! javascript와 css -->
		
		
<!-- 입원 및 병원실을 보여주는 화면 stayView.jsp 입니다. -->
<div class="body">

	<!-- begin : 입원 및 호텔 추가 팝업내용 -->
	<div class="popit-wrapper popit-wrapper-chase" id='addDIV' style="top:50%; left:0px; opacity:0;">
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



	<!-- begin : 입원 및 호텔에 들어가는 팝업 내용 -->
	<div class="popit-wrapper popit-wrapper-chase" id='inDIV' style="left: 0px; opacity:0; width:800px; top:20px">
	<div class="popit-content">
		<div class="popit-header">
	    <h4 class="popit-title">입원하기 및 호텔가기</h4>
	    </div><br/>
	
		<!-- 팝업창 바디부분 -->
		<div class="popit-body" id="bodycontainer">
		<div class="content-wrapper">
	  
	  	<div>
	  	<label>기간</label>
	  	


	  	</div>
	
	  	<div>
	  	<label>종류</label>
		<input type="radio" name="ar_type" value="입원" checked>입원<br>
		<input type="radio" name="ar_type" value="호텔">호텔<br>

	  	</div>

	    <div>
	  	<label>동물방</label>
	  	<select class="ar_type">
			<c:forEach var='emptyroom' items="${roomList}" >
			<option value="${emptyroom.ar_num}">${emptyroom.ar_name}</option>
			</c:forEach>		
	  	</select>
	  	
	  	</div>      

	  	<div>
	  	<label>입원사유</label>
	  	<input type="text" class="stay_reason"/>
	  	</div>      

	  	</div>
		</div><br/>
		<!-- 팝업창 바디 끝 -->
		
		<div class="popit-footer" style="float:right">
			<button type="button" class="btn btn-default popitup-close">취소</button>
			<button type="button" class="btn btn-primary popitup-register" id="inRegister">등록</button>
		</div>
	</div>
	</div>
	<!-- end : 입원 및 호텔에 들어가는 팝업 내용 -->




	<!-- begin : 입원 호텔, '추가', '저장' 버튼 -->
	<div class="row">
		<div class="col-lg-12">
		<a class="btn btn-sm btn-primary btn-chase" id='add' href="javascript:void(0);" role="button">입원장 및 호텔 추가</a>
		<a class="registerbeauty" href="javascript:hospitalSave()">저장</a> 

		</div>
	</div>
	<script type="text/javascript" src="/beautymodal/rmodal.js"></script>
	<!-- end : 입원 호텔, '추가', '저장' 버튼 -->


<!-- begin : stayView.jsp의 핵심!!!!! -->
<div class="roomDIV">

	<ul id="multidraggable">
		<!-- db에서 animalroom을 불러와서 뿌려줘야 한다. -->              		
		<c:forEach var='room' items="${stayList}" >
			<li id="${room.AR_NUM}" style="background-color:${room.AR_COLOR}; top:${room.AR_TOP}; left:${room.AR_LEFT}">
			
			${room.AR_NAME}<br/>
			
			<c:if test="${empty room.STAY_NUM}">
			<br/><br/><br/><br/><br/><br/><br/><br/><br/>
			<div style='float:left; width:100%; text-align:center'>
			<img src="/css/stay/in.png" class='in' alt="입원" width="42" height="42">
			<img src="/css/stay/setting.png" alt="설정" width="42" height="42">
			</div>	
			</c:if>

			<c:if test="${!empty room.STAY_NUM}">
			동물이름 : ${room.ANIMAL_NAME} <br/>
			고객이름 : ${room.CUS_NAME} <br/>
			사유 : ${room.STAY_REASON}<br/>
			<br/><br/><br/><br/><br/><br/>
			<div style='float:left; width:100%; text-align:center'>
			<img src="/css/stay/out.png" alt="퇴원" width="42" height="42">
			<img src="/css/stay/showchart.png" alt="보기" width="42" height="42">
			<img src="/css/stay/newchart.png" alt="작성" width="42" height="42">
			<img src="/css/stay/setting.png" alt="설정" width="42" height="42">
			</div>
			</c:if>

			</li>
		</c:forEach>	
	</ul>
	<script type="text/javascript">
		$('#multidraggable').multidraggable();
	</script>
	<script>
		// 일단 저장은, 위치 값을 저장이 가능하게 해보는 거다.
		function hospitalSave(){
			
			// ul의 자식인 li 노드들 선택
			var li = $('#multidraggable').children();

			// li noeds의 갯수를 alert
			alert(li.length);
			// li의 갯수만큼 
			alert(li.attr('id')); 

			// 각각의 ar_num과 ar_top과 ar_left 값을 li.length만큼 저장해야 합니다요.
			
			
			var ar_num;
			var ar_top;
			var ar_left;
			var jsonArr = {'room' : []};
			
			li.each(function(){
				ar_num = $(this).attr('id');
				ar_top = $(this).offset().top;
				ar_left = $(this).offset().left;
				
				jsonArr.room.push({
					'ar_num' : ar_num,
					'ar_top' : ar_top,
					'ar_left' : ar_left
				})
			})
			
			/* 우후! jason 안에 배열을 넣음!!! */
			alert(JSON.stringify(jsonArr));
			
			$.ajax({
				url : "/stay/save.dodam",
				type : 'post',
				data : JSON.stringify(jsonArr),
				dataType : 'text',
				success : function(data){
					location.href=data;
				},
				error:function(request, status,error){
		  			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		   		} 
				
			})
		}
	</script>


</div>
<!-- end : stayView.jsp의 핵심!!!!! -->


</div>



<script type="text/javascript">
$(document).ready(function() {
	
	// colorpicker가 hsl값만 보이게 하려고 combobox 숨김..ㅎㅎㅎ
	$('.format').hide();	
		
	
	// 입원장 및 호텔 추가 이벤트 : 팝업 키자
	$('#add').bind('click', function(){
		//if($(this).hasClass('btn-chase')){
			$('#addDIV').popitup({
				chase: false
			});
		//}				        
	});	
    
	// 각 div의 입원 버튼을 클릭하면, 입원하게하는 div를 들어가게 합시다.
	$('.in').bind('click', function(){
		$('#inDIV').popitup({
			chase: false
		});
	})
	
	// 팝업창에서, 등록 DB에 넣자! 
	$('.popitup-register').bind('click', function(){

		// animalroom 테이블에 입원장 및 호텔방 데이터를 생성하자.
		$.ajax({
			url : "/stay/newAnimalRoom.dodam",
			type : 'get',
			data : {'ar_name':$('.ar_name').val(), 'ar_type':$('.ar_type option:selected').val(), 'ar_color' : $('.color').val(), 'ar_price':$('.ar_price').val()},
			dataType : 'json',
    		success : function(data){
				// 입원장이나 호텔방을 보여줄 div를 append하라~
				
			    $('#multidraggable').append(
			    	'<li style="background-color: '+data.ar_color+'">'+data.ar_name+'</li>'		    		
			    );
    			
    		},
    		error:function(request, status,error){
    			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		})
	})
	




});
</script>

<script>





</script>



