<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!-- 입원 및 병원실을 보여주는 화면 stayCam.jsp 입니다. -->
<div class="body"><br/>


	<!-- begin : DIV 1) 미용을 할 동물의 정보, 미용 내용을 띄움 / 미용 완료, 취소 버튼 -->
	<div>
	
		<form method="get" action="/beauty/beautyDone.dodam">
		<input type="hidden" name="bty_code" value="${bty_code}">
		<input type="hidden" name="bty_price" value="${bty_price}">
		<input type="hidden" name="animal_num" value="${animal_num}">
		<input disabled='disabled' type="text" name="btm_type" value="${btm_type}">

		
		<input type="button" value="취소" id="cancel">
		<input type="submit" value ="확인" id="done">
		</form>			
		
	
	</div>
	<!-- end : DIV 1) 미용을 할 동물의 정보, 미용 내용을 띄움 / 미용 완료, 취소 버튼 -->
	

	<div>
	<!-- 라즈베리로 입원장을 보여주는 화면을 설계합시다~~~~~~~~ -->

	<img src="http://192.168.0.194:8080/?action=stream" alt="미용하고 있는 장면이 뜨는 화면"/>
	
	<!-- end : 라즈베리 입원장 보여주는 곳 -->	
	</div>









</div>

<script type="text/javascript">
$(document).ready(function() {

	// 미용 취소 버튼 이벤트 = 미용 스케쥴 화면으로 돌아가라
	$('#cancel').bind('click', function(){
		 location.href = "/beauty/beautyView.dodam";
	});	
    

	
    

    

    

});
</script>

				​
				​
				​