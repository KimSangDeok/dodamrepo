<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- <link rel="stylesheet" href="/css/book/css/bbs.css" type="text/css"> -->
<!-- 작은데이터피커-->
<link href="/css/book/smalldatepicker/smallDatestyle.css" rel="stylesheet" type="text/css">
<link href="/css/book/smalldatepicker/smallcalendar.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.min.js"></script>
<script src="/css/book/smalldatepicker/es5.js"></script>
<!-- 작은데이터피커끝-->
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


<div class="body">
<div id="contents" style="padding-top:10px">      
	<h1>스케줄 현황</h1>
		<div style="float:left;margin-left:500px;margin-bottom:20px">
			<!-- 작은달력 화면 -->
				<div class="form-row">
				<label for="singleDateRange">Single mode</label>
				<input type="text" placeholder="Date picker" id="singleDateRange"><div class="dt"><div class="dt__wrapper"><div class="dt__calendar dt__start"><div class="dt__calendar_head"><div class="dt__calendar_head_wday">Sunday</div><div class="dt__calendar_head_month"><i class="prev">&lt;</i><span>June</span><i class="next">&gt;</i></div><div class="dt__calendar_head_day">25</div><div class="dt__calendar_head_year"><i class="prev">&lt;</i>2017<i class="next">&gt;</i></div></div><div class="dt__calendar_nav"><div class="dt__calendar_nav_title">Jun 2017</div></div><div class="dt__calendar_start"><div class="dt__calendar_m"><div class="dt__calendar_m_w"><div class="dt__calendar_m_w_n">Su</div><div class="dt__calendar_m_w_n">Mo</div><div class="dt__calendar_m_w_n">Tu</div><div class="dt__calendar_m_w_n">We</div><div class="dt__calendar_m_w_n">Th</div><div class="dt__calendar_m_w_n">Fr</div><div class="dt__calendar_m_w_n">Sa</div></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d ">1</div><div class="dt__calendar_m_d ">2</div><div class="dt__calendar_m_d ">3</div><div class="dt__calendar_m_d ">4</div><div class="dt__calendar_m_d ">5</div><div class="dt__calendar_m_d ">6</div><div class="dt__calendar_m_d ">7</div><div class="dt__calendar_m_d ">8</div><div class="dt__calendar_m_d ">9</div><div class="dt__calendar_m_d ">10</div><div class="dt__calendar_m_d ">11</div><div class="dt__calendar_m_d ">12</div><div class="dt__calendar_m_d ">13</div><div class="dt__calendar_m_d ">14</div><div class="dt__calendar_m_d ">15</div><div class="dt__calendar_m_d ">16</div><div class="dt__calendar_m_d ">17</div><div class="dt__calendar_m_d ">18</div><div class="dt__calendar_m_d ">19</div><div class="dt__calendar_m_d ">20</div><div class="dt__calendar_m_d ">21</div><div class="dt__calendar_m_d ">22</div><div class="dt__calendar_m_d ">23</div><div class="dt__calendar_m_d ">24</div><div class="dt__calendar_m_d active">25</div><div class="dt__calendar_m_d ">26</div><div class="dt__calendar_m_d ">27</div><div class="dt__calendar_m_d ">28</div><div class="dt__calendar_m_d ">29</div><div class="dt__calendar_m_d ">30</div></div></div></div></div></div>
				</div>	        
			<!-- 작은달력 화면 끝 -->
		</div>		
		<p class="cho2" style="padding-top:20px">
				<img src="/css/book/bookimage/o.gif"> 예약불가 &nbsp;&nbsp;&nbsp;&nbsp;
				<img src="/css/book/bookimage/x.gif"> 예약가능
				
		</p>    
      <div id="c_contact" style="margin-top:30px">
		<div style="width: 1000px;overflow-x: auto;margin: auto;">
			<table class="table_booking" style="width: 1680px;">				
						<tbody>
<!-- 담당자-->
						<tr>
							<th width="80px">진료시작시간</th>						
								<th style="width: 100px;">D_황선화</th>							
								<th style="width: 100px;">D_김우석</th>							
								<th style="width: 100px;">D_선민정</th>							
								<th style="width: 100px;">D_김상덕</th>							
								<th style="width: 100px;">D_백선미</th>							
								<th style="width: 100px;">B_방민주</th>						
								<th style="width: 100px;">B_이도희</th>							
						</tr>
