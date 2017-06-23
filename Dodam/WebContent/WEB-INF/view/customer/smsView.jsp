<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" type="text/css" href="/manage/style.css" />
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css' />
<link href="/css/goods/smalldatepicker/smallDatestyle.css" rel="stylesheet" type="text/css">

    <link type="text/css" rel="stylesheet" href="/sms/demo.css">
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
   
    <style>
	/* z-index 값이 작을 수록 아래에 깔리고, 높을 수록 위로 나온다. */
	.manage{
		z-index:2;
	}
	.count, .Quantity{
		z-index:1;
	}
	</style>
<script type="text/javascript" src="/manage/modernizr.custom.79639.js"></script>
<link rel="stylesheet" type="text/css" href="/manage/noJS.css" />
<div class="body">
		<div class="wrapper-demo">
			<div id="dd" class="wrapper-dropdown-3" tabindex="1">
				<span>고객관리</span>
				<ul class="dropdown">						
					<li><div id="registerDiv"><a href="#"><i class="icon-envelope icon-large"></i>고객등록</a></div></li>
					<li><a href="/mpay/mpayView2.dodam"><i class="icon-truck icon-large"></i>고객수정</a></li>
					<li><a href="/mpay/mpayView3.dodam"><i class="icon-plane icon-large"></i>고객검색</a></li>
					<li><a href="/customer/smsView.dodam"><i class="icon-plane icon-large"></i>sms 전송</a></li>
				</ul>
			</div>
		​</div>
			
		<!-- start : 고객관리 하부 메뉴 --> 		
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
					$('.wrapper-dropdown-3').removeClass('active');
				});
			});
		</script>
		<!-- end : 고객관리 하부 메뉴 --> 		
			
			
		<!-- sms화면은 div3개로 관리, 1)고객핸드폰번호검색, 2)메세지 보내는 부분, 3)즐겨찾기로 구성 -->

<!-- start 1) 고객 핸드폰 번호 검색 -->
		<div style="border:3px solid pink; width:33%; float:left">
		<section class="content" style="margin:150px auto;">
			<div class="container">
            <h1>고객검색</h1>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-search"></i></span>
					<input class="form-control" id="livesearch" placeholder="아무거나 입력하세요" type="text" />
				</div>
				<table class="table" id="users">
					<tr>
						<th class="hidden-xs">고객 성명</th>
						<th class="hidden-xs">동물 이름</th>
						<th class="hidden-xs">고객 핸드폰번호</th>
					</tr>
					<tr>
						<td>김우석</td><td>연이</td><td>010-1234-5678</td>
					</tr>
					<tr>
						<td>김우석</td><td>꿍이</td><td>010-9999-9999</td>
					</tr>
					<tr>
						<td>김우석</td><td>밍ㄴ이</td><td>010-1111-8888</td>
					</tr>
				</table>
			</div><!-- /.container -->
		</section>
		<script src="/js/demo.js"></script>
		<script src="/js/livesearch.js"></script>		
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
<!-- end 1) 고객 핸드폰 번호 검색 -->
		
		
		
		
				
<!-- start 2) 메세지 전송 -->
		<div style="border:3px solid pink; width:33%; float:left; padding:10px">
		<h1>미리보기</h1>
		<div style="border:3px solid #FFBEC3; text-align:center; background:#FFBEC3">오늘은 코코의 미용 예약일입니다. <br/>방문바랍니다. <br/>도담도담동물병원<br/></div>
		<div style="border:3px solid red; text-align:center; height:10%">
			<input type="text" style="width:100%; height:100%">
		</div>
		<div>
			<input type='button' value='내용 지우기'/>
			<input type='text' style="width:35%; padding:10px" placeholder="즐겨찾기 명"/>
			<input type='button' value='저장하기'/>
		</div>
		<div>
			나중에 이모티콘 jquery를 넣어주세요~~~~ (문자로 보낼 수만 있다면!!)
		</div>
		문자전송할 핸드폰 번호 리스트<br/>
		<div> <!-- start 예약 발송할 datepicker -->
			<input type="checkbox" name="vehicle1" value="Bike">예약발송
	        <input type="text" class="mt10px input" id="J-demo-02">
	    	<script type="text/javascript" src="/sms/date-time-picker.min.js"></script>
	        <script type="text/javascript">
	            $('#J-demo-02').dateTimePicker({
	                mode: 'dateTime'
	            });
	        </script>
		</div> <!-- end 예약 발송할 datepicker -->
			<input type='button' value='발송' style="width:100%"/>
		</div>
<!-- end 2) 메세지 전송 -->
		
		
		
		
		
		<!-- 3) 즐겨찾기 -->	
		<div style="border:3px solid pink; width:33%; float:left">
		백신이나 진료 예약 내용 즐겨찾기 해놓음<br/><br/><br/><br/><br/><br/><br/>
		</div>		

		
		
		
		
		
		
		
		
</div>

				​
				​
				​