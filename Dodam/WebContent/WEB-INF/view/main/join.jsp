<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- 회원가입 화면 CSS -->
<link rel="stylesheet" type="text/css" href="/logincss/join.css" />

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- Scripts -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">
	//아이디 중복체크
	function idDuplicateCheck() {
		var reg_uid = /^[a-z0-9]{4,12}$/; //5~12자 영문소문자, 숫자 사용가능
		var reg_upw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,24}$/; //6~16자 영문대소문자, 숫자, 특수문자 혼합하여 사용
		var id = $.trim($("#per_id").val());
		// 로그인 프로세스 호출
		$.ajax({
			type : 'post',
			async : true,
			//url:'${pageContext.request.contextPath}/login_chk.do',
			url : 'idCheck.dodam',
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			// data: $("#userinput").serialize(),
			data : "per_id=" + $("#per_id").val(),

			success : function(resultData) {
				if (!reg_uid.test(id)) {
					$('#idCheckResult').html("4~ 12자 영문 소문자, 숫자만 사용가능합니다.");

				} else {
					$('#idCheckResult').html(resultData);
				}

			}
		});
	}

	// 생년월일 셀렉트박스 생성
	$(function() {
		var mydate = new Date();
		var ye = $('.year');
		var mo = $('.month');
		var da = $('.date');

		//년도 옵션 추가
		for (var i = mydate.getFullYear(); i > mydate.getFullYear() - 70; i--) {
			ye.append("<option value=" + i + ">" + i);
		}

		//월 옵션 추가
		for (var i = 1; i <= 12; i++) {
			if (i < 10) {
				mo.append("<option value='0" + i + "'>" + i);
			} else {
				mo.append("<option value=" + i + ">" + i);
			}
		}

		var d = new Date();
		d.setYear(ye.val());
		d.setMonth(mo.val());
		d.setDate(0);
		var date = d.getDate();

		//1~마지막날까지 옵션 추가
		for (var i = 1; i <= date; i++) {
			if (i < 10) {
				da.append("<option value='0" + i + "'>" + i);
			} else {
				da.append("<option value=" + i + ">" + i);
			}
		}

		//월이 바뀌었을때의 이벤트
		mo.change(function() {
			$("#date option").remove();

			//선택된 월의 마지막 날짜 얻어옴
			var d = new Date();
			d.setYear(ye.val());
			d.setMonth(mo.val());
			d.setDate(0);
			var date = d.getDate();

			//1~마지막날까지 옵션 추가
			for (var i = 1; i <= date; i++) {
				if (i < 10) {
					da.append("<option value='0" + i + "'>" + i);
				} else {
					da.append("<option value=" + i + ">" + i);
				}
			}
		});

	});

	//비밀번호 유효성
	$(function() {
		$("#per_pass")
				.blur(
						function() {
							var val = $(this).val();
							var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,16}$/;

							if (val == "" || val == null) {
								$("#pwCheckResult").html("필수입력");
							} else if (!regex.test(val)) {
								$("#pwCheckResult")
										.html(
												"6~ 16자 영문 대 소문자, 숫자, 특수문자 혼합하여 입력해주세요.");
							} else {
								$("#pwCheckResult").html("확인");
							}
						});
	});

	//비밀번호 확인
	$(function() {
		$("#reper_pass").blur(function() {
			var val = $(this).val();
			var orgin = $("#per_pass").val();

			if (val == "" || val == null) {
				$("#repwCheckResult").html("필수입력");
			} else if (val != orgin) {
				$("#repwCheckResult").html("비밀번호 불일치");
			} else {
				$("#repwCheckResult").html("확인");
			}
		});
	});

	//이름 유효성
	$(function() {
		$("#per_name").blur(function() {
			var val = $(this).val();
			var regex = /^[가-힣]{2,12}$/;

			if (val == "" || val == null) {
				$("#nameCheckResult").html("필수입력");
			} else if (!regex.test(val)) {
				$("#nameCheckResult").html("한글만 입력해주세요.");
			} else {
				$("#nameCheckResult").html("확인");
			}
		});
	});

	//연락처 유효성
	$(function() {
		$("#per_tel").blur(function() {
			var val = $(this).val();
			var regex = /^\d{2,3}\d{3,4}\d{4}$/;

			if (val == "" || val == null) {
				$("#telCheckResult").html("필수입력");
			} else if (!regex.test(val)) {
				$("#telCheckResult").html("숫자만 입력해주세요.");
			} else {
				$("#telCheckResult").html("확인");
			}
		});
	});

	//이메일 유효성
	$(function() {
		$("#per_mail").blur(function() {
			var val = $(this).val();
			var regex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

			if (val == "" || val == null) {
				$("#mailCheckResult").html("필수입력");
			} else if (!regex.test(val)) {
				$("#mailCheckResult").html("이메일 형식이 올바르지 않습니다.");
			} else {
				$("#mailCheckResult").html("확인");
			}
		});
	});

	//사용자의 자료 입력여부를 검사하는 함수
	function checkUserInput() {
		var reg_uid = /^[a-z0-9]{4,12}$/; // 아이디 정규표현식
		var reg_upw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,16}$/; // 비밀번호 정규표현식
		var reg_uname = /^[가-힣]{2,8}$/; // 이름 정규표현식
		var reg_umail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; // 이메일 정규표현식
		var reg_utel = /^\d{2,3}\d{3,4}\d{4}$/; // 연락처 정규표현식
		var id = $.trim($("#per_id").val());
		var pass = $.trim($("#per_pass").val());
		var name = $.trim($("#per_name").val());
		var mail = $.trim($("#per_mail").val());
		var tel = $.trim($("#per_tel").val());

		// 구분 미선택
		if (!($('.director').prop("checked")) && !($('.vet').prop("checked"))
				&& !($('.nurse').prop("checked"))) {
			alert("직책을 선택해 주세요.");
			$(".type").focus();
			return;
		}

		// 아이디 미입력
		if ($.trim($("#per_id").val()) == '') {
			alert("아이디를 입력해 주세요.");
			$("#per_id").focus();
			return;
		}

		// 정규표현식에 어긋나는 아이디
		if (!reg_uid.test(id)) {
			alert("올바른 형식의 아이디가 아닙니다.");
			$("#per_id").focus();
			return;
		}

		// 비밀번호 미입력
		if ($.trim($('#per_pass').val()) == '') {
			alert("비밀번호를 입력해 주세요.");
			$('#per_pass').focus();
			return;
		}

		// 정규표현식에 어긋나는 비밀번호
		if (!reg_upw.test(pass)) {
			alert("올바른 형식의 비밀번호가 아닙니다.");
			$("#per_pass").focus();
			return;
		}

		// 먼저입력한 비밀번호와 미일치
		if ($.trim($('#per_pass').val()) != $.trim($('#reper_pass').val())) {
			alert("비밀번호가 일치하지 않습니다.");
			$('#reper_pass').focus();
			return;
		}

		// 이름 미입력
		if ($.trim($('#per_name').val()) == '') {
			alert("이름을 입력해 주세요.");
			$('#per_name').focus();
			return;
		}

		// 정규표현식에 어긋나는 이름
		if (!reg_uname.test(name)) {
			alert("올바른 형식의 이름이 아닙니다.");
			$("#per_name").focus();
			return;
		}

		// 생년월일 미선택
		if (($('.year').val()) == '0' || ($('.month').val()) == '0'
				|| ($('.date').val()) == '0') {
			alert("생년월일을 입력해 주세요.");
			return;
		}

		// 연락처 미입력
		if ($.trim($('#per_tel').val()) == '') {
			alert("연락처를 입력해 주세요.");
			$('#per_tel').focus();
			return;
		}

		// 정규표현식에 어긋나는 연락처
		if (!reg_utel.test(tel)) {
			alert("올바른 형식의 연락처가 아닙니다.");
			$("#per_tel").focus();
			return;
		}

		// 이메일 미입력
		if ($.trim($('#per_mail').val()) == '') {
			alert("이메일을 입력해 주세요.");
			$('#per_mail').focus();
			return;
		}

		// 정규표현식에 어긋나는 이메일
		if (!reg_umail.test(mail)) {
			alert("올바른 형식의 이메일이 아닙니다.");
			$("#per_mail").focus();
			return;
		}

		// 약관미동의
		if (!($('#chkConfirm').prop("checked"))) {
			alert("약관에 동의하셔야 합니다.");
			return;
		}

		// 입력한 생년월일
		$('#per_birth').attr(
				'value',
				$.trim($('#per_y').val() + $('#per_m').val()
						+ $('#per_d').val()));

		// 선택한 구분번호
		$('#pertype_code').attr('value',
				$.trim($('input[type=radio][name=pertype]:checked').val()));

		// 자료를 전송합니다.
		document.userinput.submit();
	}
