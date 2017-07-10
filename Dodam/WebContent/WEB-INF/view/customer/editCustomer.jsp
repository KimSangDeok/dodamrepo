<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="/manage/style.css" />


<!-- begin : 사진 보내는 Form 쓰려면 필요한 js -->
<script type="text/javascript" src="/customer-css/jquery.form.js"></script>
<!-- end : 사진 보내는 Form 쓰려면 필요한 js -->
 
<!-- Begin 왼쪽 메뉴바 스크립트 -->
<script type="text/javascript" src="/manage/modernizr.custom.79639.js"></script>
<noscript><link rel="stylesheet" type="text/css" href="/manage/noJS.css" /></noscript> 
<!-- End 왼쪽 메뉴바 스크립트 -->

<!-- 팝업js -->
<script src="/js/jquery.popitup.js"></script>
<!-- 고객동물 모달창 스크립트 -->
<script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js"
	type="text/javascript"></script>
<script src="/register/js/jquery-multi-step-form.js"
	type="text/javascript"></script>
	
	
	

<!-- Begin 이미지 업로드 -->
 	<link rel="stylesheet" type="text/css" href="/upload/UnoDropZone.css">
    <script src="/upload/UnoDropZone.js"></script>
    <script>
        var MyObject = {
            foo: function (uplaodCont) {
                console.log('calling foo');
                console.log('uplaodCont:');
                console.log(uplaodCont);
                $('#callbackmsg').html('Call MyObject.foo() function at:' + new Date())
            }
        };

        $(document).ready(function () {
            UnoDropZone.init();
        });
    </script>
  <!--  End 이미지 업로드 -->  
  
  <!-- Begin 고객등록팝업 css -->
<style type="text/css">
@media ( min-width:768px) {
	#main-nav {
		line-height: 0;
		text-align: center;
	}
	#main-menu {
		display: inline-block;
	}
}


.popit-wrapper {
 	max-width:500px; 
	height: 450px;
	width: 50%;
	display: none;
	border: 1px solid #ccc;
	background: #fff;
	border-radius: 5px;
	box-shadow: 0px 0px 6px 2px #ccc;
}

.popit-header {
	border-bottom: 1px solid #ccc;
}

.popit-body {
	padding: 20px 0;
	width: 300px;
	height: 300px;
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
.margin-top-40 {
	margin-top: 40px;
}

.list-group-item {
	border: 0;
}

#animalform input{
margin-bottom: 5px;
}
</style>
	
<!-- Begin 스타일 -->
    <style>
    .container{
    top:0px;
    left:20px;
    width:600px;
    height: 150px;
    }
    .line{
    margin-bottom: 10px;
    }
    .form-control{
    float: right;
     margin-bottom: 15px;
    }
    
    /*사진 수정 스타일*/
    .cusinfo{
 	margin-top: -100px;
    max-width: 300px;
    margin-left: 150px;
    text-align: right;
	
    }
    .animalinfo {
    margin-top: -100px;
    max-width: 300px;
    margin-left: 100px;
    text-align: right;
    }
    .cusinfo input{
    float: right;
    }
     .cusinfo a{
    color: black;
    float: right;
    margin-bottom:5px;
    }
    .infodiv{
    max-width:500px;
    magin-top:100px;
    }
    .animalinfo a{
    color: black;
    float: right;
    margin-bottom:5px;
    }
    
    #cusfile{
	background-size: 100% 100%;
    background-repeat: no-repeat;
   
    }
    #animalfile{
	background-size: 100% 100%;
    background-repeat: no-repeat;
   
    }
    #bigdiv{
    height: 250px;
    width: 500px;
    }
    
    .title{
     font-size: 25pt;
    }
    
    /*div 스타일 적용 */
    .modal-content {
    position: relative;
    background-color: #fff;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
    border: 1px solid #999;
    border: 1px solid rgba(248, 14, 14, 0.2);
    border-radius: 6px;
    outline: 0;
    -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
    box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
    width:500px;
    height:450px;
    margin-bottom: 50px;
    
}
.modal-content a{
 	font-size: 12pt;
}
#block1{
margin-left:25%;
height: 500px;
}
#block2{
 position: absolute;
 height: 500px;
 overflow: scroll;
}
.avatar
{
float:left;
margin-left: 70px;
}


