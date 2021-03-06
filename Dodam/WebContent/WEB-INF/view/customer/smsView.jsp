<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- c태그를 사용하기 위해 taglib를 적어야 한다. -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" type="text/css" href="/manage/style.css" />
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css' />
	
	<link href="/css/goods/smalldatepicker/smallDatestyle.css" rel="stylesheet" type="text/css">	<!-- tale의 css -->
    <link type="text/css" rel="stylesheet" href="/sms/demo.css">
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
   
   	<!-- begin : sms를 보낼 고객 핸드폰을 놓는 scroll -->
   	<link rel="stylesheet" type="text/css" href="/sms/scroll.css">
   	<!-- end : sms를 보낼 고객 핸드폰을 놓는 scroll -->
 
 	<!-- begin : sms 전송하는 css -->
	<link rel="stylesheet" href="/css/customer/style.css" type="text/css" media="all" />
 	<!-- end : sms 전송하는 css --> 

 	<!-- begin : 즐겨찾기 accordian -->
  	<link rel="stylesheet" type="text/css" href="/sms/favorite.css">
 	<!-- end : 즐겨찾기 accordian -->
 	
 	<!-- 대메뉴 css --> 
 	<link rel="stylesheet" type="text/css" href="/sms/subMenu.css">
 
 
    <style>
    /*div 스타일 적용 */
    #accordianmessage {
    margin-top:52px;
    position: relative;
    background-color: #fff;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
    border: 1px solid #999;
    border: 1px solid rgba(248, 14, 14, 0.2);
    border-radius: 6px;
    outline: 0;
    -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
    box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
    width:400px;
    height:690px;
    margin-bottom: 50px;
    
}
    
	/* z-index 값이 작을 수록 아래에 깔리고, 높을 수록 위로 나온다. */
	.manage{
		z-index:2;
	}
	.count, .Quantity{
		z-index:1;
	}
	.subMenu{
	background-image:url('/sms/stripe.jpg');
	font-size: 50px;
	border-top-left-radius: 10em;
	border-bottom-right-radius: 5em;
	border-bottom-left-radius: 2em; 
	}
	</style>
	
	<link rel="stylesheet" type="text/css" href="/manage/noJS.css" />
	<script type="text/javascript" src="/manage/modernizr.custom.79639.js"></script>


<div class="body">
		
	<div class="wrapper-demo">
		<div id="dd" class="wrapper-dropdown-3" tabindex="1">
			<span>고객관리</span>
			<ul class="dropdown">						
				<li><a href="/customer/customerView.dodam"><i class="icon-envelope icon-large"></i>고객검색</a></li>
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
			
			
	
	
<div class="smsView" style="margin-left:15%">	
	
	<!-- sms화면은 div3개로 관리, 1)고객핸드폰번호검색, 2)메세지 보내는 부분, 3)즐겨찾기로 구성 -->

<!-- start DIV 1) 고객 핸드폰 번호 검색 -->
	<div style="width:30%; float:left">
		<br/><br/>				



			<div class="input-group">
			<span class="input-group-addon"><i class="fa fa-search"></i></span>
			<input class="form-control" id="livesearch" placeholder="아무거나 입력하세요" type="text" />
			</div></br>
		
			<div style="overflow: scroll; height: 670px;">
			<table class="table" id="users">
				<tr>
					<th class="hidden-xs">고객 성명</th>
					<th class="hidden-xs">동물 이름</th>
					<th class="hidden-xs">고객 핸드폰번호</th>
				</tr>
				
				<!-- db에서 전체 동물의 목록을 가져오세요~~ -->
				<c:forEach var="animal" items="${animalList}">
					<tr onclick="javascript:sendTel('${animal.ANIMAL_NAME}')">
					<td>${animal.CUS_NAME}</td>
					<td>${animal.ANIMAL_NAME}</td>						
					<td>${animal.CUS_TEL}</td>										
					</tr>
				</c:forEach>
			</table>
			</div>

		
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
<!-- end DIV1) 고객 핸드폰 번호 검색 -->
	
	<!-- 고객 핸드폰 번호 검색한 거를 메세지 보내는 div에 핸드폰 목록으로 보낸다. -->
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
	<div style="width:40%; float:left; padding:10px">

	<div id="content">
		<h1>메세지 보내기</h1>
        <form action=" " method="post" id='form_wrap' autocomplete="on">
			<p>
				고객들 	
				<span class="required">*</span>
				<input type='button' class='erase' value='지우기'/>
				<div class='scroll' name="username" id="username"  required="required" placeholder="Hi friend, how may I call you ?"></div> 
			</p>


 			<p>
			즐겨찾기 명 <br/><br/>
			<input class='message_name' type="text" name="subject" id="subject"  placeholder="즐겨찾기 명" />
			</p>

			<p>메세지  
			<span class="required">*</span> 
			<br/><br/>	
			<textarea class='message_content' style='width:300px'placeholder= "메세지내용을 입력하세요."  required="required" ></textarea> </p>
			<p class="indication"> All fields with a <span class="required">*</span> are required</p>
			
			<input type="button" class="smsSave" value="저장"/>			
			<input type="button" value="★Send  Message" onclick="javascript:sendMessage()" />		
		</form>		
    </div> 
	    
	</div>
		
		
	<script>
	//* 발송 버튼을 누르면  
	function sendMessage(){

		// 메세지를 보내기 전, 모든 내용(메세지내용과, 보낼 핸드폰번호 목록)을 입력했는지 검사한다.
		if($('.scroll').text()==""){
			alert("전송할 핸드폰주소를 반드시 하나 이상 입력해야 합니다.");
			return false;
		}
		if($('.message_content').val()==""){
			alert("전송할 메세지 내용을 반드시 입력해야 합니다.");
			return false;
		}
		
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
	
			$.ajax({
			url : "http://api.coolsms.co.kr/sendmsg",
			type : "get",
	
				data : "user=mimdong&password=smj1161803&to="+smsTel[i]+"&from=01083081520&text="+$('.message_content').val()+"&type=SMS",
			dataType : "text",
			success : function(data){
				//alert(data);
				//alert("되나여");
			},
	   		error:function(request, status,error){
	   			 //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   			 //console.log(error);
	   			$('.scroll').text('');
	   			$('.message_content').val("");
	   			 alert("메세지가 전송되었습니다.");
	   			 
	   			 
	   		}
		})
	
	
		} // end of for문

	}
	</script>
		
