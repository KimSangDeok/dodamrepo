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
		
		var bigMenu=$(this).attr('bigMenu');
		var midMenu=$(this).text();
		
		$.ajax({
			url : "/jinryo/smMonjin.dodam",
			type : 'get',
			data : {
				"bigMenu" : bigMenu,
				"midMenu" : midMenu
			},
			dataType : "json",
			success : function(data){
				console.log(data);
				console.log(data.length);
				console.log(data[0].PA_SM);
				var inputText = '';
				$('#questionDiv',parent.document).text('');
				for(var i=0; i<data.length; i++){
					if(data[i].PA_SELECT_NUM=='1'){
						
						inputText='  <input type="radio" name="a'+i+'" />예<input type="radio" name="a'+i+'" />아니오';
					}else if(data[i].PA_SELECT_NUM=='2'){
						
						inputText='<input type="text" />';
					}
					$('#questionDiv',parent.document).append(''+
						'<div class="content-wrapper">'+
							'<div>'+
								'<label>'+data[i].PA_SM+'</label>'+inputText+
							'</div>'+
						'</div>'+
					'');
				}
			}
		});
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
	            			<c:forEach items="${midMenus}" var="midMenus"  begin="${st.index}" end="${st.index}">
	            				<c:forEach items="${midMenus}" var="inMidMenus" >
	            					<li class="midLi" bigMenu="${bigMenus}">${inMidMenus}</li>
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
