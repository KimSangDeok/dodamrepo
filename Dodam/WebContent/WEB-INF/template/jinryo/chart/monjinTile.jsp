<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> 
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Snippet - Bootsnipp.com</title>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
<style>/* MENU-LEFT
-------------------------- */
/* layout */
#left ul.nav {
	margin-bottom: 2px;
	font-size: 12px; /* to change font-size, please change instead .lbl */
}

#left ul.nav ul, #left ul.nav ul li {
	list-style: none !important;
	list-style-type: none !important;
	margin-top: 1px;
	margin-bottom: 1px;
}

#left ul.nav ul {
	padding-left: 0;
	width: auto;
}

#left ul.nav ul.children {
	padding-left: 12px;
	width: auto;
}

#left ul.nav ul.children li {
	margin-left: 0px;
}

#left ul.nav li a:hover {
	text-decoration: none;
}

#left ul.nav li a:hover .lbl {
	color: #999 !important;
}

#left ul.nav li.current>a .lbl {
	background-color: #999;
	color: #fff !important;
}

/* parent item */
#left ul.nav li.parent a {
	padding: 0px;
	color: #ccc;
}

#left ul.nav>li.parent>a {
	border: solid 1px #999;
	text-transform: uppercase;
}

#left ul.nav li.parent a:hover {
	background-color: #fff;
	-webkit-box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
	-moz-box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
	box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
}

/* link tag (a)*/
#left ul.nav li.parent ul li a {
	color: #222;
	border: none;
	display: block;
	padding-left: 5px;
}

#left ul.nav li.parent ul li a:hover {
	background-color: #fff;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
}

/* sign for parent item */
#left ul.nav li .sign {
	display: inline-block;
	width: 14px;
	padding: 5px 8px;
	background-color: transparent;
	color: #fff;
}

#left ul.nav li.parent>a>.sign {
	margin-left: 0px;
	background-color: #999;
}

/* label */
#left ul.nav li .lbl {
	padding: 5px 12px;
	display: inline-block;
}

#left ul.nav li.current>a>.lbl {
	color: #fff;
}

#left ul.nav  li a .lbl {
	font-size: 12px;
}

/* THEMATIQUE
------------------------- */
/* theme 1 */
#left ul.nav>li.item-1.parent>a {
	border: solid 1px #ff6307;
}

#left ul.nav>li.item-1.parent>a>.sign, #left ul.nav>li.item-1 li.parent>a>.sign
	{
	margin-left: 0px;
	background-color: #ff6307;
}

#left ul.nav>li.item-1 .lbl {
	color: #ff6307;
}

#left ul.nav>li.item-1 li.current>a .lbl {
	background-color: #ff6307;
	color: #fff !important;
}

/* theme 2 */
#left ul.nav>li.item-8.parent>a {
	border: solid 1px #51c3eb;
}

#left ul.nav>li.item-8.parent>a>.sign, #left ul.nav>li.item-8 li.parent>a>.sign
	{
	margin-left: 0px;
	background-color: #51c3eb;
}

#left ul.nav>li.item-8 .lbl {
	color: #51c3eb;
}

#left ul.nav>li.item-8 li.current>a .lbl {
	background-color: #51c3eb;
	color: #fff !important;
}

/* theme 3 */
#left ul.nav>li.item-15.parent>a {
	border: solid 1px #94cf00;
}

#left ul.nav>li.item-15.parent>a>.sign, #left ul.nav>li.item-15 li.parent>a>.sign
	{
	margin-left: 0px;
	background-color: #94cf00;
}

#left ul.nav>li.item-15 .lbl {
	color: #94cf00;
}

#left ul.nav>li.item-15 li.current>a .lbl {
	background-color: #94cf00;
	color: #fff !important;
}

/* theme 4 */
#left ul.nav>li.item-22.parent>a {
	border: solid 1px #ef409c;
}

#left ul.nav>li.item-22.parent>a>.sign, #left ul.nav>li.item-22 li.parent>a>.sign
	{
	margin-left: 0px;
	background-color: #ef409c;
}

#left ul.nav>li.item-22 .lbl {
	color: #ef409c;
}

#left ul.nav>li.item-22 li.current>a .lbl {
	background-color: #ef409c;
	color: #fff !important;
}
</style>
<script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
!function ($) {
    
    // Le left-menu sign
    /* for older jquery version
    $('#left ul.nav li.parent > a > span.sign').click(function () {
        $(this).find('i:first').toggleClass("icon-minus");
    }); */
    
    $(document).on("click","#left ul.nav li.parent > a > span.sign", function(){          
        $(this).find('i:first').toggleClass("icon-minus");      
    }); 
    
    // Open Le current menu
    $("#left ul.nav li.parent.active > a > span.sign").find('i:first').addClass("icon-minus");
    $("#left ul.nav li.current").parents('ul.children').addClass("in");

}(window.jQuery);</script>
</head>
<body>
      <tiles:insertAttribute name="noTemplate"/>
</body>
</html>