/* 이미지 파일 업로드 */
.custom-drop-zone{
            width: 600px;
            height: 480px;
            background: cadetblue;
        }
        
  
    </style>

<!--  End 스타일 -->

<script src='//cdnjs.cloudflare.com/ajax/libs/jquery.form/3.51/jquery.form.min.js'></script>
<!-- Begin 헤더 숨기기 스크립트 -->
<script>

$(document).ready(function(){
   $('.popit-wrapper').hide();
   $('.header').addClass('hide');

   
   
/* Begin 고객 & 동물 정보 수정 DB 업데이트 스크립트    */

//고객 수정 버튼 클릭시 ajax방식으로 DB에 정보 업데이트 
   $('#editsave').click(function(){

 		var formData = new FormData($('#cusform')[0]);
 			
   		  $.ajax({
   			 type:"POST",
//    		 url:'/customer/editInfoInsert.dodam',
   			 url: $('#cusform').attr('action'), //cusform의 action의 url로 연결
   			 data: formData,
   			 processData : false,
   			 contentType : false,
   			 enctype: "multipart/form-data",
   			 success: function(data) {
   				 alert( "고객 수정 성공");
   			 }
   		  });

	});
     	
});

//동물 수정 버튼 클릭시 Ajax 방식으로 DB에 정보 업데이트
function animalUpdate(animal_num, cus_tel){
	
	var formData = new FormData($('#animalForm'+animal_num)[0]); 
	$.ajax({
		   type:"POST",
		   url: $('#animalForm'+animal_num).attr('action'),//animalform의 action의 url로 연결
		   data:formData,
		   processData : false, //false로 지정을 안해주면 오류 발생
		   contentType : false, //false로 지정을 안해주면 DB저장 불가능
		   enctype: "multipart/form-data",
		   success: function() {
			   
			 alert( "동물 수정 성공");
		 	}
	   });
}
/* End 고객 & 동물 정보 수정 DB 업데이트 스크립트    */   
   
   $(function(){
	   $('#add').click(function(){
		   alert("동물추가");
		   
		   $('.popit-wrapper-chase').popitup({
			   widthSet : window.innerWidth*0.8+'',
			   chase : false
		   });
		   
	   });
   });
</script>
<!-- End 헤더 스크립트 -->


<div class="body">


<!-- Begin 왼쪽 메뉴바 -->
<section class="main">
				<div class="wrapper-demo">
					<div id="dd" class="wrapper-dropdown-3" tabindex="1">
						<span>고객관리</span>
						<ul class="dropdown">						
							<li><a href="/customer/customerView.dodam"><i class="icon-envelope icon-large"></i>고객검색</a></li>
							<li><a href="/customer/smsView.dodam"><i class="icon-plane icon-large"></i>SMS발송</a></li>							
						</ul>
					</div>
				​</div>
</section>

<script type="text/javascript">
			
			function DropDown(el) {
				this.dd = el;
				this.placeholder = this.dd.children('span');
				this.opts = this.dd.find('ul.dropdown > li');
				this.val = '';
				this.index = -1;
				this.initEvents();
			}
			DropDown.prototype = {
				initEvents : function() {
					var obj = this;

					obj.dd.on('click', function(event){
						$(this).toggleClass('active');
						return false;
					});

					obj.opts.on('click',function(){
						var opt = $(this);
						obj.val = opt.text();
						obj.index = opt.index();
						obj.placeholder.text(obj.val);
						// ****페이지 이동 소스
						location.href = $(this).find('a').attr('href');
					});
				},
				getValue : function() {
					return this.val;
				},
				getIndex : function() {
					return this.index;
				}
			}

			$(function() {

				var dd = new DropDown( $('#dd') );

				$(document).click(function() {
					// all dropdowns
					$('.wrapper-dropdown-3').removeClass('active');
				});

			});

		</script>

<!-- End 왼쪽 메뉴바 -->

  
    <!-- Begin 고객&동물 수정 코딩 -->
