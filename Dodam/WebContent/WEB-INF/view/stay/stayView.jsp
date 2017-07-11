<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- c�±׸� ����ϱ� ���� taglib�� ����� �Ѵ�. -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	
	
		<!-- ��Ʈ��Ʈ�� ����!! -->
	    <link rel="stylesheet" href="/css/bootstrap.css" />
		
		<!-- begin : �˾� style�� script!! -->
		<link rel="stylesheet" href="/css/stay/popup.css"/>
		<script src="/js/jquery.popitup.js"></script>
		<!-- end : �˾� -->

		<!-- begin : colorPicker -->
		<link rel="stylesheet" href="/css/stay/color-picker.css" />
		<script src="/css/stay/color-picker.js"></script>
		<!-- end : colorPicker -->
		
		<!-- begin : �Կ��� !!drag!! javascript�� css -->
        <link rel="stylesheet" href="/css/stay/styles.css" media="screen" title="no title" charset="utf-8">
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
        <script src="/css/stay/multidraggable.js" charset="utf-8"></script>
		<!-- end : �Կ��� !!drag!! javascript�� css -->

		<!-- date range picker�� css (�Կ��ϱ� �� ȣ�ڰ��� �˾����� ����� �˴ϴ�.) -->
		<link href="/css/goods/smalldatepicker/smallDatestyle.css" rel="stylesheet" type="text/css">
		<link href="/css/goods/smalldatepicker/smallcalendar.css" rel="stylesheet" type="text/css">
		<!-- date range picker�� css (�Կ��ϱ� �� ȣ�ڰ��� �˾����� ����� �˴ϴ�.) -->

<style>
#add {
	background-color: #e74c3c;
    border-color: #e74c3c;
}
.registerbeauty {
	background-color: #e74c3c;
    border-color: #e74c3c;
}
.registerbeauty:hover{
	color: #00000;
	background-color: #fafbfb;
    border-color: #e74c3c;
}

