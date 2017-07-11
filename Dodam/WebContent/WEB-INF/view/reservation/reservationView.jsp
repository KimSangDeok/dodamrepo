<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!-- 툴팁부분 -->
<link rel="stylesheet" type="text/css" href="/tooltipster-master/dist/css/tooltipster.bundle.css" />
<link rel="stylesheet" type="text/css" href="/tooltipster-master/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-punk.min.css" />
<script type="text/javascript" src="/tooltipster-master/dist/js/tooltipster.bundle.js"></script>
<!-- 툴팁부분 끝 -->

<!-- 달력부분 -->
<!-- <script src='/fullcal/lib/jquery.js'></script> -->
<link href='/fullcalendar-2.9.1/fullcalendar.css' rel='stylesheet'/>
<link href='/fullcalendar-2.9.1/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='/fullcalendar-2.9.1/lib/moment.min.js'></script>
<script src='/fullcalendar-2.9.1/fullcalendar.js'></script>
<script src='/fullcalendar-2.9.1/lang-all.js'></script>


<!-- 리스트부분 -->
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/reservationCss/bootstrap.css">
<script type="text/javascript" src="/js/paginathing.js"></script>
<!-- 리스트끝 -->
<!-- popup script -->
<script src="/js/jquery.popitup.js"></script>
<!-- Begin popup css -->
<style type="text/css">

@media ( min-width:768px) {
	#main-nav {
		line-height: 0;
		text-align: center;
	}
	#main-menu {
		display: inline-block;
	}
}

.popit-wrapper {
/* 	height: 90%; */
	display: none;
	border: 1px solid #ccc;
	background: #fff;
	border-radius: 5px;
	box-shadow: 0px 0px 6px 2px #ccc;
}

.popit-content {
/* 	padding: 20px; */
    margin-top: 10px
}

.popit-header {
	border-bottom: 1px solid #ccc;
}

.popit-body {
	padding: 40px 0;
	width: 300px;
	height: 100px;
	position: relative;
	overflow: hidden;
	left: 0px;
}

.popit-body p {
 text-align: right; 
 margin-right: 120px;
 padding-left:50px;
 
}
.popit-footer{ margin-bottom:20px;
}
.popitup-overlay {
	background: #000;
	position: fixed;
	z-index: 9999;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	opacity: 0.5;
}

.margin-top-40 {
	margin-top: 40px;
}

.list-group-item {
	border: 0;
}

#popupCloseBtn{
	height: 0.85em;
}
</style>
<!-- End popup 스타일-->
<style>

	.fc td, .fc th {
    border-style: solid;
    border-width: 1px;
    padding: 0;
    vertical-align: top;
	}

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
	
	.fc-sun{
		color:red;
	}
	.fc-sat{
		color:blue;
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
	max-width: 700px;
}

.col-xs-6 {
	width: 100%;
}
</style>
<style>
.calendar-trash{
    border: 1px red solid;
    width: 100px;
    height: 100px;
    float: right;
    margin-right: 610px;
    }
</style>


<script type="text/javascript">

	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			height: 800,
			header: {
				left: 'prev,next today',
				center: 'title'//,
// 				right: 'month,agendaWeek,agendaDay'
			},
			lang:"ko",
