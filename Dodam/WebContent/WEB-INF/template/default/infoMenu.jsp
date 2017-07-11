<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="infoMenu" style="padding-top:20px;">
	<!-- 진료, 입원 등 현재 서비스를 받는 고객 및 동료 정보를 보는 곳 -->
	<!-- 진료, 입원 등 현재 서비스를 받는 고객 및 동료 정보를 보는 곳 -->
	<input id="info_cusname" class='customerInfo' type='text' readonly="readonly" name='cust_name' value=''/>
	<input id ="info_custel" type='text' readonly="readonly" name='cus_tel'/>
	<input id ="info_animalname" type='text' readonly="readonly" name='animal_name'/>
	<input id= "info_animalbreed" type='text' readonly="readonly" name='animal_breed'/>
	<input id= "info_doctor_name" type='text' readonly="readonly" name='doctor_name'/>
	<input id= "info_animalnum" type='hidden' readonly="readonly" name='animal_num'/>
</div>