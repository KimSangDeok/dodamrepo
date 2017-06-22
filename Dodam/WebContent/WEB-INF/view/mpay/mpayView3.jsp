<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" type="text/css" href="/manage/style.css" />
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css' />
<link href="/smalldatepicker/smallDatestyle.css" rel="stylesheet" type="text/css">
<link href="/smalldatepicker/smallcalendar.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/mpay/barchart.css" />
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

		<!-- start : 매출 분류 별 분석 chart -->
		<div id="chart"></div>
		<script src="/mpay/barchart.jquery.js"></script>
		<script>

			$(document).ready(function(){

				$('#chart').barChart({
					height : 500,
					bars : [
						{ 
							name : 'Dataset 1',
							values : [[1450569600,40],[1450656000,30],[1450742400,15],[1450828800,75],[1450915200,129],[1451001600,3.3],[1451088000,57],[1451174400,50],[1451260800,30],[1451347200,31],[1451433600,24],[1451520000,24],[1451606400,24],[1451692800,29],[1451779200,39],[1451865600,52],[1451952000,36],[1452038400,60],[1452124800,39],[1452211200,44],[1452297600,36],[1452384000,44],[1452470400,64],[1452556800,28],[1452643200,58],[1452729600,58],[1452816000,50],[1452902400,44],[1452988800,57],[1453075200,45],[1453161600,7]] 
						},{ 
							name : 'Dataset 2',
							values : [[1450569600,45],[1450656000,33],[1450742400,49],[1450828800,25],[1450915200,29],[1451001600,33],[1451088000,5.7],[1451174400,50],[1451260800,30],[1451347200,10],[1451433600,24],[1451520000,24],[1451606400,24],[1451692800,29],[1451779200,39],[1451865600,52],[1451952000,36],[1452038400,60],[1452124800,39],[1452211200,44],[1452297600,36],[1452384000,44],[1452470400,64],[1452556800,28],[1452643200,58],[1452729600,58],[1452816000,50],[1452902400,44],[1452988800,57],[1453075200,45],[1453161600,7]] 
						}
					]
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
		<!-- end : 매출 분류 별 분석 chart -->
</div>