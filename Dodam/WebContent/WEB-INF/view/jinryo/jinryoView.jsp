<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link href="/css/bootstrap.css" rel="stylesheet" />
<style>
.panel-body{
	padding: 0;
}

.infoList>li:hover, .wait-box:hover {
	background-color: #FAE0D4; 
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
				data : {"animal_num":animal_num},
				dataType : "json",
				success : function(data){
					
					for(var i in data){
						
						 if (data.hasOwnProperty(i)) {
						        cnt++;
					    }
					}
					var text='';
					for(var i = 0; i<cnt; i++){
						
						text+=''+
						'<li class="media">'+
							'<div class="media-body">'+
								'<div class="media">'+
									'<a class="pull-left" href="#">'+
										'<img class="media-object img-circle " src="/images/jinryo/dog01.jpg" width="70px" height="70px">'+
									'</a>'+
									'<div class="media-body">'+
										'<table class="table-condensed">'+
											'<tbody><tr>'+
												'<td><small class="text-muted">보호자명</small><br>'+data[i].CUS_NAME+'</td>'+
												'<td><small class="text-muted">환자명</small><br>'+data[i].ANIMAL_NAME+'</td>'+
												'<td><small class="text-muted">품종</small><br>'+data[i].ANIMAL_BREED+'</td>'+
												'<td><small class="text-muted">담당의</small><br>'+data[i].PER_NAME+'</td>'+
												'<td><small class="text-muted">차트번호</small><br>'+data[i].JRYO_NUM+'</td>'+
												'<td><small class="text-muted">등록일</small><br>'+data[i].JRYO_DT+'</td>'+
											'</tr>'+
										'</tbody></table>'+
									'</div>'+
								'</div>'+
							'</div>'+
						'</li>';
					}
					$('#chartHistoryListUl').text('');
					$('#chartHistoryListUl').append(text);
				},
				 error:function(request, status,error){
		             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		         }
			});
		});
	});
});

</script>


