<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- 부트스트랩 공통!! -->
<link rel="stylesheet" href="/css/bootstrap.css" />

<!-- 수납화면css -->
<link rel="stylesheet" href="/paymentcss/payment.css">

<script type="text/javascript">
	$(function() {

		// 수납대기 삭제
		$('.paydelbtn').click(function() {
			var flag = confirm("정말 삭제하시겠습니까?");
			var animal_num = $(this).next().val();
			if (flag == true) {
				$("#listfrm").attr("method", "post");
				$("#listfrm").attr("action", "listdel.dodam?animal_num=" + animal_num);
				$("#listfrm").submit();
			} else {
				alert("취소하였습니다.");
			}
		});
		
		// 수납대기 리스트 클릭시 수납목록
		$("#listTable tr").click(function() {
			if ($(this).click) {
				
				var animal_num = $(this).find('input[name=animal_num]').val();
				var bcnt = 0; // 미용 카운트 변수
				var scnt = 0; // 입원/호텔 카운트 변수
				var jcnt = 0; // 진료 카운트 변수
				var totpay = $(this).find('#totpay').text(); // 총액
				$('#pay_amnum').attr('value', animal_num);
				console.log(totpay);
				
				$.ajax({
					url : "/payment/selectPay.dodam",
					type : 'post',
					data : "animal_num=" + animal_num,
					dataType : "json",
					success : function(data){
						console.log(data);
						
						// 미용 목록
						for(var i in data.btpaylist){
							
							 if(data.btpaylist.hasOwnProperty(i)){
							    bcnt++;
							 }
						}
						// 입원/호텔 목록
						for(var i in data.stpaylist){
							
							 if(data.stpaylist.hasOwnProperty(i)){
							    scnt++;
							 }
						}
						// 진료 목록
						for(var i in data.trpaylist){
							
							 if(data.trpaylist.hasOwnProperty(i)){
							    jcnt++;
							 }
						}
						
						var text='';
						
						// 미용 리스트 생성
						var btpay = data.btpaylist;
						for(var i = 0; i<bcnt; i++){
							text+=''+
							'<tr>'+
							'<td>미용</td>'+
							'<td>'+btpay[i].BTM_TYPE+'</td>'+
							'<td>'+btpay[i].BTPAY_PRICE+'</td>'+
							'</tr>';
						}
						
						// 입원/호텔 리스트 생성
						var stpay = data.stpaylist;
						for(var i = 0; i<scnt; i++){
							text+=''+
							'<tr>'+
							'<td>입원/호텔</td>'+
							'<td>'+stpay[i].AR_NAME+'</td>'+
							'<td>'+stpay[i].STPAY_PRICE+'</td>'+
							'</tr>';
						}
						
						// 진료 리스트 생성
						var trpay = data.trpaylist;
						for(var i = 0; i<jcnt; i++){
							text+=''+
							'<tr>'+
							'<td>진료</td>'+
							'<td>'+trpay[i].TX_NAME+'-'+trpay[i].RX_NAME+'</td>'+
							'<td>'+trpay[i].TRPAY_PRICE+'</td>'+
							'</tr>';
						}
						$('#payTable thead').text('');
						$('#payTable thead').append('<tr><th style="width: 90px;">구분</th><th style="width: 380px;">내용</th><th>금액</th></tr>');
						$('#payTable tbody').text('');
						$('#payTable tbody').append(text);
						$('.rowgruop h3').text('');
						$('.rowgruop h3').text('총액 : '+totpay);
					},
					 error:function(request, status,error){
			             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			         }
				});
			}
		});
		
		// 결제버튼 이벤트
		$("#paybtn").click(function() {
			var flag = confirm("결제하시겠습니까?");
			var animal_num = $(this).next().val();
			if (flag == true) {
				
				$("#payment").attr("method", "post");
				$("#payment").attr("action", "payment.dodam?animal_num=" + animal_num);
				$("#payment").submit();
			} else {
				alert("결제가 취소되었습니다.");
			}
		});
		
	});
</script>

<!-- 바디 시작 -->
<div class="body">

		<!-- Begin 수납대기/수납목록 -->
		<div class="paygroup">
		
			<!-- Begin 수납대기 -->
			<div class="payleft">
				<h1 class="title">수납대기</h1>
				<form id="listfrm">
					<!-- Begin 수납대기 테이블 -->
					<table id="listTable">
						<tbody style="overflow:scroll">
							<!-- Begin 수납대기 리스트 -->
							<c:choose>
								<c:when test="${waitinglist == null}">
									<tr>
										<td colspan='4'>수납대기목록이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${waitinglist}" var="wait">
										<tr>

											<td style="text-align: center;"><strong>${wait.CUS_NAME}</strong></td>
											<td style="text-align: center;">${wait.ANIMAL_NAME}</td>
											<td id="totpay" style="text-align: center;">${wait.TOTAL_PRICE}</td>
											<td>
												<input type="hidden" name="tot_price" value="${wait.TOTAL_PRICE}">
												<button class="paydelbtn btn-sm">삭제</button>
												<input type="hidden" id="animal_num" name="animal_num" value="${wait.ANIMAL_NUM}">

											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<!-- End 수납대기 리스트 -->
						</tbody>
					</table>
					<!-- End 수납대기 테이블 -->
				</form>
			</div>
			<!-- End 수납대기 -->

			<!-- Begin 수납목록 -->
			<div class="payright">
				<h1 class="title">수납목록</h1>
					<div class="tablediv">
						<!-- Begin 수납목록 테이블 -->
						<table id="payTable">
							<thead>
								<tr>
									<th style="width: 90px;">구분</th>
									<th style="width: 380px;">내용</th>
									<th>금액</th>
								</tr>
							</thead>
							<tbody style="overflow:scroll">
							</tbody>
						</table>
						<!-- End 수납목록 테이블 -->
					</div>

				<!-- Begin 총액/결제버튼 -->
				<form id="payment">
					<div class="rowgruop">
						<h3>총액 : 0</h3>
						<hr>
						<button id="paybtn">결제</button>
						<input type="hidden" id="pay_amnum" value="">
					</div>
				</form>
				<!-- End 총액/결제버튼 -->
			</div>
			<!-- End 수납목록 -->

		</div>
		<!-- 수납대기/수납목록end -->
</div>