<!-- end 2) 메세지 전송 -->
		
		
		
		
		
<!-- begin : 3) 즐겨찾기 -->	
	<div id="accordianmessage" style="border-radius: 6px; width:30%; float:left; ">
		<p style="margin-top:20px; font-size:18pt; font-family:맑은고딕; font-weight: bold;">즐겨찾는 Message</p>
		<!-- begin : 즐겨찾기 메뉴 보이는 부분 -->
		<div class="accordion" >

		<!-- 자자, 여기서 SMS테이블에서 sms 즐겨찾기 내용을 불러와줘야해요~~ -->
 		
 			<c:forEach var="favorite" items="${favoriteList}">
				
		        <div >
		            <!-- span to target fix accordion -->
		            <span class="target-fix" id="accordion${favorite.MESSAGE_ID}"></span>
		            
		            <!-- Link to open accordion, hidden when open --> 
		            <a href="#accordion${favorite.MESSAGE_ID}" id="open-accordion${favorite.MESSAGE_ID}" title="open">${favorite.MESSAGE_NAME}</a>
		            
		            <!-- Link to close accordion, hidden when closed -->
		            <a href="#accordion" id="close-accordion${favorite.MESSAGE_ID}" title="close">${favorite.MESSAGE_NAME}</a> 
		            
		            <!-- Accorion content goes in this div -->
		            <div class="accordion-content">
		                <p>${favorite.MESSAGE_CONTENT}</p>
		            </div>
		        </div>

			</c:forEach> 

		</div>
	</div>
<!-- end : 3) 즐겨찾기 -->	

<script type="text/javascript">
$(document).ready(function() {
	
	// 즐겨찾기 목록을 추가해주면 해당 내용이 message에 들어가게 해주세여~~~
	$('.accordion-content p').bind('click', function(){
		$('.message_content').val($(this).text());

	})

	
	// sms에서 자주 사용하는 메세지 내용을 즐겨찾기 목록에 추가한다. ajax를 이용
	$('.smsSave').bind('click', function(){
		
		// 등록하기전, 모든 내용(즐겨찾기명과 메세지 내용)을 입력했는지 검사한다.
		if($('.message_name').val()==""){
			alert("즐겨찾기 명을 반드시 입력해야 합니다.");
			return false;
		}
		if($('.message_content').val()==""){
			alert("즐겨찾기 메세지 내용을 반드시 입력해야 합니다.");
			return false;
		}

 		$.ajax({
			url : '/customer/favoriteSMS.dodam',
			type : 'get',
			async : true,
			//data : {'message_name' : $('#favorite').val(), 'message_content' : $('#smsContent').val()},
			data : "message_name="+$('.message_name').val()+"&message_content="+$('.message_content').val(),
			dataType : "json",
			success : function(data){
				
				// sms 저장 했으니 text 비워주기.
				$('.message_name').val("");
				$('.message_content').val("");
				
				// success 라면, 방금 추가한 메세지 내용을 append 해줘야 합니다.
				var i;
				var count=0;
				for (i in data) {
				    if (data.hasOwnProperty(i)) {
				        count++;
				    }
				}
				
				$('.accordion').text('');	// div 클리어!
				
				// data의 갯수만큼!, append로 sms 즐겨찾기 목록을 추가해줍니다.
				for(var i=0; i<count; i++){
					
					$('.accordion').append
					(
					'<div>'+
		            '<span class="target-fix" id="accordion'+data[i].MESSAGE_ID+'"></span>'+
		            '<a href="#accordion'+data[i].MESSAGE_ID+'" id="open-accordion'+data[i].MESSAGE_ID+'" title="open">'+data[i].MESSAGE_NAME+'</a>'+
		            '<a href="#accordion" id="close-accordion'+data[i].MESSAGE_ID+'" title="close">'+data[i].MESSAGE_NAME+'</a>'+
		            '<div class="accordion-content">'+
		            '<p>'+data[i].MESSAGE_CONTENT+'</p>'+
		            '</div></div>'
					);
				}	

			},
    		error:function(request, status,error){
   			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   			}
		}) 	
	})
	
	// 내용지우기 버튼을 누르면 내용아 모두 사라져라!!
	$('.erase').bind('click', function(){
		$('.scroll').text('');
	})
}); 
</script>

</div>​
</div>	<!-- end of div (class=body) -->	​
				​