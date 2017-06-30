<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- 테이블부분-->
<link rel="stylesheet" href="/css/goodsbootstrap.css">
<script src="/goodsexcel/src/jquery.table2excel.js"></script>
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"rel="stylesheet" type="text/css">
<!-- 테이블부분 끝-->
<!-- 팝업 시작-->
<script src="/js/jquery.goods-popitup.js"></script>
<!-- 팝업끝-->
<!-- 왼쪽 사이드바부분 -->
<link rel="stylesheet" type="text/css" href="/css/goods/leftsidestyle.css" />
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css' />
<script type="text/javascript" src="/css/goods/modernizr.custom.79639.js"></script>
<noscript><link rel="stylesheet" type="text/css" href="/css/goods/noJS.css" /></noscript> 
<!-- 왼쪽 사이드바부분 끝 -->

<!-- 작은데이터피커-->
<link href="/css/book/smalldatepicker/smallDatestyle.css" rel="stylesheet" type="text/css">
<link href="/css/book/smalldatepicker/smallcalendar.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.min.js"></script>
<script src="/css/book/smalldatepicker/es5.js"></script>
<!-- 작은데이터피커끝-->


<!-- 스타일 -->
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
	display: none;
	border: 1px solid #ccc;
	background: #fff;
	border-radius: 5px;
	box-shadow: 0px 0px 6px 2px #ccc;
}

.popit-content {
	padding: 20px;
}

.popit-header {
	border-bottom: 1px solid #ccc;
}