<form  id="cusform" method="post" action="/customer/editInfoInsert.dodam" enctype="multipart/form-data">
  <div  style=" margin-left:100px;   float: left ;"  >
	<div id="block1" class="modal-content" >

	<table>
		<tr>
			<td>
			<a class="title">보호자 목록
			
			</a>
    		</td>
		</tr>
	</table>
    <br/>
    <ul class="modal-user-index group">
        <li class="group">
            <a class="modal-user-link group" >
                <div class="user" >

				<div class="container" >
						<p style="float: left;">please click here and upload your picture</p>
						<input id="editsave" type="button"  style="float: left; margin-left:320px; margin-top:100px; margin-bottom:10px; 
						 background-color: #fafafa; font-family: 맑은고딕; font-weight: bold;" value="SAVE">
						 
						<br/>
						<input type="hidden"class="file-upload" name="cushidden" style="background-image:url(/imageupload/${cusInfo.cusfile_name})"/>
						<div id="cusfile" class="file-upload" name="file" data-input-name="file" style="margin-top:180px; background-image:url(/imageupload/${cusInfo.cusfile_name})" >
						</div>
					</div>
					<!-- 고객정보div -->
								<div id="infodiv" class="cusinfo" style="margin-top:-50px;">
									<a class="name" style="float: left; margin-left: 110px;"> <br/> <br/> <br/>
										<input id="cus_name" style="background: none; border: none;" type="text" name="cus_name" value="${cusInfo.cus_name}" />
									</a> 
									<br/><br/><br/> 
									<a> 전화번호 &nbsp; <input	id="cus_tel" name="cus_tel" style="background-color: #fda699" type="text" value="${cusInfo.cus_tel}" />
									</a><br />
									 <a> 주소 &nbsp; <input id="cus_addr" name="cus_addr" style="background-color: #fda699" type="text" value="${cusInfo.cus_addr}" />
									</a><br/> 
									<a> 참조병원&nbsp; <input id="cus_hospital" name="cus_hospital"style="background-color: #fda699" type="text" value="${cusInfo.cus_hospital}" />
									</a> <br/>
									<a> 메모<textarea id="cus_memo" style="background-color: #fda699;" placeholder="memo" name="cus_memo">${cusInfo.cus_memo}</textarea></a><br/>
								</div>
							</div></a>
        </li>
    </ul>
</div>
</div>
	</form>	
    
    <!--  동물추가 팝업 -->
    <!-- Begin 팝업 내용 -->
	<div class="popit-wrapper popit-wrapper-chase" style="left: 0px; opacity: 0;  ">
	
		<div class="popit-content" style=" ">
			<button id="popupCloseBtn" type="button" class="popitup-close close" style="background: none;">
				<span style="margin-left: 400px;">close</span>
			</button>
		</div>
		<!-- ------------------------------------------------------------------------------------------------------- -->
		
		<div id="step" >
		<form id="firstform" method="post" action="/customer/infoaddInsert.dodam" 	enctype="multipart/form-data">
			<div class="popit-content1" style=" margin-left:50px; width:80%; height:65%; ">
			
			<div id="secondpopup">

					<h2 class="fs-title">Step. 동물 추가</h2><br/>
					<h3 class="fs-subtitle">Please register your animal's picture</h3>
					<br/>
					<div class="file-upload" data-input-name="file2" name="file2"  style="float: left;"></div>
					<div id="animalform" style=" text-align: right; margin-right: 30px;">
						<a>이름 <input id="atextname" type="text" name="animal_name" placeholder="이름"></a><br/>
						<a>타입 <input id="atexttype" type="text" name="animal_type" placeholder="강아지"></a><br/>
						<a>품종 <input id="atextbreed" type="text" name="animal_breed" placeholder="시츄"></a><br/>
						<a>성별 <input id="atextgender" type="text" name="animal_gender" placeholder="암컷"></a><br/>
						<a>피모색 <input type="text" name="animal_color" placeholder="흰색"></a><br/>
						<a>생일 <input  type="text" name="animal_birth" placeholder="17/04/08"></a><br/>
						<a>메모 <textarea type="text" name="animal_memo" placeholder="메모"></textarea></a><br/>
						<input type="hidden" name="cus_tel" value="${cusInfo.cus_tel}" />
					</div>
					<br/>
						<input id="save" type="submit" name="submit" class="next button" value="Save">
				</div>
			
			 </div>
			</form>
		</div>
	</div>
	<!-- End 팝업 내용  -->
    <!-- ***************** -->
    
        <!-- Begin 동물수정 -->
  <div  style=" margin-left:200px ;   float: left ;"  >
	<div id="block2" class="modal-content" style="width: 500px;">
	<table>
		<tr>
			<td><a class="title" >반려 동물 목록</a><img id="add" style="background: none; float:right;" src="/images/add.png">
    		</td>
		</tr>
	</table>
    <br/>
    <ul class="modal-user-index group">
        <li class="group">
            <a class="modal-user-link group" >
                <div class="user">
                
				<div class="container" >
				<p style="float: left;">please click here and upload animal picture</p>
