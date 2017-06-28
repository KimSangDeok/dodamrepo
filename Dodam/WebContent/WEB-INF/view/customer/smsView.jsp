<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- c태그를 사용하기 위해 taglib를 적어야 한다. -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" type="text/css" href="/manage/style.css" />
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css' />
<link href="/css/goods/smalldatepicker/smallDatestyle.css" rel="stylesheet" type="text/css">

    <link type="text/css" rel="stylesheet" href="/sms/demo.css">
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
   
   	<!-- begin : sms를 보낼 고객 핸드폰을 놓는 scroll -->
   	<link rel="stylesheet" type="text/css" href="/sms/scroll.css">
   	<!-- end : sms를 보낼 고객 핸드폰을 놓는 scroll -->
 
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
					
					<!-- db에서 전체 동물의 목록을 가져오세요~~ -->
					<c:forEach var="animal" items="${animalList}">
						<tr ondblclick="javascript:sendTel('${animal.ANIMAL_NAME}')">
							<td>${animal.CUS_NAME}</td>
							<td>${animal.ANIMAL_NAME}</td>						
							<td>${animal.CUS_TEL}</td>						
											
						</tr>
					</c:forEach>

				</table>
			</div><!-- /.container -->
		</section>
		<script src="/sms/demo.js"></script>
		<script src="/sms/livesearch.js"></script>		
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

		<script>
		function sendTel(animal_name){
			
			var result = new Array();
			
			<c:forEach items="${animalList}" var="animal">
			
				var json = new Object();
				json.cus_name="${animal.CUS_NAME}";
				json.animal_name="${animal.ANIMAL_NAME}";
				json.cus_tel="${animal.CUS_TEL}";

				
				if(animal_name=="${animal.ANIMAL_NAME}"){
					result.push(json);
				}
				
			</c:forEach>
			
			$('.scroll').append(result[0].cus_tel+" "+'</br>');
						
			
		}	
		</script>
		
		
		
		
				
<!-- start 2) 메세지 전송 -->
		<div style="border:3px solid pink; width:33%; float:left; padding:10px">
		<h1>미리보기</h1>
		<div style="border:3px solid #FFBEC3; text-align:center; background:#FFBEC3">오늘은 코코의 미용 예약일입니다. <br/>방문바랍니다. <br/>도담도담동물병원<br/></div>
		<div style="border:3px solid red; text-align:center; height:10%">
			<input id='smsContent' type="text" style="width:100%; height:100%">
		</div>
		<div>
			<input id='erase' type='button' value='내용 지우기'/>
			<input id='favorite' type='text' style="width:35%; padding:10px" placeholder="즐겨찾기 명"/>
			<input id='smsSave' type='button' value='저장하기'/>
		</div>
		<div>
			나중에 이모티콘 jquery를 넣어주세요~~~~ (문자로 보낼 수만 있다면!!)
		</div>
		
		
		<!-- begin : 문자를 전송할 핸드폰 추가하는 공간 -->
		<h5>문자전송할 핸드폰 번호 리스트</h5>
		<div class="scroll">

		</div>
		<script type="text/javascript" src="/sms/prognroll.js"></script>	<!-- scroll 스크립트 -->
		<!-- end : 문자를 전송할 핸드폰 추가하는 공간 -->
		
		
		
		
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
			<input type='button' value='발송' style="width:100%" onclick="javascript:sendMessage()"/>
		</div>
		
		
		
		<script>
			//* 발송 버튼을 누르면  
			function sendMessage(){
				// 문자 발송하는 메소드~~ action이 coolsms에서 제공하는 페이지로 넘어가므로
				// ajax를 이용해야 한다요~

				
				/*
				url : sms를 제공하는 link 주소
				data : parameter형태로 무조건 보내주자! url에서 파라미터 형으로 가야 함
				dataType : parameter형태로 쫘르르르륵 가는 건 "~~~~" 는 text 형식
				error : 이 ajax는 에러가 나지만, 일단 문자가 가니까...ㅎㅎㅎㅎ
				*/
				
				
				//여려명한테 보내야만 한다면, ajax를 여러벌 돌려야 합니다.
				var smsTel = $('.scroll').text().trim().split(" ");		// sms를 전송할 핸드폰 목록을 배열로 담자
				var smsTelCount = smsTel.length;						// 전송할 핸드폰 번호 수
				
				for(var i=0; i<smsTelCount; i++){
					alert(smsTel[i]);

				 	/*
					data : {'user' : 'mimdong', 'password' : 'sms1161803', 'to' : '01083081520', 'from' : '01083081520', 'text' : 'sms제발여', 'type' : 'SMS'},
 					*/
		
				$.ajax({
					url : "http://api.coolsms.co.kr/sendmsg",
					type : "get",

 					data : "user=mimdong&password=smj1161803&to="+smsTel[i]+"&from=01083081520&text="+$('#smsContent').val()+"&type=SMS",
					dataType : "text",
					success : function(data){
						//alert(data);
						//alert("되나여");
					},
		    		error:function(request, status,error){
		    			 //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    			 //console.log(error);
		    		}
				})
			
 
				} // end of for문
				
				

			}
		</script>
		
<!-- end 2) 메세지 전송 -->
		
		
		
		
		
		<!-- 3) 즐겨찾기 -->	
		<div style="border:3px solid pink; width:33%; float:left">
		백신이나 진료 예약 내용 즐겨찾기 해놓음<br/><br/><br/><br/><br/><br/><br/>
		</div>		

		
		
		

		
		
		
</div>

<script type="text/javascript">
/* $(document).ready(function() {
	$('#smsSave').bind('click', function(){
		alert("저장버튼");
		alert($('#smsContent').val());
		alert($('#favorite').val());
		
		// sms에서 자주 사용하는 메세지 내용을 즐겨찾기 목록에 추가한다. ajax를 이용!
		$.ajax({
			url : ,
			type : 'get',
			async : true,
			//data : {'message_name' : $('#favorite').val(), 'message_content' : $('#smsContent').val()},
			data : "message_name=" + $('#favorite').val() +"&message_content=",
			dataType : "text",
			success : function(data){
				
			},
    		error:function(request, status,error){
   			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   			}
		})
	})
}); */
</script>​
				​
				​