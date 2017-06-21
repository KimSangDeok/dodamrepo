<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" type="text/css" href="/manage/style.css" />
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css' />
	<style>
	/* z-index 값이 작을 수록 아래에 깔리고, 높을 수록 위로 나온다. */
	.main{
		z-index:2;
	}
	.container{
		z-index:1;
	}
	</style>
<script type="text/javascript" src="/manage/modernizr.custom.79639.js"></script>
<noscript><link rel="stylesheet" type="text/css" href="/manage/noJS.css" /></noscript> 
<script>
$(document).ready(function(){
   
   $('.header').addClass('hide');
});
</script>
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