<%-- 				 --%>
				<br/><br/><br/><br/><br/>
				 
				  <c:forEach items="${aniInfo}" var="animal">
				  	<form id="animalForm${animal.animal_num}" method="post" action="/customer/editanimal.dodam" enctype="multipart/form-data"> 
				  		<input type="hidden" name="cus_tel" value="${animal.cus_tel}">
				  		<input type="hidden" name="animal_num" value="${animal.animal_num}">
					   <div id="bigdiv" style="margin-top:40px; ">
					   
					   	<input type="hidden"class="file-upload" name="animalhidden" value="${animal.animalfile_name}" style="background-image:url(/imageupload/${animal.animalfile_name})"/>
					   	
					   	<input type="hidden" name="animal_type" value="${animal.animal_type}"/>
					   	<input type="hidden" name="animal_color" value="${animal.animal_color}"/>
					   	<input type="hidden" name="animal_birth" value="${animal.animal_birth}"/>
					   	
					   	
				        <div id="animalfile" class="file-upload" data-input-name="file2" name="file2" style="margin-top:10px; background-image:url(/imageupload/${animal.animalfile_name});" >
					 	</div>
					 	<div class="animalinfo" >
	 					 	<input onclick="javascript:animalUpdate('${animal.animal_num}')" class='animalSaveBtn' type="button" style=" margin-left:80px; background-color: #fafafa; font-family: 맑은고딕; font-weight: bold;" value="SAVE"/>
		                	<br/><br/>
		                	<a class="name" style="float: left; margin-left:110px;">
		                	<br/>
		                      <input id="animal_name"  style="background: none; border: none;"type="text" name="animal_name" value="${animal.animal_name}" />
		                    </a> 
		                    <a>
		                        생일 &nbsp; <input name="animal_birth" disabled="disabled" style="background-color: #DBDBDB" type="text" value="${animal.animal_birth}"/>
		                    </a><br/>
		               		<a>
		                        품종 &nbsp; <input  name="animal_type" disabled="disabled" style="background-color: #DBDBDB" type="text" value="${animal.animal_type}"/>
		                    </a><br/>
		                    <a>
		                        피모색 &nbsp; <input name="animal_color" disabled="disabled" style="background-color: #DBDBDB" type="text" value="${animal.animal_color}"/>
		                    </a><br/>
		                    <a>
		                        특이사항 &nbsp; <textarea id="animal_memo" name="animal_memo" style="background-color: #DBDBDB; " placeholder="memo">${animal.animal_memo}</textarea><br/>
		                        <br/><br/>
		                    </a>
		                    <br/><br/><br/><br/>
		                    
		                  </div> 
					 	</div>
				 	</form>
				  </c:forEach>
			     </div>
			     	
			     

                    <!-- 고객정보div -->
                
                
                <!-- 동물의 갯수만큼 정보를 출력하기위한 forEach 반복문 -->
                 <div class="cusinfo" style="margin-left: 20px;">
                 <c:forEach items="${aniInfo}" var="aniInfo">
	                
	                   
                </c:forEach> 	                   
	                </div>

                <br/><br/><br/><br/><br/><br/><br/>
                </div>
                 
            </a>
        </li>
    </ul>
</div>
</div>

<!-- End 고객 & 동물 등록 코딩 -->


</div>
