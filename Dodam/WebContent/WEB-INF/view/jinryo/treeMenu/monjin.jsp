<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.bigLi, .midLi{
	cursor:pointer;
}
.midLi:HOVER{
	background-color: #EAEAEA;
}
</style>
<script>
$(document).ready(function(){
	
	$(".midLi").on("click",function(){
		
		alert('중메뉴 선택! 소메뉴 불러오자');
	});
});
</script>
<div class="body">
	<div class="container" style="margin-top:30px;">
    <div class="row">
        <div class="col-md-4">
            <ul id="tree2">
            	<c:forEach items="${bigMenus}" var="bigMenus" varStatus="st">
            		<li class="bigLi">${bigMenus}
            			<ul>
	            			<c:forEach items="${midMenus}" var="midMenus" begin="${st.index}" end="${st.index}">
	            				<c:forEach items="${midMenus}" var="inMidMenus">
	            					<li class="midLi">${inMidMenus}</li>
	            				</c:forEach>
	            			</c:forEach>
            			</ul>
            		</li>
            	</c:forEach>
            </ul>
        </div>
    </div>
</div>
</div>
