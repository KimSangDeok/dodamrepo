<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<link rel="stylesheet" href="/jinryoCss/css/bootstrap.css">

<script>
$(document).ready(function(){
	
	$('.header').addClass('hide');
});
</script>

<div class="body">
	<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								<span class="glyphicon glyphicon-bookmark"></span> 진료 차트
							</h3>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-12 col-md-12">
									<a href="#" class="btn btn-default btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-list-alt"></span> <br />문진표</a> 
									<a href="#" class="btn btn-primary btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-bookmark"></span> <br />증상</a> 
									<a href="#" class="btn btn-success btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-signal"></span> <br />진단명</a> 
									<a href="#" class="btn btn-info btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-comment"></span> <br />처치/처방</a> 
									<a href="#" class="btn btn-danger btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-comment"></span> <br />추가 진료</a>
								</div>
							</div>
							<br/>
							<div class="row">
								<div class="col-xs-12 col-md-12">
									<a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-user"></span> <br />혈액검사</a> 
									<a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-file"></span> <br />바이탈</a> 
									<a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-picture"></span> <br />X-ray</a> 
									<a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-tag"></span> <br />CT결과</a> 
									<a href="#" class="btn btn-warning btn-lg" role="button">&nbsp;<span class="glyphicon glyphicon-tag"></span> <br />심전도 검사</a>
								</div>
							</div>
							<br/>
							<a href="#" class="btn btn-success btn-lg btn-block" role="button"><span class="glyphicon glyphicon-globe"></span>진료완료</a>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>