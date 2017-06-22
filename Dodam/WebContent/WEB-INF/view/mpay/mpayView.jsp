<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" type="text/css" href="/manage/style.css" />
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css' />
<link href="/smalldatepicker/smallDatestyle.css" rel="stylesheet" type="text/css">
<link href="/smalldatepicker/smallcalendar.css" rel="stylesheet" type="text/css">

	<style>
	/* z-index 값이 작을 수록 아래에 깔리고, 높을 수록 위로 나온다. */
	.main{
		z-index:2;
	}
	.count, .Quantity{
		z-index:1;
	}
	</style>
<script type="text/javascript" src="/manage/modernizr.custom.79639.js"></script>
<noscript><link rel="stylesheet" type="text/css" href="/manage/noJS.css" /></noscript> 

<div class="body">

<div class="body">
			<section class="main">
				<div class="wrapper-demo">
					<div id="dd" class="wrapper-dropdown-3" tabindex="1">
						<span>매출관리</span>
						<ul class="dropdown">
						
							<li><a href="/mpay/mpayView.dodam"><i class="icon-envelope icon-large"></i>시간대별 접수고객</a></li>
							<li><a href="/mpay/mpayView2.dodam"><i class="icon-truck icon-large"></i>매출 액 및 건수</a></li>
							<li><a href="/mpay/mpayView3.dodam"><i class="icon-plane icon-large"></i>매출 내용 분석</a></li>
						</ul>
					</div>
				​</div>
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

		<br/>
		<!-- 분석 기간을 설정하는 datepicker와 button -->
		<div class="form-row">
			<div style="float:left">
			<input type="text" placeholder="Date range picker" id="rangedate"><div class="dt"><div class="dt__wrapper rangedate"><div class="dt__calendar dt__start"><div class="dt__calendar_head"><div class="dt__calendar_head_wday">Tuesday</div><div class="dt__calendar_head_month"><i class="prev">&lt;</i><span>June</span><i class="next">&gt;</i></div><div class="dt__calendar_head_day">20</div><div class="dt__calendar_head_year"><i class="prev">&lt;</i>2017<i class="next">&gt;</i></div></div><div class="dt__calendar_nav"><div class="dt__calendar_nav_title">Jun 2017</div></div><div class="dt__calendar_start"><div class="dt__calendar_m"><div class="dt__calendar_m_w"><div class="dt__calendar_m_w_n">Su</div><div class="dt__calendar_m_w_n">Mo</div><div class="dt__calendar_m_w_n">Tu</div><div class="dt__calendar_m_w_n">We</div><div class="dt__calendar_m_w_n">Th</div><div class="dt__calendar_m_w_n">Fr</div><div class="dt__calendar_m_w_n">Sa</div></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d ">1</div><div class="dt__calendar_m_d ">2</div><div class="dt__calendar_m_d ">3</div><div class="dt__calendar_m_d ">4</div><div class="dt__calendar_m_d ">5</div><div class="dt__calendar_m_d ">6</div><div class="dt__calendar_m_d ">7</div><div class="dt__calendar_m_d ">8</div><div class="dt__calendar_m_d ">9</div><div class="dt__calendar_m_d ">10</div><div class="dt__calendar_m_d ">11</div><div class="dt__calendar_m_d ">12</div><div class="dt__calendar_m_d ">13</div><div class="dt__calendar_m_d ">14</div><div class="dt__calendar_m_d ">15</div><div class="dt__calendar_m_d ">16</div><div class="dt__calendar_m_d ">17</div><div class="dt__calendar_m_d ">18</div><div class="dt__calendar_m_d ">19</div><div class="dt__calendar_m_d active">20</div><div class="dt__calendar_m_d between">21</div><div class="dt__calendar_m_d between">22</div><div class="dt__calendar_m_d between">23</div><div class="dt__calendar_m_d active">24</div><div class="dt__calendar_m_d ">25</div><div class="dt__calendar_m_d ">26</div><div class="dt__calendar_m_d ">27</div><div class="dt__calendar_m_d ">28</div><div class="dt__calendar_m_d ">29</div><div class="dt__calendar_m_d ">30</div></div></div></div><div class="dt__calendar dt__end"><div class="dt__calendar_head"><div class="dt__calendar_head_wday">Saturday</div><div class="dt__calendar_head_month"><i class="prev">&lt;</i><span>June</span><i class="next">&gt;</i></div><div class="dt__calendar_head_day">24</div><div class="dt__calendar_head_year"><i class="prev">&lt;</i>2017<i class="next">&gt;</i></div></div><div class="dt__calendar_nav"><div class="dt__calendar_nav_title">Jun 2017</div></div><div class="dt__calendar_end"><div class="dt__calendar_m"><div class="dt__calendar_m_w"><div class="dt__calendar_m_w_n">Su</div><div class="dt__calendar_m_w_n">Mo</div><div class="dt__calendar_m_w_n">Tu</div><div class="dt__calendar_m_w_n">We</div><div class="dt__calendar_m_w_n">Th</div><div class="dt__calendar_m_w_n">Fr</div><div class="dt__calendar_m_w_n">Sa</div></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d ">1</div><div class="dt__calendar_m_d ">2</div><div class="dt__calendar_m_d ">3</div><div class="dt__calendar_m_d ">4</div><div class="dt__calendar_m_d ">5</div><div class="dt__calendar_m_d ">6</div><div class="dt__calendar_m_d ">7</div><div class="dt__calendar_m_d ">8</div><div class="dt__calendar_m_d ">9</div><div class="dt__calendar_m_d ">10</div><div class="dt__calendar_m_d ">11</div><div class="dt__calendar_m_d ">12</div><div class="dt__calendar_m_d ">13</div><div class="dt__calendar_m_d ">14</div><div class="dt__calendar_m_d ">15</div><div class="dt__calendar_m_d ">16</div><div class="dt__calendar_m_d ">17</div><div class="dt__calendar_m_d ">18</div><div class="dt__calendar_m_d ">19</div><div class="dt__calendar_m_d active">20</div><div class="dt__calendar_m_d between">21</div><div class="dt__calendar_m_d between">22</div><div class="dt__calendar_m_d between">23</div><div class="dt__calendar_m_d active">24</div><div class="dt__calendar_m_d ">25</div><div class="dt__calendar_m_d ">26</div><div class="dt__calendar_m_d ">27</div><div class="dt__calendar_m_d ">28</div><div class="dt__calendar_m_d ">29</div><div class="dt__calendar_m_d ">30</div></div></div></div><div class="dt__ranges"><div class="dt__ranges_item" data-range="0" "="">Yesterday</div><div class="dt__ranges_item" data-range="1" "="">Sunday</div><div class="dt__ranges_item" data-range="2" "="">2 Weeks</div><div class="dt__ranges_item" data-range="3" "="">This Month</div><div class="dt__ranges_item" data-range="4" "="">Last Month</div><div class="dt__ranges_item" data-range="5" "="">This Year</div></div></div></div>
			</div>
		</div>
 
 		<br/><br/>
		          
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.min.js"></script>
		<script src="/smalldatepicker/es5.js"></script>
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
		<!-- datepicker와 button 끝 -->

		<!-- mpayView는 시간대별 접수고객의 수를 의미한다. 그래프 작성 내용을 시작.... 드디어!!! -->
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		
		<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		
		<script type="text/javascript">
		$(function(){
			Highcharts.chart('container', {
			    chart: {
			        type: 'line'
			    },
			    title: {
			        text: '시간대별 접수 고객'
			    },
			    xAxis: {
			        categories: ['월', '화', '수', '목', '금', '토', '일']
			    },
			    yAxis: {
			        title: {
			            text: '수(명 or 마리)'
			        }
			    },
			    plotOptions: {
			        line: {
			            dataLabels: {
			                enabled: true
			            },
			            enableMouseTracking: false
			        }
			    },
			    series: [{
			        name: '고객 수',
			        data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2]
			    }, {
			        name: '동물 수',
			        data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0]
			    }]
			});
		})
		</script>
		
		
		
		
		<!-- 접수소객 chart 끝 -->


		


</div>