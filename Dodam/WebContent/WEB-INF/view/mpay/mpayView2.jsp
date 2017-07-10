<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	
	<!-- begin : 관리자 추가 메뉴 css -->
	<link rel="stylesheet" type="text/css" href="/manage/style.css" />
	<!-- end : 관리자 추가 메뉴 css -->
	
	<!-- begin : date range picker -->
	<link href="/css/mpay/smalldatepicker/smallDatestyle.css" rel="stylesheet" type="text/css">
	<link href="/css/mpay/smalldatepicker/smallcalendar.css" rel="stylesheet" type="text/css">
	<link href="/css/book/smalldatepicker/smallDatestyle.css" rel="stylesheet" type="text/css">
	<!-- end : date range picker -->

<!-- begin : mpayView 두번째 : 기간내 매출액, 건수를 보여주라~ -->
<div class="body">

		<!-- begin : 관리자 추가 메뉴 DIV, 스크립트 -->
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
		

		<!-- mpayView2의 진짜 본문 내용 : div로 묶는 이유는, 내용을 우측으로 이동하게 하려고 -->
		<div class='mpayView1' style='margin-left:11%'>		
		
		<!-- 분석 기간을 설정하는 datepicker와 button -->
		<div class="form-row">
			<div style="float:left">
			<input type="text" placeholder="Date range picker" id="rangedate"><div class="dt"><div class="dt__wrapper rangedate"><div class="dt__calendar dt__start"><div class="dt__calendar_head"><div class="dt__calendar_head_wday">Tuesday</div><div class="dt__calendar_head_month"><i class="prev">&lt;</i><span>June</span><i class="next">&gt;</i></div><div class="dt__calendar_head_day">20</div><div class="dt__calendar_head_year"><i class="prev">&lt;</i>2017<i class="next">&gt;</i></div></div><div class="dt__calendar_nav"><div class="dt__calendar_nav_title">Jun 2017</div></div><div class="dt__calendar_start"><div class="dt__calendar_m"><div class="dt__calendar_m_w"><div class="dt__calendar_m_w_n">Su</div><div class="dt__calendar_m_w_n">Mo</div><div class="dt__calendar_m_w_n">Tu</div><div class="dt__calendar_m_w_n">We</div><div class="dt__calendar_m_w_n">Th</div><div class="dt__calendar_m_w_n">Fr</div><div class="dt__calendar_m_w_n">Sa</div></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d ">1</div><div class="dt__calendar_m_d ">2</div><div class="dt__calendar_m_d ">3</div><div class="dt__calendar_m_d ">4</div><div class="dt__calendar_m_d ">5</div><div class="dt__calendar_m_d ">6</div><div class="dt__calendar_m_d ">7</div><div class="dt__calendar_m_d ">8</div><div class="dt__calendar_m_d ">9</div><div class="dt__calendar_m_d ">10</div><div class="dt__calendar_m_d ">11</div><div class="dt__calendar_m_d ">12</div><div class="dt__calendar_m_d ">13</div><div class="dt__calendar_m_d ">14</div><div class="dt__calendar_m_d ">15</div><div class="dt__calendar_m_d ">16</div><div class="dt__calendar_m_d ">17</div><div class="dt__calendar_m_d ">18</div><div class="dt__calendar_m_d ">19</div><div class="dt__calendar_m_d active">20</div><div class="dt__calendar_m_d between">21</div><div class="dt__calendar_m_d between">22</div><div class="dt__calendar_m_d between">23</div><div class="dt__calendar_m_d active">24</div><div class="dt__calendar_m_d ">25</div><div class="dt__calendar_m_d ">26</div><div class="dt__calendar_m_d ">27</div><div class="dt__calendar_m_d ">28</div><div class="dt__calendar_m_d ">29</div><div class="dt__calendar_m_d ">30</div></div></div></div><div class="dt__calendar dt__end"><div class="dt__calendar_head"><div class="dt__calendar_head_wday">Saturday</div><div class="dt__calendar_head_month"><i class="prev">&lt;</i><span>June</span><i class="next">&gt;</i></div><div class="dt__calendar_head_day">24</div><div class="dt__calendar_head_year"><i class="prev">&lt;</i>2017<i class="next">&gt;</i></div></div><div class="dt__calendar_nav"><div class="dt__calendar_nav_title">Jun 2017</div></div><div class="dt__calendar_end"><div class="dt__calendar_m"><div class="dt__calendar_m_w"><div class="dt__calendar_m_w_n">Su</div><div class="dt__calendar_m_w_n">Mo</div><div class="dt__calendar_m_w_n">Tu</div><div class="dt__calendar_m_w_n">We</div><div class="dt__calendar_m_w_n">Th</div><div class="dt__calendar_m_w_n">Fr</div><div class="dt__calendar_m_w_n">Sa</div></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d ">1</div><div class="dt__calendar_m_d ">2</div><div class="dt__calendar_m_d ">3</div><div class="dt__calendar_m_d ">4</div><div class="dt__calendar_m_d ">5</div><div class="dt__calendar_m_d ">6</div><div class="dt__calendar_m_d ">7</div><div class="dt__calendar_m_d ">8</div><div class="dt__calendar_m_d ">9</div><div class="dt__calendar_m_d ">10</div><div class="dt__calendar_m_d ">11</div><div class="dt__calendar_m_d ">12</div><div class="dt__calendar_m_d ">13</div><div class="dt__calendar_m_d ">14</div><div class="dt__calendar_m_d ">15</div><div class="dt__calendar_m_d ">16</div><div class="dt__calendar_m_d ">17</div><div class="dt__calendar_m_d ">18</div><div class="dt__calendar_m_d ">19</div><div class="dt__calendar_m_d active">20</div><div class="dt__calendar_m_d between">21</div><div class="dt__calendar_m_d between">22</div><div class="dt__calendar_m_d between">23</div><div class="dt__calendar_m_d active">24</div><div class="dt__calendar_m_d ">25</div><div class="dt__calendar_m_d ">26</div><div class="dt__calendar_m_d ">27</div><div class="dt__calendar_m_d ">28</div><div class="dt__calendar_m_d ">29</div><div class="dt__calendar_m_d ">30</div></div></div></div><div class="dt__ranges"><div class="dt__ranges_item" data-range="0" "="">Yesterday</div><div class="dt__ranges_item" data-range="1" "="">Sunday</div><div class="dt__ranges_item" data-range="2" "="">2 Weeks</div><div class="dt__ranges_item" data-range="3" "="">This Month</div><div class="dt__ranges_item" data-range="4" "="">Last Month</div><div class="dt__ranges_item" data-range="5" "="">This Year</div></div></div></div>
			</div>
		</div>
 
 		<br/><br/>
		          
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.min.js"></script>
		<script src="/css/goods/smalldatepicker/es5.js"></script>
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

		<div style="background:pink">기간 내 매출액</div>
		<div id="Quantity" style="text-align:center; margin:auto; border:1px solid black">
			<div id="count1" style="border:2px solid red; width:50%; float:left; text-align:center">
			<div id="QuantityPie" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto;"></div>
			</div>
			<div id="count2" style="border:2px solid pink; width:50%; float:left; text-align:center">
			<div id="QuantityBar"></div>
			</div>
		</div>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		<script src="https://code.highcharts.com/highcharts-more.js"></script>	
		<script type="text/javascript">
		$(function(){
			Highcharts.chart('QuantityPie', {
			    chart: {
			        plotBackgroundColor: null,
			        plotBorderWidth: 0,
			        plotShadow: false
			    },
			    title: {
			        text: 'Browser<br>shares<br>2015',
			        align: 'center',
			        verticalAlign: 'middle',
			        y: 40
			    },
			    tooltip: {
			        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
			    },
			    plotOptions: {
			        pie: {
			            dataLabels: {
			                enabled: true,
			                distance: -50,
			                style: {
			                    fontWeight: 'bold',
			                    color: 'white'
			                }
			            },
			            startAngle: -90,
			            endAngle: 90,
			            center: ['50%', '75%']
			        }
			    },
			    series: [{
			        type: 'pie',
			        name: 'Browser share',
			        innerSize: '50%',
			        data: [
			            ['Firefox',   10.38],
			            ['IE',       56.33],
			            ['Chrome', 24.03],
			            ['Safari',    4.77],
			            ['Opera',     0.91],
			            {
			                name: 'Proprietary or Undetectable',
			                y: 0.2,
			                dataLabels: {
			                    enabled: false
			                }
			            }
			        ]
			    }]
			});
			
			var chart = Highcharts.chart("QuantityBar", {

			    title: {
			        text: 'Chart.update'
			    },

			    subtitle: {
			        text: 'Plain'
			    },

			    xAxis: {
			        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
			    },

			    series: [{
			        type: 'column',
			        colorByPoint: true,
			        data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
			        showInLegend: false
			    }]

			});

			
			
		})
		</script>
		
		
		
		<br/><br/><br/><br/>		<br/><br/><br/><br/>			<br/><br/><br/><br/>		<br/><br/><br/><br/>		<br/><br/><br/><br/>	<br/><br/><br/><br/>		<br/><br/><br/><br/>
		
		<div style="background:skyblue">기간 내 매출 건수</div>
		<div id="Count" style="text-align:center; margin:auto; border:1px solid blue">
			<div id="count1" style="border:2px solid red; width:50%; float:left; text-align:center">
			<div id="CountPie" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto;"></div>
			</div>
			<div id="count2" style="border:2px solid pink; width:50%; float:left; text-align:center">
			<div id="CountBar"></div>
			</div>
		</div>
		<script type="text/javascript">
		$(function(){
			Highcharts.chart('CountPie', {
			    chart: {
			        plotBackgroundColor: null,
			        plotBorderWidth: 0,
			        plotShadow: false
			    },
			    title: {
			        text: 'Browser<br>shares<br>2015',
			        align: 'center',
			        verticalAlign: 'middle',
			        y: 40
			    },
			    tooltip: {
			        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
			    },
			    plotOptions: {
			        pie: {
			            dataLabels: {
			                enabled: true,
			                distance: -50,
			                style: {
			                    fontWeight: 'bold',
			                    color: 'white'
			                }
			            },
			            startAngle: -90,
			            endAngle: 90,
			            center: ['50%', '75%']
			        }
			    },
			    series: [{
			        type: 'pie',
			        name: 'Browser share',
			        innerSize: '50%',
			        data: [
			            ['Firefox',   10.38],
			            ['IE',       56.33],
			            ['Chrome', 24.03],
			            ['Safari',    4.77],
			            ['Opera',     0.91],
			            {
			                name: 'Proprietary or Undetectable',
			                y: 0.2,
			                dataLabels: {
			                    enabled: false
			                }
			            }
			        ]
			    }]
			});
			
			var chart = Highcharts.chart("CountBar", {

			    title: {
			        text: 'Chart.update'
			    },

			    subtitle: {
			        text: 'Plain'
			    },

			    xAxis: {
			        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
			    },

			    series: [{
			        type: 'column',
			        colorByPoint: true,
			        data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
			        showInLegend: false
			    }]

			});

			
			
		})
		</script>	


		</div>


</div>