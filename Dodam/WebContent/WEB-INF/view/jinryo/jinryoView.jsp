<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="/css/jinryo/jinryoView/bootstrap.css" rel="stylesheet" />
<style>
/* Begin div 테두리 */
 .divBorder, .jinryoUl>li{
    position: relative;
    background-color: #fff;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
    border: 1px solid #999;
    border-radius: 6px;
    outline: 0;
    -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
    box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
}
			
.jinryoUl>li:HOVER {
	background: #F6F6F6;
}
/* End div 테두리 */

/* 테이블 */
table tbody tr {
    border-color: white;
}
</style>
<script type="text/javascript">

function goChartForm(){
	
	$(location).attr('href', '/jinryo/chartForm.dodam');
}

$(document).ready(function(){
	
	$('#readyListDiv li').each(function(){
		
		$(this).click(function(){
			
			var cnt = 0;
			
			var animal_num = $(this).find('input[name=animal_num]').val();
			$.ajax({
				url : "/jinryo/selectByAnimalNum.dodam",
				type : 'get',
				data : "animal_num=" + animal_num,
				dataType : "json",
				success : function(data){
					
					console.log(data);
					for(var i in data){
						
						 if (data.hasOwnProperty(i)) {
						        cnt++;
					    }
					}
					
					// 고객 정보
					$('#cusName').text(data[0].CUS_NAME);
					$('#aniName').text(data[0].ANIMAL_NAME);
					$('#aniBreed').text(data[0].ANIMAL_BREED);
					
					var text='';
					for(var i = 0; i<cnt; i++){

						text+=''+
						'<li style="width:95%; height: 10%; padding: 10px; margin-left: auto; margin-right: auto; margin-bottom: 10px;" onclick="javascript:goDetail('+data[i].JRYO_NUM+')" >'+
							'<div style="width:10%; height:100%; display: inline-block; overflow: hidden;">'+
								'<span>차트번호</span>'+
								'<h4  style="display: inline;">'+data[i].JRYO_NUM+'</h4>'+
							'</div>'+
							'<div style="width:20%; height:100%; display: inline-block; white-space: nowrap;  overflow: hidden;  text-overflow: ellipsis;  ">'+
								'<span>질병</span>'+
								'<h4  style="display: inline;">'+data[i].JRYO_DISEASES+'</h4>'+
							'</div>'+
						'<div style="width:20%; height:100%; display: inline-block; white-space: nowrap;  overflow: hidden;  text-overflow: ellipsis;">'+
							'<span>증상</span>'+
							'<h4  style="display: inline; text-overflow: ellipsis;">'+data[i].SYMPTOM+'</h4>'+
						'</div>'+
							'<div style="width:20%; height:100%; display: inline-block; overflow: hidden;">'+
								'<span>담당의</span>'+
								'<h4  style="display: inline;">'+data[i].PER_NAME+'</h4>'+
							'</div>'+
							'<div style="width:25%; height:100%; display: inline-block; overflow: hidden;">'+
								'<span>진료일자</span>'+
								'<h4  style="display: inline;">'+ajaxNumTransDateFormat(data[i].JRYO_DT)+'</h4>'+
							'</div>'+
						'</li>';
					}
					
					//	진료 내역
					$('#jinroyHistoryListUl').text('');
					$('#jinroyHistoryListUl').append(text);
				},
				 error:function(request, status,error){
		             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		         }
			});
		});
	});
});

//ajax 에서 받아온 data 값중 칼럼타입이 DATE인 놈의 값이 3121240 이런식으로 이상하게 받아올경우.
function ajaxNumTransDateFormat(num){
	
	var date = ("/Date("+num+")/").substr(6);
   	var currentTime = new Date(parseInt(date ));
   	var month = currentTime.getMonth() + 1;
   	var day = currentTime.getDate();
   	var year = currentTime.getFullYear();
   	var date = year+ "/" + month + "/" + day;
   	
  	return date;
}

