<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="infoMenu" style="padding-top:20px;">
	<!-- 진료, 입원 등 현재 서비스를 받는 고객 및 동료 정보를 보는 곳 -->
	<input id="cusname" class='customerInfo' type='text' disabled='disabled' name='customer_name' value=''/>
	<input id ="custel" type='text' disabled='disabled' name='customer_tel'/>
	<input id ="animalname" type='text' disabled='disabled' name='customer_tel'/>
	<input id= "animalbreed" type='text' disabled='disabled' name='pet_type'/>
	<input id= "cusaddr" type='text' disabled='disabled' name='customer_addr'/>
	<input id= "animalnum" type='hidden' disabled='disabled' name='animal_num'/>	
</div>