<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- 부트스트랩 공통!! -->
<link rel="stylesheet" href="/css/bootstrap.css" />

<!-- 접수화면css -->
<link rel="stylesheet" href="/countercss/counter.css" />

<!-- navAccordion플러그인 -->
<script src="/countercss/navAccordion.min.js"></script>

<!-- 팝업 -->
<script src="/js/jquery.popitup.js"></script>

<!-- 바디 시작 -->
<div class="body">



	<!-- 여기 부분이 실질적으로 코딩하는 부분입니다~~~ div의 테두리는 지금 보기 편하기 위한 부분이고, 나중에 지울껍니다~~ -->
	<div>
		<!-- 가운데 구분 줄 -->
		<div class="hr1" style="margin-top: 50px"></div>

		<h1
			style="font-weight: bolder; margin-left: 5%; margin-top: 0.5%; font-size: 200%; text-align: left;">접수</h1>

		<!-- 전체접수창 -->
		<div class="outer-wrap">

			<!-- 접수메뉴 -->
			<div class="demenu">
				<a class="add addpop" href="javascript:void(0);" role="button">
				<img class="addimg" alt="접수추가" src="/countercss/add.png"></a>
					<a href=""><img class="re" alt="새로고침" src="/countercss/refresh.png"></a>
			</div>

			<!-- Navigation -->
			<nav class="mainNav">
			
				<!-- 진료접수목록 -->
				<ul style="text-align: left;">
					<li><a>원장실<input type="text" value="2" disabled="disabled"></a>
						<ul>
							<li>
								<!-- 접수정보 -->
								<div class="rcvdiv">
									<div class="ldiv">
										<label>연이(Toy Poodle)</label> <label><strong>김우석</strong>
											귀진료</label>
									</div>
									<div class="cdiv">
										<label style="font-size: 130%;">일반</label> <label>12:33:27</label>
									</div>
									<div class="rdiv">
										<a class="add addpop edit" href="javascript:void(0);" role="button">
										<img alt="수정" src="/countercss/red_edit.png">
										</a>
										<a class="del" href="" role="button">
										<img alt="삭제" src="/countercss/red_del.png">
										</a>
									</div>
								</div>
							</li>
							<li>
								<div class="rcvdiv">
									<div class="ldiv">
										<label>연이(Toy Poodle)</label> <label><strong>김우석</strong>
											귀진료</label>
									</div>
									<div class="cdiv">
										<label style="font-size: 130%;">일반</label> <label>12:33:27</label>
									</div>
									<div class="rdiv">
										<a class="add addpop edit" href="javascript:void(0);" role="button">
										<img alt="수정" src="/countercss/red_edit.png">
										</a>
										<a class="del" href="" role="button">
										<img alt="삭제" src="/countercss/red_del.png">
										</a>
									</div>
								</div>
							</li>
						</ul></li>
					
					<li><a>태블릿<input type="text" value="0" disabled="disabled"></a></li>
					<li><a>진료실<input type="text" value="0" disabled="disabled"></a></li>
					<li><a>진료실2<input type="text" value="1"
							disabled="disabled"></a>
						<ul>
							<li>
								<div class="rcvdiv">
									<div class="ldiv">
										<label>연이(Toy Poodle)</label> <label><strong>김우석</strong>
											귀진료</label>
									</div>
									<div class="cdiv">
										<label style="font-size: 130%;">일반</label> <label>12:33:27</label>
									</div>
									<div class="rdiv">
										<a class="add addpop edit" href="javascript:void(0);" role="button">
										<img alt="수정" src="/countercss/red_edit.png">
										</a>
										<a class="del" href="" role="button">
										<img alt="삭제" src="/countercss/red_del.png">
										</a>
									</div>
								</div>
							</li>
						</ul></li>
					<li><a>회의실<input type="text" value="0" disabled="disabled"></a></li>
					<li><a>수술실<input type="text" value="0" disabled="disabled"></a></li>
					<li><a>입원실<input type="text" value="0" disabled="disabled"></a></li>
					<li><a>검사실<input type="text" value="0" disabled="disabled"></a></li>
					<li><a>접수실<input type="text" value="1" disabled="disabled"></a>
						<ul>
							<li>
								<div class="rcvdiv">
									<div class="ldiv">
										<label>연이(Toy Poodle)</label> <label><strong>김우석</strong>
											귀진료</label>
									</div>
									<div class="cdiv">
										<label style="font-size: 130%;">일반</label> <label>12:33:27</label>
									</div>
									<div class="rdiv">
										<a class="add addpop edit" href="javascript:void(0);" role="button">
										<img alt="수정" src="/countercss/red_edit.png">
										</a>
										<a class="del" href="" role="button">
										<img alt="삭제" src="/countercss/red_del.png">
										</a>
									</div>
								</div>
							</li>
						</ul></li>
					<li><a>미용실<input type="text" value="1" disabled="disabled"></a>
						<ul>
							<li>
								<div class="rcvdiv">
									<div class="ldiv">
										<label>연이(Toy Poodle)</label> <label><strong>김우석</strong>
											귀진료</label>
									</div>
									<div class="cdiv">
										<label style="font-size: 130%;">일반</label> <label>12:33:27</label>
									</div>
									<div class="rdiv">
										<a class="add addpop edit" href="javascript:void(0);" role="button">
										<img alt="수정" src="/countercss/red_edit.png">
										</a>
										<a class="del" href="" role="button">
										<img alt="삭제" src="/countercss/red_del.png">
										</a>
									</div>
								</div>
							</li>
						</ul></li>
				</ul>
			</nav>

			<!-- 팝업열리는 부분 -->
			<div class="popit-wrapper popit-wrapper-chase" style="left: 0px; opacity: 0;">
				<div class="popit-content">
					<div class="popit-header">
