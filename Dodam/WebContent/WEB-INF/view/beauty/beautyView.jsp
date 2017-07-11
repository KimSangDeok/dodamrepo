<%@ page language="java" contentType="text/html;  charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %> <!-- c태그를 사용하기 위해 taglib를 적어야 한다. -->
	
	<!-- 미용내역 table css -->
	<link rel='stylesheet'  href="/style/css/beautytablestyles.css"> <!-- 미용내역 table  css -->

	<!-- datepicker(range)의 css -->
	<link  href="/css/goods/smalldatepicker/smallDatestyle.css"  rel="stylesheet" type="text/css">
	<link  href="/css/goods/smalldatepicker/smallcalendar.css"  rel="stylesheet" type="text/css">
	
	<!-- datepicker(미용옵션) -->
	<link type="text/css" rel="stylesheet"  href="/css/beauty/demo.css">

	<!-- 부트스트랩 공통!! -->
    <link rel="stylesheet" href="/css/bootstrap.css" />
		
	<!-- Date picker css -->
	<style>
	.dt__calendar_head{
	background-color: #e74c3c;
	}
	.dt__calendar_m_d.active {
	    background-color: #e5f791;
	    color: #180202;
	}
	
	/* 버튼 css */
	.btn-primary, .registerbeauty {
    color: #110f0f;
    background-color: #fafbfb;
    border-color: #e74c3c;
	}	
	.registerbeauty {
    color: #150b0b;
    background-color: none;
    border-color: none;
	}
	.btn-primary:hover {
	    color: #fff;
	    background-color: rgba(245, 81, 64, 0.75);
	    border-color: #bc0b0b;
	}
	
	.col-lg-12 {
    width: 50%;
    left: 180px;
    top: -30px;
}
	
	</style>	
	
	<!-- begin : table의 헤더 중앙정렬 -->
	<style>
	.header{
		text-align:center;
	}
	</style>
	<!-- end : table의 헤더 중앙정렬 -->

	<!-- begin : 팝업 style과 script!! -->
	<style>
	.popit-wrapper {
		display: none;
		border: 1px solid #ccc;
		background: #fff;
		border-radius: 5px;
		box-shadow: 0px 0px 6px 2px #ccc;
		height:250px;
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
	.beautyDIV{
	    position: relative;
	    background-color: #fff;
	    -webkit-background-clip: padding-box;
	    background-clip: padding-box;
	    border: 1px solid #999;
	    border: 1px solid rgba(248, 14, 14, 0.2);
	    border-radius: 6px;
	    outline: 0;
	    -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
	    box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
	    width:500px;
	    height:500px;
	    margin-bottom: 50px;
	}
	</style>
	<script src="/js/jquery.popitup.js"></script>
	<!-- begin : 팝업 -->

	<!-- 미용 옵션 저장할때 사용하는 datepicker -->
	<script type="text/javascript"  src="/css/beauty/date-time-picker.min.js"></script>




<!-- start of div(body) -->
<div class="body"><br/>
			
	<!-- 팝업내용 -->
	<div class="popit-wrapper popit-wrapper-chase"  style=" left: 0px; opacity: 0;">
        <div class="popit-content">
			<div class="popit-header">
            	<h4 class="popit-title">미용 옵션 추가</h4>
			</div><br/>
			
			<!-- 팝업창 바디부분 -->
			<div class="popit-body"  id="bodycontainer">
				<div class="content- wrapper">
		            
					<div>
					 <label>종류</label>
					<input  type="text" class="btm_type"/>
					</div>
					
					   <div>
					 <label>가격</label>
					<input  type="text" class="btm_price"/>
					</div>      
		                     	            	
				</div>
			</div><br/>
			<!-- 팝업창 바디 끝 -->

			<!-- 팝업창 fotter 끝 -->
					<div  class="popit-footer" style="float:right">
					  <button  type="button" class="btn btn-default popitup- close">취소</button>
					  <button  type="button" class="btn btn-primary popitup- register">등록</button>
					</div>
			<!-- 팝업창 fotter 끝 -->
		</div>
</div>
<!-- 팝업열리는 부분 끝-->
			
				
				 
<!-- begin : DIV 1) 미용 일정을 보여주는 테이블 -->
<div class='beautyDIV' style="float:left; width:56%; margin-left:3% ; margin-right:1%; margin-top: 5%">
	<div>
	<h1 style="font-family: 맑은고딕; ">Beauty List</h1>
	</div>


	<!-- begin : 미용 목록 기간을 설정하는 datepicker -->
	<div class="form-row">
		<div style="float:left">
		<input type="text" placeholder="Date range  picker" id="rangedate"><div class="dt"><div  class="dt__wrapper rangedate"><div class="dt__calendar  dt__start"><div class="dt__calendar_head"><div  class="dt__calendar_head_wday">Tuesday</div><div  class="dt__calendar_head_month"><i  class="prev">&lt;</i><span>June</span><i  class="next">&gt;</i></div><div  class="dt__calendar_head_day">20</div><div  class="dt__calendar_head_year"><i  class="prev">&lt;</i>2017<i  class="next">&gt;</i></div></div><div  class="dt__calendar_nav"><div  class="dt__calendar_nav_title">Jun 2017</div></div><div  class="dt__calendar_start"><div class="dt__calendar_m"><div  class="dt__calendar_m_w"><div  class="dt__calendar_m_w_n">Su</div><div  class="dt__calendar_m_w_n">Mo</div><div  class="dt__calendar_m_w_n">Tu</div><div  class="dt__calendar_m_w_n">We</div><div  class="dt__calendar_m_w_n">Th</div><div  class="dt__calendar_m_w_n">Fr</div><div  class="dt__calendar_m_w_n">Sa</div></div><div  class="dt__calendar_m_d_e"></div><div  class="dt__calendar_m_d_e"></div><div  class="dt__calendar_m_d_e"></div><div  class="dt__calendar_m_d_e"></div><div  class="dt__calendar_m_d ">1</div><div  class="dt__calendar_m_d ">2</div><div  class="dt__calendar_m_d ">3</div><div  class="dt__calendar_m_d ">4</div><div  class="dt__calendar_m_d ">5</div><div  class="dt__calendar_m_d ">6</div><div  class="dt__calendar_m_d ">7</div><div  class="dt__calendar_m_d ">8</div><div  class="dt__calendar_m_d ">9</div><div  class="dt__calendar_m_d ">10</div><div  class="dt__calendar_m_d ">11</div><div  class="dt__calendar_m_d ">12</div><div  class="dt__calendar_m_d ">13</div><div  class="dt__calendar_m_d ">14</div><div  class="dt__calendar_m_d ">15</div><div  class="dt__calendar_m_d ">16</div><div  class="dt__calendar_m_d ">17</div><div  class="dt__calendar_m_d ">18</div><div  class="dt__calendar_m_d ">19</div><div  class="dt__calendar_m_d active">20</div><div  class="dt__calendar_m_d between">21</div><div  class="dt__calendar_m_d between">22</div><div  class="dt__calendar_m_d between">23</div><div  class="dt__calendar_m_d active">24</div><div  class="dt__calendar_m_d ">25</div><div  class="dt__calendar_m_d ">26</div><div  class="dt__calendar_m_d ">27</div><div  class="dt__calendar_m_d ">28</div><div  class="dt__calendar_m_d ">29</div><div  class="dt__calendar_m_d ">30</div></div></div></div><div  class="dt__calendar dt__end"><div  class="dt__calendar_head"><div  class="dt__calendar_head_wday">Saturday</div><div  class="dt__calendar_head_month"><i  class="prev">&lt;</i><span>June</span><i  class="next">&gt;</i></div><div  class="dt__calendar_head_day">24</div><div  class="dt__calendar_head_year"><i  class="prev">&lt;</i>2017<i  class="next">&gt;</i></div></div><div  class="dt__calendar_nav"><div  class="dt__calendar_nav_title">Jun 2017</div></div><div  class="dt__calendar_end"><div class="dt__calendar_m"><div  class="dt__calendar_m_w"><div  class="dt__calendar_m_w_n">Su</div><div  class="dt__calendar_m_w_n">Mo</div><div  class="dt__calendar_m_w_n">Tu</div><div  class="dt__calendar_m_w_n">We</div><div  class="dt__calendar_m_w_n">Th</div><div  class="dt__calendar_m_w_n">Fr</div><div  class="dt__calendar_m_w_n">Sa</div></div><div  class="dt__calendar_m_d_e"></div><div  class="dt__calendar_m_d_e"></div><div  class="dt__calendar_m_d_e"></div><div  class="dt__calendar_m_d_e"></div><div  class="dt__calendar_m_d ">1</div><div  class="dt__calendar_m_d ">2</div><div  class="dt__calendar_m_d ">3</div><div  class="dt__calendar_m_d ">4</div><div  class="dt__calendar_m_d ">5</div><div  class="dt__calendar_m_d ">6</div><div  class="dt__calendar_m_d ">7</div><div  class="dt__calendar_m_d ">8</div><div  class="dt__calendar_m_d ">9</div><div  class="dt__calendar_m_d ">10</div><div  class="dt__calendar_m_d ">11</div><div  class="dt__calendar_m_d ">12</div><div  class="dt__calendar_m_d ">13</div><div  class="dt__calendar_m_d ">14</div><div  class="dt__calendar_m_d ">15</div><div  class="dt__calendar_m_d ">16</div><div  class="dt__calendar_m_d ">17</div><div  class="dt__calendar_m_d ">18</div><div  class="dt__calendar_m_d ">19</div><div  class="dt__calendar_m_d active">20</div><div  class="dt__calendar_m_d between">21</div><div  class="dt__calendar_m_d between">22</div><div  class="dt__calendar_m_d between">23</div><div  class="dt__calendar_m_d active">24</div><div  class="dt__calendar_m_d ">25</div><div  class="dt__calendar_m_d ">26</div><div  class="dt__calendar_m_d ">27</div><div  class="dt__calendar_m_d ">28</div><div  class="dt__calendar_m_d ">29</div><div  class="dt__calendar_m_d ">30</div></div></div></div><div  class="dt__ranges"><div class="dt__ranges_item" data- range="0" "="">Yesterday</div><div class="dt__ranges_item"  data-range="1" "="">Sunday</div><div  class="dt__ranges_item" data-range="2" "="">2  Weeks</div><div class="dt__ranges_item" data-range="3"  "="">This Month</div><div class="dt__ranges_item" data- range="4" "="">Last Month</div><div class="dt__ranges_item"  data-range="5" "="">This Year</div></div></div></div>
		</div>
	</div><br/>
	
	<script  src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12 .0/moment.min.js"></script>
	
