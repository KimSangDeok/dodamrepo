<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<link rel="stylesheet" href="/jinryoCss/css/bootstrap.css">

<!-- popup css -->
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

table thead tr:nth-child(1) {
    background-color: rgba(144, 144, 144, 0.075);
}

table tbody tr:nth-child(2n + 1) {
    
     background-color: white;
}
/* 팝업 table hover */
#txTBody>tr:HOVER, 
#rxBody>tr:HOVER, 
#jindanTBody>tr:HOVER, 
#jindanAddTBody>tr:HOVER,
#totalTBody>tr>.hoverTd:HOVER	{
	cursor:pointer;
	background-color: #EAEAEA;
}
.panel-primary > .panel-heading {
    color: #fff;
    background-color: #e74c3c;
    border-color: #e74c3c;
}
.btn-primary {
    color: #170a0a;
    background-color: #dceefd;
    border-color: #e6eaef;
}
 .btn-primary:hover { 
 	color: #fff; 
    background-color: #6fb9f7; 
    border-color: #6fb9f7;
 } 
.btn-success {
    color: #0f0f0f;
    background-color: #aae9aa;
    border-color: #bceebc;
}
.btn-info {
    color: #251010;
    background-color: #ffa49b;
    border-color: #ebc1c1;
}
.btn-danger {
    color: #0d0909;
    background-color: #fbf7ad;
    border-color: #efe6a2;
}
.btn-info:hover {
    color: #fff;
    background-color: #ff7b7b;
    border-color: #ff7b7b;
}
.btn-warning {
    color: #150e0e;
    background-color: rgb(251, 211, 107);
    border-color: #febf67;
}
</style>


<!-- datepicker css -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
	
	
	$("#datepicker").datepicker({
// 		showOn : 'text',
		dateFormat : 'yymmdd',
		showButtonPanel : true,
		currentText : '오늘',
		dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		closeText : '닫기',
		monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	});
	
	// 진단명 검색(엔터)
	$('#jindanSearchWord').keypress(function( event ) {
		if ( event.which == 13 ) {
			if($(this).val()=='') {
				
				alert('검색어를 입력하세요');
				return false;
			}
			var searchWord = $(this).val();

			$.ajax({
				url : "/jinryo/jindan.dodam",
				type : 'get',
				data : {
					"word" : searchWord
				},
				dataType : "json",
				success : function(data){
					
					var inputText = '';
					$('#jindanTBody').text('');
					for(var i=0; i<data.length; i++){
						
						$('#jindanTBody').append(''+
							'<tr id="jindanNum'+data[i].DI_NUM+'" onclick="javascript:jindanAdd(this)">'+
								'<td>'+data[i].DI_NAME+'</td>'+
								'<td>'+data[i].DI_ANIMALTYPE+'</td>'+
							'</tr>'+
						'');
					}		//End for()
				}		//End success()
			});	//End $.ajax()
		}		//	End if ( event.which == 13 )
	});	// End 진단명 검색(엔터)
});	// End $(function())

//	추가된 진단 클릭시 List에서 제거
function jindanRemove(thisRow){
	
	$(thisRow).remove();
}

//진단 선택시 하단에 추가
function jindanAdd(thisRow){
	
	var $addedJindanTr = [];
	$addedJindanTr = $('#jindanAddTBody>tr');
	
	if($addedJindanTr.length==0){
		
		$('#jindanAddTBody').append(''+
			'<tr id="'+$(thisRow).attr('id')+'" onclick="javascript:jindanRemove(this)">'+
				'<td>'+$(thisRow).find('td:eq(0)').text()+'</td>'+
				'<td>'+$(thisRow).find('td:eq(1)').text()+'</td>'+
			'</tr>'+
		'');
	}else{
		var existBoolean = true;
		for(var i =0; i<$addedJindanTr.length;i++){
			if($($addedJindanTr[i]).prop('id')==$(thisRow).prop('id')){
				
				alert('이미 추가된 진단 입니다.');
				existBoolean = false;
			}
		}
		if(existBoolean){
			
			$('#jindanAddTBody').append(''+
				'<tr id="'+$(thisRow).attr('id')+'" onclick="javascript:jindanRemove(this)">'+
					'<td>'+$(thisRow).find('td:eq(0)').text()+'</td>'+
					'<td>'+$(thisRow).find('td:eq(1)').text()+'</td>'+
				'</tr>'+
			'');
		}
	}
}
</script>

