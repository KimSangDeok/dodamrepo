<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- 테이블부분-->
<link rel="stylesheet" href="/css/goodsbootstrap.css">
<script src="/goodsexcel/src/jquery.table2excel.js"></script>
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<!-- 테이블부분 끝-->
<!-- 왼쪽 사이드바부분 -->
<link rel="stylesheet" type="text/css"
	href="/css/goods/leftsidestyle.css" />
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700'
	rel='stylesheet' type='text/css' />
<script type="text/javascript"
	src="/css/goods/modernizr.custom.79639.js"></script>
<noscript>
	<link rel="stylesheet" type="text/css" href="/css/goods/noJS.css" />
</noscript>
<!-- 왼쪽 사이드바부분 끝 -->
<!-- 작은데이터피커-->
<link href="/css/goods/smalldatepicker/smallDatestyle.css"
	rel="stylesheet" type="text/css">
<link href="/css/goods/smalldatepicker/smallcalendar.css"
	rel="stylesheet" type="text/css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.min.js"></script>
<script src="/css/goods/smalldatepicker/es5.js"></script>
<!-- 작은데이터피커끝-->
<!-- 스타일 -->
<style type="text/css">
@media ( min-width : 768px) {
	#main-nav {
		line-height: 0;
		text-align: center;
	}
	#main-menu {
		display: inline-block;
	}
}
</style>


