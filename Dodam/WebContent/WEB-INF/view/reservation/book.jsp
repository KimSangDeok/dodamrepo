<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- <link rel="stylesheet" href="/css/book/css/bbs.css" type="text/css"> -->
<!-- 작은데이터피커-->
<link href="/css/book/smalldatepicker/smallDatestyle.css" rel="stylesheet" type="text/css">
<link href="/css/book/smalldatepicker/smallcalendar.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.min.js"></script>
<script src="/css/book/smalldatepicker/es5.js"></script>

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
    width: 500px;
    height: 300px;
    position: relative;
    overflow: hidden;
    left: 0px;
    overflow-y: scroll;
}

.popit-body p {
 text-align: right; 
 margin-right: 80px;
 margin-bottom:20px;
 
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


<!-- 작은데이터피커끝 -->
<style>
	table.table_booking td {
    padding: 7px 0 7px 0;
    border-bottom: 1px solid #e5e5e5;
    border-right: 1px solid #e5e5e5;
    text-align: center;
    font-size: 12px;
    color: #777;
    font-family: arial, "나눔고딕", NanumGothic;
	}
</style>

<script>
//예약할 때, 빈칸 누르면 팝업창 뜨는 부분
$(function(){
	//예약가능한 칸에 클릭이벤트
	$('.listCenter').siblings('td').click(function(){ //선택자 중 형제 찾기 
		
		if( $(this).text()!=''){
			return false;
		}else{			
			$('#Popup').popitup({
 				chase : false					
			});
// 			alert($(this).parents().children().eq(0).html());
			$("#popdate").val($("#singleDateRange").val());
			$("#poptime").val($(this).parents().children().eq(0).html());
			
// 			alert("의사"+$(".doctor").children().eq($(this).index()).html());
			//팝업창에 의사이름 지정해주는 부분
			$("#doctor_name").val($(".doctor").children().eq($(this).index()).html());			
// 			alert("내가 누른 인덱스"+$(this).index());
		}
		
// 		$("#poptime").val();
		
	});
	//예약가능한 칸에 포인터 변경 하는 것.
	$('.listCenter').siblings('td').mouseover(function(){
		if( $(this).text()!=''){
			return false;
		}else{			
// 			$(this).attr("style","cursor:pointer");		
			$(this).css("cursor","pointer");		
			
		}
	});
	
	//휴대폰 번호 입력칸에서 엔터키치면 검색해 오는 부분
	 $("input[name=cus_tel]").keydown(function (key) {		 
	        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	            $.ajax({
	            	type:'get',
            		async:true,
            		url:'/reservation/custelSearch.dodam',
            		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
            		data:{"cus_tel" : $("input[name=cus_tel]").val()},
            		dataType : "json",
            		success:function(list){
            			$("#serchcusname").css("display","none");
        				$("#serchaniname").css("display","none");
        				$("input[name=cus_name]").val("");
        				$("#selectanimal").text("");
            			if((list).length==0){
            				$("#serchcusname").html("일치하는 보호자가 없습니다");
            				$("#serchcusname").css("color","red");
            				$("#serchcusname").css("display","block");
            				$("#serchaniname").html("일치하는 동물이 없습니다");
            				$("#serchaniname").css("color","red");
            				$("#serchaniname").css("display","block");
            				$("input[name=cus_tel]").val("");
            			}else{
            			 
            			 $("input[name=cus_name]").val((list[0]).cus_name);
            			 
            			 var i;
            			 var count=0;
            			 for (i in list) {
 						    if (list.hasOwnProperty(i)) {
 						        count++;
 						    }
 						}
            			 for(var i=0; i<count; i++){
            			
            			 $("#selectanimal").append
            			 	(
            					"<option style='' value='"+(list[i]).animal_name+"'>" + (list[i]).animal_name +"</option>"
            				 );
            			 }
            			}
            			}
	            });
	        }	 
	    });
	//팝업창에서 예약버튼 클릭 이벤트
	 $(".btn-primary").click(function(){
		 if($("input[name=cus_tel]").val() == null || $("input[name=cus_name]").val() == null || $("input[name=animal_name]").val()!=null){
			 alert("빈칸을 모두 입력해 주세요");
		 }else{
			 $("#formbook").submit();
		 }
	 });

	
	
});


</script>

