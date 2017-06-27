<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- c태그를 사용하기 위해 taglib를 적어야 한다. -->
<link rel='stylesheet' href="/style/css/beautytablestyles.css"> <!-- 미용내역 table css -->

		<!-- 부트스트랩 공통!! -->
	    <link rel="stylesheet" href="/css/bootstrap.css" />
		
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
		</style>
		<script src="/js/jquery.popitup.js"></script>
		<!-- begin : 팝업 -->



<!-- start of div(body) -->
<div class="body"><br/><br/>
			
			<!-- 팝업내용 -->
<div class="popit-wrapper popit-wrapper-chase" style="left: 0px; opacity: 0;">
        <div class="popit-content">
          <div class="popit-header">
            <h4 class="popit-title">미용 옵션 추가</h4>
          </div><br/>
<!-- 팝업창 바디부분 -->
          <div class="popit-body" id="bodycontainer">
            <div class="content-wrapper">
            
            	<div>
            	<label>종류</label>
            	<input type="text" class="btm_type"/>
            	</div>
      
                <div>
            	<label>가격</label>
            	<input type="text" class="btm_price"/>
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

<!-- 팝업열리는 부분 끝-->
			
				
				 
			 <!-- 여기 부분이 실질적으로 코딩하는 부분입니다~~~ div의 테두리는 지금 보기 편하기 위한 부분이고, 나중에 지울껍니다~~ -->
			 <div style="border:1px solid red; float:left; width:60%">
			 	<h1>1. 해당 날짜의 미용실 예약 일정을 모두 보여준다.</h1>
			 	
			 	
			 		<!-- datepicker, 옵션, 저장 값 가져오자. -->
			 		<div class="row">
			 			<div class="col-lg-12">
							<a class="btn btn-sm btn-primary btn-chase" href="javascript:void(0);" role="button">옵션추가</a> 
   						</div>
					</div>
			 		<script type="text/javascript" src="/beautymodal/rmodal.js"></script>
			 		
			 	
			 	  <table id="keywords" cellspacing="0" cellpadding="0">
				    <thead>
				      <tr>
				        <th><span>예약일자</span></th>
				        <th><span>동물명</span></th>
				        <th><span>종</span></th>
				        <th><span>고객명</span></th>
				        <th><span>핸드폰번호</span></th>
				        <th><span>미용내역</span></th>
				        <th><span>미용완료여부</span></th>
				      </tr>
				    </thead>
				    <tbody>     
					        <!-- db에서 BeautyService을 불러와서 뿌려줘야 한다. mapping한 key값이 대문자여서 대문자로!!-->              		
							<c:forEach var='service' items="${beautyService}" >
								<tr ondblclick="javascript:showList('${service.CUS_TEL}')">
							        <td>${service.BTY_DT}</td>
							        <td>${service.ANIMAL_NAME}</td>
							        <td>${service.ANIMAL_BREED}</td>
							        <td>${service.CUS_NAME}</td>
							        <td>${service.CUS_TEL}</td>
							        <td>${service.BTM_TYPE}</td>
							        <td>${service.BTY_OX}</td>
							        <td style="display:none">${service.CUS_ADDR}</td>

							</c:forEach>
				    </tbody>
				  </table>
				 </div> 
			 	
			 	<!-- 미용 내역 table js -->
				<script type="text/javascript" src="/style/js/jquery.tablesorter.min.js"></script>
			 	<script type="text/javascript">
				$(function(){
				   $('#keywords').tablesorter(); 
				});
				</script>
			 	
			 	
			 	
			 	
			 	<div style="border:1px solid blue; float:left; width:40%">
			 	<h1>2. 동물의 예약 미용 내역을 추가하여 저장한다.</h1>




                		
                		
			 	
			 	
			 	
			 	<div class="rowOption">
                <div class="col-xs-5">
                    <select name="from[]" id="undo_redo" class="form-control" size="13" multiple="multiple">
                        
                        <!-- db에서 BeautyOption을 불러와서 뿌려줘야 한다. -->              		
						<c:forEach var='option' items="${beautyOption}" >
							<option>${option.btm_type}</option>
						</c:forEach>

                    </select>
                </div>
                
                <div class="col-xs-2">
                    <button type="button" id="undo_redo_undo" class="btn btn-primary btn-block">undo</button>
                    <button type="button" id="undo_redo_rightAll" class="btn btn-default btn-block">▶▶</button>
                    <button type="button" id="undo_redo_rightSelected" class="btn btn-default btn-block">></button>
                    <button type="button" id="undo_redo_leftSelected" class="btn btn-default btn-block"><</button>
                    <button type="button" id="undo_redo_leftAll" class="btn btn-default btn-block">◀◀</button>
                    <button type="button" id="undo_redo_redo" class="btn btn-warning btn-block">redo</button>
                </div>
                
                <div class="col-xs-5">
                    <select name="to[]" id="undo_redo_to" class="form-control" size="13" multiple="multiple"></select>
                </div>
            </div>
			 </div>


			 
