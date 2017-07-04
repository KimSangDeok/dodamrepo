<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- c�±׸� ����ϱ� ���� taglib�� ����� �Ѵ�. -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	
	

			
		<!-- ��Ʈ��Ʈ�� ����!! -->
	    <link rel="stylesheet" href="/css/bootstrap.css" />
		
		<!-- begin : �˾� style�� script!! -->
		<style>
		.popit-wrapper {
			display: none;
			border: 1px solid #ccc;
			background: #fff;
			border-radius: 5px;
			box-shadow: 0px 0px 6px 2px #ccc;
			height:600px;
		}
		
		.popit-content {
			padding: 20px;
		}
		
		.popit-header {
			border-bottom: 1px solid #ccc;
		}
		
		.popit-body {
			padding: 20px 0;
			width: 300px;
			position: relative;
			overflow: hidden;
		}
		
		.popitup-overlay {
			background: #000;
			position: fixed;
			z-index: 9999;
			top: 0;
			bottom: 0;
			left: 0;
			right: 0;
			opacity: 0.5;
			
		}
		input[type="button"]{
			padding-left: 0;
			padding-right: 0;
		
		}

		</style>
		<script src="/js/jquery.popitup.js"></script>
		<!-- begin : �˾� -->

		<!-- begin : colorPicker -->
		<link rel="stylesheet" href="/css/stay/color-picker.css" />
		<script src="/css/stay/color-picker.js"></script>
		<!-- end : colorPicker -->
		
		<!-- begin : �Կ��� !!drag!! javascript�� css -->
        <link rel="stylesheet" href="/css/stay/styles.css" media="screen" title="no title" charset="utf-8">
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
        <script src="/css/stay/multidraggable.js" charset="utf-8"></script>
		<!-- end : �Կ��� !!drag!! javascript�� css -->
		
		
<!-- �Կ� �� �������� �����ִ� ȭ�� stayView.jsp �Դϴ�. -->
<div class="body">

	<!-- begin : �Կ� �� ȣ�� �߰� �˾����� -->
	<div class="popit-wrapper popit-wrapper-chase" id='addDIV' style="top:50%; left:0px; opacity:0;">
	<div class="popit-content">
		<div class="popit-header">
	    <h4 class="popit-title">�Կ��� �� ȣ�ڹ� �߰�</h4>
	    </div><br/>
	
		<!-- �˾�â �ٵ�κ� -->
		<div class="popit-body" id="bodycontainer">
		<div class="content-wrapper">
	  
	  	<div>
	  	<label>�̸�</label>
	  	<input type="text" class="ar_name"/>
	  	</div>
	
	    <div>
	  	<label>�з�</label>
	  	<select class="ar_type">
			<option value="�Կ�">�Կ�</option>	  	
			<option value="ȣ��">ȣ��</option>	  	
	  	</select>
	  	
	  	</div>      

	    <div>
	  	<label>����</label>
			<fieldset class="color-picker">
				<select class="format">
					<option selected>Hex</option>
					<option>RGB</option>
					<option>HSL</option>
				</select>
				<input class="color" type="text" value="#2ae7ea" />
				<div class="spectrum">
					<div>
						<div class="pin"></div>
					</div>
				</div>
				<input class="luminosity" type="range" min="0" max="100" />
			</fieldset>
	  	</div>
	  	
	  	<div>
	  	<label>����</label>
	  	<input type="text" class="ar_price"/>
	  	</div>      

	  	</div>
		</div><br/>
		<!-- �˾�â �ٵ� �� -->
		
		<div class="popit-footer" style="float:right">
			<button type="button" class="btn btn-default popitup-close">���</button>
			<button type="button" class="btn btn-primary popitup-register">���</button>
		</div>
	</div>
	</div>
	<!-- end : �Կ� �� ȣ�� �߰� �˾����� -->



	<!-- begin : �Կ� �� ȣ�ڿ� ���� �˾� ���� -->
	<div class="popit-wrapper popit-wrapper-chase" id='inDIV' style="left: 0px; opacity:0; width:800px; top:20px">
	<div class="popit-content">
		<div class="popit-header">
	    <h4 class="popit-title">�Կ��ϱ� �� ȣ�ڰ���</h4>
	    </div><br/>
	
		<!-- �˾�â �ٵ�κ� -->
		<div class="popit-body" id="bodycontainer">
		<div class="content-wrapper">
	  
	  	<div>
	  	<label>�Ⱓ</label>
	  	


	  	</div>
	
	  	<div>
	  	<label>����</label>
		<input type="radio" name="ar_type" value="�Կ�" checked>�Կ�<br>
		<input type="radio" name="ar_type" value="ȣ��">ȣ��<br>

	  	</div>

	    <div>
	  	<label>������</label>
	  	<select class="ar_type">
			<c:forEach var='emptyroom' items="${roomList}" >
			<option value="${emptyroom.ar_num}">${emptyroom.ar_name}</option>
			</c:forEach>		
	  	</select>
	  	
	  	</div>      

	  	<div>
	  	<label>�Կ�����</label>
	  	<input type="text" class="stay_reason"/>
	  	</div>      

	  	</div>
		</div><br/>
		<!-- �˾�â �ٵ� �� -->
		
		<div class="popit-footer" style="float:right">
			<button type="button" class="btn btn-default popitup-close">���</button>
			<button type="button" class="btn btn-primary popitup-register" id="inRegister">���</button>
		</div>
	</div>
	</div>
	<!-- end : �Կ� �� ȣ�ڿ� ���� �˾� ���� -->




	<!-- begin : �Կ� ȣ��, '�߰�', '����' ��ư -->
	<div class="row">
		<div class="col-lg-12">
		<a class="btn btn-sm btn-primary btn-chase" id='add' href="javascript:void(0);" role="button">�Կ��� �� ȣ�� �߰�</a>
		<a class="registerbeauty" href="javascript:hospitalSave()">����</a> 

		</div>
	</div>
	<script type="text/javascript" src="/beautymodal/rmodal.js"></script>
	<!-- end : �Կ� ȣ��, '�߰�', '����' ��ư -->


