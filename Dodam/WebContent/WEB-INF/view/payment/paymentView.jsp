<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- 부트스트랩 공통!! -->
<link rel="stylesheet" href="/css/bootstrap.css" />

<!-- 수납화면css -->
<link rel="stylesheet" href="/paymentcss/payment.css">

<!-- 바디 시작 -->
<div class="body">



	<!-- 여기 부분이 실질적으로 코딩하는 부분입니다~~~ div의 테두리는 지금 보기 편하기 위한 부분이고, 나중에 지울껍니다~~ -->
	<div>
		<!-- 가운데 구분 줄 -->
		<div class="hr1" style="margin-top: 50px"></div>

		<!-- 수납대기/수납목록 -->
		<div class="paygroup">

			<!-- 수납대기 -->
			<div class="payleft">
				<h1 class="title">수납대기</h1>
				<table id="listTable">
					<tbody>
						<tr>
							<td><input type="checkbox" /></td>
							<td><small>2017/06/21<br/>12:43:27</small></td>
							<td>김우석, 연이(Toy Poodle)</td>
							<td>200,000</td>
							<td><button class="paydelbtn btn-sm">삭제</button></td>

						</tr>
						<tr>
							<td><input type="checkbox" /></td>
							<td><small>2017/06/21<br/>12:43:27</small></td>
							<td>김우석, 연이(Toy Poodle)</td>
							<td>200,000</td>
							<td><button class="paydelbtn btn-sm">삭제</button></td>

						</tr>
						<tr>
							<td><input type="checkbox" /></td>
							<td><small>2017/06/21<br/>12:43:27</small></td>
							<td>김우석, 연이(Toy Poodle)</td>
							<td>200,000</td>
							<td><button class="paydelbtn btn-sm">삭제</button></td>

						</tr>
					</tbody>
				</table>
			</div>
			<!-- 수납대기end -->
			
			<!-- 수납목록 -->
			<div class="payright">
				<h1 class="title">수납목록</h1>
				<div class="tablediv">
					<table id="payTable">
						<tbody>
							<tr>
								<th>구분</th>
								<th>내용</th>
								<th>수량</th>
								<th>금액</th>
							</tr>
							<tr>
								<td><input type="checkbox" /></td>
								<td>주사</td>
								<td>3</td>
								<td>150,000</td>
							</tr>
							<tr>
								<td><input type="checkbox" /></td>
								<td>주사</td>
								<td>3</td>
								<td>150,000</td>
							</tr>
							<tr>
								<td><input type="checkbox" /></td>
								<td>주사</td>
								<td>3</td>
								<td>150,000</td>
							</tr>
							<tr>
								<td><input type="checkbox" /></td>
								<td>주사</td>
								<td>3</td>
								<td>150,000</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="rowgruop">
					<h3 class="totalm">총액 : 600,000</h3>
					<hr>
					<button class="paybtn">결제</button>
				</div>
			</div>
			<!-- 수납목록end -->

		</div>
		<!-- 수납대기/수납목록end -->



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
</div>
