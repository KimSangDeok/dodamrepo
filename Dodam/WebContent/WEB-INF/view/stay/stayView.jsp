<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- c태그를 사용하기 위해 taglib를 적어야 한다. -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	
	
		<!-- 부트스트랩 공통!! -->
	    <link rel="stylesheet" href="/css/bootstrap.css" />
		
		<!-- begin : 팝업 style과 script!! -->
		<link rel="stylesheet" href="/css/stay/popup.css"/>
		<script src="/js/jquery.popitup.js"></script>
		<!-- end : 팝업 -->

		<!-- begin : colorPicker -->
		<link rel="stylesheet" href="/css/stay/color-picker.css" />
		<script src="/css/stay/color-picker.js"></script>
		<!-- end : colorPicker -->
		
		<!-- begin : 입원장 !!drag!! javascript와 css -->
        <link rel="stylesheet" href="/css/stay/styles.css" media="screen" title="no title" charset="utf-8">
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
        <script src="/css/stay/multidraggable.js" charset="utf-8"></script>
		<!-- end : 입원장 !!drag!! javascript와 css -->

		<!-- date range picker의 css (입원하기 및 호텔가기 팝업에서 사용이 됩니다.) -->
		<link href="/css/goods/smalldatepicker/smallDatestyle.css" rel="stylesheet" type="text/css">
		<link href="/css/goods/smalldatepicker/smallcalendar.css" rel="stylesheet" type="text/css">
		<!-- date range picker의 css (입원하기 및 호텔가기 팝업에서 사용이 됩니다.) -->

<style>
#add {
	background-color: #e74c3c;
    border-color: #e74c3c;
}
.registerbeauty {
	background-color: #e74c3c;
    border-color: #e74c3c;
}
.registerbeauty:hover{
	color: #00000;
	background-color: #fafbfb;
    border-color: #e74c3c;
}