// 			navLinks: true, // can click day/week names to navigate views
			selectHelper: true,
			editable: true,		//드래그 부분
			eventLimit: true, // allow "more" link when too many events
			events: {
	        	url : '/reservation/calendarlist.dodam',
	           	dataType : 'json'	        
	        },
	        eventRender: function(event, element) {
	            element.attr('title', event.tip);
	        },
	        
	        //드래그 이벤트 부분
	        eventDrop:function( event, delta, revertFunc, jsEvent, ui, view ) {
                  var title = event.title.split("(");
                  var firsttime = title[1].split(")");
// 				alert(event.start.toISOString());
                //예약이 가능 한 시간 알려주는 ajax  
                var count = 0;
				$.ajax({
                    	type:'get',
                		async:true,
                		url:'/reservation/possibleReservation.dodam',
                		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
                		data:{"title" : title[0],
								"firsttime" : firsttime[0],
                				"afterdate" : event.start.format()},
                		dataType : "json",
                		success:function(list){
               			
                			var i;

    						for (i in list) {
    						    if (list.hasOwnProperty(i)) {
    						        count++;
    						    }
    						}
    						
    						$("#reservationtime option").each(function(){               					            					
            						$(this).removeAttr("disabled");
            						$(this).css("background-color","");                						            					
            				});
    						
                			for(var i=0; i<count;i++){
                				//이미 예약이 되어있는 시간은 예약 변경을 못하도록 막는 부분
                				$("#reservationtime option").each(function(){               					
                					if($(this).val()==(list[i]).rsvt_time){
                						$(this).attr("disabled","disabled");
                						$(this).css("background-color", "red");                						
                					}
                				});         
                			}
                			//변경할 시간을 설정할 팝업 뜨는 부분
                			$('#Popup').popitup({});
                			//팝업창에서 취소를 누르면 다시 돌아가는 부분
                			$("#popCancel").click(function(){
                                 	revertFunc();
     						});               			
                		}
                				
                    });    
				//hidden값으로 팝업창에 예약 수정할 정보들 넣어주는 부분
				$("#title").val(title[0]);
                $("#firstdate").val(event.start._i);
                $("#laterdate").val(event.start.format());
                $("#firsttime").val(firsttime[0]);
            },//드래그 수정 끝
            
            //드래그 해서 삭제하는 이벤트
            eventDragStop: function(event,jsEvent) {
                if( (1150 < jsEvent.pageX) & (jsEvent.pageX < 1300) & (840 < jsEvent.pageY) & (jsEvent.pageY < 940)){
						 var title = event.title.split("(");
		                 var firsttime = title[1].split(")");
						 if(!confirm("정말 삭제 하시겠습니까?")){
							 return false;
						 }else{
					location.href="/reservation/deleteReservation.dodam?doctor_name="
							+title[0]+"&rsvt_time="+firsttime[0]+"&rsvt_dt="+event.start.format();
						 }
                }
            }//드래그 삭제 끝        	        
		});
		
		//휴지통 툴팁부분
		$("#trashimg").mouseover(function(){
			$("#trashimg").css("cursor","zoom-in");
			$("#trashimg").tooltipster({
			    theme: 'tooltipster-punk'
			});
		});
		
		
		
		
	});

</script>
<script type="text/javascript">

//날짜 클릭하면 그날에 해당하는 리스트를 오늘의 예약현황에 뿌려주는 부분		
function todayclick(elem){
	var todaydate = $(elem).attr("data-date");	//클릭한 날짜 구하기
	
 	$.ajax({
		type:'get',
		async:true,
		url:'/reservation/todayreservation.dodam',
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
		data:"todaydate="+todaydate,
		dataType : "json",
		success:function(list){

			var i;
			var count=0;
			for (i in list) {
			    if (list.hasOwnProperty(i)) {
			        count++;
			    }
			}
			$("#todaytbody").text('');

		for(i=0; i<count; i++){
		$("#todaytbody").append(
		"<tr onclick='todaylistclick(this)' style='cursor:pointer'>"
		+"<td>"+(i+1)+"<input type='text' value='"+(list[i]).animal_num+"' style='display:none'>"+"<td>"
		+"<img src='/images/reservation/"+(list[i]).service_type+".png'/>"
		+ "<td>"+(list[i]).doctor_name +"</td>"
		+ "<td>"+ (list[i]).cus_name +"</td>"
		+ "<td>"+ (list[i]).animal_name +"</td>"
		+ "<td>"+ (list[i]).rsvt_dt+"/"+(list[i]).rsvt_time +"</td>"
		+ "</tr>"
		);
		}
	
		},
		error:function(request, status,error){
             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }

	});
	
}

//더블클릭하면 해당날짜로 예약하기 들어가는 부분
function todaydoubleclick(elem){
	var todaydate = $(elem).attr("data-date");	//클릭한 날짜 구하기
	location.href="/reservation/changepage.dodam?today="+todaydate;
}
//마우스 오버했을 때 예약하기로 들어가라고 알려주는 부분
//(fullcalendar.js에서 'renderNumberCellHtml'를 찾으면 툴팁 내용을 바꿀 수 있음)	
function over(elem){
	 $('.tooltipstered').tooltipster({
		    theme: 'tooltipster-punk'
		});
}	

function todaylistclick(elem){
// 	$(elem).children().eq(2).html();
// 	alert($(elem).children().eq(2).html());
	$.ajax({
		type:'get',
		async:true,
		url:'/reservation/listInfomation.dodam',
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
		data:{"animal_num" : $(elem).find("input").val(),
			"rsvt_dt" : $(elem).children().eq(5).html().split("/")[0],
			"rsvt_time" : $(elem).children().eq(5).html().split("/")[1]},
		dataType : "json",
		success:function(list){

			$("#info_doctor_name").val($(elem).children().eq(2).html());
			$("#info_cusname").val($(elem).children().eq(3).html());
			$("#info_custel").val((list[0]).cus_tel);
			$("#info_animalname").val((list[0]).animal_name);
			$("#info_animalbreed").val((list[0]).animal_breed);		

// 			alert(${animal});
			
		}
	});

}