</div> <!-- end of div(body) -->



<!-- begin : 미용옵션 옮기는 script -->
<script type="text/javascript" src="/style/js/multiselect.js"></script>
<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
    
    ga('create', 'UA-39934286-1', 'github.com');
    ga('send', 'pageview');
</script>
<!-- end : 미용옵션 옮기는 script -->



<script>
// 테이블을 클릭했을 때
function showList(cus_tel){
	
	var result = new Array();
	
	<c:forEach items="${beautyService}" var="service">
	
		var json = new Object();
		json.cus_name="${service.CUS_NAME}";
		json.cus_tel="${service.CUS_TEL}";
		json.animal_name="${service.ANIMAL_NAME}";
		json.animal_breed="${service.ANIMAL_BREED}";
		json.cus_addr="${service.CUS_ADDR}"
		
		if(cus_tel=="${service.CUS_TEL}"){
			result.push(json);
		}
		
	</c:forEach>
	
	$('#cusname').val(result[0].cus_name);
	$('#custel').val(result[0].cus_tel);
	$('#animalname').val(result[0].animal_name);
	$('#animalbreed').val(result[0].animal_breed);
	$('#cusaddr').val(result[0].cus_addr);
	
	
}

function layer_open(el){

	var temp = $('#' + el);
	var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

	if(bg){
		$('.layer').fadeIn();	//'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
	}else{
		temp.fadeIn();
	}

	// 화면의 중앙에 레이어를 띄운다.
	if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
	else temp.css('top', '0px');
	if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
	else temp.css('left', '0px');

	temp.find('a.cbtn').click(function(e){
		if(bg){
			$('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
		}else{
			temp.fadeOut();
		}
		e.preventDefault();
	});

	$('.layer .bg').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
		$('.layer').fadeOut();
		e.preventDefault();
	});

}				
</script>



<script type="text/javascript">
$(document).ready(function() {

	// 미용 옵션 버튼 이벤트
	 $('.btn-sm').bind('click', function(){    
	        if($(this).hasClass('btn-chase')){
	          $('.popit-wrapper-chase').popitup({
	            chase: false
	          });
	        }				        
	      });	
    
	// 미용 옵션 선택 제어 이벤트
    $('#undo_redo').multiselect();
	
    
	// 미용 옵션 팝업에서, 등록 버튼을 누르면 ajax를 이용하여 DB에 등록되고, 불러지게 한다.    
    $('.popitup-register').bind('click', function(){    	
    	$.ajax({
    		url : "/beauty/registerBeautyOption.dodam",
    		type : 'get',
    		async: true,
    		data : {'btm_type' : $('.btm_type').val(), 'btm_price':$('.btm_price').val()},							
    		dataType : "text",
    		success : function(data){
    			$("#undo_redo").append("<option>"+data+"</option>");
    		},
    		error:function(request, status,error){
    			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
    	})	
    })
    
    // 미용 스케쥴 테이블에서 표 내용을 클릭하면 그 해당 내용을 옆에 뿌려야주...

    
    
/*     $('#keywords tr td').bind('click', function(){
				
    	var table = $('#keywords');
    	
    		alert($(this).text());
			alert($(this).parent().index('tr'));
			
			alert($('#keywords:eq(1):eq(1)'));
			
			
    }) */	
    
    

});
</script>





</div>