<!-- popup js -->
<script src="/js/jquery.popitup.js"></script>
<script>

//선택한 버튼에 해당하는 popup open
function popupOpen(divId) {
	
	
	var popupWidth;
	
	if(divId=='addJinryoPopup'){
		
		$('#'+divId).css('height','15%');
		popupWidth=window.innerWidth*0.2+'';
	}else if(divId=='vitalPopup'){
		
		$('#'+divId).css('height','60%');
		popupWidth=window.innerWidth*0.3+'';
	}else{
		
		popupWidth=window.innerWidth*0.8+'';
	}	
	
	$('#'+divId).popitup({
		widthSet : popupWidth,
		chase : false,
		animation : 'slideDown',
		onCloseModal   :  function(){
			//닫을때(x)
		}
	});
	//등록 버튼 눌를때 데이터 어케 담고 있을꺼?
	if(divId=='monjinPopup'){
		
		$('#'+divId+'Menu').text('');
		$('#'+divId+'Menu').append('<iframe src="/jinryo/treeMenu/monjin.dodam" width="100%" height="90%" style="padding-top: 15px;"></iframe>');
	}else if(divId=='cccbPopup'){
		
		$('#'+divId+'Menu1').text('');
		$('#'+divId+'Menu1').append('<iframe src="/jinryo/treeMenu/cccbPopup.dodam?type=Tx" width="100%" height="90%" style=""></iframe>');
		
		$.ajax({
			url : "/jinryo/rxList.dodam",
			type : 'get',
			dataType : "json",
			success : function(data){
				
				var inputText = '';
				$('#rxBody').text('');
				for(var i=0; i<data.length; i++){
					
					$('#rxBody').append(''+
						'<tr id="rx'+data[i].STOCK_NAME+'" name="RxRow" onclick="javascript:addTxTr(this, '+data[i].GOODS_PRICE_OUT+')">'+
							'<td>'+data[i].STOCK_NAME+'</td>'+
							'<td>'+data[i].MEDI_COMPONENTKOR+'</td>'+
							'<td>'+data[i].MEDI_COMPONENTENG+'</td>'+
							'<td>'+data[i].STOCK_COUNT+'</td>'+
							'<td>'+data[i].GOODS_PRICE_OUT+'</td>'+
						'</tr>'+
					'');
				}
			}
		});
	}
}

// 처치/처방 선택시 하단에 추가
function addTxTr(selectedRow, trPrice){	// selectedRow : 선택한 <tr>, trPrice Rx의 경우 price를 넘김
	
	// 추가된 Tx, Rx 의 총합계변수
	var txrxTotalPrice = parseInt($('#txrxTotalPrice').text());
	
	var name = '';
	var price = '';
	if($(selectedRow).attr('name')=='TxRow'){	//Tx
		
		
		name= $(selectedRow).find('td:eq(0)').text();
		price= $(selectedRow).find('td:eq(1)').text();
	}else if($(selectedRow).attr('name')=='RxRow'){	//Rx
		
		name = $(selectedRow).find('td:eq(0)').text();
		price = trPrice;
	}
	
	//추가된 총 금액
	txrxTotalPrice+=parseInt(price);
	
	
	
	// 이미 추가된 처치/처방 인지 검사
	var addedBoolean=true;
	var $totalTBodyTr=$('#totalTBody>tr');
	for(var i=0;i<$totalTBodyTr.length;i++){
		
		if($($totalTBodyTr[i]).attr('name')==name){
		
			alert('이미 추가되어있습니다');
			addedBoolean=false;
		}
	}
	
	
	
	if(addedBoolean){
		
		var optionText='';
		for(var i=0; i<10;i++){
			optionText+='<option value="'+(i+1)+'">'+(i+1)+'</option>';
		}
		$('#totalTBody').append(''+
				'<tr id="'+$(selectedRow).attr('id')+'" name="'+name+'">'+
					'<td class="hoverTd" onclick="javascript:txrxRowRemove(this)">'+name+'</td>'+
					'<td><select name="noRemoveRow">'+optionText+'</select></td>'+
					'<td><select name="noRemoveRow">'+optionText+'</select></td>'+
					'<td name="xprice">'+price+'</td>'+
				'</tr>'+
		'');
		txrxTotalPriceRefresh();
		
	}
}