<div class="body">
<!-- Begin 팝업 -->
<form id="formbook" action="/reservation/reservInsert.dodam" method="post">
	<div id="Popup" class="popit-wrapper popit-wrapper-chase" style="  left: 0px;opacity: 0;">
		
		<!-- Begin 닫기 버튼 -->
		<div class="popit-content" style=" width:70%; height:5%;">
			<button id="button" type="button" class="popitup-close close" style="background-color: white; margin-left:110%;">
				<span class="glyphicon glyphicon-remove-circle" >close</span>
			</button>
		</div>
		<!-- End 닫기 버튼 -->
		
		<!-- *************************************  -->
		<div class="popit-content">
			<div class="popit-header">
		    </div>
			<div class="popit-body">
			
				<p>담당자 아이디
					<select  id="per_id" class="form-control J_Message" type="text" name="per_id"
					style="back-ground: rgba(229, 179, 179, 0.075);margin-left: 20px;text-align-last: center;width:235px;" placeholder="담당자 아이디">
					<c:forEach var="per_name" items="${perName}">					
							<option class = "${per_name.per_id}" style="width: 100px;" id="${per_name.per_id}" >${per_name.per_id}</option>							
					</c:forEach>
					</select>					
				</p>
				<p>담당자 이름
					<input class="form-control J_Message" type="text" id="doctor_name" name="doctor_name"
					style="back-ground: rgba(229, 179, 179, 0.075);margin-left: 20px;" placeholder="담당자 이름"  readonly="readonly">
				</p>
				<p>휴대폰 번호
					<input class="form-control J_Message" type="text" name="cus_tel"
					style="back-ground: rgba(229, 179, 179, 0.075);margin-left: 20px;" placeholder="휴대폰 번호">
				</p>
				<p>보호자 성함
					<input class="form-control J_Message" type="text" name="cus_name"
					style="back-ground: rgba(229, 179, 179, 0.075);margin-left: 20px;" placeholder="보호자 성함"  readonly="readonly">
					</br>
					<span id="serchcusname" style="dispay:none"></span>
				</p>
				
				<p>동물 이름
					<select id="selectanimal" class="form-control J_Message" type="text" name="animal_name"
					style="back-ground: rgba(229, 179, 179, 0.075);margin-left: 20px;text-align-last: center;width:235px;" placeholder="동물 이름">
						<option></option>
					</select>
					</br>
					<span id="serchaniname" style="dispay:none"></span>
				</p>
				<p>예약날짜
					<input class="form-control J_Message" id="popdate" type="text" name="rsvt_dt"
					value=""style="back-ground: rgba(229, 179, 179, 0.075);margin-left: 20px;" placeholder="예약날짜" readonly="readonly">
				</p>	
				<p>예약시간
				<input class="form-control J_Message" id="poptime" type="text" name="rsvt_time"
					value=""style="back-ground: rgba(229, 179, 179, 0.075);margin-left: 20px;" placeholder="예약시간" readonly="readonly">					
<!-- 						<option value="9:00">9:00</option> -->
<!-- 						<option value="10:00">10:00</option> -->
<!-- 						<option value="11:00">11:00</option> -->
<!-- 						<option value="12:00">12:00</option> -->
<!-- 						<option value="13:00">13:00</option> -->
<!-- 						<option value="14:00">14:00</option> -->
<!-- 						<option value="15:00">15:00</option> -->
<!-- 						<option value="16:00">16:00</option> -->
<!-- 						<option value="17:00">17:00</option> -->
<!-- 						<option value="18:00">18:00</option> -->
<!-- 						<option value="19:00">19:00</option> -->
<!-- 						<option value="20:00">20:00</option> -->
<!-- 						<option value="21:00">21:00</option> -->
<!-- 					</select>	 -->
				</p>	
				<p>서비스분류
					<select name="service_type" class="form-control J_Message" 	style="width:190px;back-ground: rgba(229, 179, 179, 0.075);margin-left: 20px;">
						<option value="미용">미용</option>
						<option value="진료">진료</option>
						<option value="호텔">호텔</option>
					</select>	
				</p>	
												
			</div>
		</div>
		<!-- *************************************  -->
		
	<!-- End 오른쪽  div -->
		
		<!-- Begin 아랫쪽 버튼 -->
		<div class="popit-content" style=" width:70%; height:10% ;  margin-left:15%;">
			<div class="popit-footer" >
				<button type="button" class="btn btn-default popitup-close">취소</button>
				<button type="button" class="btn btn-primary">예약</button>
			</div>
		</div>
		<!-- End 아랫쪽 버튼 -->
		
	</div>
	</form>
	<!-- End 팝업 -->


