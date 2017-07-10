<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

	<!-- begin : 관리자 추가 메뉴 css -->
	<link rel="stylesheet" type="text/css" href="/manage/style.css" />
	<!-- end : 관리자 추가 메뉴 css -->
	
	<!-- begin : date range picker -->
	<link rel=stylesheet href="/css/mpay/jquery.calendarPicker.css" type="text/css" media="screen">
		
		<!-- *******여기에~~~ 년도를 선택했을 때, 분석자료를 가져와야하는 함수가 있도다~~~~~~~~ -->	
		<script type="text/javascript" src="/css/mpay/jquery.mpay3CalendarPicker.js"></script>
		<!-- *******여기에~~~ 년도를 선택했을 때, 분석자료를 가져와야하는 함수가 있도다~~~~~~~~ -->	
	
	<!-- end : date range picker -->

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
		<!-- mpayView의 진짜 본문 내용 : div로 묶는 이유는, 내용을 우측으로 이동하게 하려고 -->
		<div class='mpayView1' style='margin-left:15%'>
		
		<!-- begin : 분석 기간을 설정하는 년도 picker -->
		<div class="form-row" style='float:left'>
				<div id="dsel2" style="width:340px"></div>
		</div>	      
 
 		<br/><br/>
		
		<script type="text/javascript">
		var calendarPicker2 = $("#dsel2").calendarPicker({
			    years:2,
			    showDayArrows:false,
			    callback:function(cal) {
			      $("#wtf").html("Selected date: " + cal.currentDate);
		}});
		</script>
		<!-- end : 분석 기간을 설정하는 년도 picker -->
		
		
		<!-- start : 매출 분류 별 분석 chart -->

		<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>

		<!-- end : 매출 분류 별 분석 chart -->
		</div>
</div>