function txrxTotalPriceRefresh(){
	
	var txrxTotalPrice=0;
	
	var $totalTBodyTr=$('#totalTBody>tr');
	for(var i=0;i<$totalTBodyTr.length;i++){
		
		txrxTotalPrice+=parseInt($($totalTBodyTr[i]).children('td[name="xprice"]').text());
	}
	$('#txrxTotalPrice').text(txrxTotalPrice);
}

// 이미 똑같은게 있지만 시간관계상 또 만듬..
function txrxRowRemove(thisTd){
	
	$(thisTd).parent().remove();
	txrxTotalPriceRefresh();
}
function fileUpload(){
	
	$('#jinryoImages').click();
}

//	문진표에서 'Ok' 버튼시 해당 문진의 입력된 값을 
//ajax로 Session에 저장하기위해 
//json형식으로 처리하는 과정
function setInputValuesSession(bigPlusMid, radioNameArray){	//bigPlusMid : 현재문진의 대메뉴+중메뉴
																									//radioNameArray : 라디오형식 질문의 Num
	
	var saveArray = new Array();
	
	//-------------------input text 값들 저장----------------------------------
	var allSmInputText = $('.smInputText');
	allSmInputText.each(function(){
		
		saveArray[$(this).attr('name')] = $(this).val();
	});
	
	
	//-------------------input radio 값들 저장----------------------------------
	//라디오 버튼의 name값을 담을 변수입니다
	var allSmInputRadio=[];
	
	if (radioNameArray.length==0){ //문진중 라디오버튼이 하나도 없을경우
		
	}else {	
		
		allSmInputRadio=radioNameArray.split(',');
	}
	
	for(var i=0; i<allSmInputRadio.length; i++){
		var checkedVal = $("input[name="+allSmInputRadio[i]+"]:checked").val();
		if(typeof checkedVal === "string") {
			
			saveArray[allSmInputRadio[i]] = checkedVal;
		}
	}
	
	//-------------------json, ajax----------------------------------
	var menuNameAndData = {
			"categoryName" : bigPlusMid,
			"data" : saveArray
	}
	$.ajax({
		url : "/jinryo/monjinSessionSave.dodam",
		type : 'post',
		data : JSON.stringify(menuNameAndData),
		dataType : "text",
		success : function(data){
			alert(data);	// "저장 완료"
			$('#monjinSaveMenus').val($('#monjinSaveMenus').val()+bigPlusMid+'//');
			
		}
	});
}	//End 문진표 'Ok'

// 세션에 해당 문진이 있을경우 값 뿌려줌
function getInputValuesSession(bigAndMid){
	
	//	대메뉴+중메뉴		
	//	ex)대메뉴-이비인후과 중메뉴-귀/피부
	//	bigAndMid = 이비인후과귀/피부
	var bigAndMidJson = {
			"bigAndMid" : bigAndMid
	}
	
	//	세션에 bigAndMid 값에 해당하는 key값이 있는지 찾아본다
	$.ajax({
		url : "/jinryo/monjinSessionLoad.dodam",
		type : 'post',
		data : JSON.stringify(bigAndMidJson),
		dataType : "text",
		success : function(data){	// 세션에 bigAndMid값에 해당하는 key값이 있을경우 value 적용해주기
			
			var sessionData;
			if(data!='isNull'){
				sessionData=JSON.parse(data);
				for(var i =0; i<sessionData.length; i++){
					if(sessionData[i]=='y' || sessionData[i]=='n'){
						
						$("input[name="+i+"]:input[value="+sessionData[i]+"]").attr("checked", true);
					}else $("input[name="+i+"]").val(sessionData[i]);
				}
			}
		},
		error:function(request, status,error){
 			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  		} 
	});
}	// End getInputValuesSession()
</script>