#add:hover{
	color: black;
	background-color: #fafbfb;
    border-color: #e74c3c;
}
</style>
<!-- 입원 및 병원실을 보여주는 화면 stayView.jsp 입니다. -->
<div class="body">


	<!-- begin : 입원 및 호텔 추가 팝업내용 id:addDIV -->
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
	  	<select class="ADDar_type">
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
	  	<br/>
	  	<div class="popit-footer" style="float:right">
			<button type="button" class="btn btn-default popitup-close">취소</button>
			<button type="button" class="btn btn-primary popitup-register" id='addRegister'>등록</button>
		</div>
	  	
		</div><br/>
		<!-- 팝업창 바디 끝 -->
	</div>
	</div>
	<!-- end : 입원 및 호텔 추가 팝업내용 -->



	<!-- begin : 입원 및 호텔에 들어가는 팝업 내용 -->
	<div class="popit-wrapper popit-wrapper-chase" id='inDIV' style="top:50%; left:0px; opacity:0; width:700px">
	<div class="popit-content">
		<div class="popit-header">
	    <h4 class="popit-title">입원하기 및 호텔가기</h4>
	    </div><br/>
	
		<!-- 팝업창 바디부분 -->
		<div class="popit-body" id="bodycontainer" style="width:100%; height:100%">
		<div class="content-wrapper">
	  
	  	<div>
	  	<label>기간</label>

	<!-- begin : 미용 목록 기간을 설정하는 datepicker -->
	<div class="form-row">
		<div style="float:left">
		<input type="text" placeholder="Date range picker" id="rangedate"><div class="dt"><div class="dt__wrapper rangedate"><div class="dt__calendar dt__start"><div class="dt__calendar_head"><div class="dt__calendar_head_wday">Tuesday</div><div class="dt__calendar_head_month"><i class="prev">&lt;</i><span>June</span><i class="next">&gt;</i></div><div class="dt__calendar_head_day">20</div><div class="dt__calendar_head_year"><i class="prev">&lt;</i>2017<i class="next">&gt;</i></div></div><div class="dt__calendar_nav"><div class="dt__calendar_nav_title">Jun 2017</div></div><div class="dt__calendar_start"><div class="dt__calendar_m"><div class="dt__calendar_m_w"><div class="dt__calendar_m_w_n">Su</div><div class="dt__calendar_m_w_n">Mo</div><div class="dt__calendar_m_w_n">Tu</div><div class="dt__calendar_m_w_n">We</div><div class="dt__calendar_m_w_n">Th</div><div class="dt__calendar_m_w_n">Fr</div><div class="dt__calendar_m_w_n">Sa</div></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d ">1</div><div class="dt__calendar_m_d ">2</div><div class="dt__calendar_m_d ">3</div><div class="dt__calendar_m_d ">4</div><div class="dt__calendar_m_d ">5</div><div class="dt__calendar_m_d ">6</div><div class="dt__calendar_m_d ">7</div><div class="dt__calendar_m_d ">8</div><div class="dt__calendar_m_d ">9</div><div class="dt__calendar_m_d ">10</div><div class="dt__calendar_m_d ">11</div><div class="dt__calendar_m_d ">12</div><div class="dt__calendar_m_d ">13</div><div class="dt__calendar_m_d ">14</div><div class="dt__calendar_m_d ">15</div><div class="dt__calendar_m_d ">16</div><div class="dt__calendar_m_d ">17</div><div class="dt__calendar_m_d ">18</div><div class="dt__calendar_m_d ">19</div><div class="dt__calendar_m_d active">20</div><div class="dt__calendar_m_d between">21</div><div class="dt__calendar_m_d between">22</div><div class="dt__calendar_m_d between">23</div><div class="dt__calendar_m_d active">24</div><div class="dt__calendar_m_d ">25</div><div class="dt__calendar_m_d ">26</div><div class="dt__calendar_m_d ">27</div><div class="dt__calendar_m_d ">28</div><div class="dt__calendar_m_d ">29</div><div class="dt__calendar_m_d ">30</div></div></div></div><div class="dt__calendar dt__end"><div class="dt__calendar_head"><div class="dt__calendar_head_wday">Saturday</div><div class="dt__calendar_head_month"><i class="prev">&lt;</i><span>June</span><i class="next">&gt;</i></div><div class="dt__calendar_head_day">24</div><div class="dt__calendar_head_year"><i class="prev">&lt;</i>2017<i class="next">&gt;</i></div></div><div class="dt__calendar_nav"><div class="dt__calendar_nav_title">Jun 2017</div></div><div class="dt__calendar_end"><div class="dt__calendar_m"><div class="dt__calendar_m_w"><div class="dt__calendar_m_w_n">Su</div><div class="dt__calendar_m_w_n">Mo</div><div class="dt__calendar_m_w_n">Tu</div><div class="dt__calendar_m_w_n">We</div><div class="dt__calendar_m_w_n">Th</div><div class="dt__calendar_m_w_n">Fr</div><div class="dt__calendar_m_w_n">Sa</div></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d ">1</div><div class="dt__calendar_m_d ">2</div><div class="dt__calendar_m_d ">3</div><div class="dt__calendar_m_d ">4</div><div class="dt__calendar_m_d ">5</div><div class="dt__calendar_m_d ">6</div><div class="dt__calendar_m_d ">7</div><div class="dt__calendar_m_d ">8</div><div class="dt__calendar_m_d ">9</div><div class="dt__calendar_m_d ">10</div><div class="dt__calendar_m_d ">11</div><div class="dt__calendar_m_d ">12</div><div class="dt__calendar_m_d ">13</div><div class="dt__calendar_m_d ">14</div><div class="dt__calendar_m_d ">15</div><div class="dt__calendar_m_d ">16</div><div class="dt__calendar_m_d ">17</div><div class="dt__calendar_m_d ">18</div><div class="dt__calendar_m_d ">19</div><div class="dt__calendar_m_d active">20</div><div class="dt__calendar_m_d between">21</div><div class="dt__calendar_m_d between">22</div><div class="dt__calendar_m_d between">23</div><div class="dt__calendar_m_d active">24</div><div class="dt__calendar_m_d ">25</div><div class="dt__calendar_m_d ">26</div><div class="dt__calendar_m_d ">27</div><div class="dt__calendar_m_d ">28</div><div class="dt__calendar_m_d ">29</div><div class="dt__calendar_m_d ">30</div></div></div></div><div class="dt__ranges"><div class="dt__ranges_item" data-range="0" "="">Yesterday</div><div class="dt__ranges_item" data-range="1" "="">Sunday</div><div class="dt__ranges_item" data-range="2" "="">2 Weeks</div><div class="dt__ranges_item" data-range="3" "="">This Month</div><div class="dt__ranges_item" data-range="4" "="">Last Month</div><div class="dt__ranges_item" data-range="5" "="">This Year</div></div></div></div>
		</div>
	</div><br/>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.min.js"></script>
	
<!-- begin : 이 스크립트에 daterange 바뀌면 table 다시 search 하는 코딩 있음 꼭꼭꼭 봐야함 -->
	<script src="/css/stay/daterangepicker.js"></script>