<!-- 						<button type="button" class="popitup-close close"> -->
<!-- 							<span class="glyphicon glyphicon-remove-circle"></span> -->
<!-- 						</button> -->
						<h4 class="popit-title">도담도담-접수추가/편집</h4>
					</div>

					<!-- 팝업창 바디부분 -->
					<div class="popit-body" id="bodycontainer">
						<div class="content-wrapper">
							<!--1번줄 -->
								<div style="float: left">
									<label>진료실</label>
								</div>
								<div style="float: right; padding-left: 20px;">
									<select style="width: 222px;">
										<option>원장실</option>
										<option>태블릿</option>
										<option>진료실</option>
										<option>진료실2</option>
										<option>회의실</option>
										<option>수술실</option>
										<option>입원실</option>
										<option>검사실</option>
										<option>접수실</option>
										<option>미용실</option>
									</select>
								</div><br/>

							<!-- 2번줄 -->

								<div style="float: left">
									<label>우선순위</label>
								</div>
								<div style="float: right; padding-left: 20px;">
									<select style="width: 222px;">
										<option>일반</option>
										<option>응급</option>
									</select>
								</div>

							<!--3번줄 -->

								<div style="float: left">
									<label>접수메모</label>
								</div>
								<div style="float: right; padding-left: 20px">
									<textarea rows="8" cols="25"></textarea>
								</div>
							
						</div>
					</div>
					<!-- 팝업창 바디 end -->
					
					<!-- 팝업창 접수/취소버튼 -->
					<div class="popit-footer" style="float: center">
						<button type="button" class="btn btn-default cancel popitup-close">취소</button>
						<button type="button" class="btn btn-primary receive">접수</button>
					</div>
				</div>
			</div>
			<!-- 팝업열리는 부분 end-->

		</div>
		<!-- 전체접수창 end -->
		
		<!-- 접수대기자 화면 -->
		<div class="sidebargroup">
			<div class="sidebar">
				<div class="sidebar-box">
					<h3>접수 대기자</h3>
					<hr>
					<div class="cat-list">
						<ul>
							<li><a href="#">담당의 : 황선화<br />환자명 : 순돌이
							</a></li>
							<li><a href="#">담당의 : 홍길동<br />환자명 : 순자
							</a></li>

						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- 접수대기자 화면 end -->







<!-- 상품추가 스크립트 -->
<script>			
	jQuery(document).ready(function() {

	//Accordion Nav
	jQuery('.mainNav').navAccordion({
		expandButtonText : '<i class="fa fa-plus"></i>', //Text inside of buttons can be HTML
		collapseButtonText : '<i class="fa fa-minus"></i>',
		buttonPosition : 'left',
		buttonWidth : '5%',
	}, function() {
		console.log('Callback')
	});
	
	//접수추가
	$('.add').bind('click', function() {

		if ($(this).hasClass('addpop')) {
			$('.popit-wrapper-chase').popitup({
				chase : false
			});
		}
	});

});

</script>

<script type="text/javascript">

	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-36251023-1']);
	_gaq.push(['_setDomainName', 'jqueryscript.net']);
	_gaq.push(['_trackPageview']);

	(function() {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	});

</script>

	</div>
</div>
