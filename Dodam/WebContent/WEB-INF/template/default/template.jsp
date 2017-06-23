<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
		<title>도담도담에 오신것을 환영합니다</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/maincss/css/main.css" />		
		<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="/css/reset.css"> <!--CSS reset-->
	<link rel="stylesheet" href="/css/style.css"> <!--Resource style  -->
	
		
		
		
		<!-- 스마트 메뉴 관련 시작 -->
		<!-- SmartMenus core CSS (required) -->
		<link href="/css/sm-core-css.css" rel="stylesheet" type="text/css" />
		
		<!-- "sm-mint" menu theme (optional, you can use your own CSS, too) -->
		<link href="/css/sm-mint.css" rel="stylesheet" type="text/css" />
		
		<!-- #main-menu config - instance specific stuff not covered in the theme -->
		<!-- Put this in an external stylesheet if you want the media query to work in IE8 (e.g. where the rest of your page styles are) -->
		<style type="text/css">
			@media (min-width: 768px) {
				#main-nav {
					line-height: 0;
					text-align: center;
				}
				#main-menu {
					display: inline-block;
				}
			}
		</style>
		
		<!-- jQuery -->
		<script type="text/javascript" src="/js/jquery-3.2.1.js"></script>
		
		<!-- SmartMenus jQuery plugin -->
		<script type="text/javascript" src="/js/jquery.smartmenus.js"></script>
		
		 <!-- Modernizr -->
		<script src="/js/modernizr.js"></script>
<!-- 		<script src="/js/jquery-2.1.4.js"></script> -->
		<script src="/js/popmenumain.js"></script> <!--Resource jQuery-->
		
		
		<!-- SmartMenus jQuery init -->
		<script type="text/javascript">
			$(function() {
				$('#main-menu').smartmenus({
					subMenusSubOffsetX: 6,
					subMenusSubOffsetY: -8
				});
			});
		</script>
		<!-- 스마트 메뉴 관련 끝 -->
		
		
	</head>
	
	
<body>
    <div class="page">
	        <tiles:insertAttribute name="headerTile" />
	        <div id="main" style="text-align:center">
		        <div class="content">
		            <tiles:insertAttribute name="smallMenu" />
		            <div style="margin-top:35px">
			            <tiles:insertAttribute name="menu" />
			            <tiles:insertAttribute name="infoMenu" />
			            <tiles:insertAttribute name="body" />
		            </div>
		        </div>
	      	</div>
        </div>
        <tiles:insertAttribute name="footer" />
    <!-- Scripts -->
			<!-- jquery가 겹쳐서 -->
<!-- 			<script src="/js/jquery.min.js"></script> -->
			<script src="/js/skel.min.js"></script>
			<script src="/js/util.js"></script>
			<script src="/js/main.js"></script>
</body>
</html>