<div class="body" style="padding-top: 5%;">

	<!-- Begin  컨테이너-->
	<div class="container">
		<!-- Begin 길이지정 -->
		<div class="col-md-12">
			<!-- Begin 패널 -->
			<div class="panel panel-primary">
			
				<!-- Begin header -->
				<div class="panel-heading">
					<h3 class="panel-title">
						<span class="glyphicon glyphicon-bookmark"></span> 진료 차트
					</h3>
				</div>
				<!-- End header -->
				
				<!-- Begin 버튼그룹 -->
				<div class="panel-body">
					
					<!-- Begin 버튼 윗줄 -->
					<div class="row">
						<div class="col-xs-12 col-md-12">
							<a href="javascript:popupOpen('monjinPopup')" class="btn btn-default btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-list-alt"></span> <br />문진표</a> 
							<a href="javascript:popupOpen('symptomPopup')" class="btn btn-primary btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-bookmark"></span> <br />증상</a> 
							<a href="javascript:popupOpen('diagnosisPopup')" class="btn btn-success btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-signal"></span> <br />진단명</a> 
							<a href="javascript:popupOpen('cccbPopup')" class="btn btn-info btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-comment"></span> <br />처치/처방</a> 
							<a href="javascript:popupOpen('addJinryoPopup')" class="btn btn-danger btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-comment"></span> <br />추가 진료</a>
						</div>
					</div>
					<!-- End 버튼 윗줄 -->
					
					<br/>
					
					<!-- Begin 버튼 아랫줄 -->
					<div class="row">
						<div class="col-xs-12 col-md-12">
							<a href="javascript:popupOpen('vitalPopup')" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-file"></span> <br />바이탈</a>
							<a href="javascript:fileUpload()" class="btn btn-warning btn-lg" role="button" style="width : 77%;">&nbsp;
								<span class="glyphicon glyphicon-user"></span><br />혈액검사, X-ray, CT, 심전도검사
							</a> 
						</div>
					</div>
					<!-- End 버튼 아랫줄 -->
					
					<br/>
					<a href="javascript:chartSave()" class="btn btn-success btn-lg btn-block" role="button"><span class="glyphicon glyphicon-globe"></span>진료완료</a>
				</div>
				<!-- End 버튼그룹 -->
			</div>
			<!-- End 패널 -->
		</div>
		<!-- End 길이지정 -->
	</div>
	<!-- End  컨테이너-->
	
	<!-- Begin 문진팝업 -->
	<div id="monjinPopup" class="popit-wrapper popit-wrapper-chase" style=" left: 0px; opacity: 0;">
		
		<!-- Begin 왼쪽 문진메뉴 div -->
		<div class="popit-content" style="border-right: 1px solid #ccc; width:30%; height:100%; float: left; padding-top:2.8%">
			<div class="popit-header">
				<h4 class="popit-title">분류</h4>
			</div>
			<!-- 질문 iframe (script에서 추가)-->
			<div id="monjinPopupMenu"></div>
		</div>
		<!-- End 왼쪽 문진메뉴 div-->
		
		<!-- Begin 오른쪽 질문 내용 div-->
		<div class="popit-content" style="border-bottom: 1px solid #ccc; width:70%; height:80%; float: left;">
		
			<!-- Begin header -->
			<div class="popit-header"><h4 class="popit-title">질문</h4></div>
			<!-- End header -->
			
			<!-- 질문 (카테고리 클릭하면 append 됩니당)-->
			<div id="questionDiv" class="popit-body" id="bodycontainer" style="overflow:scroll; width: 100%; height: 94%"></div>
			
		</div>
		<!-- End 오른쪽 질문 내용 div -->
		
		<!-- Begin 아랫쪽 버튼 -->
		<div class="popit-content" style=" width:70%; height:15%; float: right;">
			<div class="popit-footer" style="float: right">
				<button type="button" class="btn btn-default popitup-close">취소</button>
				<!-- 저장시 팝업 div id 넘겨주기 -->
				<button onclick="javascript:popupSave('monjinPopup')" type="button" class="btn btn-primary popitup-register">저장</button>
			</div>
		</div>
		<!-- End 아랫쪽 버튼 -->
		
	</div>
	<!-- End 문진팝업 -->
	
	<!-- Begin 증상팝업 -->
	<div id="symptomPopup" class="popit-wrapper popit-wrapper-chase" style="left: 0px; opacity: 0;">
		
		<!-- Begin 닫기 버튼 -->
		<div class="popit-content" style=" width:70%; height:5%; float: right;">
			<button id="popupCloseBtn" type="button" class="popitup-close close">
				<span class="glyphicon glyphicon-remove-circle"></span>
			</button>
		</div>
		<!-- End 닫기 버튼 -->
		
		<!-- Begin 오른쪽 증상 div-->
		<div class="popit-content" style="border-bottom: 1px solid #ccc; width:100%; height:90%;">
		
			<!-- Begin header -->