<!-- 9시-->					
						<tr>
							<td class="listCenter" nowrap="">9:00</td>						
								<td style="background-color: #29eede;"></td>						
								<td style="background-color: #29eede;"></td>						
								<td style="background-color: #29eede;"></td>						
								<td></td>					
								<td></td>						
								<td style="background-color: #29eede;"></td>						
								<td style="background-color: #29eede;"></td>
						</tr>
<!--10시-->
						<tr>
							<td class="listCenter" nowrap="">10:00</td>						
								<td></td>						
								<td></td>						
								<td style="background-color: #29eede;"></td>						
								<td style="background-color: #29eede;"></td>					
								<td></td>						
								<td style="background-color: #29eede;"></td>						
								<td></td>
						</tr>
<!--11시-->
						<tr>
							<td class="listCenter" nowrap="">11:00</td>						
								<td style="background-color: #29eede;"></td>						
								<td style="background-color: #29eede;"></td>						
								<td></td>						
								<td></td>					
								<td></td>						
								<td style="background-color: #29eede;"></td>						
								<td></td>
						</tr>
<!--12시-->
						<tr>
							<td class="listCenter" nowrap="">12:00</td>						
								<td style="background-color: #29eede;"></td>						
								<td style="background-color: #29eede;"></td>						
								<td style="background-color: #29eede;"></td>						
								<td style="background-color: #29eede;"></td>					
								<td style="background-color: #29eede;"></td>						
								<td style="background-color: #29eede;"></td>						
								<td style="background-color: #29eede;"></td>
						</tr>						
<!--13시-->
						<tr>
							<td class="listCenter" nowrap="">13:00</td>						
								<td></td>						
								<td></td>						
								<td></td>						
								<td></td>					
								<td></td>						
								<td></td>						
								<td></td>
						</tr>									
<!--14시-->
						<tr>
							<td class="listCenter" nowrap="">14:00</td>						
								<td></td>						
								<td></td>						
								<td></td>						
								<td></td>					
								<td></td>						
								<td></td>						
								<td></td>
						</tr>
<!--15시-->
						<tr>
							<td class="listCenter" nowrap="">15:00</td>						
								<td></td>						
								<td></td>						
								<td></td>						
								<td></td>					
								<td></td>						
								<td></td>						
								<td></td>
						</tr>
<!--16시-->
						<tr>
							<td class="listCenter" nowrap="">16:00</td>						
								<td></td>						
								<td></td>						
								<td></td>						
								<td></td>					
								<td></td>						
								<td></td>						
								<td></td>
						</tr>
<!--17시-->
						<tr>
							<td class="listCenter" nowrap="">17:00</td>						
								<td></td>						
								<td></td>						
								<td></td>						
								<td></td>					
								<td></td>						
								<td></td>						
								<td></td>
						</tr>
<!--18시-->
						<tr>
							<td class="listCenter" nowrap="">18:00</td>						
								<td></td>						
								<td></td>						
								<td></td>						
								<td></td>					
								<td></td>						
								<td></td>						
								<td></td>
						</tr>
<!--19시-->
						<tr>
							<td class="listCenter" nowrap="">19:00</td>						
								<td></td>						
								<td></td>						
								<td></td>						
								<td></td>					
								<td></td>						
								<td></td>						
								<td></td>
						</tr>						
<!--20시-->
						<tr>
							<td class="listCenter" nowrap="">20:00</td>						
								<td></td>						
								<td></td>						
								<td></td>						
								<td></td>					
								<td></td>						
								<td></td>						
								<td></td>
						</tr>						
<!--21시-->
						<tr>
							<td class="listCenter" nowrap="">21:00</td>						
								<td></td>						
								<td></td>						
								<td></td>						
								<td></td>					
								<td></td>						
								<td></td>						
								<td></td>
						</tr>			
			</tbody></table>
		</div>


      </div>
   </div>

<script>
$(function(){
    $('#singleDateRange').DatePicker({
        startDate: moment()
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


</div>