<!-- begin : 이 스크립트에 daterange 바뀌면 table 다시 search 하는 코 딩 있음 꼭꼭꼭 봐야함 -->
	<script  src="/css/beauty/daterangepicker.js"></script>
<!-- end : 이 스크립트에 daterange 바뀌면 table 다시 search 하는 코딩  있음 꼭꼭꼭 봐야함 -->
		
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
		        startDate: moment().startOf ('week').subtract(1, 'week'),
		        endDate: moment()
		    }, {
		        label: 'This Month',
		        startDate: moment().startOf('month'),
		        endDate: moment()
		    }, {
		        label: 'Last Month',
		        startDate: moment().startOf ('month').subtract(1, 'month'),
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

			 	
	<table id="keywords" cellspacing="0" cellpadding="0">
		<thead>
		<tr style="background-color: #e3e3e3;">
			<th><span>예약일자</span></th>
			<th><span>동물명</span></th>
			<th><span>종</span></th>
			<th><span>고객명</span></th>
			<th><span>핸드폰번호</span></th>
			<th><span>미용내역</span></th>
			<th><span>미용완료여부</span></th>
		</tr>
		</thead>
	 	<tbody class="beautyTbody">     
	     
		<!-- db에서 BeautyService을 불러와서 뿌려줘야  한다. mapping한 key값이 대문자여서 대문자로!!-->              		
		<c:forEach var='service'  items="${beautyService}" >
		
		<tr>
		<td>${service.BTY_DT}</td>
		<td>${service.ANIMAL_NAME}</td>
		<td>${service.ANIMAL_BREED}</td>
		<td>${service.CUS_NAME}</td>
		<td>${service.CUS_TEL}</td>
		<td>${service.BTM_TYPE}</td>
		<td>${service.BTY_OX}</td>
		<td style="display:none"> ${service.CUS_ADDR}</td>
		
		</c:forEach>
		</tbody>
		</table>
		
		<!-- begin : 미용 내역 table js, 기능은, th를 누르 면 정렬이 됨 -->
		<script type="text/javascript"  src="/style/js/jquery.tablesorter.min.js"></script>
			<script type="text/javascript">
		$(function(){
		   $('#keywords').tablesorter(); 
		});
		</script>
		<!-- end : 미용 내역 table js, 기능은, th를 누르면  정렬이 됨 -->
		
		
		
</div> 
<!-- end : DIV 1) 미용 일정을 보여주는 테이블 -->
	

			 	
			 	
			 	
<!-- begin : DIV 2) 미용 옵션을 보여주고, 등록하는 DIV -->
<div class='beautyDIV' style="float:left; width:37% ;margin-top:5%; ">
	<div>	
	<h1 style="font-family: 맑은고딕; ">Beauty  Register</h1>
	</div>


	<!-- begin : 미용 일정을 등록하는 datepicker -->
	<input type="text" class="mt10px input" id="J-demo-01" placeholder="Date select" style="margin-top:40px;margin-right:230px;">
	<script type="text/javascript">
		$('#J-demo-01').dateTimePicker();
	</script>	
	<!-- end : 미용 일정을 등록하는 datepicker -->


	<!-- begin : 미용 옵션 추가하는 버튼, script(팝업을 띄운다), 미 용예약, 미용하기 버튼 3가지 -->
	<div class="rows">
		<form method='get'  action="/beauty/beautyCam.dodam">
		<div class="col-lg-12">
		<a style="border-color:none; float: right;"  class="registerbeauty" href="javascript:registerBeauty()">예 약</a> 
		<input type="hidden" name="bty_code"  id="bty_code">	
		<input type="submit"  class="registerbeauty" value="미용하기" style="float: right;  background: none;">
		</div>
		</form>
	</div>
	<script type="text/javascript"  src="/beautymodal/rmodal.js"></script>
	<!-- end : 미용 옵션 추가하는 버튼, script(팝업을 띄운다), 미용 예약, 미용하기 버튼 3가지 -->
     
	<br/>        			
                		
	<!-- begin : 미용 옵션 추가 drag -->		 	
	<div class="rowOption">
		
		<div style='float:right; margin-right:3%'>
		<input type="button" class="btn btn-sm  btn-primary btn-chase" href="javascript:void(0);"  role="button" value="옵션추가" style=""/>
		</div>
		
		<br/>
		
		<div class='beautyOption' style='margin- top:30px; margin-bottom:50px'>
		
			<div class="col-xs-5">
				<select name="from[]"  id="undo_redo" class="form-control" size="13"  multiple="multiple">
					<!-- db에서  BeautyOption을 불러와서 뿌려줘야 한다. -->              		
					<c:forEach  var='option' items="${beautyOption}" >
					<option> ${option.btm_type}</option>
					</c:forEach>
				</select>
			</div>
	            
			<div class="col-xs-2">
			    <button type="button"  id="undo_redo_undo" class="btn btn-primary btn- block">undo</button>
			    <button type="button"  id="undo_redo_rightAll" class="btn btn-default btn-block">▶ ▶</button>
			    <button type="button"  id="undo_redo_rightSelected" class="btn btn-default btn- block">></button>
			    <button type="button"  id="undo_redo_leftSelected" class="btn btn-default btn- block"><</button>
			    <button type="button"  id="undo_redo_leftAll" class="btn btn-default btn-block">◀◀ </button>
			    <button type="button"  id="undo_redo_redo" class="btn btn-warning btn- block">redo</button>
			</div>
	            
			<div class="col-xs-5"  id="optionResult">
			    <select name="to[]"  id="undo_redo_to" class="form-control" size="13"  multiple="multiple"></select>
			</div>
		</div>
		
		<!-- begin : 미용옵션 옮기는 script -->
		<script type="text/javascript"  src="/style/js/multiselect.js"></script>
		<script>
		    (function(i,s,o,g,r,a,m){i ['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		    (i[r].q=i[r].q||[]).push(arguments)},i [r].l=1*new Date();a=s.createElement(o),
		    m=s.getElementsByTagName(o) [0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		    }) (window,document,'script','//www.google- analytics.com/analytics.js','ga');
		    
		    ga('create', 'UA-39934286-1',  'github.com');
		    ga('send', 'pageview');
		</script>
		<!-- end : 미용옵션 옮기는 script -->
		
		
		
	</div>	<!-- end : 미용 옵션 추가 drag -->	
</div>	<!-- begin : DIV 2) 미용 옵션을 보여주고, 등록하는 DIV -->
	

			 
</div> <!-- end of div(body) -->






	<script>
	// 미용 예약 버튼을 클릭했을 때, DB에 예약이 되게 해줘야 해요~
	function registerBeauty(){
		
		if($('#J-demo-01').val()==""){
			alert("미용을 예약할 날짜를 반드시 선택 해주세요.");
			return false;
		}
		if($('#animalnum').val()==""){
			alert("미용을 예약할 동물을 반드시 선택해 주세요");
			return false;
		}

		// 미용을 등록할 select의 option을 모두 다 넣는다.
		var opts_val = [];
		
		$('#undo_redo_to option').each(function(){
			opts_val.push( $(this).text() );
		});
	
/* 		alert(opts_val.length);
		alert(typeof(opts_val));
		
		alert("+++"+opts_val[0]);
		alert("+++"+opts_val[1]);	
		alert("+++"+opts_val[2]);
 */		
	
 		if(opts_val.length==0){
			alert("예약할 미용 옵션을 반드시 하나 이 상 선택해주세요");
			return false;
 		}
 
		var regidata = {
			'btm_type_list':opts_val,
			'bty_dt':$('#J-demo-01').val(),
			'animal_num':$('#animalnum').val()
		}
		
		// 1) ajax로 등록을하고,,,
		// 2) table의 전체 내용을 다시 뿌려주는....(오늘날짜 라면 에약날짜가~~)
		
		$.ajax({
			url :  "/beauty/registerBeauty.dodam",
			type : "post",   // ajax 는 무조건  post!
			//contentType: 'application/x- www-form-urlencoded; charset=UTF-8',
			data : JSON.stringify(regidata), 	 //stringify는 json 객체럴 string으로 변환!
			dataType : 'json',
			success : function(data){
				
			},
			error:function(request,  status,error){
	  			 //alert ("code:"+request.status +"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   		}  
		})
	}
	
	// 테이블을 클릭했을 때
	 function showList(bty_code, cus_tel, cus_name,  animal_name, animal_breed, animal_num, cus_addr){
		
		/* 값들이~, 위의 info에 적히도록!!! */
		$('#cusname').val(cus_name);
		$('#custel').val(cus_tel);
		$('#animalname').val(animal_name);
		$('#animalbreed').val(animal_breed);
		$('#cusaddr').val(cus_addr);
		$('#animalnum').val(animal_num);
		
		$('#bty_code').val(bty_code);
			
	} 
	
	function layer_open(el){
	
		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg');	 //dimmed 레이어를 감지하기 위한 boolean 변수
	
		if(bg){
			$('.layer').fadeIn();	//'bg'  클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
		}else{
			temp.fadeIn();
		}
	
		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() <  $(document).height() ) temp.css('margin-top',  '-'+temp.outerHeight()/2+'px');
		else temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width () ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
		else temp.css('left', '0px');
	
		temp.find('a.cbtn').click(function(e){
			if(bg){
				$('.layer').fadeOut();  //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			}else{
				temp.fadeOut();
			}
			e.preventDefault();
		});
	
		$('.layer .bg').click(function(e){	//배경 을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			$('.layer').fadeOut();
			e.preventDefault();
		});
	
	}
	
	</script>



	<script type="text/javascript">
	$(document).ready(function() {
	
		
		// 미용 옵션 선택 제어 이벤트
	    $('#undo_redo').multiselect();
	
		
		// 미용 옵션 버튼 이벤트 : 팝업아 열려라
		$('.btn-sm').bind('click', function(){    
			if($(this).hasClass('btn-chase')){
				$('.popit-wrapper- chase').popitup({
				chase: false
				});
			}				         
		 });	
	    
		
		// 미용 옵션 팝업에서, 등록 버튼을 누르면 ajax를 이용 하여 DB에 등록되고, 불러지게 한다.    
	    $('.popitup-register').bind('click', function(){ 
	    	
	    	
	    	// 미용 옵션을 등록하기 전에, 모든 내용(미용유형, 미용 가격)을 다 입력했는지 검사한다.
	    	if($('.btm_type').val()==""){
	    		alert("미용 유형을 반드시 입력하세요.");
				return false;
			}
	    	if($('.btm_price').val()==""){
	    		alert("미용 가격을 반드시 입력하세요.");
				return false;
			} 	
	    	
	    	$.ajax({
	    		url :  "/beauty/registerBeautyOption.dodam",
	    		type : 'get',
	    		async: true,
	    		data : {'btm_type' :  $('.btm_type').val(), 'btm_price':$('.btm_price').val()},		 					
	    		dataType : "text",
	    		success : function(data){
	    			$("#undo_redo").append ("<option>"+data+"</option>");
	    		},
	    		error:function(request,  status,error){
	    			 alert ("code:"+request.status +"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    		}
	    	})	
	    })
	    
	    
	});
	</script>