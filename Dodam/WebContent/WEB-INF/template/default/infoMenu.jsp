<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

	<link href="/css/goods/smalldatepicker/smallDatestyle.css" rel="stylesheet" type="text/css">	<!-- tale의 css -->

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


<div class="infoMenu" style="padding-top:20px;">
	
	<!-- 진료, 입원 등 현재 서비스를 받는 고객 및 동료 정보를 보는 곳 -->
	<input id="info_cusname" class='customerInfo' type='text' disabled='disabled' name='customer_name' value='${cus_name}'/>
	<input id ="info_custel" type='text' disabled='disabled' name='customer_tel' value='${cus_tel}'/>
	<input id ="info_animalname" type='text' disabled='disabled' name='customer_tel' value='${ani_name}'/>
	<input id= "info_animalbreed" type='text' disabled='disabled' name='pet_type' value='${ani_breed}'/>
	<input id= "info_doctor_name" type='text' disabled='disabled' name='doctor_name'/>
	
	<input id= "info_animalnum" type='hidden' disabled='disabled' name='animal_num' value='${ani_num}'/>
	<a class="btn btn-sm btn-primary btn-chase" id='infoBtn' href="javascript:void(0);" role="button">고객검색</a>
	
	
	<!-- begin : 팝업에서 고객을 선택한 값을 잠시 저장해주는 공간 -->
	<form class='infoAnimal' action="/customer/infoAnimalApply.dodam">
	<input id="v_cusname" type='hidden' name='cus_name'/>
	<input id ="v_custel" type='hidden' name='cus_tel'/>
	<input id ="v_animalname" type='hidden' name='animal_name'/> 
	<input id= "v_animalbreed" type='hidden' name='animal_breed'/>
	<input id= "v_cusaddr" type='hidden' name='cus_addr'/>
	<input id= "v_animalnum" type='hidden' name='animal_num'/>
	</form>
	<!-- end : 팝업에서 고객을 선택한 값을 잠시 저장해주는 공간 -->
	

	<!-- begin: 팝업 DIV : infoMenu의 팝업내용 (동물을 검색하여 info에 띄우고, session에 등록한다.) -->
	<div class="popit-wrapper popit-wrapper-chase infoPopup" id='infoPopup' style="left: 0px; opacity: 0;">
        <div class="popit-content">
			<div class="popit-header">
            	<h4 class="popit-title">동 물 검 색</h4>
			</div><br/>
			
			<!-- 팝업창 바디부분 -->
			<div class="popit-body" id="bodycontainer">
				<div class="content-wrapper">
		            
				<!-- begin : 고객의 검색을 하는 입력창과 동물 총 검색 내역 table -->
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-search"></i></span>
				<input class="form-control" id="livesearch" placeholder="아무거나 입력하세요" type="text" />
				</div>
			
				<div style="overflow-y:scroll">
				<table class="table" id="users">
					<tr>
						<th class="hidden-xs">동물 이름</th>
						<th class="hidden-xs">고객 성명</th>
						<th class="hidden-xs">고객 핸드폰번호</th>
					</tr>
					
					<!-- db에서 전체 동물의 목록을 가져오세요~~ -->
					<tbody class="tbody">

					</tbody>
				</table>
				</div>
				<!-- end : 고객의 검색을 하는 입력창과 동물 총 검색 내역 table -->

				선택한 고객 동물 : 	<input id ="popup_animalname" type='text' disabled="disabled"/> <br/>
				선택한 고객 성명 :  <input id="popup_cusname" type='text' disabled="disabled"/> <br/>
				선택한 고객 핸드폰 :  <input id ="popup_custel" type='text' disabled="disabled"/> <br/>
	
				</div>
			</div><br/>
			<!-- 팝업창 바디 끝 -->

			<!-- 팝업창 footer 끝 -->
					<div class="popit-footer" style="float:right">
					  <button type="button" class="btn btn-default popitup-close">취소</button>
					  <button type="button" class="btn btn-primary popitup-register" id="infoRegister">적용</button>
					</div>
			<!-- 팝업창 footer 끝 -->
		</div>
	</div>
	<!-- end: 팝업 DIV --> 

	<!-- begin : 팝업내 자동 검색 테이블 -->
	<script src="/sms/demo.js"></script>
	<script src="/sms/livesearch.js"></script>		
	<script type="text/javascript">
	
	
	// 고객 리스트가 뜬 팝업화면에서, 클릭한 고객의 값을 지정, 그리고 이걸 다시 control 타게 해야함...
	function infoAnimal(animal_num, animal_name, cus_name, cus_tel, animal_breed, cus_addr){
		
		$('#popup_cusname').val(cus_name);
		$('#popup_custel').val(cus_tel);
		$('#popup_animalname').val(animal_name);
		
		$('#v_cusname').val(cus_name);
		$('#v_custel').val(cus_tel);
		$('#v_animalname').val(animal_name);
		$('#v_animalbreed').val(animal_breed);	
		$('#v_cusaddr').val(cus_addr);
		$('#v_animalnum').val(animal_num);	
	}
		
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
	<!-- begin : 팝업내 자동 검색 테이블 -->

	<!-- begin : 팝업 div를 열어주는 script -->
	<script type="text/javascript">
	$(document).ready(function() {
		// info menu 에서 동물검색 버튼 이벤트 : 팝업아 열려라
		$('#infoBtn').bind('click', function(){    
			
			// 전체 동물 내역을 가져오고, 팝업을 켜야한다.
			$.ajax({
				url : '/customer/infoAnimal.dodam',
				dataType : 'json',
				success : function(data){
					console.log('ddd');
					console.log(data);
					
					
					var i;
					var count=0;
					for (i in data) {
					    if (data.hasOwnProperty(i)) {
					        count++;
					    }
					}
					
					$('.tbody').text("");
					
					// data의 갯수만큼!, append로 sms 즐겨찾기 목록을 추가해줍니다.
					for(var i=0; i<count; i++){
						
						$('.tbody').append(
								'<tr onclick="javascript:infoAnimal('+"'"+data[i].ANIMAL_NUM+"'"+","+"'"+data[i].ANIMAL_NAME+"'"+","+"'"+data[i].CUS_NAME+"'"+","+"'"+data[i].CUS_TEL+"'"+","+"'"+data[i].ANIMAL_BREED+"'"+","+"'"+data[i].CUS_ADDR+"'"+')">'+
								"<td>"+data[i].ANIMAL_NAME+"</td>"+
								"<td>"+data[i].CUS_NAME+"</td>"+
								"<td>"+data[i].CUS_TEL+"</td>"+
								"</tr>"
						);
					}						

					
				},
				error:function(request, status,error){
		  			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		   		} 
				
			});

			$('.infoPopup').popitup({
				chase: false
			});
			
		 });
	
		// 고객 찾는 팝업에서 적용 버튼을 누른다면!!
		$('#infoRegister').bind('click', function(){
			var pageSessionName = "<%=(String)session.getAttribute("pageName")%>"
			alert(pageSessionName);
			if(pageSessionName!="jinryo" || pageSessionName!="pay"){
				$.ajax({
		    		url : "/customer/infoAnimalApplyAJAX.dodam",
		    		type : 'get',  
		    		async: true,
		    		data : {'cus_tel':$('#v_custel').val(), 'cus_name':$('#v_cusname').val(), 'animal_breed':$('#v_animalbreed').val(), 'animal_name':$('#v_animalname').val(), 'animal_num':$('#v_animalnum').val()},							
		    		dataType : "text",
		    		success : function(){
		    			location.reload();
		    		},
		    		error:function(request, status,error){
		    		}
				})
				
			}else{
				$('.infoAnimal').submit();			
			}
		})
	});
	</script>
	<!-- end : 팝업 div를 열어주는 script -->
	
</div>