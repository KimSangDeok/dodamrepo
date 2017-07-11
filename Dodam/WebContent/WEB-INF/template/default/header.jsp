<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script>
    $(function(){
    	$('#logout').click(function(){
    		
			location.href="/main/main.dodam";
    	});
    });
    </script>
<div class="headerTile">
	<!-- Header 로그인화면 전 시작화면 -->
	<header id="header" class='header hide'>
		<div class="inner">
			<div class="content">
				<h1>DodamDodam</h1>
				<h2 style="font-weight:bold;font-size:30px;color:white;">User Name : ${userName}</h2>
				<input type="hidden" value="${userid}">
				<a href="#" id="logout" class="button big alt" style="background-color: #e74c3c;"><span style="color:white;">Logout</span></a>	
				<a href="#" class="button big alt" style="background-color: #e74c3c;"><span style="color:white;">close</span></a>
			</div>
			<a href="#" class="button hidden"><span>start</span></a>
		</div>
	</header>
</div>