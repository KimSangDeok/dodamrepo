<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link rel="stylesheet" href="/jinryoCss/css/bootstrap.css">

<script>
$(document).ready(function(){
	
	$('.nav-tabs>li').click(function(){
		
		//탭버튼 active 클래스 다지우기
		$('.nav-tabs>li').removeClass('active');
		
		//선택한 탭버튼 active 주기
		$(this).addClass('active');
		
		//내용 div active 클래스 다지우기
		$('.tab-content>div').removeClass('active');
		
		//선택한 href값에 해당하는 id 찾아서 active 주기.
		$(($(this).children('a').attr('href'))).addClass('active');
		
	});
});

</script>
<div class="body">
	<br/>
	<br/>
	<div style="width: 90%;  margin-left: auto; margin-right: auto;" >
		<ul class="nav nav-tabs" >
			<!-- class="active" 탭 활성화--> 
			<li class="active"><a href="#tab1" data-toggle="tab">문진표</a></li>
			<li><a href="#tab2" data-toggle="tab">검사기록</a></li>
			<li><a href="#tab3" data-toggle="tab">증상</a></li>
			<li><a href="#tab4" data-toggle="tab">진단명</a></li>
			<li><a href="#tab5" data-toggle="tab">처치/처방</a></li>
			<li><a href="#tab6" data-toggle="tab">결제내역</a></li>
		</ul>
		<div class="tab-content" style="border-left:1px solid #ddd; border-right:1px solid #ddd; border-bottom:1px solid #ddd">
			<!-- class="active" 탭 내용 -->
			<div class="tab-pane active" id="tab1">
				<p>home1 부분입니다.</p>
			</div> 
			<div class="tab-pane" id="tab2">
				<p>menu2 부분입니다.</p>
			</div>
			<div class="tab-pane" id="tab3">
				<p>menu3 부분입니다.</p>
			</div>
			<div class="tab-pane" id="tab4">
				<p>home4 부분입니다.</p>
			</div> 
			<div class="tab-pane" id="tab5">
				<p>menu5 부분입니다.</p>
			</div>
			<div class="tab-pane" id="tab6">
				<p>menu6 부분입니다.</p>
			</div>
		</div>
	</div>
</div>