<!-- end : 이 스크립트에 daterange 바뀌면 table 다시 search 하는 코딩 있음 꼭꼭꼭 봐야함 -->
		
	<script type="text/javascript">
	$(function(){
		 $('#rangedate').DatePicker({
		        type: 'rangedate',
		    startDate: moment().subtract(1, 'week'),
		    endDate: moment(),
		    ranges: [{
		        label: "Yesterday",
		        startDate: moment().subtract(1, 'day'),
		        endDate: moment().subtract(1, 'day')
		    }, {
		        label: 'Sunday',
		        startDate: moment().startOf('week'),
		        endDate: moment()
		    }, {
		        label: '2 Weeks',
		        startDate: moment().startOf('week').subtract(1, 'week'),
		        endDate: moment()
		    }, {
		        label: 'This Month',
		        startDate: moment().startOf('month'),
		        endDate: moment()
		    }, {
		        label: 'Last Month',
		        startDate: moment().startOf('month').subtract(1, 'month'),
		        endDate: moment().startOf('month')
		    }, {
		        label: 'This Year',
		        startDate: moment().startOf('year'),
		        endDate: moment().startOf('moth')
		    }]
		    });      				      
		});
	</script>
	<!-- end : datepicker -->


	  	</div>
	
	  	<div>
	  	<label>종류</label>
		<input type="radio" name="ar_type" value="입원" checked>입원<br>
		<input type="radio" name="ar_type" value="호텔">호텔<br>
	  	</div>
	  	
	    <div>
	  	<label>동물방</label>
	  	<select class="radio_ar_type" name='radio_ar_type'>
			<c:forEach var='emptyroom' items="${roomList}" >
			<option value="${emptyroom.ar_num}">${emptyroom.ar_name}</option>
			</c:forEach>		
	  	</select>
	  	
	  	</div>      

	  	<div>
	  	<label>입원사유</label>
	  	<input type="text" class="stay_reason"/>
	  	</div>      
	  	<br/>
	  	
	  	<div class="popit-footer" style="float:right">
			<button type="button" class="btn btn-default popitup-close">취소</button>
			<button type="button" class="btn btn-primary popitup_close" id="inRegister">등록</button>
		</div>
	  	</div>
		</div><br/>
		<!-- 팝업창 바디 끝 -->
		
		<div class="popit-footer" style="float:right">

		</div>
	</div>
	</div>
	<!-- end : 입원 및 호텔에 들어가는 팝업 내용 -->



	<!-- begin : 입원 및 호텔 정보 변경하는 팝업 id:setDIV -->
	<div class="popit-wrapper popit-wrapper-chase" id='setDIV' style="top:50%; left:0px; opacity:0;">
	<div class="popit-content">
		<div class="popit-header">
	    <h4 class="popit-title">입원장 및 호텔방 정보 변경</h4>
	    </div><br/>
	
		<!-- 팝업창 바디부분 -->
		<div class="popit-body" id="bodycontainer">
		<div class="content-wrapper">
	  
	  	<div>
	  	<label>이름</label>
	  	<input type="hidden" class='set_ar_num'/>
	  	<input type="text" class="set_ar_name"/>
	  	</div>
	
	    <div>
	  	<label>분류</label>
	  	<select class="set_ar_type">
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
				<input class="color" id='set_ar_color' type="text" value="#2ae7ea" />
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
	  	<input type="text" class="set_ar_price"/>
	  	</div>      

	  	</div>
	  	<br/>
	  	<div class="popit-footer" style="float:right">
			<button type="button" class="btn btn-default popitup-close">취소</button>
			<button type="button" class="btn btn-primary popitup-register" id='setRegister'>등록</button>
		</div>
	  	
		</div><br/>
		<!-- 팝업창 바디 끝 -->
	</div>
	</div>
	<!-- end : 입원 및 호텔 추가 팝업내용 -->





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
			<img src="/css/stay/setting.png" class='set' id="${room.AR_NUM}+${room.AR_NAME}+${room.AR_TYPE}+${room.AR_COLOR}+${room.AR_PRICE}" alt="설정" width="42" height="42">
			</div>	
			</c:if>

			<c:if test="${!empty room.STAY_NUM}">
			동물이름 : ${room.ANIMAL_NAME} <br/>
			고객이름 : ${room.CUS_NAME} <br/>
			사유 : ${room.STAY_REASON}<br/>
			<br/><br/><br/><br/><br/><br/>
			<div style='float:left; width:100%; text-align:center'>
			<img src="/css/stay/out.png" class="out" id="${room.AR_NUM}+${room.STAY_NUM}+${room.ANIMAL_NUM}"alt="퇴원" width="42" height="42">
			<img src="/css/stay/showchart.png" alt="보기" width="42" height="42">
			<img src="/css/stay/newchart.png" alt="작성" width="42" height="42">
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
			//alert(li.length);
			// li의 갯수만큼 
			//alert(li.attr('id')); 

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
			//alert(JSON.stringify(jsonArr));
			
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
	

	// 라디오 값 변경에 따른 (입원하기 및 호텔하기 : 호텔과 입원 라디오 선택시)
	$('input:radio[name=ar_type]').change(function(){
		$.ajax({
			url : "/stay/radioChange.dodam",
			type : 'get',
			data : {'ar_type' : $("input[name='ar_type']:checked").val()},
			dataType : 'json',
			success : function(data){
				$('.radio_ar_type').text('');
		
				var i;
				var count=0;
				for (i in data) {
				    if (data.hasOwnProperty(i)) {
				        count++;
				    }
				}
				
				for(var i=0; i<count; i++){
					$('.radio_ar_type').append(
		 			'<option value="'+data[i].ar_num+'">'+data[i].ar_name+'</option>'
		 			);
				}
		
			},
			error:function(request, status,error){
				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	});
	
	// 입원 및 호텔하기에서 등록!!
	$('#inRegister').bind('click', function(){
		// 입원 및 호텔장 ar_num 번호
		var ar_num = $('.radio_ar_type option:selected').val();
		// 입원이나 호텔에 들어갈 동물번호
		var animal_num = $('#animalnum').val();
		// 입원이나 호텔 기간을 정한 datepicker value
		var indays = $('#rangedate').val();
		// 입원이나 호텔에 들어가는 사유
		var stay_reason = $('.stay_reason').val();
	
		location.href="/stay/inAnimalStay.dodam?ar_num="+ar_num+"&animal_num="+animal_num+"&indays="+indays+"&stay_reason="+stay_reason;		
	})
	
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
    
	// 각 div의 입원 버튼을 클릭하면, 입원을 시키는 팝업을 킵시다!!
	$('.in').bind('click', function(){
		$('#inDIV').popitup({
			chase: false
		});
	})
	
	$('.set').bind('click', function(){
		//alert($(this).attr('id'));
		
		var infoss = $(this).attr('id').split('+');		
		
		$('.set_ar_num').val(infoss[0]);
		$('.set_ar_name').val(infoss[1]);
		$('.set_ar_type').val(infoss[2]).prop('selected', true);
		$('#set_ar_color').val(infoss[3]);
		$('.set_ar_price').val(infoss[4]);

		
		$('#setDIV').popitup({
			chase: false
		});
	})
	
	// 팝업창에서, 등록 DB에 넣자! 
	$('#addRegister').bind('click', function(){

		// 등록 이전, 장의 이름과 가격이 반드시 들어와야 한다.
		if($('.ar_name').val()==""){
			alert('입원장 이나 호텔장의 이름을 반드시 입력해야합니다.');
			return false;
		}
		if($('.ar_price').val()==""){
			alert('입원장 이나 호텔장의 가격을 반드시 입력해야합니다.');
			return false;
		}
		
		// animalroom 테이블에 입원장 및 호텔방 데이터를 생성하자.
		$.ajax({
			url : "/stay/newAnimalRoom.dodam",
			type : 'get',
			data : {'ar_name':$('.ar_name').val(), 'ar_type':$('.ADDar_type option:selected').val(), 'ar_color' : $('.color').val(), 'ar_price':$('.ar_price').val()},
			dataType : 'json',
    		success : function(data){
				// 입원장이나 호텔방을 보여줄 div를 append하라~
				location.href="/stay/stayView.dodam";
    		},
    		
    		error:function(request, status,error){
    			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		})
	})
	
	// 퇴원 버튼을 눌렀을 때,
	$('.out').bind('click', function(){
		alert($(this).attr('id'));
		location.href="/stay/outStay.dodam?infos="+$(this).attr('id');
	})
	
	
	// 입원장과 호텔장의 정보를 수정한다.
	$('#setRegister').bind('click', function(){

		alert($('.set_ar_num').val());
		alert($('.set_ar_name').val());
		alert($('.set_ar_type option:selected').val());
		alert($('#set_ar_color').val());
		alert($('.set_ar_price').val());
		
		// 등록 이전, 장의 이름과 가격이 반드시 들어와야 한다.
		if($('.set_ar_name').val()==""){
			alert('입원장 이나 호텔장의 이름을 반드시 입력해야합니다.');
			return false;
		}
		if($('.set_ar_price').val()==""){
			alert('입원장 이나 호텔장의 가격을 반드시 입력해야합니다.');
			return false;
		}
		

		$.ajax({
			url : "/stay/setAnimalRoom.dodam",
			type : 'get',
			data : {'ar_num':$('.set_ar_num').val(), 'ar_name':$('.set_ar_name').val(), 'ar_type':$('.set_ar_type option:selected').val(), 'ar_color' : $('#set_ar_color').val(), 'ar_price':$('.set_ar_price').val()},
			dataType : 'json',
    		success : function(data){
				// 입원장이나 호텔방을 보여줄 div를 append하라~
				location.href="/stay/stayView.dodam";
    		},
    		
    		error:function(request, status,error){
    			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		})
		
		
	})

});
</script>





