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

</style>


<!-- datepicker css -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
	$("#datepicker").datepicker();
});
</script>

<!-- popup js -->
<script src="/js/jquery.popitup.js"></script>

<script>

//선택한 버튼에 해당하는 popup open
function popupOpen(divId) {
	//
	
	$('#'+divId).popitup({
		widthSet : window.innerWidth*0.8+'',	//팝업창 가로길이 (창 최대길이의 80%)
		chase : false,
		onCloseModal   :  function(){
			//닫을때 값
		}
	});
	
	
	
	//
	if(divId=='monjinPopup'){
		//한번 열리면 막기 해야함.
		$('#monjinMenuDiv').text('');
		$('#monjinMenuDiv').append('<iframe src="/jinryo/treeMenu/monjin.dodam?type='+divId+'" width="100%" height="90%" style="padding-top: 15px;"></iframe>');
		
		return false;
		
	}
}
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
							<a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-user"></span> <br />혈액검사</a> 
							<a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-file"></span> <br />바이탈</a> 
							<a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-picture"></span> <br />X-ray</a> 
							<a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-tag"></span> <br />CT결과</a> 
							<a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-tag"></span> <br />심전도 검사</a>
						</div>
					</div>
					<!-- End 버튼 아랫줄 -->
					
					<br/>
					<a href="#" class="btn btn-success btn-lg btn-block" role="button"><span class="glyphicon glyphicon-globe"></span>진료완료</a>
				</div>
				<!-- End 버튼그룹 -->
			</div>
			<!-- End 패널 -->
		</div>
		<!-- End 길이지정 -->
	</div>
	<!-- End  컨테이너-->
	
	<!-- Begin 문진팝업 -->
	<div id="monjinPopup" class="popit-wrapper popit-wrapper-chase" style="left: 0px; opacity: 0;">
		
		<!-- Begin 닫기 버튼 -->
		<div class="popit-content" style=" width:70%; height:5%; float: right;">
			<button id="popupCloseBtn" type="button" class="popitup-close close">
				<span class="glyphicon glyphicon-remove-circle"></span>
			</button>
		</div>
		<!-- End 닫기 버튼 -->
		
		<!-- Begin 왼쪽 문진메뉴 div -->
		<div class="popit-content" style="border-right: 1px solid #ccc; width:30%; height:100%; float: left; padding-top:2.8%">
			<div class="popit-header">
				<h4 class="popit-title">분류</h4>
			</div>
			<!-- 질문 iframe -->
			<div id="monjinMenuDiv">
<!-- 				<iframe src="/jinryo/monjinType.dodam" width="100%" height="90%" style="padding-top: 15px;"></iframe> -->
			</div>
		</div>
		<!-- End 왼쪽 문진메뉴 div-->
		
		<!-- Begin 오른쪽 질문 내용 div-->
		<div class="popit-content" style="border-bottom: 1px solid #ccc; width:70%; height:80%; float: left;">
		
			<!-- Begin header -->
			<div class="popit-header"><h4 class="popit-title">질문</h4></div>
			<!-- End header -->
			
			<!-- Begin 질문-->
			<div id="questionDiv" class="popit-body" id="bodycontainer" style="overflow:scroll; width: 100%; height: 94%">
				
				<div class="content-wrapper">
					<div>
						<label>가려움은?</label><input id="testInput" value="0" type="radio"/>
					</div>
				</div>
				
				<div class="content-wrapper">
					<div>
						<label>백신 접종은 몇사까지 되어있습니까?</label><select><option>1차</option><option>2차</option></select>
					</div>
				</div>
				
			</div>
			<!-- End 질문-->
			
		</div>
		<!-- End 오른쪽 질문 내용 div -->
		
		<!-- Begin 아랫쪽 버튼 -->
		<div class="popit-content" style=" width:70%; height:15%; float: right;">
			<div class="popit-footer" style="float: right">
				<button type="button" class="btn btn-default popitup-close">취소</button>
				<button type="button" class="btn btn-primary">등록</button>
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
		
		<!-- Begin 왼쪽 카테고리 div -->
		<div class="popit-content" style="border-right: 1px solid #ccc; width:30%; height:100%; float: left; padding-top:2.8%">
			<div class="popit-header">
				<h4 class="popit-title">category</h4>
			</div>
			<!-- 증상분류 iframe -->