<!-- 바디 시작 -->
<div class="body">

	<!-- 여기 부분이 실질적으로 코딩하는 부분입니다~~~ div의 테두리는 지금 보기 편하기 위한 부분이고, 나중에 지울껍니다~~ -->
	<div>
		<!-- 가운데 구분 줄 -->
		<div class="hr1" style="margin-top: 50px"></div>
		<!-- goods화면의 sidemenu 시작-->
		<div>
			<div style="float: left">
				<section class="main">
					<div class="wrapper-demo">
						<div id="dd" class="wrapper-dropdown-3" tabindex="1">
							<span>입출고내역</span>
							<ul class="dropdown">
								<li><a href="/goods/goodsShow.dodam">재고현황</a></li>
								<li><a href="/goods/goodsHistory.dodam">입출고내역</a></li>
							</ul>
						</div>
						​
					</div>
				</section>
				<script type="text/javascript">
				
				function DropDown(el) {
					this.dd = el;
					this.placeholder = this.dd.children('span');
					this.opts = this.dd.find('ul.dropdown > li');
					this.val = '';
					this.index = -1;
					this.initEvents();
				}
				DropDown.prototype = {
					initEvents : function() {
						var obj = this;
				
						obj.dd.on('click', function(event){
							$(this).toggleClass('active');
							return false;
						});
				
						obj.opts.on('click',function(){
							var opt = $(this);
							obj.val = opt.text();
							obj.index = opt.index();
							obj.placeholder.text(obj.val);
//////////////////////////////////왼쪽 사이드바 페이지 전환 부분/////////////////////////
							location.href = $(this).find('a').attr('href');
						});
					},
					getValue : function() {
						return this.val;
					},
					getIndex : function() {
						return this.index;
					}
				}
				
				$(function() {				
					var dd = new DropDown( $('#dd') );				
					$(document).click(function() {
						// all dropdowns
						$('.wrapper-dropdown-3').removeClass('active');
					});
				
				});
				
				</script>
				<!-- goods화면의 sidemenu 끝 -->
			</div>

			<!-- 테이블 div-->
			<div style="float: left; padding-left: 50px;">
				<h5>입출고 내역</h5>
				<form class="forms" method="get" action="#">
					<!-- 입/출고 기간 셀렉트 박스 -->
					<div style="float: left; width: 1000px;">
						<div style="float: left; padding-top: 20px;">
							<div style="float: left;">
								<label style="font-size: 15px; padding-right: 10px;">입/출고 기간</label>
							</div>
							<div style="float: left;">
								<!-- 작은달력 화면 -->
								<div class="form-row">
									<input type="text" placeholder="Date range picker"
										id="rangedate" name="rangedate">
									<div class="dt">
										<div class="dt__wrapper rangedate">
											<div class="dt__calendar dt__start">
												<div class="dt__calendar_head">
													<div class="dt__calendar_head_wday">Tuesday</div>
													<div class="dt__calendar_head_month">
														<i class="prev">&lt;</i><span>June</span><i class="next">&gt;</i>
													</div>
													<div class="dt__calendar_head_day">20</div>
													<div class="dt__calendar_head_year">
														<i class="prev">&lt;</i>2017<i class="next">&gt;</i>
													</div>
												</div>
												<div class="dt__calendar_nav">
													<div class="dt__calendar_nav_title">Jun 2017</div>
												</div>
												<div class="dt__calendar_start">
													<div class="dt__calendar_m">
														<div class="dt__calendar_m_w">
															<div class="dt__calendar_m_w_n">Su</div>
															<div class="dt__calendar_m_w_n">Mo</div>
															<div class="dt__calendar_m_w_n">Tu</div>
															<div class="dt__calendar_m_w_n">We</div>
															<div class="dt__calendar_m_w_n">Th</div>
															<div class="dt__calendar_m_w_n">Fr</div>
															<div class="dt__calendar_m_w_n">Sa</div>
														</div>
														<div class="dt__calendar_m_d_e"></div>
														<div class="dt__calendar_m_d_e"></div>
														<div class="dt__calendar_m_d_e"></div>
														<div class="dt__calendar_m_d_e"></div>
														<div class="dt__calendar_m_d ">1</div>
														<div class="dt__calendar_m_d ">2</div>
														<div class="dt__calendar_m_d ">3</div>
														<div class="dt__calendar_m_d ">4</div>
														<div class="dt__calendar_m_d ">5</div>
														<div class="dt__calendar_m_d ">6</div>
														<div class="dt__calendar_m_d ">7</div>
														<div class="dt__calendar_m_d ">8</div>
														<div class="dt__calendar_m_d ">9</div>
														<div class="dt__calendar_m_d ">10</div>
														<div class="dt__calendar_m_d ">11</div>
														<div class="dt__calendar_m_d ">12</div>
														<div class="dt__calendar_m_d ">13</div>
														<div class="dt__calendar_m_d ">14</div>
														<div class="dt__calendar_m_d ">15</div>
														<div class="dt__calendar_m_d ">16</div>
														<div class="dt__calendar_m_d ">17</div>
														<div class="dt__calendar_m_d ">18</div>
														<div class="dt__calendar_m_d ">19</div>
														<div class="dt__calendar_m_d active">20</div>
														<div class="dt__calendar_m_d between">21</div>
														<div class="dt__calendar_m_d between">22</div>
														<div class="dt__calendar_m_d between">23</div>
														<div class="dt__calendar_m_d active">24</div>
														<div class="dt__calendar_m_d ">25</div>
														<div class="dt__calendar_m_d ">26</div>
														<div class="dt__calendar_m_d ">27</div>
														<div class="dt__calendar_m_d ">28</div>
														<div class="dt__calendar_m_d ">29</div>
														<div class="dt__calendar_m_d ">30</div>
													</div>
												</div>
											</div>
											<div class="dt__calendar dt__end">
												<div class="dt__calendar_head">
													<div class="dt__calendar_head_wday">Saturday</div>
													<div class="dt__calendar_head_month">
														<i class="prev">&lt;</i><span>June</span><i class="next">&gt;</i>
													</div>
													<div class="dt__calendar_head_day">24</div>
													<div class="dt__calendar_head_year">
														<i class="prev">&lt;</i>2017<i class="next">&gt;</i>
													</div>
												</div>
												<div class="dt__calendar_nav">
													<div class="dt__calendar_nav_title">Jun 2017</div>
												</div>
												<div class="dt__calendar_end">
													<div class="dt__calendar_m">
														<div class="dt__calendar_m_w">
															<div class="dt__calendar_m_w_n">Su</div>
															<div class="dt__calendar_m_w_n">Mo</div>
															<div class="dt__calendar_m_w_n">Tu</div>
															<div class="dt__calendar_m_w_n">We</div>
															<div class="dt__calendar_m_w_n">Th</div>
															<div class="dt__calendar_m_w_n">Fr</div>
															<div class="dt__calendar_m_w_n">Sa</div>
														</div>
														<div class="dt__calendar_m_d_e"></div>
														<div class="dt__calendar_m_d_e"></div>
														<div class="dt__calendar_m_d_e"></div>
														<div class="dt__calendar_m_d_e"></div>
														<div class="dt__calendar_m_d ">1</div>
														<div class="dt__calendar_m_d ">2</div>
														<div class="dt__calendar_m_d ">3</div>
														<div class="dt__calendar_m_d ">4</div>
														<div class="dt__calendar_m_d ">5</div>
														<div class="dt__calendar_m_d ">6</div>
														<div class="dt__calendar_m_d ">7</div>
														<div class="dt__calendar_m_d ">8</div>
														<div class="dt__calendar_m_d ">9</div>
														<div class="dt__calendar_m_d ">10</div>
														<div class="dt__calendar_m_d ">11</div>
														<div class="dt__calendar_m_d ">12</div>
														<div class="dt__calendar_m_d ">13</div>
														<div class="dt__calendar_m_d ">14</div>
														<div class="dt__calendar_m_d ">15</div>
														<div class="dt__calendar_m_d ">16</div>
														<div class="dt__calendar_m_d ">17</div>
														<div class="dt__calendar_m_d ">18</div>
														<div class="dt__calendar_m_d ">19</div>
														<div class="dt__calendar_m_d active">20</div>
														<div class="dt__calendar_m_d between">21</div>
														<div class="dt__calendar_m_d between">22</div>
														<div class="dt__calendar_m_d between">23</div>
														<div class="dt__calendar_m_d active">24</div>
														<div class="dt__calendar_m_d ">25</div>
														<div class="dt__calendar_m_d ">26</div>
														<div class="dt__calendar_m_d ">27</div>
														<div class="dt__calendar_m_d ">28</div>
														<div class="dt__calendar_m_d ">29</div>
														<div class="dt__calendar_m_d ">30</div>
													</div>
												</div>
											</div>
											<div class="dt__ranges">
												<div class="dt__ranges_item" data-range="0""="">Yesterday</div>
												<div class="dt__ranges_item" data-range="1""="">Sunday</div>
												<div class="dt__ranges_item" data-range="2""="">2
													Weeks</div>
												<div class="dt__ranges_item" data-range="3""="">This
													Month</div>
												<div class="dt__ranges_item" data-range="4""="">Last
													Month</div>
												<div class="dt__ranges_item" data-range="5""="">This
													Year</div>
											</div>
										</div>
									</div>
								</div>
								<!-- 작은달력 화면 끝 -->
							</div>
						</div>
						<!-- 입/출고 셀렉트 박스 -->
						<div style="float: left; padding-top: 20px; padding-right: 30px;">
							<div style="float: left;">
								<label
									style="font-size: 15px; padding-right: 10px; padding-top: 5px; padding-left: 20px;">입/출고</label>
							</div>
							<div style="float: left;">
								<select id="goods_inout_type" name="goods_inout_type">
									<option>입고</option>
									<option>출고</option>
								</select>
							</div>
						</div>
						<!-- 용도 셀렉트 박스 -->
						<div style="float: left; padding-top: 20px; padding-right: 30px;">
							<div style="float: left;">
								<label style="font-size: 15px; padding-right: 10px;">용도</label>
							</div>
							<div style="float: left;">
								<select id="goods_use" name="">
									<option></option>
									<option>동물용의약품</option>
									<option>동물용의약외품</option>
								</select>
							</div>
						</div>


						<!-- 재고 검색 텍스트 및 버튼 -->
						<div style="float: right; padding-top: 10px;">

							<div style="float: left; padding-top: 10px; padding-right: 10px">
								<input type="text" id="historySearchtxt" name="name" value=""
									class="goods-input">
							</div>
							<div style="float: left">
								<button type="button" id="historySearch" class="btn btn-danger">검색</button>
							</div>
				</form>
			</div>
		</div>
		<!-- 가운데 구분 줄 -->
		<div class="hr1"></div>


		<table class="table" id="table2excel">
			<thead>
				<tr class="noExl">
					<th>입/출고</th>
					<th>품목명</th>
					<th>용도</th>
					<th>입고날짜</th>
					<th>입고가격</th>
					<th>입고수량</th>
					<th style="display: none">출고날짜</th>
					<th style="display: none">판매가격</th>
					<th style="display: none">판매수량</th>
				</tr>
			</thead>
			<tbody class="goodsHistoryTbody">
				<!-- ajax되어서 들어올 부분 es5.js에 있음 -->
			</tbody>
		</table>
		<div style="float: right">
			<button id="btnexport" class="btn btn-success">Export</button>
		</div>
	</div>
	<!-- 테이블 div 끝 -->

