<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
			top:300px;
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
		</style>
		<script src="/js/jquery.popitup.js"></script>
		<!-- begin : �˾� -->

		<!-- begin : colorPicker -->
		<link rel="stylesheet" href="/css/stay/color-picker.css" />
		<script src="/css/stay/color-picker.js"></script>
		<!-- end : colorPicker -->


<!-- �Կ� �� �������� �����ִ� ȭ�� stayView.jsp �Դϴ�. -->
<div class="body">

	<!-- begin : �Կ� �� ȣ�� �߰� �˾����� -->
	<div class="popit-wrapper popit-wrapper-chase" style="left: 0px; opacity: 0;">
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





	<!-- begin : �Կ� ȣ��, '�߰�', '����' ��ư -->
	<div class="row">
		<form method='get' action="/beauty/beautyCam.dodam">
		<div class="col-lg-12">
		<a class="btn btn-sm btn-primary btn-chase" href="javascript:void(0);" role="button">�Կ��� �� ȣ�� �߰�</a>
		<a class="registerbeauty" href="javascript:registerBeauty()">����</a> 

		</div>
		</form>
	</div>
	<script type="text/javascript" src="/beautymodal/rmodal.js"></script>
	<!-- end : �Կ� ȣ��, '�߰�', '����' ��ư -->


</div>



<script type="text/javascript">
$(document).ready(function() {
	
	// colorpicker�� hsl���� ���̰� �Ϸ��� combobox ����..������
	$('.format').hide();	
		
	
	// �Կ��� �� ȣ�� �߰� �̺�Ʈ : �˾� Ű��
	$('.btn-sm').bind('click', function(){
		if($(this).hasClass('btn-chase')){
			$('.popit-wrapper-chase').popitup({
				chase: false
			});
		}				        
	});	
    
	// �˾�â����, ��� DB�� ����! 
	$('.popitup-register').bind('click', function(){
		alert('��ϵ��');
		alert($('.ar_name').val());
		alert($('.ar_type option:selected').val());
		alert($('.color').val());
		alert($('.ar_price').val());
		
		// animalroom ���̺� �Կ��� �� ȣ�ڹ� �����͸� ��������.
		$.ajax({
			url : "/stay/newAnimalRoom.dodam",
			type : 'get',
			data : {'ar_name':$('.ar_name').val(), 'ar_type':$('.ar_type option:selected').val(), 'ar_color' : $('.color').val(), 'ar_price':$('.ar_price').val()},
			dataType : 'json',
    		success : function(data){

    		},
    		error:function(request, status,error){
    			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		})
		
		
		
		
	})



});
</script>