<div class="body" style="width: 100%; height: 100%;">
	
	<div class="container">
		<!-- top -->
		<div style="padding-top: 15px;">
			<button type="button" class="btn btn-danger btn-block" onclick="javascript:goChartForm()">차트생성</button>
		</div>
		<div class="row " style="padding-top: 40px;">
			<style>
		    .chartDiv, .panel-primary, .wait-box{
			    position: relative;
			    background-color: #fff;
			    -webkit-background-clip: padding-box;
			    background-clip: padding-box;
			    border: 1px solid #999;
/* 			    border: 1px solid rgba(248, 14, 14, 0.2); */
			    border-radius: 6px;
			    outline: 0;
			    -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
			    box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
			}
			</style>
			<div class="col-md-8">
				<div class="panel panel-info  chartDiv">
					<div class="panel-heading">Information</div>
					<div class="panel-body">
						<ul id="chartHistoryListUl" class="media-list infoList">
							<li class="media">

								<div class="media-body">

									<div class="media">
										<a class="pull-left" href="#">
											<img class="media-object img-circle " src="/images/jinryo/dog01.jpg" width="70px" height="70px">
										</a>
										<div class="media-body">
											<table class="table-condensed">
												<tr>
													<td><small class="text-muted">보호자명</small><br/>김예은</td>
													<td><small class="text-muted">환자명</small><br/>순돌이</td>
													<td><small class="text-muted">품종</small><br/>푸들</td>
													<td><small class="text-muted">담당의</small><br/>황선화</td>
													<td><small class="text-muted">차트번호</small><br/>2017061213</td>
													<td><small class="text-muted">등록일</small><br/>2017-06-12</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</li>
							<li class="media">

								<div class="media-body">

									<div class="media">
										<a class="pull-left" href="#">
											<img class="media-object img-circle " src="/images/jinryo/dog01.jpg" width="70px" height="70px">
										</a>
										<div class="media-body">
											<table class="table-condensed">
												<tr>
													<td><small class="text-muted">보호자명</small><br/>김예은</td>
													<td><small class="text-muted">환자명</small><br/>순돌이</td>
													<td><small class="text-muted">품종</small><br/>푸들</td>
													<td><small class="text-muted">담당의</small><br/>황선화</td>
													<td><small class="text-muted">차트번호</small><br/>2017061213</td>
													<td><small class="text-muted">등록일</small><br/>2017-06-12</td>
												</tr>
											</table>
										</div>
									</div>

								</div>
							</li><li class="media">

								<div class="media-body">

									<div class="media">
										<a class="pull-left" href="#">
											<img class="media-object img-circle " src="/images/jinryo/dog05.jpg" width="70px" height="70px">
										</a>
										<div class="media-body">
											<table class="table-condensed">
												<tr>
													<td><small class="text-muted">보호자명</small><br/>김우석</td>
													<td><small class="text-muted">환자명</small><br/>연이</td>
													<td><small class="text-muted">품종</small><br/>푸들</td>
													<td><small class="text-muted">담당의</small><br/>선민정</td>
													<td><small class="text-muted">차트번호</small><br/>2017061213</td>
													<td><small class="text-muted">등록일</small><br/>2017-06-12</td>
												</tr>
											</table>
										</div>
									</div>

								</div>
							</li><li class="media">

								<div class="media-body">

									<div class="media">
										<a class="pull-left" href="#">
											<img class="media-object img-circle " src="/images/jinryo/dog04.jpg" width="70px" height="70px">
										</a>
										<div class="media-body">
											<table class="table-condensed">
												<tr>
													<td><small class="text-muted">보호자명</small><br/>백선미</td>
													<td><small class="text-muted">환자명</small><br/>치즈</td>
													<td><small class="text-muted">품종</small><br/>고양이</td>
													<td><small class="text-muted">담당의</small><br/>김상덕</td>
													<td><small class="text-muted">차트번호</small><br/>2017061213</td>
													<td><small class="text-muted">등록일</small><br/>2017-06-12</td>
												</tr>
											</table>
										</div>
									</div>

								</div>
							</li><li class="media">

								<div class="media-body">

									<div class="media">
										<a class="pull-left" href="#">
											<img class="media-object img-circle " src="/images/jinryo/dog03.jpg" width="70px" height="70px">
										</a>
										<div class="media-body">
											<table class="table-condensed">
												<tr>
													<td><small class="text-muted">보호자명</small><br/>김예은</td>
													<td><small class="text-muted">환자명</small><br/>순돌이</td>
													<td><small class="text-muted">품종</small><br/>푸들</td>
													<td><small class="text-muted">담당의</small><br/>황선화</td>
													<td><small class="text-muted">차트번호</small><br/>2017061213</td>
													<td><small class="text-muted">등록일</small><br/>2017-06-12</td>
												</tr>
											</table>
										</div>
									</div>

								</div>
							</li><li class="media">

								<div class="media-body">

									<div class="media">
										<a class="pull-left" href="#">
											<img class="media-object img-circle " src="/images/jinryo/dog02.png" width="70px" height="70px">
										</a>
										<div class="media-body">
											<table class="table-condensed">
												<tr>
													<td><small class="text-muted">보호자명</small><br/>김예은</td>
													<td><small class="text-muted">환자명</small><br/>순돌이</td>
													<td><small class="text-muted">품종</small><br/>푸들</td>
													<td><small class="text-muted">담당의</small><br/>황선화</td>
													<td><small class="text-muted">차트번호</small><br/>2017061213</td>
													<td><small class="text-muted">등록일</small><br/>2017-06-12</td>
												</tr>
											</table>
										</div>
									</div>

								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-4" id="readyListDiv">
				<div class="panel panel-primary">
					<div class="panel-heading">Wait list</div>
					<div class="panel-body">
						<ul class="media-list">
							<li class="media">
								<div class="media-body">
									<div class="media">
										<div class="media-body" >
											<div class="wait-box" style="width: 98%; margin-top: 15px; margin-bottom: 15px;">
												<h3><small class="text-muted">담당의</small>&nbsp;황선화</h3>
												<h3><small class="text-muted">환자명</small>&nbsp;콩이</h3>
												<input type="hidden" name="animal_num" value="3"/>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="media">
								<div class="media-body">
									<div class="media">
										<div class="media-body" >
											<div class="wait-box" style="width: 98%; margin-top: 15px; margin-bottom: 15px;">
												<h3><small class="text-muted">담당의</small>&nbsp;선민정</h3>
												<h3><small class="text-muted">환자명</small>&nbsp;치즈</h3>
												<input type="hidden" name="animal_num" value="2"/>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="media">
								<div class="media-body">
									<div class="media">
										<div class="media-body" >
											<div class="wait-box" style="width: 98%;">
												<h3><small class="text-muted">담당의</small>&nbsp;김우석</h3>
												<h3><small class="text-muted">환자명</small>&nbsp;연이</h3>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<!-- End body -->