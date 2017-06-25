<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="menu">
	<nav id="main-nav" role="navigation">
		<ul id="main-menu" class="sm sm-mint">
			<li><a href="#"><font size="5em">예약</font></a>
				<ul>
					<li><a href="/reservation/reservationView.dodam">예약현황보기</a></li>
					<li><a href="/reservation/book.dodam">예약하기</a></li>
				</ul>
			</li>
			<li><a href="/counter/counterView.dodam"><font size="5em">접수</font></a></li>
			<li><a href="/jinryo/jinryoView.dodam"><font size="5em">진료</font></a></li>
			<li><a href="#"><font size="5em">입원/호텔</font></a>
				<ul>
					<li><a href="/stay/stayView.dodam">입원 및 호텔하기</a></li>
					<li><a href="#">입원 및 호텔 카메라 보여주기</a></li>
				</ul>
			</li>	
			<li><a href="/beauty/beautyView.dodam"><font size="5em">미용</font></a></li>
			<li><a href="/payment/paymentView.dodam"><font size="5em">수납</font></a></li>
		</ul>
	</nav>
</div>