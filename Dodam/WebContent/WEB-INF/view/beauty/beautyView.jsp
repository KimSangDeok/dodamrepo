<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
		<link rel='stylesheet' href="/style/css/beautytablestyles.css"> <!-- 미용내역 table css -->
		
		<!-- start : table의 헤더 중앙정렬 -->
		<style>
		.header{
			text-align:center;
		}
		</style>
		<!-- end : table의 헤더 중앙정렬 -->
		
		
		<!-- 부트스트랩 공통!! -->
	    <link rel="stylesheet" href="/css/bootstrap.css" />
		

		<!-- 팝업모달 -->
		<link rel="stylesheet" href="/beautymodal/rmodal.css" type="text/css" />
		<script src="/js/popmenumain.js"></script>
<div class="body">

			<!-- 팝업내용 -->
<div id="modal" class="modal">
    <div class="modal-dialog animated">
        <div class="modal-content">
            <form class="form-horizontal" method="get">
                <div class="modal-header">
                    <strong>미용 옵션 추가</strong>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                        <label for="dummyText" class="control-label col-xs-4">미용 종류</label>
                        <div class="input-group col-xs-7">
                            <input type="text" name="dummyText" id="dummyText" class="form-control" />
                        </div>
                        <label for="dummyText" class="control-label col-xs-4">미용 가격</label>
                        <div class="input-group col-xs-7">
                            <input type="text" name="dummyText" id="dummyText" class="form-control" />
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-default" type="button" onclick="modal.close();">Cancel</button>
                  <button class="btn btn-primary" type="submit" onclick="modal.close();">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>			
			
				
				 
			 <!-- 여기 부분이 실질적으로 코딩하는 부분입니다~~~ div의 테두리는 지금 보기 편하기 위한 부분이고, 나중에 지울껍니다~~ -->
			 <div style="border:1px solid red; float:left">
			 	<h1>1. 해당 날짜의 미용실 예약 일정을 모두 보여준다.</h1>
			 	
			 	
			 	
			 		<!-- datepicker, 옵션, 저장 값 가져오자. -->
			 		<div class="row">
			 			<div class="col-lg-12">
			 				<a href="#" id="showModal" class="btn btn-success">미용옵션</a>
   						</div>
					</div>
			 		<script type="text/javascript" src="/beautymodal/rmodal.js"></script>
			 		
			 	
			 	  <table id="keywords" cellspacing="0" cellpadding="0">
				    <thead>
				      <tr>
				        <th><span>예약일자</span></th>
				        <th><span>동물명</span></th>
				        <th><span>종</span></th>
				        <th><span>고객명</span></th>
				        <th><span>핸드폰번호</span></th>
				        <th><span>미용내역</span></th>
				        <th><span>미용완료여부</span></th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td>silly tshirts</td>
				        <td>6,000</td>
				        <td>110</td>
				        <td>1.8%</td>
				        <td>22.2</td>
				      </tr>
				      <tr>
				        <td>desktop workspace photos</td>
				        <td>2,200</td>
				        <td>500</td>
				        <td>22%</td>
				        <td>8.9</td>
				      </tr>
				      <tr>
				        <td>arrested development quotes</td>
				        <td>13,500</td>
				        <td>900</td>
				        <td>6.7%</td>
				        <td>12.0</td>
				      </tr>
				      <tr>
				        <td>popular web series</td>
				        <td>8,700</td>
				        <td>350</td>
				        <td>4%</td>
				        <td>7.0</td>
				      </tr>
				      <tr>
				        <td>2013 webapps</td>
				        <td>9,900</td>
				        <td>460</td>
				        <td>4.6%</td>
				        <td>11.5</td>
				      </tr>
				      <tr>
				        <td>ring bananaphone</td>
				        <td>10,500</td>
				        <td>748</td>
				        <td>7.1%</td>
				        <td>17.3</td>
				      </tr>
				    </tbody>
				  </table>
				 </div> 
			 	
			 	<!-- 미용 내역 table js -->
				<script type="text/javascript" src="/style/js/jquery.tablesorter.min.js"></script>
			 	<script type="text/javascript">
				$(function(){
				   $('#keywords').tablesorter(); 
				});
				</script>
			 	
			 	
			 	
			 	
			 	<div style="border:1px solid blue; float:left">
			 	<h1>2. 동물의 예약 미용 내역을 추가하여 저장한다.</h1>
			 	<div class="row">
                <div class="col-xs-5">
                    <select name="from[]" id="undo_redo" class="form-control" size="13" multiple="multiple">
                        <option value="1">전체미용</option>
                        <option value="2">부분미용</option>
                        <option value="3">귀청소</option>
                        <option value="4">안마</option>
                        <option value="5">산책서비스</option>

                    </select>
                </div>
                
                <div class="col-xs-2">
                    <button type="button" id="undo_redo_undo" class="btn btn-primary btn-block">undo</button>
                    <button type="button" id="undo_redo_rightAll" class="btn btn-default btn-block">▶▶</button>
                    <button type="button" id="undo_redo_rightSelected" class="btn btn-default btn-block">></button>
                    <button type="button" id="undo_redo_leftSelected" class="btn btn-default btn-block"><</button>
                    <button type="button" id="undo_redo_leftAll" class="btn btn-default btn-block">◀◀</button>
                    <button type="button" id="undo_redo_redo" class="btn btn-warning btn-block">redo</button>
                </div>
                
                <div class="col-xs-5">
                    <select name="to[]" id="undo_redo_to" class="form-control" size="13" multiple="multiple"></select>
                </div>
            </div>
			 </div>


			 
</div> <!-- end of div(body) -->


<script type="text/javascript" src="/style/js/multiselect.js"></script>
<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
    
    ga('create', 'UA-39934286-1', 'github.com');
    ga('send', 'pageview');
</script>

<script type="text/javascript">
$(document).ready(function() {
    // make code pre

    	            var modal = new RModal(document.getElementById('modal'), {
	                beforeOpen: function(next) {
	                    console.log('beforeOpen');
	                    next();
	                }
	                , afterOpen: function() {
	                    console.log('opened');
	                }

	                , beforeClose: function(next) {
	                    console.log('beforeClose');
	                    next();
	                }
	                , afterClose: function() {
	                    console.log('closed');
	                }

	                // , content: 'Abracadabra'

	                // , bodyClass: 'modal-open'
	                // , dialogClass: 'modal-dialog-lg'
	                // , dialogOpenClass: 'fadeIn'
	                // , dialogCloseClass: 'fadeOut'

	                // , focus: true
	                // , focusElements: ['input.form-control', 'textarea', 'button.btn-primary']

	                // , escapeClose: true
	            });

	            document.addEventListener('keydown', function(ev) {
	                modal.keydown(ev);
	            }, false);

	            document.getElementById('showModal').addEventListener("click", function(ev) {
	                ev.preventDefault();
	                modal.open();
	            }, false);

	            window.modal = modal;
    
    
    $('#undo_redo').multiselect();
});
</script>





</div>