#add:hover{
	color: black;
	background-color: #fafbfb;
    border-color: #e74c3c;
}
</style>
<!-- �Կ� �� �������� �����ִ� ȭ�� stayView.jsp �Դϴ�. -->
<div class="body">


	<!-- begin : �Կ� �� ȣ�� �߰� �˾����� id:addDIV -->
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
	  	<select class="ADDar_type">
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
	  	<br/>
	  	<div class="popit-footer" style="float:right">
			<button type="button" class="btn btn-default popitup-close">���</button>
			<button type="button" class="btn btn-primary popitup-register" id='addRegister'>���</button>
		</div>
	  	
		</div><br/>
		<!-- �˾�â �ٵ� �� -->
	</div>
	</div>
	<!-- end : �Կ� �� ȣ�� �߰� �˾����� -->



	<!-- begin : �Կ� �� ȣ�ڿ� ���� �˾� ���� -->
	<div class="popit-wrapper popit-wrapper-chase" id='inDIV' style="top:50%; left:0px; opacity:0; width:700px">
	<div class="popit-content">
		<div class="popit-header">
	    <h4 class="popit-title">�Կ��ϱ� �� ȣ�ڰ���</h4>
	    </div><br/>
	
		<!-- �˾�â �ٵ�κ� -->
		<div class="popit-body" id="bodycontainer" style="width:100%; height:100%">
		<div class="content-wrapper">
	  
	  	<div>
	  	<label>�Ⱓ</label>

	<!-- begin : �̿� ��� �Ⱓ�� �����ϴ� datepicker -->
	<div class="form-row">
		<div style="float:left">
		<input type="text" placeholder="Date range picker" id="rangedate"><div class="dt"><div class="dt__wrapper rangedate"><div class="dt__calendar dt__start"><div class="dt__calendar_head"><div class="dt__calendar_head_wday">Tuesday</div><div class="dt__calendar_head_month"><i class="prev">&lt;</i><span>June</span><i class="next">&gt;</i></div><div class="dt__calendar_head_day">20</div><div class="dt__calendar_head_year"><i class="prev">&lt;</i>2017<i class="next">&gt;</i></div></div><div class="dt__calendar_nav"><div class="dt__calendar_nav_title">Jun 2017</div></div><div class="dt__calendar_start"><div class="dt__calendar_m"><div class="dt__calendar_m_w"><div class="dt__calendar_m_w_n">Su</div><div class="dt__calendar_m_w_n">Mo</div><div class="dt__calendar_m_w_n">Tu</div><div class="dt__calendar_m_w_n">We</div><div class="dt__calendar_m_w_n">Th</div><div class="dt__calendar_m_w_n">Fr</div><div class="dt__calendar_m_w_n">Sa</div></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d ">1</div><div class="dt__calendar_m_d ">2</div><div class="dt__calendar_m_d ">3</div><div class="dt__calendar_m_d ">4</div><div class="dt__calendar_m_d ">5</div><div class="dt__calendar_m_d ">6</div><div class="dt__calendar_m_d ">7</div><div class="dt__calendar_m_d ">8</div><div class="dt__calendar_m_d ">9</div><div class="dt__calendar_m_d ">10</div><div class="dt__calendar_m_d ">11</div><div class="dt__calendar_m_d ">12</div><div class="dt__calendar_m_d ">13</div><div class="dt__calendar_m_d ">14</div><div class="dt__calendar_m_d ">15</div><div class="dt__calendar_m_d ">16</div><div class="dt__calendar_m_d ">17</div><div class="dt__calendar_m_d ">18</div><div class="dt__calendar_m_d ">19</div><div class="dt__calendar_m_d active">20</div><div class="dt__calendar_m_d between">21</div><div class="dt__calendar_m_d between">22</div><div class="dt__calendar_m_d between">23</div><div class="dt__calendar_m_d active">24</div><div class="dt__calendar_m_d ">25</div><div class="dt__calendar_m_d ">26</div><div class="dt__calendar_m_d ">27</div><div class="dt__calendar_m_d ">28</div><div class="dt__calendar_m_d ">29</div><div class="dt__calendar_m_d ">30</div></div></div></div><div class="dt__calendar dt__end"><div class="dt__calendar_head"><div class="dt__calendar_head_wday">Saturday</div><div class="dt__calendar_head_month"><i class="prev">&lt;</i><span>June</span><i class="next">&gt;</i></div><div class="dt__calendar_head_day">24</div><div class="dt__calendar_head_year"><i class="prev">&lt;</i>2017<i class="next">&gt;</i></div></div><div class="dt__calendar_nav"><div class="dt__calendar_nav_title">Jun 2017</div></div><div class="dt__calendar_end"><div class="dt__calendar_m"><div class="dt__calendar_m_w"><div class="dt__calendar_m_w_n">Su</div><div class="dt__calendar_m_w_n">Mo</div><div class="dt__calendar_m_w_n">Tu</div><div class="dt__calendar_m_w_n">We</div><div class="dt__calendar_m_w_n">Th</div><div class="dt__calendar_m_w_n">Fr</div><div class="dt__calendar_m_w_n">Sa</div></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d_e"></div><div class="dt__calendar_m_d ">1</div><div class="dt__calendar_m_d ">2</div><div class="dt__calendar_m_d ">3</div><div class="dt__calendar_m_d ">4</div><div class="dt__calendar_m_d ">5</div><div class="dt__calendar_m_d ">6</div><div class="dt__calendar_m_d ">7</div><div class="dt__calendar_m_d ">8</div><div class="dt__calendar_m_d ">9</div><div class="dt__calendar_m_d ">10</div><div class="dt__calendar_m_d ">11</div><div class="dt__calendar_m_d ">12</div><div class="dt__calendar_m_d ">13</div><div class="dt__calendar_m_d ">14</div><div class="dt__calendar_m_d ">15</div><div class="dt__calendar_m_d ">16</div><div class="dt__calendar_m_d ">17</div><div class="dt__calendar_m_d ">18</div><div class="dt__calendar_m_d ">19</div><div class="dt__calendar_m_d active">20</div><div class="dt__calendar_m_d between">21</div><div class="dt__calendar_m_d between">22</div><div class="dt__calendar_m_d between">23</div><div class="dt__calendar_m_d active">24</div><div class="dt__calendar_m_d ">25</div><div class="dt__calendar_m_d ">26</div><div class="dt__calendar_m_d ">27</div><div class="dt__calendar_m_d ">28</div><div class="dt__calendar_m_d ">29</div><div class="dt__calendar_m_d ">30</div></div></div></div><div class="dt__ranges"><div class="dt__ranges_item" data-range="0" "="">Yesterday</div><div class="dt__ranges_item" data-range="1" "="">Sunday</div><div class="dt__ranges_item" data-range="2" "="">2 Weeks</div><div class="dt__ranges_item" data-range="3" "="">This Month</div><div class="dt__ranges_item" data-range="4" "="">Last Month</div><div class="dt__ranges_item" data-range="5" "="">This Year</div></div></div></div>
		</div>
	</div><br/>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.min.js"></script>
	
