<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>Radius by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
				
		<link rel="stylesheet" href="/jinryoCss/css/bootstrap.css">
		
		<link rel="stylesheet" href="/jinryoCss/assets/css/main.css" />
		
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
  #section1 {color: #fff; background-color: #1E88E5;}
  #section2 {color: #fff; background-color: #673ab7;}
  #section3 {color: #fff; background-color: #ff9800;}
  #section4 {color: #fff; background-color: #00bcd4;}
  #section5 {color: #fff; background-color: #009688;}
  #section6 {color: #fff; background-color: #9FC93C;}

  
  @media screen and (max-width: 810px) {
    #section1, #section2, #section3, #section41, #section42  {
        margin-left: 150px;
    }
  }
  </style>

	</head>
	<body data-spy="scroll" data-target="#myScrollspy" data-offset="20">

		<!-- Header 로그인화면 전 시작화면 -->
			<header id="header" class='header hide'>
				<div class="inner">
					<div class="content">
						<h1>DodamDodam</h1>
						<h2>건강하고 예쁘게 자라주렴</h2>
						<a href="#" class="button big alt"><span>도담도담한 시작</span></a>
					</div>
					<a href="#" class="button hidden"><span>start</span></a>
				</div>
			</header>
			
		<!-- Main -->
			<div id="main" style="text-align:center">
				 
				 
				 <div style="line-height:100px">
				 <a href="/reservation/reserView.dodam">예약</a>
				 <a href="/counter/counterView.dodam">접수</a>
				 <a href="/main/main.dodam">홈</a>
				 <a href="/jinryo/jinryoView.dodam">진료</a>
				 <a href="/stay/stayView.dodam">입원/호텔</a>
				 <a href="/beauty/beautyView.dodam">미용</a>
				 <a href="/payment/paymentView.dodam">수납</a>
				 </div>
				 
				 
				 <!-- 여기 부분이 실질적으로 코딩하는 부분입니다~~~ div의 테두리는 지금 보기 편하기 위한 부분이고, 나중에 지울껍니다~~ -->
				 <div style="border:1px solid red">
				
				<style>
					body { padding-top:20px; }
					.panel-body .btn:not(.btn-block) { width:150px;margin-bottom:10px; }
					.panel-heading {height: 80px;}
				</style>
					<div class="container">
    <div class="row">
        <div class="col-md-10">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="glyphicon glyphicon-bookmark"></span> 진료 차트</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                          <a href="#" class="btn btn-default btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-list-alt"></span> <br/>문진표</a>
                          <a href="#" class="btn btn-primary btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-bookmark"></span> <br/>증상</a>
                          <a href="#" class="btn btn-success btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-signal"></span> <br/>진단명</a>
                          <a href="#" class="btn btn-info btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-comment"></span> <br/>처치/처방</a>
                          <a href="#" class="btn btn-danger btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-comment"></span> <br/>추가 진료</a>
                        </div>
                   	</div>
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                          <a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-user"></span> <br/>혈액검사</a>
                          <a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-file"></span> <br/>바이탈</a>
                          <a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-picture"></span> <br/>X-ray</a>
                          <a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-tag"></span> <br/>CT결과</a>
                          <a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-tag"></span> <br/>심전도 검사</a>
                        </div>
                    </div>
                   	<a href="#" class="btn btn-success btn-lg btn-block" role="button"><span class="glyphicon glyphicon-globe"></span>진료완료</a>
                </div>
            </div>
        </div>
    </div>
</div>
									 
				 
				 </div>
				 
				 
				 
				 
				 
				 
				
				
			</div>

		<!-- Footer -->
			<footer id="footer">
				<a href="#" class="info fa fa-info-circle"><span>About</span></a>
				<div class="inner">
					<div class="content">
						<h3>Vestibulum hendrerit tortor id gravida</h3>
						<p>In tempor porttitor nisl non elementum. Nulla ipsum ipsum, feugiat vitae vehicula vitae, imperdiet sed risus. Fusce sed dictum neque, id auctor felis. Praesent luctus sagittis viverra. Nulla erat nibh, fermentum quis enim ac, ultrices euismod augue. Proin ligula nibh, pretium at enim eget, tempor feugiat nulla.</p>
					</div>
					<div class="copyright">
						<h3>Follow me</h3>
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
						</ul>
						&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com/">Unsplash</a>.
					</div>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="/assets/js/jquery.min.js"></script>
			<script src="/assets/js/skel.min.js"></script>
			<script src="/assets/js/util.js"></script>
			<script src="/assets/js/main.js"></script>

	</body>
</html>