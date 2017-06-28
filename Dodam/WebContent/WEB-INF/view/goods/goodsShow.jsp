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
<script src="/js/jquery.popitup.js"></script>
<!-- 팝업끝-->
<!-- 왼쪽 사이드바부분 -->
<link rel="stylesheet" type="text/css" href="/css/goods/leftsidestyle.css" />
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css' />
<script type="text/javascript" src="/css/goods/modernizr.custom.79639.js"></script>
<noscript><link rel="stylesheet" type="text/css" href="/css/goods/noJS.css" /></noscript> 
<!-- 왼쪽 사이드바부분 끝 -->

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
	width: 300px;
	height: 300px;
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
	        		<input type="text" id="goodsSearch" name="goods_name" value="" class="goods-input">
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
<div class="popit-wrapper popit-wrapper-chase" style="left: 0px; opacity: 0;">
        <div class="popit-content">
          <div class="popit-header">
            <button type="button" class="popitup-close close">
            <span class="glyphicon glyphicon-remove-circle"></span>
            </button>
            <h4 class="popit-title">도담도담-상품추가/편집</h4>
          </div>
<!-- 팝업창 바디부분 -->
          <div class="popit-body" id="bodycontainer">
            <div class="content-wrapper">
<!--1번줄 -->
            	<div class="goodsitem">
            		<div style="float:left">
            			<label>상품구분</label>
            		</div>
            		<div style="float:left; padding-left:20px">
            			<select>
			    			<option></option>
			    			<option>의약품</option>
			    			<option>식품</option>
			    			<option>물품</option>
			    		</select>
            		</div>
            	</div>
<!-- 2번줄 -->
            	<div class="goodsitem">
            		<div style="float:left">
            			<label>품목명</label>
            		</div>
            		<div style="float:left; padding-left:34px">
            			<input type="text" style="width:150px;"/>
            		</div>
            	</div> 
<!--3번줄 -->
            	<div class="goodsitem">
            		<div style="float:left">
            			<label>용도</label>
            		</div>
            		<div style="float:left; padding-left:48px">
            			<select>
			    			<option></option>
		    				<option>동물의약품</option>
		    				<option>의약외품</option>
			    		</select>
            		</div>
            	</div>            	
<!-- 4번줄 -->
            	<div class="goodsitem">
            		<div style="float:left">
            			<label>가격</label>
            		</div>
            		<div style="float:left; padding-left:48px">
            			<input type="text" style="width:150px;"/>
            		</div>
            	</div>
<!-- 5번줄 -->
            	<div class="goodsitem">
            		<div style="float:left">
            			<label>입고날짜</label>
            		</div>
            		<div style="float:left; padding-left:18px">
            			<input type="text" style="width:150px;"/>
            		</div>
            	</div> 
<!-- 6번줄 -->
            	<div class="goodsitem">
            		<div style="float:left">
            			<label>수량</label>
            		</div>
            		<div style="float:left; padding-left:48px">
            			<input type="text" style="width:150px;"/>
            		</div>
            	</div>             	             	
            	           	            	
            </div>
          </div>
<!-- 팝업창 바디 끝 -->
          <div class="popit-footer" style="float:right">
            <button type="button" class="btn btn-default popitup-close">취소</button>
            <button type="button" class="btn btn-primary">등록</button>
          </div>
        </div>
</div>

<!-- 팝업열리는 부분 끝-->
	   			
    	</div>
<!-- 가운데 구분 줄 -->    	
    	<div class="hr1"></div>

<!-- 테이블 시작 -->
	<table class="table" id="table2excel">
      <thead>
        <tr class="noExl">
          <th>구분</th>
          <th>품목명</th>
          <th>용도</th>
          <th>가격</th>
          <th>입고날짜</th>
          <th>수량</th>
        </tr>
      </thead>
      <tbody id="tbody">  
   <c:choose>
   	<c:when test="${goodslist eq null}">
   		<tr>
   			<td colspan="6">등록된 재고가 없습니다.</td>
   		</tr>
   	</c:when>
    <c:otherwise>    	
    	<c:forEach items="${goodslist}" var="a">
    		<tr class="danger">     			   			    						
    			<td>${a.goods_type}</td>
    			<td>${a.goods_name}</td>
    			<td>${a.goods_use}</td>
    			<td>${a.goods_price}</td>
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
						
 					$("#tbody").text('');
					$("#table2excel").append(
						"<tr class='danger'>"
						+"<td>"+(list[0]).goods_type+"</td>"
						+"<td>"+ (list[0]).goods_name +"</td>" 
						+ "<td>"+(list[0]).goods_use +"</td>"
						+ "<td>"+ (list[0]).goods_price +"</td>"
						+ "<td>"+(list[0]).goods_date +"</td>"
						+ "<td>"+ (list[0]).goods_count +"</td>"			    							
					);							
					},
					error:function(request, status,error){
			             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			         }
			    
				});
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
</div>
