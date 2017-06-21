<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="body">

		<!-- mpayView�� �ð��뺰 �������� ���� �ǹ��Ѵ�. �׷��� �ۼ� ������ ����.... ����!!! -->
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
			        text: '�ð��뺰 ���� ��'
			    },
			    xAxis: {
			        categories: ['��', 'ȭ', '��', '��', '��', '��', '��']
			    },
			    yAxis: {
			        title: {
			            text: '��(�� or ����)'
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
			        name: '�� ��',
			        data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2]
			    }, {
			        name: '���� ��',
			        data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0]
			    }]
			});
		})
		</script>
		
		
		
		
		<!-- �����Ұ� chart �� -->

</div>