<!-- 			<div class="popit-header"><h4 class="popit-title">증상</h4></div> -->
			<!-- End header -->
			
			<!-- Begin 증상-->
			<div class="popit-body" id="" style="width: 100%; height: 90%;">
				<div class="content-wrapper">
					<h1>증상을 입력하세요.</h1>
				</div>
				<div class="content-wrapper">
					<textarea id="symptomValue" name="symptomValue" rows="" cols="" style="width: 90%; height: 90%; font-size: 20px;" ></textarea>
				</div>
			</div>
			<!-- End 증상-->
			
		</div>
		<!-- End 오른쪽 증상 div -->
		
		<!-- Begin 아랫쪽 버튼 -->
		<div class="popit-content" style=" width:70%; height:10%; float: right;">
			<div class="popit-footer" style="float: right">
				<button type="button" class="btn btn-default popitup-close">취소</button>
				<!-- 저장시 팝업 div id 넘겨주기 -->
				<button onclick="javascript:popupSave('symptomPopup')" type="button" class="btn btn-primary popitup-register">저장</button>
			</div>
		</div>
		<!-- End 아랫쪽 버튼 -->
		
	</div>
	<!-- End 증상팝업 -->
	
	<!-- Begin 진단팝업 -->
	<div id="diagnosisPopup" class="popit-wrapper popit-wrapper-chase" style="left: 0px; opacity: 0;">
		
				<div class="popit-content" style="border: 1px solid #ccc; width:100%; height:10%; clear: both; background: #FF6C6C">
<!-- 					<div class="popit-header"> -->
						<h2 class="popit-title" style="color: white; font-style: italic;">진단</h2>