function goDetail(chartNum){
	
	$('#jryo_num').val(chartNum);
	$('#viewForm').submit();
}
</script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<form id="viewForm" name="viewForm" action="/jinryo/detail.dodam" method="post">
<input type="hidden" id="jryo_num" name="jryo_num" value="" />
</form>
<div class="body" style="width: 100%; height: 100%; ">
	<br/>
	
	<!-- Begin 전체 내용 테두리 -->
	<div style=" width: 80%; height: 100%; margin-left: auto; margin-right: auto;">
	
		<!-- Begin 상단 차트생성 롱버튼 테두리-->
		<div style=" width: 100%; height: 5%;">
			<button type="button" class="btn btn-danger btn-block" onclick="javascript:goChartForm()">차트생성</button>
		</div>
		<!-- End 상단 차트생성 롱버튼 테두리-->
		
		<br/>
		<!-- Begin 고객정보, 이전 진료내역 전체테두리 -->
		<div style=" width: 78%; height: 95%; float:left;">
			
			<!-- Begin 고객정보 전체테두리 -->
			<div class="divBorder" style=" width: 100%; height: 20%;">
			
				<!-- Begin 내용 넓이 테두리 -->
				<div class="col-md-12">	
					
					<!-- Begin 고객 이미지 테두리 -->
					<div style="width: 20%; height:100%; float: left;  padding-top: 1%  ">
						<img class=" img-circle" src="/images/jinryo/dog01.jpg" alt="" width="70%" height="90%" />
					</div>
					<!-- End 고객 이미지정보 테두리 -->
					
					<!-- Begin 고객  정보 테두리-->
					<div style="width: 80%; height:100%; float: left; padding-top: 1%;">	
						<table style="width: 80%; margin-left: auto; margin-right: auto; background-color: white;">
							<tr style=" background-color: white;">
								<td>보호자명</td><td>환자명</td><td>품종</td>
							</tr>
							<tr>
								<td><h1 id="cusName"></h1></td><td><h1 id="aniName"></h1></td><td><h1 id="aniBreed"></h1></td>
							</tr>
						</table>
					</div>
					<!-- End 고객  정보 테두리-->
				</div>
				<!-- End 내용 넓이 테두리 -->
		    </div>
		    <!-- End 고객정보 전체테두리 -->
		    
		    <!-- 간격 맞추기위한 ...div -->
		    <div style="height: 3%"></div>
		    
		    <!-- 이전 진료내역 전체 테두리 -->
		    <div class="divBorder" style="  width: 100%; height: 77%;">


<ul id="jinroyHistoryListUl" class="jinryoUl" style="padding-top: 15px;">		    		
	<c:forEach var='infoJinryoHistory' items="${infoJinryoHistory}">  
		<li style="width:95%; height: 10%; padding: 10px; margin-left: auto; margin-right: auto; margin-bottom: 10px;" onclick="javascript:goDetail('${infoJinryoHistory.JRYO_NUM}+')" >
			<div style="width:10%; height:100%; display: inline-block; overflow: hidden;">
				<span>차트번호</span>
				<h4  style="display: inline;">${infoJinryoHistory.JRYO_NUM}</h4>
			</div>
			<div style="width:20%; height:100%; display: inline-block; white-space: nowrap;  overflow: hidden;  text-overflow: ellipsis;  ">
				<span>질병</span>
				<h4  style="display: inline;">${infoJinryoHistory.JRYO_DISEASES}</h4>
			</div>
			<div style="width:20%; height:100%; display: inline-block; white-space: nowrap;  overflow: hidden;  text-overflow: ellipsis;">
				<span>증상</span>
				<h4  style="display: inline; text-overflow: ellipsis;">${infoJinryoHistory.SYMPTOM}</h4>
			</div>
			<div style="width:20%; height:100%; display: inline-block; overflow: hidden;">
				<span>담당의</span>
				<h4  style="display: inline;">${infoJinryoHistory.PER_NAME}</h4>
			</div>
			<div style="width:25%; height:100%; display: inline-block; overflow: hidden;">
				<span>진료일자</span>
				<h4  style="display: inline;">${infoJinryoHistory.JRYO_DT}</h4>
			</div>
		</li>
	</c:forEach>		    		
</ul>

		    </div>
		</div>
		<!-- End 고객정보, 이전 진료내역 전체테두리 -->
		
		<!-- Begin 나의 대기환자 전체 테두리 -->
		<div class="divBorder" style=" width: 20%; height: 95%; float: right; ">
		
			<!-- 해더 -->
			<div style="width: 100%; height: 10%; border-bottom: 2px solid gray; background-color: #FF7171">
				<h2 style="margin-top: 0; padding-top:10px; ">나의 대기환자</h2>
			</div>
			
			<!-- 대기환자 리스트 -->
			<div style="width: 100%; height: 90%; " id="readyListDiv">
				<ul class="jinryoUl">
<!-- 					<li style="height: 10%; padding: 10px;" >치즈<input type="hidden" name="animal_num" value="59"/></li> -->
					<c:forEach var="aniInfo" items="${aniInfoList}">
						<li style="height: 10%; padding: 10px;" >${aniInfo.ANIMAL_NAME}<input type="hidden" name="animal_num" value="${aniInfo.ANIMAL_NUM}"/></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!-- End 나의 대기환자 전체 테두리 -->
	</div>
	<!-- End 전체 내용 테두리 -->
</div>
<!-- End body -->