</script>







<div class="body">
	

	<!-- 여기 부분이 실질적으로 코딩하는 부분입니다~~~ div의 테두리는 지금 보기 편하기 위한 부분이고, 나중에 지울껍니다~~ -->
	
	<div style="padding-top:50px;margin-bottom:100px;">
			<!--달력시작 -->
		<div style="float:left;padding-left:30px;padding-bottom:150px;padding-left:300px">
				<div id='calendar' style="float:left;width:50%"></div>
			<!--달력 끝 -->	
			<!-- 테이블 리스트 코딩 부분 -->

			<div class="row" style="float:left; width:50%;">
				<div id="firstTable" class="col-sm-6 col-sm-offset-3"></div>

				<div class="col-xs-6 col-xs-offset-3">
					<div class="panel panel-primary" style="font-size:20px">
						<div class="panel-heading">
							<h3 class="panel-title">오늘의 예약 현황</h3>
						</div>
<!-- 						<ul class="list-group"> -->
								
<!-- 						</ul> -->
					<div style="height:500px; overflow:scroll">
					<table>
						<thead>
							<th>번호</th>
							<th>구분</th>
							<th>담당자</th>
							<th>보호자</th>
							<th>환자</th>
							<th>날짜/시간</th>
						</thead>
						<tbody id="todaytbody" style="overflow:scroll">
<!-- 여기에 들어와라 -->		
<c:choose>
   	<c:when test="${reservationlist eq null}">
   		<tr>
   			<td colspan="6">등록된 예약이 없습니다.</td>
   		</tr>
   	</c:when>
    <c:otherwise>     
    	<c:set var='i' value='0'/> 	
    	<c:forEach items="${reservationlist}" var="a">

    		<c:set var='i' value='${i+1}'/>
    		<tr class="todaylist" onclick="todaylistclick(this)" style="cursor:pointer">     			   			    						
    			<td>${i}<input type="text" value="${a.animal_num}" style="display:none"></td>
    			<c:choose>
    			<c:when test="${a.service_type eq '진료'}">
    			<td><img src="/images/reservation/진료.png"></td>
    			</c:when>
    			<c:when test="${a.service_type eq '미용'}">
    			<td><img src="/images/reservation/미용.png"></td>
    			</c:when>
    			<c:when test="${a.service_type eq '호텔'}">
    			<td><img src="/images/reservation/호텔.png"></td>
    			</c:when>
    			</c:choose>
    			<td>${a.doctor_name}</td>
    			<td>${a.cus_name}</td>
    			<td>${a.animal_name}</td>		    			  			
    			<td>${a.rsvt_dt}/${a.rsvt_time}</td>		    			  			
    		</tr>
    	</c:forEach>
    </c:otherwise>
</c:choose>   										
						</tbody>
					</table>
					</div>
					</div>
				</div>
			</div>
<!--휴지통 -->
			<div id="calendarTrash" class="calendar-trash"><img id="trashimg" src="/images/reservation/garbage.png" title="일정을 여기에 드래그 하면 삭제 할 수 있어요"/></div>
		
		</div>
	</div>

<!-- Begin 팝업 -->
<form action="/reservation/reserveUpdate.dodam" method="post">
	<div id="Popup" class="popit-wrapper popit-wrapper-chase" style="  left: 0px;opacity: 0;">
		<input type="hidden" id="title" name = "doctor_name" value="">
		<input type="hidden" id="firstdate" name = "firstdate" value="">
		<input type="hidden" id="laterdate" name = "laterdate" value="">
		<input type="hidden" id="firsttime" name = "firsttime" value="">
		
		<div class="popit-content">
			<div class="popit-header">
				<h5>시간변경</h5>
		    </div>
			<div class="popit-body">			
				<p>변경시간
					<select id="reservationtime" name="latertime">
						<c:forEach var="time" begin="9" end="21">
							<option class="reservationtime" value="${time}:00">${time}:00</option>
						</c:forEach>
					</select>
				</p>																
			</div>
		</div>
		<!-- *************************************  -->		
	<!-- End 오른쪽  div -->		
		<!-- Begin 아랫쪽 버튼 -->
		<div class="popit-content" style=" width:70%; height:10% ;  margin-left:15%;">
			<div class="popit-footer" >
				<button type="button" id="popCancel"class="btn btn-default popitup-close">취소</button>
				<button type="submit" class="btn btn-primary">변경하기</button>
			</div>
		</div>
		<!-- End 아랫쪽 버튼 -->
		
	</div>
	</form>
	<!-- End 팝업 -->




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


