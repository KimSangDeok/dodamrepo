<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- 달력부분 -->
<!-- <script src='/fullcal/lib/jquery.js'></script> -->
<link href='/fullcal/fullcalendar.css' rel='stylesheet'/>
<link href='/fullcal/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='/fullcal/lib/moment.min.js'></script>

<script src='/fullcal/fullcalendar.js'></script>
<!-- 리스트부분 -->
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/reservationCss/bootstrap.css">
<script type="text/javascript" src="/js/paginathing.js"></script>
<!-- 리스트끝 -->
<script>

	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultDate: '2017-05-12',
			navLinks: true, // can click day/week names to navigate views
			selectable: true,
			selectHelper: true,
			select: function(start, end) {
				var title = prompt('Event Title:');
				var eventData;
				if (title) {
					eventData = {
						title: title,
						start: start,
						end: end
					};
					$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
				}
				$('#calendar').fullCalendar('unselect');
			},
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2017-05-01'
				},
				{
					title: 'Long Event',
					start: '2017-05-07',
					end: '2017-05-10'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-05-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-05-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2017-05-11',
					end: '2017-05-13'
				},
				{
					title: 'Meeting',
					start: '2017-05-12T10:30:00',
					end: '2017-05-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2017-05-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2017-05-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2017-05-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2017-05-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2017-05-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2017-05-28'
				}
			]
		});
		
	});

</script>
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}
	
	table tbody tr:nth-child(2n + 1) {
    background-color: #fff;
}

	.fc-rigid{
	height:100px;
	}

</style>
<!-- 달력끝 -->

<!-- 테이블 리스트 스타일 -->


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
	float: right;
	padding-left:50px;
	padding-top:50px
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
	<div style="padding-top:50px;margin-bottom:100px;">
			<!--달력시작 -->
		<div style="float:left;padding-left:30px;padding-bottom:150px">
				<div id='calendar' style="float:left;width:50%"></div>
			<!--달력 끝 -->	
			<!-- 테이블 리스트 코딩 부분 -->

			<div class="row" style="float:left;width:50%">
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