</script>

</head>
<body>

	<!-- Begin 상단메뉴 -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="main.dodam">도담도담</a>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse">
				<div class="row">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="main.dodam">HOME</a></li>
						<li><a href="main.dodam">로그인</a></li>
						<li><a href="join.dodam">회원가입</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<!-- End 상단메뉴 -->

	<!-- Begin 회원가입전체화면 -->
	<div class="contentwrap">
		<article class="container">
			<div class="page-header">
				<h1>
					회원가입 <small>관계자만 회원가입이 가능합니다.</small>
				</h1>
			</div>
			<br />

			<!-- Begin 정보작성폼 -->
			<form class="form-horizontal joinform" method="post"
				action="userInsert.dodam" name="userinput" id="userinput">
				
				<!-- Begin 정보작성란 -->
				<div class="join_group">
					<br />
					<div class="form-group">
						<label class="col-sm-2 control-label">*구분</label>
						<div class="col-sm-5 type" tabindex="0">
							<input type="hidden" name="pertype_code" id="pertype_code">
							<input type="radio" name="pertype" class="director" value="1">원장
							<input type="radio" name="pertype" class="vet" value="2">수의사
							<input type="radio" name="pertype" class="nurse" value="3">간호사
						</div>
					</div>
					<hr />
					<div class="form-group">
						<label for="inputId" class="col-sm-2 control-label">*아이디</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="per_id" name="per_id"
								placeholder="아이디" onkeyup="idDuplicateCheck()">

						</div>
						<span id="idCheckResult" style="width: 150px; color: red"></span>
					</div>
					<hr />
					<div class="form-group">
						<label for="inputPassword" class="col-sm-2 control-label">*비밀번호</label>
						<div class="col-sm-5">
							<input type="password" class="form-control" id="per_pass"
								name="per_pass" placeholder="비밀번호">

						</div>
						<span id="pwCheckResult" style="width: 150px; color: red"></span>
					</div>
					<hr />
					<div class="form-group">
						<label for="inputPasswordCheck" class="col-sm-2 control-label">*비밀번호
							확인</label>
						<div class="col-sm-5">
							<input type="password" class="form-control" id="reper_pass"
								placeholder="비밀번호 확인">
						</div>
						<span id="repwCheckResult" style="width: 150px; color: red"></span>
					</div>
					<hr />


					<div class="form-group">
						<label for="inputName" class="col-sm-2 control-label">*이름</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="per_name"
								name="per_name" placeholder="이름">
						</div>
						<span id="nameCheckResult" style="width: 150px; color: red"></span>
					</div>
					<hr />
					<div class="form-group">

						<label for="inputName" class="col-sm-2 control-label">*생년월일</label>

						<div class="col-sm-1">
							<input type="hidden" id="per_birth" name="per_birth"> <select
								class="year" title="년" id="per_y">
								<option value="0">년</option>

							</select>년
						</div>
						<div class="col-sm-1">
							<select class="month" title="월" id="per_m">
								<option value="0">월</option>


							</select>월
						</div>
						<div class="col-sm-1 day">
							<select class="date" title="일" id="per_d">
								<option value="0">일</option>

							</select>일
						</div>
					</div>

					<hr />
					<div class="form-group">
						<label for="inputNumber" class="col-sm-2 control-label">*연락처</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="per_tel"
								name="per_tel" placeholder="연락처">

						</div>
						<span id="telCheckResult" style="width: 150px; color: red"></span>
					</div>

					<hr />
					<div class="form-group">
						<label for="inputNumber" class="col-sm-2 control-label">*이메일주소</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="per_mail"
								name="per_mail" placeholder="이메일주소">

						</div>
						<span id="mailCheckResult" style="width: 150px; color: red"></span>
					</div>
				</div>
				<!-- End 정보작성란 -->

				<!-- Begin 이용약관화면 -->
				<br /> <label>*이용약관</label>
				<div class="tarConfirm1">
					<table class="confirmtable">
						<tbody>
							<tr>
								<td height="31" colspan="2">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" colspan="2"><strong>제1조(목적)</strong></td>
							</tr>
							<tr>
								<td width="20" height="20" align="center">&nbsp;</td>
								<td width="880" height="20">본 약관은 도담도담 웹챠트 홈페이지가 제공하는 모든
									서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 도담도담 웹챠트 홈페이지의 권리, 의무, 책임사항과 기타
									필요한 사항을 규정함을 목적으로 합니다.</td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" colspan="2"><strong> 제2조(약관의 효력과
										변경)</strong></td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">1. 도담도담 웹챠트 홈페이지는 귀하가 본 약관 내용에 동의하는 경우,
									도담도담 웹챠트 홈페이지의 서비스 제공 행위 및 귀하의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다. <br>
									2. 도담도담 웹챠트 홈페이지는 본 약관을 사전 고지 없이 변경할 수 있고, 변경된 약관은 도담도담 웹챠트
									홈페이지 내에 공지하거나 e-mail을 통해 회원에게 공지하며, 공지와 동시에 그 효력이 발생됩니다. 이용자가
									변경된 약관에 동의하지 않는 경우, 이용자는 본인의 회원등록을 취소(회원탈퇴)할 수 있으며 계속 사용의 경우는
									약관 변경에 대한 동의로 간주됩니다.
								</td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" colspan="2"><strong>제3조(약관 외 준칙)</strong></td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">1. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법,
									정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.</td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" colspan="2"><strong>제4조(용어의 정의)</strong></td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">본 약관에서 사용하는 용어의 정의는 다음과 같습니다. <br> 1.
									이용자 : 본 약관에 따라 도담도담 웹챠트 홈페이지가 제공하는 서비스를 받는 자.<br> 2. 가입 :
									도담도담 웹챠트 홈페이지가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을
									완료시키는 행위. <br> 3. 회원 : 도담도담 웹챠트 홈페이지에 개인 정보를 제공하여 회원 등록을 한
									자로서 도담도담 웹챠트 홈페이지가 제공하는 서비스를 이용할 수 있는 자. <br> 4. 비밀번호 :
									이용자와 회원ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이 선정한 문자와 숫자의
									조합. <br> 5. 탈퇴 : 회원이 이용계약을 종료시키는 행위
								</td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" colspan="2"><strong>제5조(이용계약의 성립)</strong></td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">1. 이용계약은 신청자가 온라인으로 도담도담 웹챠트 홈페이지에서 제공하는
									소정의 가입신청 양식에서 요구하는 사항을 기록하여 가입을 완료하는 것으로 성립됩니다. <br> 2.
									도담도담 웹챠트 홈페이지는 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다.<br>
									1) 다른 사람의 명의를 사용하여 신청하였을 때 <br> 2) 이용계약 신청서의 내용을 허위로
									기재하였거나 신청하였을 때 <br> 3) 다른 사람의 도담도담 웹챠트 홈페이지 서비스 이용을 방해하거나
									그 정보를 도용하는 등의 행위를 하였을 때 <br> 4) 도담도담 웹챠트 홈페이지를 이용하여 법령과 본
									약관이 금지하는 행위를 하는 경우<br> 5) 기타 도담도담 웹챠트 홈페이지가 정한 이용신청요건이 미비
									되었을 때
								</td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" colspan="2"><strong>제6조(회원정보 사용에
										대한 동의)</strong></td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">1. 회원의 개인정보는 [공공기관의 개인정보보호에 관한 법률]에 의해
									보호됩니다. <br> 2. 도담도담 웹챠트 홈페이지의 회원 정보는 다음과 같이 사용, 관리, 보호됩니다.<br>
									1) 개인정보의 사용 : 도담도담 웹챠트 홈페이지는 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승낙
									없이 제3자에게 누설, 배포하지 않습니다. 단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는
									경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한
									절차에 따른 요청이 있는 경우, 귀하가 도담도담 웹챠트 홈페이지에 제공한 개인정보를 스스로 공개한 경우에는
									그러하지 않습니다.<br> 2) 개인정보의 관리 : 귀하는 개인정보의 보호 및 관리를 위하여 서비스의
									개인정보관리에서 수시로 귀하의 개인정보를 수정/삭제할 수 있습니다. <br> 3) 개인정보의 보호 :
									귀하의 개인정보는 오직 귀하만이 열람/수정/삭제 할 수 있으며, 이는 전적으로 귀하의 ID와 비밀번호에 의해
									관리되고 있습니다. 따라서 타인에게 본인의 ID와 비밀번호를 알려주어서는 안되며, 작업 종료시에는 반드시 로그아웃
									해주시기 바랍니다. <br> 3. 회원이 본 약관에 따라 이용신청을 하는 것은, 도담도담 웹챠트
									홈페이지가 신청서에 기재된 회원정보를 수집, 이용하는 것에 동의하는 것으로 간주됩니다.
								</td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" colspan="2"><strong>제7조(사용자의 정보
										보안)</strong></td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">1. 가입 신청자가 도담도담 웹챠트 홈페이지 서비스 가입 절차를 완료하는
									순간부터 귀하는 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 ID와 비밀번호를 사용하여 발생하는 모든
									결과에 대한 책임은 회원 본인에게 있습니다. <br> 2. ID와 비밀번호에 관한 모든 관리의 책임은
									회원에게 있으며, 회원의 ID나 비밀번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 도담도담 웹챠트
									홈페이지에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다.<br>
									3. 이용자는 도담도담 웹챠트 홈페이지 서비스의 사용 종료시 마다 정확히 접속을 종료해야 하며, 정확히 종료하지
									아니함으로써 제3자가 귀하에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 도담도담
									웹챠트 홈페이지는 책임을 부담하지 아니합니다.
								</td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" colspan="2"><strong>제8조(서비스의 중지)</strong></td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">1. 도담도담 웹챠트 홈페이지는 이용자가 본 약관의 내용에 위배되는 행동을 한
									경우, 임의로 서비스 사용을 제한 및 중지할 수 있습니다.</td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" colspan="2"><strong>제9조(서비스의 변경 및
										해지)</strong></td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">1. 도담도담 웹챠트 홈페이지는 귀하가 서비스를 이용하여 기대하는 손익이나
									서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료,
									사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.<br> 2. 도담도담 웹챠트 홈페이지는
									서비스 이용과 관련하여 가입자에게 발생한 손해 중 가입자의 고의, 과실에 의한 손해에 대하여 책임을 부담하지
									아니합니다.
								</td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" colspan="2"><strong>제10조(게시물의 저작권)</strong></td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">1. 귀하가 게시한 게시물의 내용에 대한 권리는 귀하에게 있습니다. <br>
									2. 도담도담 웹챠트 홈페이지는 게시된 내용을 사전 통지 없이 편집, 이동할 수 있는 권리를 보유하며,
									게시판운영원칙에 따라 사전 통지 없이 삭제할 수 있습니다. <br> 3. 귀하의 게시물이 타인의 저작권을
									침해함으로써 발생하는 민, 형사상의 책임은 전적으로 귀하가 부담하여야 합니다.
								</td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" colspan="2"><strong>제11조(도담도담 웹챠트
										홈페이지의 의무)</strong></td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">1. 도담도담 웹챠트 홈페이지는 회원의 개인 신상 정보를 본인의 승낙없이
									타인에게 누설, 배포하지 않습니다. 다만, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가 있는
									경우에는 그러하지 아니합니다.</td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" colspan="2"><strong>제12조(회원의 의무)</strong></td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">1. 회원 가입 시에 요구되는 정보는 정확하게 기입하여야 합니다. 또한 이미
									제공된 귀하에 대한 정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 ID 및 비밀번호를
									제3자에게 이용하게 해서는 안됩니다. <br> 2. 회원은 도담도담 웹챠트의 사전 승낙 없이 서비스를
									이용하여 어떠한 영리행위도 할 수 없습니다.
								</td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" colspan="2"><strong>제13조(양도금지)</strong></td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">1. 회원이 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도,
									증여할 수 없습니다.</td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" colspan="2"><strong>제14조(손해배상)</strong></td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">1. 도담도담 웹챠트 홈페이지는 무료로 제공되는 서비스와 관련하여 회원에게
									어떠한 손해가 발생하더라도 도담도담 웹챠트 홈페이지가 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지
									아니합니다.</td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" colspan="2"><strong>제15조(면책조항)</strong></td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">1. 도담도담 웹챠트 홈페이지는 회원이나 제3자에 의해 표출된 의견을
									승인하거나 반대하거나 수정하지 않습니다. 도담도담 웹챠트 홈페이지는 어떠한 경우라도 회원이 서비스에 담긴 정보에
									의존해 얻은 이득이나 입은 손해에 대해 책임이 없습니다.<br> 2. 도담도담 웹챠트 홈페이지는 회원간
									또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 혹은 금전적 거래 등과 관련하여 어떠한 책임도 부담하지
									아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.
								</td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" colspan="2"><strong>제16조(재판관할)</strong></td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">1. 도담도담 웹챠트 홈페이지와 이용자간에 발생한 서비스 이용에 관한 분쟁에
									대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 대한민국의 법원에 제기합니다.</td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">&nbsp;</td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20" style="font-weight: bold;">부 칙 1. (시행일) 본
									약관은 2017년 6월 12일부터 시행됩니다.</td>
							</tr>
							<tr>
								<td height="20" align="center">&nbsp;</td>
								<td height="20">&nbsp;</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- End 이용약관화면 -->
				
				<!-- 약관동의체크 -->
				<input type="checkbox" name="chkConfirm" id="chkConfirm">
				<label>위 약관에 동의 합니다.</label> <br /> <br />

				<!-- Begin 회원가입/다시작성 버튼 -->
				<div class="button_group">
					<div class="col-sm-6">
						<input type="button" name="confirm" class="btn btn-primary"
							value="회원가입" OnClick="javascript:checkUserInput()">
						<button class="btn btn-warning">다시작성</button>
					</div>
				</div>
				<!-- End 회원가입/다시작성 버튼 -->
				<br /> <br /> <br /> <br />
			</form>
			<!-- End 정보작성폼 -->
		</article>
	</div>
	<!-- End 회원가입전체화면 -->
	
	<!-- Begin 하위 푸터 -->
	<div class="dvFooter" id="dvFooter">
		<div class="copyright">
			<address>
				경기도 성남시 분당구 삼평동 대왕판교로 670길 유스페이스2 B동 8층 Copyright ©2013 <strong>KOSTA</strong>
				All Rights Reserved. <br> 판교교육장 컨소시엄&nbsp;&nbsp; TEL :
				070-5039-5803,5805&nbsp;&nbsp; FAX : 070-7614-3450<br> 가산교육장
				컨소시엄&nbsp;&nbsp; TEL : 070-5039-5815&nbsp;&nbsp; FAX : 070-7614-3450<br>
			</address>
		</div>
	</div>
	<!-- End 하위 푸터 -->


</body>
</html>