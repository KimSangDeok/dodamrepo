<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- calendar -->
<link rel="stylesheet" href="/calendar-css/monthly.css">
<style type="text/css">
body {
	font-family: Calibri;
	padding: 0em 1em;
}

#mycalendar {
	display: inline;
	margin-top: 20px;
	margin-bottom: 20px;
	margin-left: 30px;
	max-width: 500px;
	border: 1px solid #666;
}
/* 		#footer .inner {display: inline;} */
#footer .inner .content {
	margin-right: 600px;
}

#footer .inner .copyright {
	margin-right: 600px;
}
</style>


<!-- 테이블 리스트 스타일 -->
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/reservationCss/bootstrap.css">

<style>
body {
	font-family: 'Open Sans';
}

.container {
	margin: 150px auto;
}

.panel-primary {
	border-color: #e74c3c;
}

.panel-primary>.panel-heading {
	color: #fff;
	background-color: #e74c3c;
	border-color: #e74c3c;
}

.panel-footer {
	padding: 10px 15px;
	background-color: white;
	border-top: 1px solid #ddd;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
}

.panel-footer li a {
	color: #e74c3c;
}

.panel panel-primary {
	float: left;
}

.pagination {
	width: 650px;
}

.list-group li {
	text-align: left;
}

.row {
	width: 700px;
	left: 50px;
}

.col-xs-offset-3 {
	margin-left: 0%;
	max-width: 600px;
}

.col-xs-6 {
	width: 100%;
}
</style>






<div class="body">




	<!-- 여기 부분이 실질적으로 코딩하는 부분입니다~~~ div의 테두리는 지금 보기 편하기 위한 부분이고, 나중에 지울껍니다~~ -->
	<div>
		<br />
		<div style="border: 1px solid red; width: 50%; float: left;">

			<div class="monthly" id="mycalendar"></div>
			<!-- 캘린더script -->
			<script type="text/javascript" src="/calendar-js/monthly.js"></script>
			<script type="text/javascript">
				var sampleEvents = {
					"monthly" : [ {
						"id" : 1,
						"name" : "Whole month event",
						"startdate" : "2016-10-01",
						"enddate" : "2016-10-31",
						"starttime" : "12:00",
						"endtime" : "2:00",
						"color" : "#99CCCC",
						"url" : ""
					}, {
						"id" : 2,
						"name" : "Test encompasses month",
						"startdate" : "2016-10-29",
						"enddate" : "2016-12-02",
						"starttime" : "12:00",
						"endtime" : "2:00",
						"color" : "#CC99CC",
						"url" : ""
					}, {
						"id" : 3,
						"name" : "Test single day",
						"startdate" : "2016-11-04",
						"enddate" : "",
						"starttime" : "",
						"endtime" : "",
						"color" : "#666699",
						"url" : "https://www.google.com/"
					}, {
						"id" : 8,
						"name" : "Test single day",
						"startdate" : "2016-11-05",
						"enddate" : "",
						"starttime" : "",
						"endtime" : "",
						"color" : "#666699",
						"url" : "https://www.google.com/"
					}, {
						"id" : 4,
						"name" : "Test single day with time",
						"startdate" : "2016-11-07",
						"enddate" : "",
						"starttime" : "12:00",
						"endtime" : "02:00",
						"color" : "#996666",
						"url" : ""
					}, {
						"id" : 5,
						"name" : "Test splits month",
						"startdate" : "2016-11-25",
						"enddate" : "2016-12-04",
						"starttime" : "",
						"endtime" : "",
						"color" : "#999999",
						"url" : ""
					}, {
						"id" : 6,
						"name" : "Test events on same day",
						"startdate" : "2016-11-25",
						"enddate" : "",
						"starttime" : "",
						"endtime" : "",
						"color" : "#99CC99",
						"url" : ""
					}, {
						"id" : 7,
						"name" : "Test events on same day",
						"startdate" : "2016-11-25",
						"enddate" : "",
						"starttime" : "",
						"endtime" : "",
						"color" : "#669966",
						"url" : ""
					}, {
						"id" : 9,
						"name" : "Test events on same day",
						"startdate" : "2016-11-25",
						"enddate" : "",
						"starttime" : "",
						"endtime" : "",
						"color" : "#999966",
						"url" : ""
					} ]
				};

				$(window).load(function() {
					$('#mycalendar').monthly({
						mode : 'event',
						dataType : 'json',
						events : sampleEvents
					});
				});
			</script>
		</div>
		<div>
			<!-- 테이블 리스트 코딩 부분 -->

			<!-- 	<div class="jquery-script-clear"></div>
 -->
			<div class="row" style="float: right">
				<div id="firstTable" class="col-sm-6 col-sm-offset-3"></div>

				<div class="col-xs-6 col-xs-offset-3">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">접수대기자</h3>
						</div>
						<ul class="list-group">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/calendar-js/paginathing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(
				function($) {
					for (var i = 1; i <= 150; i++) {
						$('.list-group').append(
								'<li class="list-group-item"> 접수자 ' + i
										+ '</li>');
					}

					$('.list-group').paginathing({
						perPage : 5,
						limitPagination : 9,
						containerClass : 'panel-footer'
					})

					$('.table tbody').paginathing({
						perPage : 2,
						insertAfter : '.table'
					});
				});
	</script>

	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
		_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>

</div>