<div id="contents" style="padding-top:10px">      
	<h1>스케줄 현황</h1>
		<div style="float:left;margin-left:500px;margin-bottom:20px">
			<!-- 작은달력 화면 -->
				<div class="form-row">
				<label for="singleDateRange">날짜선택</label>
				<input type="text" placeholder="Date picker" id="singleDateRange" ><div class="dt"><div class="dt__wrapper"><div class="dt__calendar dt__start"><div class="dt__calendar_head"><div class="dt__calendar_head_wday">Sunday</div><div class="dt__calendar_head_month"><i class="prev">&lt;</i><span>June</span><i class="next">&gt;</i></div><div class="dt__calendar_head_day">25</div><div class="dt__calendar_head_year"><i class="prev">&lt;</i>2017<i class="next">&gt;</i></div></div><div class="dt__calendar_nav"><div class="dt__calendar_nav_title">Jun 2017</div></div><div class="dt__calendar_start"><div class="dt__calendar_m"><div class="dt__calendar_m_w"><div class="dt__calendar_m_w_n">Su</div><div class="dt__calendar_m_w_n">Mo</div><div class="dt__calendar_m_w_n">Tu</div><div class="dt__calendar_m_w_n">We</div><div class="dt__calendar_m_w_n">Th</div><div class="dt__calendar_m_w_n">Fr</div><div class="dt__calendar_m_w_n">Sa</div></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d ">1</div><div class="dt__calendar_m_d ">2</div><div class="dt__calendar_m_d ">3</div><div class="dt__calendar_m_d ">4</div><div class="dt__calendar_m_d ">5</div><div class="dt__calendar_m_d ">6</div><div class="dt__calendar_m_d ">7</div><div class="dt__calendar_m_d ">8</div><div class="dt__calendar_m_d ">9</div><div class="dt__calendar_m_d ">10</div><div class="dt__calendar_m_d ">11</div><div class="dt__calendar_m_d ">12</div><div class="dt__calendar_m_d ">13</div><div class="dt__calendar_m_d ">14</div><div class="dt__calendar_m_d ">15</div><div class="dt__calendar_m_d ">16</div><div class="dt__calendar_m_d ">17</div><div class="dt__calendar_m_d ">18</div><div class="dt__calendar_m_d ">19</div><div class="dt__calendar_m_d ">20</div><div class="dt__calendar_m_d ">21</div><div class="dt__calendar_m_d ">22</div><div class="dt__calendar_m_d ">23</div><div class="dt__calendar_m_d ">24</div><div class="dt__calendar_m_d active">25</div><div class="dt__calendar_m_d ">26</div><div class="dt__calendar_m_d ">27</div><div class="dt__calendar_m_d ">28</div><div class="dt__calendar_m_d ">29</div><div class="dt__calendar_m_d ">30</div></div></div></div></div></div>
				</div>	        
			<!-- 작은달력 화면 끝 -->
		</div>		
		<p class="cho2" style="padding-top:20px">
				<img src="/css/book/bookimage/o.gif"> 예약불가 &nbsp;&nbsp;&nbsp;&nbsp;
				<img src="/css/book/bookimage/x.gif"> 예약가능
				
		</p>    
      <div id="c_contact" style="margin-top:30px">
		<div style="width: 1000px;overflow-x: auto;margin: auto;">
			<table  class="table_booking" style="width: 1680px;">	
			<thead class="bookthead">							
<!-- 담당자-->
					<tr class="doctor">
						<th width="130px" id="doctorname" >진료시작시간</th>	
						<c:forEach var="per_name" items="${perName}">					
							<th class = "${per_name.per_name}" style="width: 100px;" id="${per_name.per_name}" >${per_name.per_name}</th>							
						</c:forEach>				
					</tr>
			</thead>		
				<tbody class="booktbody">
						<c:forEach var="time" begin="9" end="21">
							<tr class="scheduleclass">
								<td class="listCenter">${time}:00</td>
									<c:forEach var="per_name" items="${perName}">
										<td class="reservation"></td>
									</c:forEach>
							</tr>
						</c:forEach>
				</tbody>
			</table>
		</div>


      </div>
   </div>

<script>

	$(function() {
		var temp1 = location.href.split("=");
		var today = temp1[1];
			//예약하기 탭을 눌렀을때 예약페이지로 넘어가는 부분
			if(today==""){
				$('#singleDateRange').DatePicker({
					startDate : moment()
				});
			}else{			
			$('#singleDateRange').DatePicker({	//더블클릭하여 예약하러 들어오는 부분
				startDate : moment(today)
			});
			}
		
			
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

</div>