<!-- 					</div>				 -->
				</div>		
		
		
		<!-- Begin 진단윗쪽 div -->

		<div class="popit-content" style="border: 1px solid #ccc; width:100%; height:40%; clear: both;">
			<div class="popit-header">
				<h4 class="popit-title">진단 내용 검색<input type="text" id="jindanSearchWord" name="jindanSearchWord" /></h4>
			</div>
			<div style="width:100%; height:88%; overflow:scroll;">
				<table>
					<thead>
						<tr style="background: #FFCA6C">
							<td>진단명(영문)</td>
							<td>종</td>
						</tr>
					</thead>
					<tbody id="jindanTBody"></tbody>
				</table>
			</div>
		</div>
		<!-- End 진단윗쪽 div-->
		
		<!-- Begin 진단아랫쪽 div-->
		<div class="popit-content" style="border: 1px solid #ccc; width:100%; height:40%;">
		
			<!-- Begin header -->
			<div class="popit-header" >
				<h4 class="popit-title" >
					진단명 직접입력<input type="text"/>
					<select>
						<option>확정진단</option>
						<option>예상진단</option>
					</select>
				</h4>
			</div>
			<!-- End header -->
			
			<!-- Begin -->
			<div style="width:100%; height:76%; overflow:scroll">
				<table>
					<thead>
						<tr style="background: #FFCA6C">
							<td>진단명(영문)</td>
							<td>종</td>
						</tr>
					</thead>
					<tbody id="jindanAddTBody"></tbody>
				</table>
			</div>
			<!-- End -->
			
		</div>
		<!-- End 진단아랫쪽 div -->
		
		<!-- Begin 아랫쪽 버튼 -->
		<div class="popit-content" style=" width:70%; height:15%; float: right;">
			<div class="popit-footer" style="float: right">
				<button type="button" class="btn btn-default popitup-close">취소</button>
				<!-- 저장시 팝업 div id 넘겨주기 -->
				<button onclick="javascript:popupSave('diagnosisPopup')" type="button" class="btn btn-primary popitup-register">저장</button>
			</div>
		</div>
		<!-- End 아랫쪽 버튼 -->
		
	</div>
	<!-- End 진단팝업 -->
	
	<!-- Begin Tx/Rx 팝업 -->
	<div id="cccbPopup" class="popit-wrapper popit-wrapper-chase" style="left: 0px; opacity: 0;">
		
		<!-- Begin 닫기 버튼 -->
		<div class="popit-content" style=" width:70%; height:5%; float: right;">
			<button id="popupCloseBtn" type="button" class="popitup-close close">
				<span class="glyphicon glyphicon-remove-circle"></span>
			</button>
		</div>
		<!-- End 닫기 버튼 -->
		
		<!-- Begin 진단 위왼쪽(Tx) div -->
		<div class="popit-content" style="border: 1px solid #ccc; width:50%; height:40%; clear: both; float: left;">
			<div class="popit-header" style="height: 10%; background: #FFD8D8;">
				<h4 class="popit-title" style="margin-top: 0; margin-bottom: 0;">Tx</h4>
			</div>
			
			<div id="cccbPopupMenu1" style="width: 20%; height:90%; float: left;"></div>
			
			<div style="width: 80%; height:90%; float: left;">
				<table>
					<thead>
						<tr>
							<td>처치명</td>
							<td>금액</td>
						</tr>
					</thead>
					<tbody id="txTBody">
					</tbody>
				</table>
			</div>
		</div>
		<!-- End 진단 위왼쪽(Tx) div-->
		
		<!-- Begin 진단 위오른쪽(Rx) div-->
		<div class="popit-content" style="border: 1px solid #ccc; width:50%; height:40%; float: left;">
			<div class="popit-header" style="height: 10%; background: #FFD8D8;">
				<h4 class="popit-title" style="margin-top: 0; margin-bottom: 0;">Rx</h4>
			</div>
			<div style="width: 100%; height:90%; overflow:scroll;">
				<table>
					<thead>
						<tr>
							<td style="width: 25%">상품명</td>
							<td style="width: 30%">성분명(한글)</td>
							<td style="width: 30%">성분명(영어)</td>
							<td style="width: 7%">재고</td>
							<td style="width: 8%">곰액</td>
						</tr>
					</thead>
					<tbody id="rxBody">
					</tbody>
				</table>
			</div>
		</div>
		<!-- End 진단 위오른쪽(Rx) div -->
		
		<!-- Begin 진단 아랫쪽(처치처방된 리스트) div -->
		<div class="popit-content" style="border: 1px solid #ccc; width:100%; height:45%; clear: both; ">
		
			<!-- Begin header -->
			<div class="popit-header" style=" background:#FFD8D8; height: 10%;">
				<h4 class="popit-title" style="margin-top: 0; margin-bottom: 0;" >처치/처방 List</h4>
			</div>
			<div style="float: right;">
				<input type="button" value="추가">
				<input type="button" value="삭제">
			</div>
			
			<!-- End header -->
			
			<!-- Begin -->
			<div style="width:100%; height:80%; overflow:scroll;">
				<table class="table-bordered table-hover">
					<thead>
						<tr>
							<td width="50%">이름</td>
							<td width="20%">단위 (회)</td>
							<td width="20%">투여 (일)</td>
							<td width="10%">금액</td>
						</tr>
					</thead>
					<tbody id="totalTBody">
					</tbody>
				</table>
			</div>
			<!-- End -->
			
		</div>
		<!-- End  진단 아랫쪽(처치처방된 리스트) div -->		
		<div style="width: 100%; height:5%;">
			<h2 style="margin-top: 0; margin-bottom: 0; float: right;">총 금액:<span id="txrxTotalPrice">0</span></h2>
		</div>
		
		<!-- Begin 아랫쪽 버튼 -->
		<div class="popit-content" style=" width:70%; height:5%; float: right;">
			<div class="popit-footer" style="float: right">
				<button type="button" class="btn btn-default popitup-close">취소</button>
				<!-- 저장시 팝업 div id 넘겨주기 -->
				<button onclick="javascript:popupSave('cccbPopup')" type="button" class="btn btn-primary popitup-register">저장</button>
			</div>
		</div>
		<!-- End 아랫쪽 버튼 -->
		
	</div>
	<!-- End Tx/Rx팝업 -->
	
	<!-- Begin 추가 진료 팝업 -->
	<div id="addJinryoPopup" class="popit-wrapper popit-wrapper-chase" style=" left: 0px; opacity: 0;">
		
		<!-- Begin 닫기 버튼 -->
		<div class="popit-content" style=" width:70%; float: right;">
			<button id="popupCloseBtn" type="button" class="popitup-close close">
				<span class="glyphicon glyphicon-remove-circle"></span>
			</button>
		</div>
		<!-- End 닫기 버튼 -->
		
		<!-- Begin -->
		<div class="popit-content" style="margin-left:auto; margin-right:auto;  width:50%; clear: both;">
			<div class="popit-header" style="">
				<h4 class="popit-title" style="margin-top: 0; margin-bottom: 0;">추가진료 날짜 선택</h4>
			</div>
			<div style="">
				<input name="addJinryoValue" id="datepicker" type="text"/>
			</div>
		</div>
		<!-- End -->
		
		<!-- Begin 아랫쪽 버튼 -->
		<div class="popit-content" style=" width:70%;  float: right;">
			<div class="popit-footer" style="float: right">
				<button type="button" class="btn btn-default popitup-close">취소</button>
				<!-- 저장시 팝업 div id 넘겨주기 -->
				<button onclick="javascript:popupSave('addJinryoPopup')" type="button" class="btn btn-primary popitup-register">저장</button>
			</div>
		</div>
		<!-- End 아랫쪽 버튼 -->
		
	</div>
	<!-- End 추가 진료 팝업 -->
	
	
	<!-- Begin 바이탈 팝업 -->
	<div id="vitalPopup" class="popit-wrapper popit-wrapper-chase" style=" left: 0px; opacity: 0;">
		
		<!-- Begin 닫기 버튼 -->
		<div class="popit-content" style=" width:70%; float: right;">
			<button id="popupCloseBtn" type="button" class="popitup-close close">
				<span class="glyphicon glyphicon-remove-circle"></span>
			</button>
		</div>
		<!-- End 닫기 버튼 -->
		
		<!-- Begin 오른쪽 증상 div-->
		<div class="popit-content" style="border-bottom: 1px solid #ccc; width:100%; ">
		
			<!-- Begin header -->
