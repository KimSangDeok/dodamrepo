<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" href="/jinryoCss/css/bootstrap.css">
		
<!-- <link rel="stylesheet" href="/jinryoCss/assets/css/main.css" /> -->

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	position: relative;
}

ul.nav-pills {
	top: 130px;
	position: fixed;
}

div.col-sm-9 div {
	height: 500px;
	font-size: 28px;
}

#section1 {
	color: #fff;
	background-color: #1E88E5;
}

#section2 {
	color: #fff;
	background-color: #673ab7;
}

#section3 {
	color: #fff;
	background-color: #ff9800;
}

#section4 {
	color: #fff;
	background-color: #00bcd4;
}

#section5 {
	color: #fff;
	background-color: #009688;
}

#section6 {
	color: #fff;
	background-color: #9FC93C;
}

@media screen and (max-width: 810px) {
	#section1, #section2, #section3, #section41, #section42 {
		margin-left: 150px;
	}
}
</style>







	<!-- 여기 부분이 실질적으로 코딩하는 부분입니다~~~ div의 테두리는 지금 보기 편하기 위한 부분이고, 나중에 지울껍니다~~ -->

		<style>
body {
	padding-top: 20px;
}

.panel-body .btn:not (.btn-block ) {
	width: 150px;
	margin-bottom: 10px;
}

.panel-heading {
	height: 80px;
}
</style>
		

<div class="body">
	<div class="container">
			<div class="row">
				<div class="col-md-10">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								<span class="glyphicon glyphicon-bookmark"></span> 진료 차트
							</h3>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-12 col-md-12">
									<a href="#" class="btn btn-default btn-lg" role="button">&nbsp;<span
										class="glyphicon glyphicon-list-alt"></span> <br />문진표
									</a> <a href="#" class="btn btn-primary btn-lg" role="button">&nbsp;<span
										class="glyphicon glyphicon-bookmark"></span> <br />증상
									</a> <a href="#" class="btn btn-success btn-lg" role="button">&nbsp;<span
										class="glyphicon glyphicon-signal"></span> <br />진단명
									</a> <a href="#" class="btn btn-info btn-lg" role="button">&nbsp;<span
										class="glyphicon glyphicon-comment"></span> <br />처치/처방
									</a> <a href="#" class="btn btn-danger btn-lg" role="button">&nbsp;<span
										class="glyphicon glyphicon-comment"></span> <br />추가 진료
									</a>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12 col-md-12">
									<a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span
										class="glyphicon glyphicon-user"></span> <br />혈액검사
									</a> <a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span
										class="glyphicon glyphicon-file"></span> <br />바이탈
									</a> <a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span
										class="glyphicon glyphicon-picture"></span> <br />X-ray
									</a> <a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span
										class="glyphicon glyphicon-tag"></span> <br />CT결과
									</a> <a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span
										class="glyphicon glyphicon-tag"></span> <br />심전도 검사
									</a>
								</div>
							</div>
							<a href="#" class="btn btn-success btn-lg btn-block"
								role="button"><span class="glyphicon glyphicon-globe"></span>진료완료</a>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>