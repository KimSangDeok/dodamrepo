<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디/비밀번호 찾기</title>

<link rel="stylesheet" href="/logincss/idpw_find.css">
<script src="/logincss/idpw_find.js"></script>
</head>

<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td bgcolor="#999999" style="padding: 5px 10px;" class="white12bold">아이디/비밀번호
				찾기</td>
		</tr>
	</table>
	<table width="450" border="0" cellspacing="0" cellpadding="0"
		class="grey12">
		<tr>
			<td style="padding: 20px 0 0 0">
				<table width="420" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td
							style="padding: 15px; border-top: 2px #cccccc solid; border-right: 2px #cccccc solid; border-bottom: 2px #cccccc solid; border-left: 2px #cccccc solid;">
								<table width="380" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="stitle">아이디 찾기</td>
									</tr>
								</table>
								
								<!-- Begin 아이디찾기 입력란 -->
								<form name="id_f" id="id_f" method="post" action="id_find.dodam">
								<table width="380" border="0" cellspacing="1" class="regtable">
									<tr>
										<td width="100" height="25" bgcolor="#f4f4f4">이름</td>
										<td width="130"><input type="text" name="per_name"
											id="per_name" tabindex="1" /></td>
										<td rowspan="2" align="center"><div class="bts">
												<a href="javascript:id_search();" tabindex="4"><span
													style="width: 80px">아이디 찾기</span></a>
											</div></td>
									</tr>
									<tr>
										<td height="25" bgcolor="#f4f4f4">e-Mail</td>
										<td><input type="text" name="per_mail" id="per_mail"
											tabindex="2" /></td>
									</tr>
								</table>
							</form>
							<!-- End 아이디찾기 입력란 -->

							<!-- Begin 비밀번호찾기 입력란 -->
							<form name="pw_f" id="pw_f" method="post" action="pw_find.dodam">
								<table width="380" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="stitle">비밀번호 찾기</td>
									</tr>
								</table>
								<table width="380" border="0" cellspacing="1" class="regtable">
									<tr>
										<td width="100" height="25" bgcolor="#f4f4f4">ID</td>
										<td width="130"><input type="text" name="per_id"
											id="per_id" tabindex="5" /></td>
										<td rowspan="2" align="center"><div class="bts">
												<a href="javascript:pw_search();" tabindex="8"><span
													style="width: 80px">비밀번호 찾기</span></a>
											</div></td>
									</tr>
									<tr>
										<td height="25" bgcolor="#f4f4f4">e-Mail</td>
										<td><input type="text" name="per_mail" id="per_mail"
											tabindex="6" /></td>
									</tr>
								</table>
							</form>
							<!-- End 비밀번호찾기 입력란 -->


						</td>
					</tr>
				</table>
				
				<!-- Begin 닫기버튼 -->
				<table border="0" align="right" cellpadding="0" cellspacing="0">
					<tr>
						<td height="40" style="padding: 0 13px 0 0">
							<div class="bts">
								<a href="javascript:self.close();"><span style="width: 50px">닫기</span></a>
							</div>
						</td>
					</tr>
				</table>
				<!-- End 닫기버튼 -->
			</td>
		</tr>
	</table>
</body>
</html>