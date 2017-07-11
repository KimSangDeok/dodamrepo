<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

	<link href="/css/stay/bootstrap-combobox.css" rel="stylesheet" type="text/css">
	<script src="/css/stay/bootstrap-combobox.js"></script>

<!-- 입원 및 병원실을 보여주는 화면 stayCam.jsp 입니다. -->


<div class="body"><br/>

	<select class="input-large form-control">
		<option value="AL" selected="selected">입원장 및 병원실 선택</option>
		<option value="AK">입원실1</option>
		<option value="AZ">입원실2</option>
		<option value="AR">젤좋은호텔</option>
	</select><br/><br/><br/>
	
	<!-- start : 콤보박스 관련 script -->
	<script>
	$(document).ready(function(){
		
		if(!('url' in window)&&('webkitURL' in window)){
			window.URL = window.webkitURL;
		}
		
		$('#camera').change(function(e){
			$('#pic').attr('src', URL.createObjectURL(e.target.files[0]));
			
		});
		
	          $('.combobox').combobox();
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
	})();
	</script>
	<!-- end : 콤보박스 관련 script -->




	<!-- 라즈베리로 입원장을 보여주는 화면을 설계합시다~~~~~~~~ -->

	<img src="http://192.168.0.194:8080/?action=stream" alt='입원장을 보여주는 곳입니다.'/>
	
	<!-- end : 라즈베리 입원장 보여주는 곳 -->


</div>


				​
				​
				​