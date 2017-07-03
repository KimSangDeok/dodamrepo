<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.txL{
	cursor:pointer;
}
.txL:HOVER{
	background-color: #EAEAEA;
}
</style>
<script>
$(document).ready(function(){
	
	$(".txL").on("click",function(){
		
		var txLargeMenu=$(this).text();
		
		$.ajax({
			url : "/jinryo/smTx.dodam",
			type : 'get',
			data : {
				"txLargeMenu" : txLargeMenu
			},
			dataType : "json",
			success : function(data){
				console.log(data);
				console.log(data.length);
				console.log(data[0].TX_SMALL);
				console.log(data[0].TX_PRICE);
// 				return false;
				var inputText = '';
				$('#txTBody',parent.document).text('');
				for(var i=0; i<data.length; i++){
					
					$('#txTBody',parent.document).append(''+
						'<tr>'+
							'<td>'+data[i].TX_SMALL+'</td>'+
							'<td>'+data[i].TX_PRICE+'</td>'+
						'</tr>'+
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
            	<c:forEach items="${txList}" var="txList" varStatus="st">
            		<li class="txL">${txList}</li>
            	</c:forEach>
            </ul>
        </div>
    </div>
</div>
</div>