<!-- begin : �� ��ũ��Ʈ�� daterange �ٲ�� table �ٽ� search �ϴ� �ڵ� ���� ������ ������ -->
	<script src="/css/stay/daterangepicker.js"></script>
<!-- end : �� ��ũ��Ʈ�� daterange �ٲ�� table �ٽ� search �ϴ� �ڵ� ���� ������ ������ -->
		
	<script type="text/javascript">
	$(function(){
		 $('#rangedate').DatePicker({
		        type: 'rangedate',
		    startDate: moment().subtract(1, 'week'),
		    endDate: moment(),
		    ranges: [{
		        label: "Yesterday",
		        startDate: moment().subtract(1, 'day'),
		        endDate: moment().subtract(1, 'day')
		    }, {
		        label: 'Sunday',
		        startDate: moment().startOf('week'),
		        endDate: moment()
		    }, {
		        label: '2 Weeks',
		        startDate: moment().startOf('week').subtract(1, 'week'),
		        endDate: moment()
		    }, {
		        label: 'This Month',
		        startDate: moment().startOf('month'),
		        endDate: moment()
		    }, {
		        label: 'Last Month',
		        startDate: moment().startOf('month').subtract(1, 'month'),
		        endDate: moment().startOf('month')
		    }, {
		        label: 'This Year',
		        startDate: moment().startOf('year'),
		        endDate: moment().startOf('moth')
		    }]
		    });      				      
		});
	</script>
	<!-- end : datepicker -->


	  	</div>
	
	  	<div>
	  	<label>����</label>
		<input type="radio" name="ar_type" value="�Կ�" checked>�Կ�<br>
		<input type="radio" name="ar_type" value="ȣ��">ȣ��<br>
	  	</div>
	  	
	    <div>
	  	<label>������</label>
	  	<select class="radio_ar_type" name='radio_ar_type'>
			<c:forEach var='emptyroom' items="${roomList}" >
			<option value="${emptyroom.ar_num}">${emptyroom.ar_name}</option>
			</c:forEach>		
	  	</select>
	  	
	  	</div>      

	  	<div>
	  	<label>�Կ�����</label>
	  	<input type="text" class="stay_reason"/>
	  	</div>      
	  	<br/>
	  	
	  	<div class="popit-footer" style="float:right">
			<button type="button" class="btn btn-default popitup-close">���</button>
			<button type="button" class="btn btn-primary popitup_close" id="inRegister">���</button>
		</div>
	  	</div>
		</div><br/>
		<!-- �˾�â �ٵ� �� -->
		
		<div class="popit-footer" style="float:right">

		</div>
	</div>
	</div>
	<!-- end : �Կ� �� ȣ�ڿ� ���� �˾� ���� -->



	<!-- begin : �Կ� �� ȣ�� ���� �����ϴ� �˾� id:setDIV -->
	<div class="popit-wrapper popit-wrapper-chase" id='setDIV' style="top:50%; left:0px; opacity:0;">
	<div class="popit-content">
		<div class="popit-header">
	    <h4 class="popit-title">�Կ��� �� ȣ�ڹ� ���� ����</h4>
	    </div><br/>
	
		<!-- �˾�â �ٵ�κ� -->
		<div class="popit-body" id="bodycontainer">
		<div class="content-wrapper">
	  
	  	<div>
	  	<label>�̸�</label>
	  	<input type="hidden" class='set_ar_num'/>
	  	<input type="text" class="set_ar_name"/>
	  	</div>
	
	    <div>
	  	<label>�з�</label>
	  	<select class="set_ar_type">
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
				<input class="color" id='set_ar_color' type="text" value="#2ae7ea" />
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
	  	<input type="text" class="set_ar_price"/>
	  	</div>      

	  	</div>
	  	<br/>
	  	<div class="popit-footer" style="float:right">
			<button type="button" class="btn btn-default popitup-close">���</button>
			<button type="button" class="btn btn-primary popitup-register" id='setRegister'>���</button>
		</div>
	  	
		</div><br/>
		<!-- �˾�â �ٵ� �� -->
	</div>
	</div>
	<!-- end : �Կ� �� ȣ�� �߰� �˾����� -->





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
			<img src="/css/stay/setting.png" class='set' id="${room.AR_NUM}+${room.AR_NAME}+${room.AR_TYPE}+${room.AR_COLOR}+${room.AR_PRICE}" alt="����" width="42" height="42">
			</div>	
			</c:if>

			<c:if test="${!empty room.STAY_NUM}">
			�����̸� : ${room.ANIMAL_NAME} <br/>
			���̸� : ${room.CUS_NAME} <br/>
			���� : ${room.STAY_REASON}<br/>
			<br/><br/><br/><br/><br/><br/>
			<div style='float:left; width:100%; text-align:center'>
			<img src="/css/stay/out.png" class="out" id="${room.AR_NUM}+${room.STAY_NUM}+${room.ANIMAL_NUM}"alt="���" width="42" height="42">
			<img src="/css/stay/showchart.png" alt="����" width="42" height="42">
			<img src="/css/stay/newchart.png" alt="�ۼ�" width="42" height="42">
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
			//alert(li.length);
			// li�� ������ŭ 
			//alert(li.attr('id')); 

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
			//alert(JSON.stringify(jsonArr));
			
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
	

	// ���� �� ���濡 ���� (�Կ��ϱ� �� ȣ���ϱ� : ȣ�ڰ� �Կ� ���� ���ý�)
	$('input:radio[name=ar_type]').change(function(){
		$.ajax({
			url : "/stay/radioChange.dodam",
			type : 'get',
			data : {'ar_type' : $("input[name='ar_type']:checked").val()},
			dataType : 'json',
			success : function(data){
				$('.radio_ar_type').text('');
		
				var i;
				var count=0;
				for (i in data) {
				    if (data.hasOwnProperty(i)) {
				        count++;
				    }
				}
				
				for(var i=0; i<count; i++){
					$('.radio_ar_type').append(
		 			'<option value="'+data[i].ar_num+'">'+data[i].ar_name+'</option>'
		 			);
				}
		
			},
			error:function(request, status,error){
				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	});
	
	// �Կ� �� ȣ���ϱ⿡�� ���!!
	$('#inRegister').bind('click', function(){
		// �Կ� �� ȣ���� ar_num ��ȣ
		var ar_num = $('.radio_ar_type option:selected').val();
		// �Կ��̳� ȣ�ڿ� �� ������ȣ
		var animal_num = $('#animalnum').val();
		// �Կ��̳� ȣ�� �Ⱓ�� ���� datepicker value
		var indays = $('#rangedate').val();
		// �Կ��̳� ȣ�ڿ� ���� ����
		var stay_reason = $('.stay_reason').val();
	
		location.href="/stay/inAnimalStay.dodam?ar_num="+ar_num+"&animal_num="+animal_num+"&indays="+indays+"&stay_reason="+stay_reason;		
	})
	
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
    
	// �� div�� �Կ� ��ư�� Ŭ���ϸ�, �Կ��� ��Ű�� �˾��� ŵ�ô�!!
	$('.in').bind('click', function(){
		$('#inDIV').popitup({
			chase: false
		});
	})
	
	$('.set').bind('click', function(){
		//alert($(this).attr('id'));
		
		var infoss = $(this).attr('id').split('+');		
		
		$('.set_ar_num').val(infoss[0]);
		$('.set_ar_name').val(infoss[1]);
		$('.set_ar_type').val(infoss[2]).prop('selected', true);
		$('#set_ar_color').val(infoss[3]);
		$('.set_ar_price').val(infoss[4]);

		
		$('#setDIV').popitup({
			chase: false
		});
	})
	
	// �˾�â����, ��� DB�� ����! 
	$('#addRegister').bind('click', function(){

		// ��� ����, ���� �̸��� ������ �ݵ�� ���;� �Ѵ�.
		if($('.ar_name').val()==""){
			alert('�Կ��� �̳� ȣ������ �̸��� �ݵ�� �Է��ؾ��մϴ�.');
			return false;
		}
		if($('.ar_price').val()==""){
			alert('�Կ��� �̳� ȣ������ ������ �ݵ�� �Է��ؾ��մϴ�.');
			return false;
		}
		
		// animalroom ���̺� �Կ��� �� ȣ�ڹ� �����͸� ��������.
		$.ajax({
			url : "/stay/newAnimalRoom.dodam",
			type : 'get',
			data : {'ar_name':$('.ar_name').val(), 'ar_type':$('.ADDar_type option:selected').val(), 'ar_color' : $('.color').val(), 'ar_price':$('.ar_price').val()},
			dataType : 'json',
    		success : function(data){
				// �Կ����̳� ȣ�ڹ��� ������ div�� append�϶�~
				location.href="/stay/stayView.dodam";
    		},
    		
    		error:function(request, status,error){
    			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		})
	})
	
	// ��� ��ư�� ������ ��,
	$('.out').bind('click', function(){
		alert($(this).attr('id'));
		location.href="/stay/outStay.dodam?infos="+$(this).attr('id');
	})
	
	
	// �Կ���� ȣ������ ������ �����Ѵ�.
	$('#setRegister').bind('click', function(){

		alert($('.set_ar_num').val());
		alert($('.set_ar_name').val());
		alert($('.set_ar_type option:selected').val());
		alert($('#set_ar_color').val());
		alert($('.set_ar_price').val());
		
		// ��� ����, ���� �̸��� ������ �ݵ�� ���;� �Ѵ�.
		if($('.set_ar_name').val()==""){
			alert('�Կ��� �̳� ȣ������ �̸��� �ݵ�� �Է��ؾ��մϴ�.');
			return false;
		}
		if($('.set_ar_price').val()==""){
			alert('�Կ��� �̳� ȣ������ ������ �ݵ�� �Է��ؾ��մϴ�.');
			return false;
		}
		

		$.ajax({
			url : "/stay/setAnimalRoom.dodam",
			type : 'get',
			data : {'ar_num':$('.set_ar_num').val(), 'ar_name':$('.set_ar_name').val(), 'ar_type':$('.set_ar_type option:selected').val(), 'ar_color' : $('#set_ar_color').val(), 'ar_price':$('.set_ar_price').val()},
			dataType : 'json',
    		success : function(data){
				// �Կ����̳� ȣ�ڹ��� ������ div�� append�϶�~
				location.href="/stay/stayView.dodam";
    		},
    		
    		error:function(request, status,error){
    			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		})
		
		
	})

});
</script>





