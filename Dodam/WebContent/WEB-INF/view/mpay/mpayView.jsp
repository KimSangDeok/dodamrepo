<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="body">

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