</div>


<!-- 상품추가 스크립트 -->
<script>			
			$(function() {
////////////////////////////엑셀로 export부분		
				$("#btnexport").click(function(){
				$("#table2excel").table2excel({
					exclude: ".noExl",
    				name: "Excel Document Name"
				}); 
				 });	
////////////////////////////////작은 달력 제이쿼리(smalldatepicker)				      
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

///////////////////////////////검색하는 부분
				$("#historySearch").click(function(){
					if($("#goods_inout_type").val()=="입고"){
						$(".noExl").children().eq(3).css("display","");
						$(".noExl").children().eq(4).css("display","");
						$(".noExl").children().eq(5).css("display","");
						$(".noExl").children().eq(6).css("display","none");
						$(".noExl").children().eq(7).css("display","none");
						$(".noExl").children().eq(8).css("display","none");
					}else if($("#goods_inout_type").val()=="출고"){
						$(".noExl").children().eq(6).css("display","");
						$(".noExl").children().eq(7).css("display","");
						$(".noExl").children().eq(8).css("display","");
						$(".noExl").children().eq(3).css("display","none");
						$(".noExl").children().eq(4).css("display","none");
						$(".noExl").children().eq(5).css("display","none");
					}
					if($("#historySearchtxt").val()==""){
						alert("검색어를 입력해 주세요");
					}else{
						var count = 0;
						//검색 버튼 눌렀을 때 입고일때에 한해서 타는 ajax
						if($("#goods_inout_type").val()=="입고"){
						$.ajax({
							type:'get',
							async:true,
							url:'/goods/historySearch.dodam',
							contentType:'application/x-www-form-urlencoded;charset=UTF-8',
							data:{"rangedate":$('#rangedate').val(),
								"goods_inout_type":$("#goods_inout_type").val(),
								"goods_use":$("#goods_use").val(),
								"stock_name":$("#historySearchtxt").val()},
							dataType : "json",
							success:function(list){
								
								var i;

								for (i in list) {
								    if (list.hasOwnProperty(i)) {
								        count++;
								    }
								}
								$(".goodsHistoryTbody").text('');
						
						for(var i = 0; i<count; i++){
							$(".goodsHistoryTbody").append(						
									"<tr>"
									+"<td>"+(list[i]).goods_inout_type +"</td>"
									+"<td>"+ (list[i]).stock_name +"</td>" 
									+"<td>"+ (list[i]).goods_use +"</td>"
									+"<td>"+ (list[i]).goods_date_in +"</td>"
									+"<td>"+ (list[i]).goods_price_in +"</td>"
									+"<td>"+(list[i]).goods_count_in +"</td>"						
									+"</tr>"						
								);					
				
						}
							},
							error:function(request, status,error){
					             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					         }
					    
						});
						
					}
						//검색버튼 눌렀을 때 출고 일때 ajax타는 부분
					else if($("#goods_inout_type").val()=="출고"){
					
						$.ajax({
							type:'get',
							async:true,
							url:'/goods/historySearch.dodam',
							contentType:'application/x-www-form-urlencoded;charset=UTF-8',
							data:{"rangedate":$('#rangedate').val(),
								"goods_inout_type":$("#goods_inout_type").val(),
								"goods_use":$("#goods_use").val(),
								"stock_name":$("#historySearchtxt").val()},
							dataType : "json",
							success:function(list){
								
								var i;

								for (i in list) {
								    if (list.hasOwnProperty(i)) {
								        count++;
								    }
								}
								$(".goodsHistoryTbody").text('');
						
						for(var i = 0; i<count; i++){
							$(".goodsHistoryTbody").append(						
									"<tr>"
									+"<td>"+(list[i]).goods_inout_type +"</td>"
									+"<td>"+ (list[i]).stock_name +"</td>" 
									+"<td>"+ (list[i]).goods_use +"</td>"
									+"<td>"+ (list[i]).goods_date_out +"</td>"
									+"<td>"+ (list[i]).goods_price_out +"</td>"
									+"<td>"+(list[i]).goods_count_out +"</td>"						
									+"</tr>"						
								);					
				
						}
							},
							error:function(request, status,error){
					             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					         }
					    
						});
						
					}
			
			}
		
				
				});
				
			});
		
</script>




<script type="text/javascript">

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

</div>
</div>
