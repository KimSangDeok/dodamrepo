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
		var bigAndMid = bigMenu+midMenu;
		$.ajax({
			url : "/jinryo/smMonjin.dodam",
			type : 'get',
			data : {
				"bigMenu" : bigMenu,
				"midMenu" : midMenu
			},
			dataType : "json",
			success : function(data){
// 				console.log(data);
// 				console.log(data.length);
// 				console.log(data[0].PA_SM);
				var inputText = '';
				
				//문진한 값 담을 배열
				var saveArray = new Array();
				
				//라디오 일경우 name을 담기위한 배열
				var radioNameArray = new Array();
				
				$('#questionDiv',parent.document).text('');
				for(var i=0; i<data.length; i++){
					if(data[i].PA_SELECT_NUM=='1'){
						
						inputText='  <input type="radio" class="smInputRadio" name="'+data[i].PA_NUM+'" value="y" />예<input class="smInputRadio" type="radio" name="'+data[i].PA_NUM+'" value="n" />아니오';
						radioNameArray.push(data[i].PA_NUM);
					}else if(data[i].PA_SELECT_NUM=='2'){
						
						inputText='<input type="text" class="smInputText" name="'+data[i].PA_NUM+'" />';
					}
					
					$('#questionDiv',parent.document).append(''+'<br/>'+
						'<div class="content-wrapper">'+
							'<div>'+
								'<label>'+data[i].PA_SM+'</label>'+inputText+
							'</div>'+
						'</div>'+
					'');
				}	// end for문
				
				$('#questionDiv',parent.document).append(''+'<br/>'+
					'<div class="popit-content" style="  height:15%; float: center;">'+
						'<div class="popit-footer" style="float: center">'+
							'<button type="button" class="btn btn-primary" onclick="javascript:setInputValuesSession(\''+bigAndMid+'\', \''+radioNameArray+'\')">Ok</button>'+
						'</div>'+
					'</div>'+
				'');
			}
		});
		// 세션에 이미 저장한 값 있으면 뿌리기
		$(parent.location).attr("href", "javascript:getInputValuesSession('"+bigAndMid+"');");
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