.popit-body {
	padding: 20px 0;
	width: 900px;
	height: 700px;
	position: relative;
	overflow: hidden;
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

.margin-top-20 {
	margin-top: 20px;
}

.list-group-item {
	border: 0;
}

.goodsitem {
	/*       	width:500px; */
	height: 20px;
	vertical-align: middle;
	/*       	background-color:yellow; */
	margin: 5px;
	margin-top: 15px;
	font-family: Arial;
	float: left;
	padding-left: 20px;
/* 	display: inline-block; */
}

.popit-wrapper .popit-wrapper-chase{
	display: block;
    position: absolute;
    opacity: 1;
    z-index: 99999;
    margin-top: -201px;
    margin-left: 200px;
    padding: inherit;
}
td{
text-overflow;
}

</style>


<!-- 바디 시작 -->
<div class="body">
		
			

<!-- 여기 부분이 실질적으로 코딩하는 부분입니다~~~ div의 테두리는 지금 보기 편하기 위한 부분이고, 나중에 지울껍니다~~ -->
<div >
<!-- 가운데 구분 줄 -->    	
    	<div class="hr1"  style="margin-top:50px"></div>
<!-- goods화면의 sidemenu 시작-->
<div>
<div style="float:left">
<!-- <span> -->
					
					<section class="main">
						<div class="wrapper-demo">
							<div id="dd" class="wrapper-dropdown-3" tabindex="1">
								<span>재고현황</span>
								<ul class="dropdown">
									<li><a href="/goods/goodsShow.dodam">재고현황</a></li>
									<li><a href="/goods/goodsHistory.dodam">입출고내역</a></li>
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
//////////////////////////////////왼쪽 사이드바 페이지 전환 부분/////////////////////////
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
<!-- goods화면의 sidemenu 끝 -->	
</div>		

<!-- 테이블 div-->
<div style="float:left;padding-left:50px;">
    <h1>재고현황</h1>
	     <form class="forms" method="get" action="#">
<!-- 재고 검색 텍스트 및 버튼  begin-->
    		<div style="float:left;padding-top:20px;padding-right:20px">				
					<div style="float:left;padding-right:10px">
	        		<input type="text" id="goodsSearch" name="goods_name" value="" placeholder="품목명 (ex)장~,장난~,장난감"class="goods-input">
	        		</div>
	        		<div style="float:left">
	       			<button type="button" id ="btnsearch"class="btn btn-danger">검색</button>
	       			</div>
	       </form>
    		</div>
<!-- 상품추가버튼-->
	 <div class="row margin-top-20" style="float:right; padding-right:20px;padding-bottom:15px">        
            <a class="btn btn-sm btn-primary btn-chase" href="javascript:void(0);" role="button">상품추가</a>            
      </div>
<!-- 상품추가버튼 끝 -->

<!-- 팝업열리는 부분 -->
<div class="popit-wrapper popit-wrapper-chase">
        <div class="popit-content">
          <div class="popit-header">
            <button type="button" class="popitup-close close">
            <span class="glyphicon glyphicon-remove-circle"></span>
            </button>
            <h4 class="popit-title">도담도담-상품추가/편집</h4>
          </div>
<!-- 팝업창 바디부분 -->
		<form id="formgoods" method="post" action="/goods/goodsInsert.dodam">
          <div class="popit-body" id="bodycontainer">
            <div class="content-wrapper">
<!--용도 -->
				<div class="goodsitem">
            		<div style="float:left">
            			<label>용도</label>
            		</div>
            		<div style="float:left; padding-left:48px">
            			<select id="goods_use" name="goods_use">
            				<option></option>
		    				<option>동물의약품</option>
		    				<option>의약외품</option>
			    		</select>
            		</div>
            	</div>


            	
<!-- 상품구분 -->
            	<div class="goodsitem">
            		<div style="float:left">
            			<label>상품구분</label>
            		</div>
            		<div style="float:left; padding-left:20px">
            			<select id="goods_type" name="goods_type">
						<!--옵션이 append되어서 들어올 부분 -->
			    		</select>
            		</div>
            	</div>
<!--품목명 -->
            	 <div class="goodsitem">
            		<div style="float:left">
            			<label>품목명</label>
            		</div>
            		<div style="float:left; padding-left:34px;display:block" id="goodsnamediv1">
            			<input type="text" id="medisearchtxt" name="medisearchtxt" style="width:150px;"/>
            		</div>
            		<div style="float:left; padding-left:34px;display:none" id="goodsnamediv2">
            			<input type="text" id="goodsnametxt" name="goods_name" style="width:150px;"/>
            		</div>
            		<div style="float:left; padding-left:10px;display:block" id="goodsnamediv3">
            			<button type="button" id ="mediSearch"class="btn btn-info" style="font-size:10px">검색</button>
            		</div>
            	</div>            	
<!-- 입고가격 -->
            	<div class="goodsitem">
            		<div style="float:left">
            			<label>입고가격</label>
            		</div>
            		<div style="float:left; padding-left:48px">
            			<input type="text" id="goods_price_in" name="goods_price_in" style="width:150px;"/>
            		</div>
            	</div>
  <!-- 판매가격 -->          	
            	<div class="goodsitem">
            		<div style="float:left">
            			<label>판매가격</label>
            		</div>
            		<div style="float:left; padding-left:48px">
            			<input type="text" id="goods_price_out" name="goods_price_out" style="width:150px;"/>
            		</div>
            	</div>
            	
<!-- 입고날짜 -->
            	<div class="goodsitem">
            		<div style="float:left">
            			<label>입고날짜</label>
            		</div>
            		<!-- 작은달력 화면 -->
				<div class="form-row">
				<input type="text" placeholder="Date picker" id="singleDateRange" name="goods_date"><div class="dt"><div class="dt__wrapper"><div class="dt__calendar dt__start"><div class="dt__calendar_head"><div class="dt__calendar_head_wday">Sunday</div><div class="dt__calendar_head_month"><i class="prev">&lt;</i><span>June</span><i class="next">&gt;</i></div><div class="dt__calendar_head_day">25</div><div class="dt__calendar_head_year"><i class="prev">&lt;</i>2017<i class="next">&gt;</i></div></div><div class="dt__calendar_nav"><div class="dt__calendar_nav_title">Jun 2017</div></div><div class="dt__calendar_start"><div class="dt__calendar_m"><div class="dt__calendar_m_w"><div class="dt__calendar_m_w_n">Su</div><div class="dt__calendar_m_w_n">Mo</div><div class="dt__calendar_m_w_n">Tu</div><div class="dt__calendar_m_w_n">We</div><div class="dt__calendar_m_w_n">Th</div><div class="dt__calendar_m_w_n">Fr</div><div class="dt__calendar_m_w_n">Sa</div></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d ">1</div><div class="dt__calendar_m_d ">2</div><div class="dt__calendar_m_d ">3</div><div class="dt__calendar_m_d ">4</div><div class="dt__calendar_m_d ">5</div><div class="dt__calendar_m_d ">6</div><div class="dt__calendar_m_d ">7</div><div class="dt__calendar_m_d ">8</div><div class="dt__calendar_m_d ">9</div><div class="dt__calendar_m_d ">10</div><div class="dt__calendar_m_d ">11</div><div class="dt__calendar_m_d ">12</div><div class="dt__calendar_m_d ">13</div><div class="dt__calendar_m_d ">14</div><div class="dt__calendar_m_d ">15</div><div class="dt__calendar_m_d ">16</div><div class="dt__calendar_m_d ">17</div><div class="dt__calendar_m_d ">18</div><div class="dt__calendar_m_d ">19</div><div class="dt__calendar_m_d ">20</div><div class="dt__calendar_m_d ">21</div><div class="dt__calendar_m_d ">22</div><div class="dt__calendar_m_d ">23</div><div class="dt__calendar_m_d ">24</div><div class="dt__calendar_m_d active">25</div><div class="dt__calendar_m_d ">26</div><div class="dt__calendar_m_d ">27</div><div class="dt__calendar_m_d ">28</div><div class="dt__calendar_m_d ">29</div><div class="dt__calendar_m_d ">30</div></div></div></div></div></div>
				</div>	        
			<!-- 작은달력 화면 끝 -->
            	</div> 
<!-- 수량 -->
            	<div class="goodsitem" style="margin-bottom:20px">
            		<div style="float:left">
            			<label>수량</label>
            		</div>
            		<div style="float:left; padding-left:48px">
            			<input type="text" id="goods_count" name="goods_count" style="width:150px;"/>
            		</div>
            	</div>             	             	
    <div style="width:100%; height:500px; overflow:scroll">
    <table class="table" id="meditable">
      <thead>
        <tr class="noExl">
          <th>품목명</th>
          <th>용도</th>
          <th>성분명(국문)</th>
          <th>성분명(영문)</th>
          <th>업체명</th>
        </tr>
      </thead>
      <tbody id="meditbody">
<!--append 되어서 들어올 부분 -->
    </tbody>
    	</table>
    	</div>           	           	            	
            </div>
          </div>        
<!-- 팝업창 바디 끝 -->
          <div class="popit-footer" style="float:right">
            <button type="button" class="btn btn-default popitup-close">취소</button>
            <button type="button" id="btninsert" class="btn btn-primary">등록</button>
          </div>
          </form>
        </div>
</div>

<!-- 팝업열리는 부분 끝-->
	   			
    	</div>
<!-- 가운데 구분 줄 -->    	
    	<div class="hr1"></div>

<!-- 테이블 시작 -->
	<table class="table" id="table2excel">
      <thead>
        <tr class="">
          <th>구분</th>
          <th>품목명</th>
          <th>용도</th>
          <th>입고가격</th>
          <th>판매가격</th>
          <th>입고날짜</th>
          <th>수량</th>
        </tr>
      </thead>
      <tbody id="tbody">  
   <c:choose>
   	<c:when test="${goodslist eq null}">
   		<tr>
   			<td colspan="7">등록된 재고가 없습니다.</td>
   		</tr>
   	</c:when>
    <c:otherwise>    	
    	<c:forEach items="${goodslist}" var="a">
    		<tr class="danger">     			   			    						
    			<td>${a.goods_type}</td>
    			<td>${a.goods_name}</td>
    			<td>${a.goods_use}</td>
    			<td>${a.goods_price_in}</td>
    			<td>${a.goods_price_out}</td>
    			<td>${a.goods_date}</td>
    			<td>${a.goods_count}</td>   			
    		</tr>
    	</c:forEach>   	
    </c:otherwise>
   </c:choose>   
      </tbody>
    </table>
    	<div style="float:right">
        <button id="btnexport"class="btn btn-success">Export</button>
        </div>
</div>
<!-- 테이블 div 끝 -->



</div>






	


<!-- 이벤트 스크립트 -->
<script>			
			$(function() {
// 		엑셀로 export부분		
				$("#btnexport").click(function(){
				$("#table2excel").table2excel({
					exclude: ".noExl",
    				name: "Excel Document Name"
				}); 
				 });
				
// 			상품추가 제이쿼리(팝업열리는 쿼리)
				 $('.btn-sm').bind('click', function(){				        
				        if($(this).hasClass('btn-chase')){
				          $('.popit-wrapper-chase').popitup({
				            chase: false
				          });
				        }				        
				      });	
				      
//			상품 검색 부분				      
			$('#btnsearch').click(function(){
				var count = 0;
				$.ajax({
					type:'get',
					async:true,
					url:'/goods/goodsSearch.dodam',
					contentType:'application/x-www-form-urlencoded;charset=UTF-8',
					data:"goodsSearch="+$('#goodsSearch').val(),
					dataType : "json",
					success:function(list){
						alert((list[0]).goods_type);
						var i;

						for (i in list) {
						    if (list.hasOwnProperty(i)) {
						        count++;
						    }
						}
						$("#tbody").text('');
						alert(count);
				for(var i = 0; i<count; i++){						
					$("#tbody").append(
						"<tr class='danger'>"
						+"<td>"+(list[i]).goods_type+"</td>"
						+"<td>"+ (list[i]).goods_name +"</td>" 
						+ "<td>"+(list[i]).goods_use +"</td>"
						+ "<td>"+ (list[i]).goods_price_in +"</td>"
						+ "<td>"+ (list[i]).goods_price_out +"</td>"
						+ "<td>"+(list[i]).goods_date +"</td>"
						+ "<td>"+ (list[i]).goods_count +"</td>"
						+ "</tr>"
					);
				}
					},
					error:function(request, status,error){
			             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			         }
			    
				});
			});	

//			용도셀렉트박스 선택하는 옵션
			$("#goods_use").change(function(){
				if($("#goods_use").val() == "동물의약품"){
					$("#goods_type option").remove();
					$("#goods_type").append("<option>의약품</option>");
				}else if($("#goods_use").val() == "의약외품"){
					$("#goods_type option").remove();
					$("#goods_type").append("<option>식품</option>");
					$("#goods_type").append("<option>물품</option>");
					$("#goodsnamediv2").show();
					$("#goodsnamediv1").hide();
					$("#goodsnamediv3").hide();
				}
			});
			
			
			//입고날짜 달력 열리는 부분
			$('#singleDateRange').DatePicker({
		        startDate: moment()
		    });
			
			//품목 검색버튼 이벤트
			$("#mediSearch").click(function(){
				
				if($('#medisearchtxt').val()==""){
					alert("품목명을 입력하세요");
				}else{				
				var count = 0;
				$.ajax({
					type:'get',
					async:true,
					url:'/goods/goodsMediSearch.dodam',
					contentType:'application/x-www-form-urlencoded;charset=UTF-8',
					data:"medisearchtxt="+$('#medisearchtxt').val(),
					dataType : "json",
					success:function(list){
						var i;

						for (i in list) {
						    if (list.hasOwnProperty(i)) {
						        count++;
						    }
						}
						$("#meditbody").text('');
				for(var i = 0; i<count; i++){						
					$("#meditable").append(
						"<tr class='danger' id='medigoods' onclick='javascript:trclick(this)'>"
						+"<td><input type='radio' id='mediradio' name='goods_name' value='"+(list[i]).medi_name+"'/>"+(list[i]).medi_name +"</td>"
						+"<td>"+ (list[i]).medi_use +"</td>" 
						+"<td>"+ (list[i]).medi_componentkor +"</td>"
						+"<td>"+ (list[i]).medi_componenteng +"</td>"
						+"<td>"+(list[i]).medi_company +"</td>"						
						+"</tr>"
					);
				}
					},
					error:function(request, status,error){
			             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			         }
			    
				});
				}
			});
				
			
			$("#btninsert").click(function(){
			    if($("#goods_use").val()==""){alert("용도를 선택해 주세요");return;}
			    else if($("#goods_type").val()==""){alert("상품구분을 선택해 주세요");return;}
			    else if($("#medi_radio").val()==""){alert("품목을 선택해 주세요");return;}
			    else if($("#goods_price_in").val()==""){alert("입고가격을 입력해 주세요");return;}
			    else if($("#goods_price_out").val()==""){alert("판매가격을 입력해 주세요");return;}
			    else if($("#goods_count").val()==""){alert("수량을 입력해 주세요");return;}
			    else if($("#goods_date").val()==""){alert("입고날짜를 선택해 주세요");return;}
			    else{$("#formgoods").submit();}
			});

			
			
			
			
				});
			//상품추가에서 행을 누르면 라디오 버튼 체크
			function trclick(elem){

			}
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
</div>