<!-- begin : stayView.jsp�� �ٽ�!!!!! -->
<div class="roomDIV">

	<ul id="multidraggable">
		<!-- db���� animalroom�� �ҷ��ͼ� �ѷ���� �Ѵ�. -->              		
		<c:forEach var='room' items="${stayList}" >
			<li id="${room.AR_NUM}" style="background-color:${room.AR_COLOR}; top:${room.AR_TOP}; left:${room.AR_LEFT}">
			
			${room.AR_NAME}<br/>
			
			<c:if test="${empty room.STAY_NUM}">
			<br/><br/><br/><br/><br/><br/><br/><br/><br/>
			<div style='float:left; width:100%; text-align:center'>
			<img src="/css/stay/in.png" class='in' alt="�Կ�" width="42" height="42">
			<img src="/css/stay/setting.png" alt="����" width="42" height="42">
			</div>	
			</c:if>

			<c:if test="${!empty room.STAY_NUM}">
			�����̸� : ${room.ANIMAL_NAME} <br/>
			���̸� : ${room.CUS_NAME} <br/>
			���� : ${room.STAY_REASON}<br/>
			<br/><br/><br/><br/><br/><br/>
			<div style='float:left; width:100%; text-align:center'>
			<img src="/css/stay/out.png" alt="���" width="42" height="42">
			<img src="/css/stay/showchart.png" alt="����" width="42" height="42">
			<img src="/css/stay/newchart.png" alt="�ۼ�" width="42" height="42">
			<img src="/css/stay/setting.png" alt="����" width="42" height="42">
			</div>
			</c:if>

			</li>
		</c:forEach>	
	</ul>
	<script type="text/javascript">
		$('#multidraggable').multidraggable();
	</script>
	<script>
		// �ϴ� ������, ��ġ ���� ������ �����ϰ� �غ��� �Ŵ�.
		function hospitalSave(){
			
			// ul�� �ڽ��� li ���� ����
			var li = $('#multidraggable').children();

			// li noeds�� ������ alert
			alert(li.length);
			// li�� ������ŭ 
			alert(li.attr('id')); 

			// ������ ar_num�� ar_top�� ar_left ���� li.length��ŭ �����ؾ� �մϴٿ�.
			
			
			var ar_num;
			var ar_top;
			var ar_left;
			var jsonArr = {'room' : []};
			
			li.each(function(){
				ar_num = $(this).attr('id');
				ar_top = $(this).offset().top;
				ar_left = $(this).offset().left;
				
				jsonArr.room.push({
					'ar_num' : ar_num,
					'ar_top' : ar_top,
					'ar_left' : ar_left
				})
			})
			
			/* ����! jason �ȿ� �迭�� ����!!! */
			alert(JSON.stringify(jsonArr));
			
			$.ajax({
				url : "/stay/save.dodam",
				type : 'post',
				data : JSON.stringify(jsonArr),
				dataType : 'text',
				success : function(data){
					location.href=data;
				},
				error:function(request, status,error){
		  			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		   		} 
				
			})
		}
	</script>


</div>
<!-- end : stayView.jsp�� �ٽ�!!!!! -->


</div>



<script type="text/javascript">
$(document).ready(function() {
	
	// colorpicker�� hsl���� ���̰� �Ϸ��� combobox ����..������
	$('.format').hide();	
		
	
	// �Կ��� �� ȣ�� �߰� �̺�Ʈ : �˾� Ű��
	$('#add').bind('click', function(){
		//if($(this).hasClass('btn-chase')){
			$('#addDIV').popitup({
				chase: false
			});
		//}				        
	});	
    
	// �� div�� �Կ� ��ư�� Ŭ���ϸ�, �Կ��ϰ��ϴ� div�� ���� �սô�.
	$('.in').bind('click', function(){
		$('#inDIV').popitup({
			chase: false
		});
	})
	
	// �˾�â����, ��� DB�� ����! 
	$('.popitup-register').bind('click', function(){

		// animalroom ���̺� �Կ��� �� ȣ�ڹ� �����͸� ��������.
		$.ajax({
			url : "/stay/newAnimalRoom.dodam",
			type : 'get',
			data : {'ar_name':$('.ar_name').val(), 'ar_type':$('.ar_type option:selected').val(), 'ar_color' : $('.color').val(), 'ar_price':$('.ar_price').val()},
			dataType : 'json',
    		success : function(data){
				// �Կ����̳� ȣ�ڹ��� ������ div�� append�϶�~
				
			    $('#multidraggable').append(
			    	'<li style="background-color: '+data.ar_color+'">'+data.ar_name+'</li>'		    		
			    );
    			
    		},
    		error:function(request, status,error){
    			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		})
	})
	




});
</script>

<script>





</script>