<!-- 			<div class="popit-header"><h4 class="popit-title">증상</h4></div> -->
			<!-- End header -->
			
			<!-- Begin 증상-->
			<div class="popit-body" id="" style="width: 100%; height: 90%;">
				<div class="content-wrapper">
					<h1>바이탈</h1>
				</div>
				<div class="content-wrapper">
					<br/><br/>
					몸무게<input type="text" id="vt_weight" name=""/><br/><br/>
					체온<input type="text" id="vt_temperature" name=""/><br/><br/>
					수축기혈압<input type="text" id="vt_systolic_blood" name=""/><br/><br/>
					이완기혈압<input type="text" id="vt_diastolic_blood" name=""/><br/><br/>
					심박수<input type="text" id="vt_heart_rate" name=""/><br/><br/>
					호흡수<input type="text" id="vt_breathing_rate" name=""/><br/><br/>
				</div>
			</div>
			<!-- End 증상-->
			
		</div>
		<!-- End 오른쪽 증상 div -->
		
		<!-- Begin 아랫쪽 버튼 -->
		<div class="popit-content" style=" width:70%; height:10%; float: right;">
			<div class="popit-footer" style="float: right">
				<button type="button" class="btn btn-default popitup-close">취소</button>
				<!-- 저장시 팝업 div id 넘겨주기 -->
				<button onclick="javascript:popupSave('vitalPopup')" type="button" class="btn btn-primary popitup-register">저장</button>
			</div>
		</div>
		<!-- End 아랫쪽 버튼 -->
		
	</div>
	<!-- End 바이탈 팝업 -->
	
	<form id="jinroyForm" name="jinroyForm" method="post" action="/jinryo/chartInsert.dodam" enctype="multipart/form-data">
		<input type="hidden" id="per_id" name="per_id" value="test">
		<input type="hidden" id="animal_num" name="animal_num" value="59">
		<input type="hidden" id="jryo_diseases" name="jryo_diseases" value="jryo_diseases">
		<input type="hidden" id="symptom" name="symptom" value="symptom">
		<input type="hidden" id="jryo_tx" name="jryo_tx" value="jryo_tx">
		<input type="hidden" id="jryo_rx" name="jryo_rx" value="jryo_rx">
		<input type="hidden" id="jryo_memo" name="jryo_memo" value="jryo_memo">
		<input type="hidden" id="jryo_price" name="jryo_price" value="jryo_price">
		<input type="hidden" id="monjinSaveMenus" name="monjinSaveMenus" value="">
		<input id="jinryoImages" name="jinryoImages" type="file" style="display: none;" multiple="multiple">
		
		<!-- 바이탈 -->
							<input type="hidden" id="" name="vt_weight"/><br/><br/>
					<input type="hidden" id="" name="vt_temperature"/><br/><br/>
					<input type="hidden" id="" name="vt_systolic_blood"/><br/><br/>
					<input type="hidden" id="" name="vt_diastolic_blood"/><br/><br/>
					<input type="hidden" id="" name="vt_heart_rate"/><br/><br/>
					<input type="hidden" id="" name="vt_breathing_rate"/><br/><br/>
	</form>