<!-- 			<iframe src="/jinryo/monjinType.dodam" width="100%" height="90%" style="padding-top: 15px;"></iframe> -->
			
			
			
			
			
			
<!-- <div class="container" style="margin-top:30px;">
    <div class="row">
        <div class="col-md-4">
            <ul id="tree2">
                <li><a href="#">TECH</a>
                    <ul>
                        <li>Company Maintenance</li>
                        <li>Employees
                            <ul>
                                <li>Reports
                                    <ul>
                                        <li>Report1</li>
                                        <li>Report2</li>
                                        <li>Report3</li>
                                    </ul>
                                </li>
                                <li>Employee Maint.</li>
                            </ul>
                        </li>
                        <li>Human Resources</li>
                    </ul>
                </li>
                <li>XRP
                    <ul>
                        <li>Company Maintenance</li>
                        <li>Employees
                            <ul>
                                <li>Reports
                                    <ul>
                                        <li>Report1</li>
                                        <li>Report2</li>
                                        <li>Report3</li>
                                    </ul>
                                </li>
                                <li>Employee Maint.</li>
                            </ul>
                        </li>
                        <li>Human Resources</li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div> -->
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		</div>
		<!-- End 왼쪽 카테고리 div-->
		
		<!-- Begin 오른쪽 증상 div-->
		<div class="popit-content" style="border-bottom: 1px solid #ccc; width:70%; height:80%; float: left;">
		
			<!-- Begin header -->
			<div class="popit-header"><h4 class="popit-title">증상</h4></div>
			<!-- End header -->
			
			<!-- Begin 증상-->
			<div class="popit-body" id="bodycontainer">
				
				<div class="content-wrapper">
					<div>
						<input type="checkbox"/><label>난청,귀머거리</label>
					</div>
				</div>
				
				<div class="content-wrapper">
					<div>
						<input type="checkbox"/><label>귀의 진드기,기생충,기생충</label>
					</div>
				</div>
				
			</div>
			<!-- End 증상-->
			
		</div>
		<!-- End 오른쪽 증상 div -->
		
		<!-- Begin 아랫쪽 버튼 -->
		<div class="popit-content" style=" width:70%; height:15%; float: right;">
			<div class="popit-footer" style="float: right">
				<button type="button" class="btn btn-default popitup-close">취소</button>
				<button type="button" class="btn btn-primary">등록</button>
			</div>
		</div>
		<!-- End 아랫쪽 버튼 -->
		
	</div>
	<!-- End 증상팝업 -->
	
	<!-- Begin 진단팝업 -->
	<div id="diagnosisPopup" class="popit-wrapper popit-wrapper-chase" style="left: 0px; opacity: 0;">
		
		<!-- Begin 닫기 버튼 -->
		<div class="popit-content" style=" width:70%; height:5%; float: right;">
			<button id="popupCloseBtn" type="button" class="popitup-close close">
				<span class="glyphicon glyphicon-remove-circle"></span>
			</button>
		</div>
		<!-- End 닫기 버튼 -->
		
		<!-- Begin 진단윗쪽 div -->
		<div class="popit-content" style="border: 1px solid #ccc; width:100%; height:40%; clear: both;">
			<div class="popit-header">
				<h4 class="popit-title">진단 내용 검색<input type="text"/></h4>
			</div>
			<div>
				<table>
					<thead>
						<tr>
							<td>진단명(영문)</td>
							<td>진단명(한글)</td>
							<td>종</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Pateller luxation, medial, lateral, aplaisa</td>
							<td>슬개골 탈굴, 무형성증</td>
							<td>Canine, Feline</td>
						</tr>
						<tr>
							<td>Pateller trauma, fracture, ligament, tendon</td>
							<td>슬개골의 외상, 골절, 인대, 힘줄의 손상, 파열</td>
							<td>Canine, Feline</td>
						</tr>
					</tbody>
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
			<div style="float: right;">
				<input type="button" value="추가">
				<input type="button" value="삭제">
			</div>
			
			<!-- End header -->
			
			<!-- Begin -->
			<div>
				<table>
					<thead>
						<tr>
							<td>진단명(영문)</td>
							<td>진단명(한글)</td>
							<td>종</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Pateller luxation, medial, lateral, aplaisa</td>
							<td>슬개골 탈굴, 무형성증</td>
							<td>Canine, Feline</td>
						</tr>
						<tr>
							<td>Pateller trauma, fracture, ligament, tendon</td>
							<td>슬개골의 외상, 골절, 인대, 힘줄의 손상, 파열</td>
							<td>Canine, Feline</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- End -->
			
		</div>
		<!-- End 진단아랫쪽 div -->
		
		<!-- Begin 아랫쪽 버튼 -->
		<div class="popit-content" style=" width:70%; height:15%; float: right;">
			<div class="popit-footer" style="float: right">
				<button type="button" class="btn btn-default popitup-close">취소</button>
				<button type="button" class="btn btn-primary">등록</button>
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
			<div class="popit-header" style="height: 10%;">
				<h4 class="popit-title" style="margin-top: 0; margin-bottom: 0;">Tx</h4>
			</div>
			<div style="width: 20%; height:90%; float: left;">
