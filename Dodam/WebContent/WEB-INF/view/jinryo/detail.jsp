<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- c태그를 사용하기 위해 taglib를 적어야 한다. -->	

	<!-- accordian 관련 css -->
	<link rel='stylesheet' href="/css/jinryo/detail.css">

<div class="body" style='text-align:center'>

	<!-- begin : 어떤 동물의 언제 진료 기록인지 title을 보여준다. -->
	<div class="content title">
	<h1>${jinryo.ANIMAL_NAME}의 진료 기록  /  날짜 : ${jinryo.JRYO_DT}  /  담당선생님 : ${jinryo.PER_NAME}</h1>
	<span class="back-to-article"><a href="/jinryo/jinryoView.dodam">${jinryo.ANIMAL_NAME}의 전체진료기록<i class="fa fa-angle-right"></i></a></span>
	</div>
	<!-- end : 어떤 동물의 언제 진료 기록인지 title을 보여준다. -->


	<!-- begin : content white는 전체 진료 기록을 감싸는 div 입니다. -->
	<div class="content white" style='width:80% '>

		<!-- begin : 1. 진료기록 중, 문진표!!! -->
		<div class="accordion-container">
			<a href="#" class="accordion-toggle">문 진 표<span class="toggle-icon"><i class="fa fa-plus-circle"></i></span></a>
			<div class="accordion-content">
			
				<!-- 문진의 질문항목, 답변사항을 뿌려주자. -->
				<c:forEach var='moonjin' items="${moonjinHistory}" >
					<p>Q. ${moonjin.PA_SM}</p>
					<c:choose>
						<c:when test="${moonjin.PA_H_HISTORY=='y'}">
							<p>A. 예</p>
						</c:when>
						<c:when test="${moonjin.PA_H_HISTORY=='n'}">
							<p>A. 아니오</p>
						</c:when>
						<c:otherwise>
							<p>A. ${moonjin.PA_H_HISTORY}</p>
						</c:otherwise>
					</c:choose>
					<br/>
				</c:forEach>

			</div>
		</div>
		<!-- end : 1. 진료기록 중, 문진표!!! -->


		<!-- begin : 2. 진료기록 중, 차트검사이미지 -->
		<div class="accordion-container">
			<a href="#" class="accordion-toggle">진 료 기 록(차트검사내역)<span class="toggle-icon"><i class="fa fa-plus-circle"></i></span></a>
			<div class="accordion-content">
			
				<!-- 검사기록에 있는 jpg를 불러준다. -->
				<c:forEach var="img" items="${charImageHistory}">
					<div style="border: solid 1px black; width: 20%; height: 20%; float: left;">
						<img src="/imageupload/chartImages/${img.JR_IMG_FAKE_NAME}"/>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- end : 2. 진료기록 중, 검사기록 -->


		<!-- begin : 3. 진료기록 중, 증상 -->
		<div class="accordion-container">
			<a href="#" class="accordion-toggle">증 상<span class="toggle-icon"><i class="fa fa-plus-circle"></i></span></a>
			<div class="accordion-content">
				
				<!-- 증상 text를 뿌려주자. -->
				<p>${jinryo.SYMPTOM}</p>
				
			</div>
		</div>
		<!-- end : 3. 진료기록 중, 증상 -->
	
	
		<!-- begin : 4. 진료기록 중, 바이탈 -->	
		<div class="accordion-container">
			<a href="#" class="accordion-toggle">바 이 탈<span class="toggle-icon"><i class="fa fa-plus-circle"></i></span></a>
			<div class="accordion-content">

				<!-- 진단명 text(vital 정보)를 뿌려주자. -->
				<p>몸무게 : ${jindanHistory.VT_WEIGHT}</p>
				<p>체온 : ${jindanHistory.VT_TEMPERATURE}</p>
				<p>수축기혈압 : ${jindanHistory.VT_SYSTOLIC_BLOOD}</p>
				<p>이완기혈압 : ${jindanHistory.VTDIASTOLIC_BLOOD}</p>
				<p>심박수 : ${jindanHistory.VT_HEART_RATE}</p>
				<p>호흡수 : ${jindanHistory.VT_BREATHING_RATE}</p>

			</div>
		</div>
		<!-- end : 4. 진료기록 중, 진단명 -->	
	
	
		<!-- begin : 5. 진료기록 중, 처치처방 -->		
		<div class="accordion-container">
			<a href="#" class="accordion-toggle">처 치 처 방<span class="toggle-icon"><i class="fa fa-plus-circle"></i></span></a>
			<div class="accordion-content">

				<!-- 처치처방 text를 뿌려주자. -->
				<h2>처치내역</h2>
				<c:forEach var="txList" items="${jinryo.txList}">
					<p style="display: inline;">${txList} / </p>
				</c:forEach>
<%-- 				<p>${jinryo.JRYO_TX}</p> --%>
				<br/>
				<br/>
				<h2>처방내역</h2>
				<p>${jinryo.JRYO_RX}</p>
				
			</div>
		</div>
		<!-- begin : 5. 진료기록 중, 처치처방 -->		
	
	
	</div>
	<!-- end : content white는 전체 진료 기록을 감싸는 div 입니다. -->



	<!-- begin : script ) 진료기록이 tab으로 분류되어 하나하나씩 열리도록 하게 해주는 accordian -->
	<script type="text/javascript">
	$(document).ready(function () {
		
		
		
	    $('.accordion-toggle').on('click', function(event){
	    	event.preventDefault();
	    	// create accordion variables
	    	var accordion = $(this);
	    	var accordionContent = accordion.next('.accordion-content');
	    	var accordionToggleIcon = $(this).children('.toggle-icon');
	    	
	    	// toggle accordion link open class
	    	accordion.toggleClass("open");
	    	// toggle accordion content
	    	accordionContent.slideToggle(250);
	    	
	    	// change plus/minus icon
	    	if (accordion.hasClass("open")) {
	    		accordionToggleIcon.html("<i class='fa fa-minus-circle'></i>");
	    	} else {
	    		accordionToggleIcon.html("<i class='fa fa-plus-circle'></i>");
	    	}
	    });
	});
	</script>
	<!-- stop : script ) 진료기록이 tab으로 분류되어 하나하나씩 열리도록 하게 해주는 accordian -->



</div>
