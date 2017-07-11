<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

	<!-- begin : 관리자 추가 메뉴 css -->
	<link rel="stylesheet" type="text/css" href="/manage/style.css" />
	<!-- end : 관리자 추가 메뉴 css -->
	
	<!-- begin : date range picker -->
	<link href="/css/mpay/smallDatestyle.css" rel="stylesheet" type="text/css">
	<link href="/css/mpay/smallcalendar.css" rel="stylesheet" type="text/css">
	<link href="/css/mpay/smallDatestyle.css" rel="stylesheet" type="text/css">
	<!-- end : date range picker -->

	<!-- Date picker css -->
	<style>
	.dt__calendar_head{
	background-color: #e74c3c;
	}
	.dt__calendar_m_d.active {
	    background-color: #e5f791;
	    color: #180202;
	}
	</style>

<!-- begin : mpayView 첫번째 : 시간대별 접수 고객을 보여줘라~ -->
<div class="body">

		<!-- begin : 관리자 추가 메뉴 DIV, 스크립트 -->
		<div class="wrapper-demo">
			<div id="dd" class="wrapper-dropdown-3" tabindex="1">
				<span>매출관리</span>
				<ul class="dropdown">
					<li><a href="/mpay/mpayView.dodam"><i class="icon-envelope icon-large"></i>시간대별 접수고객</a></li>
					<li><a href="/mpay/mpayView3.dodam"><i class="icon-plane icon-large"></i>매출 내용 분석</a></li>
				</ul>
			</div>
		​</div>
			 
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
						// ****페이지 이동 소스
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
		<!-- end : 관리자 추가 메뉴 DIV, 스크립트 -->

 
		<br/>

		<!-- mpayView의 진짜 본문 내용 : div로 묶는 이유는, 내용을 우측으로 이동하게 하려고 -->
		<div class='mpayView1' style='margin-left:15%'>
		
		<!-- 분석 기간을 설정하는 datepicker와 button -->
		<div class="form-row" style='float:left'>
		<input class='selectDay' type="text" placeholder="Date picker" id="singleDateRange"><div class="dt"><div class="dt__wrapper"><div class="dt__calendar dt__start"><div class="dt__calendar_head"><div class="dt__calendar_head_wday">Sunday</div><div class="dt__calendar_head_month"><i class="prev">&lt;</i><span>June</span><i class="next">&gt;</i></div><div class="dt__calendar_head_day">25</div><div class="dt__calendar_head_year"><i class="prev">&lt;</i>2017<i class="next">&gt;</i></div></div><div class="dt__calendar_nav"><div class="dt__calendar_nav_title">Jun 2017</div></div><div class="dt__calendar_start"><div class="dt__calendar_m"><div class="dt__calendar_m_w"><div class="dt__calendar_m_w_n">Su</div><div class="dt__calendar_m_w_n">Mo</div><div class="dt__calendar_m_w_n">Tu</div><div class="dt__calendar_m_w_n">We</div><div class="dt__calendar_m_w_n">Th</div><div class="dt__calendar_m_w_n">Fr</div><div class="dt__calendar_m_w_n">Sa</div></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d ">1</div><div class="dt__calendar_m_d ">2</div><div class="dt__calendar_m_d ">3</div><div class="dt__calendar_m_d ">4</div><div class="dt__calendar_m_d ">5</div><div class="dt__calendar_m_d ">6</div><div class="dt__calendar_m_d ">7</div><div class="dt__calendar_m_d ">8</div><div class="dt__calendar_m_d ">9</div><div class="dt__calendar_m_d ">10</div><div class="dt__calendar_m_d ">11</div><div class="dt__calendar_m_d ">12</div><div class="dt__calendar_m_d ">13</div><div class="dt__calendar_m_d ">14</div><div class="dt__calendar_m_d ">15</div><div class="dt__calendar_m_d ">16</div><div class="dt__calendar_m_d ">17</div><div class="dt__calendar_m_d ">18</div><div class="dt__calendar_m_d ">19</div><div class="dt__calendar_m_d ">20</div><div class="dt__calendar_m_d ">21</div><div class="dt__calendar_m_d ">22</div><div class="dt__calendar_m_d ">23</div><div class="dt__calendar_m_d ">24</div><div class="dt__calendar_m_d active">25</div><div class="dt__calendar_m_d ">26</div><div class="dt__calendar_m_d ">27</div><div class="dt__calendar_m_d ">28</div><div class="dt__calendar_m_d ">29</div><div class="dt__calendar_m_d ">30</div></div></div></div></div></div>
		</div>	      
 
 		<br/><br/>
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.min.js"></script>
		<script src="/css/mpay/mpayView1.js"></script>
		<script type="text/javascript">
		$(function(){
		    $('#singleDateRange').DatePicker({
		        startDate: moment()
		    });
		});
		</script>
		<!-- datepicker와 button 끝 -->


		<!-- mpayView는 시간대별 접수고객의 수를 의미한다. 그래프 작성 내용을 시작.... 드디어!!! -->
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		
		<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		
		<!-- 접수소객 chart 끝 -->


		</div>


</div>