</div>
<script>
// 팝업에서 '저장'
function popupSave(divId){
	
// 	alert('divId : '+divId);
	if(divId=='symptomPopup') {
		
		$('#symptom').val($('#symptomValue').val());
	}else if(divId=='addJinryoPopup'){
		
		$('#jryo_memo').val($('input[name=addJinryoValue]').val());
	}else if(divId=='diagnosisPopup'){
		
		var addedTxRxValue='';
		$('#jindanAddTBody>tr').each(function(index){
			
			addedTxRxValue+=$(this).children().first().text()+'/ ';
		});
		
		$('#jryo_diseases').val(addedTxRxValue);
	}else if(divId=='cccbPopup'){
		
		var txList='';
		var rxList='';
		$('#totalTBody>tr').each(function(){
			
			
			if($(this).attr('id').match('tx')=='tx'){
				
				txList+=$(this).attr('id').split('tx')[1]+'/';
			}else if($(this).attr('id').match('rx')=='rx'){
				
				rxList+=$(this).attr('id').split('rx')[1]+'/';
			}
		});
		
		$('#jryo_tx').val(txList);
		$('#jryo_rx').val(rxList);
		
		$('#jryo_price').val($('#txrxTotalPrice').text());
	}else if(divId=='vitalPopup'){
		
		$('input[name=vt_weight]').val($('#vt_weight').val());
		$('input[name=vt_temperature]').val($('#vt_temperature').val());
		$('input[name=vt_systolic_blood]').val($('#vt_systolic_blood').val());
		$('input[name=vt_diastolic_blood]').val($('#vt_diastolic_blood').val());
		$('input[name=vt_heart_rate]').val($('#vt_heart_rate').val());
		$('input[name=vt_breathing_rate]').val($('#vt_breathing_rate').val());
	}
}
function chartSave(){
	
	$('#jinroyForm').submit();
}
</script>
<!-- End body -->