<!-- 				<iframe src="/jinryo/monjinType.dodam" "></iframe> -->
			</div>
			<div style="width: 80%; height:90%; float: left;">
				<table>
					<thead>
						<tr>
							<td>처치명</td>
							<td>금액</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>BIle acid test(Pre&Post)</td>
							<td>100,000</td>
						</tr>
						<tr>
							<td>Biopsy-초음파유도</td>
							<td>80,000</td>
						</tr>
						<tr>
							<td>CT검사(10-20kg)</td>
							<td>500,000</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- End 진단 위왼쪽(Tx) div-->
		
		<!-- Begin 진단 위오른쪽(Rx) div-->
		<div class="popit-content" style="border: 1px solid #ccc; width:50%; height:40%; float: left;">
			<div class="popit-header" style="height: 10%;">
				<h4 class="popit-title" style="margin-top: 0; margin-bottom: 0;">Rx</h4>
			</div>
			<div style="width: 20%; height:90%; float: left;">
<!-- 				<iframe src="/jinryo/monjinType.dodam" "></iframe> -->
			</div>
			<div style="width: 80%; height:90%; float: left;">
				<table>
					<thead>
						<tr>
							<td>성분명</td>
							<td>상품명</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>?????????</td>
							<td>?????????</td>
						</tr>
						<tr>
							<td>?????????</td>
							<td>?????????</td>
						</tr>
						<tr>
							<td>?????????</td>
							<td>?????????</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- End 진단 위오른쪽(Rx) div -->
		
		<!-- Begin 진단 아랫쪽(처치처방된 리스트) div -->
		<div class="popit-content" style="border: 1px solid #ccc; width:100%; height:40%; clear: both;">
		
			<!-- Begin header -->
			<div class="popit-header" >
				<h4 class="popit-title" >처치/처방 List</h4>
			</div>
			<div style="float: right;">
				<input type="button" value="추가">
				<input type="button" value="삭제">
			</div>
			
			<!-- End header -->
			
			<!-- Begin -->
			<div>
				<table class="table-bordered table-hover">
					<thead>
						<tr>
							<td>이름</td>
							<td>단위</td>
							<td colspan="7" align="center">투여</td>
							<td>판매</td>
							<td colspan="3" align="center">합계</td>
						</tr>
					</thead>
					<tbody>
						<tr style="background-color: rgba(144, 144, 144, 0.075);">
							<td>Tx/Rx/Labs</td>
							<td>Unit</td>
							<td>Qty</td>
							<td>QtyT</td>
							<td>EA</td>
							<td>Dy</td>
							<td>Tt</td>
							<td>일</td>
							<td>Rt</td>
							<td>금액</td>
							<td>금액</td>
							<td>부가세</td>
							<td>합계금액</td>
						</tr>
						<tr>
							<td>진료비-재진</td>
							<td>회</td>
							<td>1</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>일</td>
							<td></td>
							<td>5,000</td>
							<td>5,000</td>
							<td>500</td>
							<td>5,500</td>
						</tr>
						<tr>
							<td>내복약</td>
							<td>회</td>
							<td>1</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>일</td>
							<td></td>
							<td>5,000</td>
							<td>5,000</td>
							<td>500</td>
							<td>5,500</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- End -->
			
		</div>
		<!-- End  진단 아랫쪽(처치처방된 리스트) div -->		
		
		<!-- Begin 아랫쪽 버튼 -->
		<div class="popit-content" style=" width:70%; height:15%; float: right;">
			<div class="popit-footer" style="float: right">
				<button type="button" class="btn btn-default popitup-close">취소</button>
				<button type="button" class="btn btn-primary">등록</button>
			</div>
		</div>
		<!-- End 아랫쪽 버튼 -->
		
	</div>
	<!-- End Tx/Rx팝업 -->
	
	<!-- Begin 추가 진료 팝업 -->
	<div id="addJinryoPopup" class="popit-wrapper popit-wrapper-chase" style="left: 0px; opacity: 0;">
		
		<!-- Begin 닫기 버튼 -->
		<div class="popit-content" style=" width:70%; height:5%; float: right;">
			<button id="popupCloseBtn" type="button" class="popitup-close close">
				<span class="glyphicon glyphicon-remove-circle"></span>
			</button>
		</div>
		<!-- End 닫기 버튼 -->
		
		<!-- Begin -->
		<div class="popit-content" style="margin-left:auto; margin-right:auto;  width:50%; height:40%; clear: both;">
			<div class="popit-header" style="height: 10%;">
				<h4 class="popit-title" style="margin-top: 0; margin-bottom: 0;">추가진료 날짜 선택</h4>
			</div>
			<div >
				<input id="datepicker" type="text"/>
			</div>
		</div>
		<!-- End -->
		
		<!-- Begin 아랫쪽 버튼 -->
		<div class="popit-content" style=" width:70%; height:15%; float: right;">
			<div class="popit-footer" style="float: right">
				<button type="button" class="btn btn-default popitup-close">취소</button>
				<button type="button" class="btn btn-primary">등록</button>
			</div>
		</div>
		<!-- End 아랫쪽 버튼 -->
		
	</div>
	<!-- End 추가 진료 팝업 -->
	
</div>
<!-- End body -->