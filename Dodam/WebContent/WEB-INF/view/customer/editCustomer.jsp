<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="/manage/style.css" />


 
<!-- Begin 왼쪽 메뉴바 스크립트 -->
<script type="text/javascript" src="/manage/modernizr.custom.79639.js"></script>
<noscript><link rel="stylesheet" type="text/css" href="/manage/noJS.css" /></noscript> 
<!-- End 왼쪽 메뉴바 스크립트 -->

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
  
	
<!-- Begin 스타일 -->
    <style>
    .container{
    top:10px;
    left:20px;
    width:600px;
    
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
/*     .animalinfo a{ */
/*     float: right; */
/*     margin-bottom: 5px; */
/*     } */
    .cusinfo input{
    float: right;
    }
     .cusinfo a{
    color: black;
    float: right;
    margin-bottom:5px;
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
    #bigdiv{
    height: 250px;
    width: 500px;
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
}
#block2{
 position: absolute;
/*  top:700px; */
/*  left:730px; */
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

<!-- Begin 헤더 숨기기 스크립트 -->
<script>
$(document).ready(function(){
	
	
   $('.header').addClass('hide');
   
   $('#editsave').click(function(){
	  alert("확인"); 
   });
});
</script>
<!-- End 헤더 스크립트 -->

<!-- 고객 동물 정보 수정 스크립트 -->
<script>


</script>

<div class="body">

<!-- Begin 왼쪽 메뉴바 -->
<section class="main">
				<div class="wrapper-demo">
					<div id="dd" class="wrapper-dropdown-3" tabindex="1">
						<span>고객관리</span>
						<ul class="dropdown">						
							<li><a href="/customer/customerView.dodam"><i class="icon-envelope icon-large"></i>고객검색</a></li>
							<li><a href="/customer/editCustomer.dodam"><i class="icon-truck icon-large"></i>고객수정</a></li>
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
<form  method="post" action="/customer/editInfoInsert.dodam" enctype="multipart/form-data">
  <div  style=" margin-left:100px;   float: left ;"  >
	<div id="block1" class="modal-content" >

	<table>
		<tr>
			<td>
			<a class="title">보호자 목록
			<input id="editsave" type="submit"  style="float: right;  background-color: #fafafa; font-family: 맑은고딕; font-weight: bold;" value="SAVE"/>
			</a>
    		</td>
		</tr>
	</table>
    <br/>
    <ul class="modal-user-index group">
        <li class="group">
            <a class="modal-user-link group" >
                <div class="user">

				<div class="container" >
					<div>
						<p style="float: left;">please click here and upload your picture</p><br/><br/>
						<br/><br/>

						<div id="cusfile" class="file-upload" name="file" data-input-name="file" style="background-image:url(/imageupload/${cusInfo.cusfile_name})  " >
						</div>

					</div>
					</div>
					<!-- 고객정보div -->
								<div class="cusinfo" style="margin-left:150px;">
									<a class="name" style="float: left; margin-left: 110px;"> <br />
										<input style="background: none; border: none;"type="text" name="cus_name" value="${cusInfo.cus_name}" />
									</a> <br />
									<br />
									<br /> <a> 전화번호 &nbsp; <input	id="cusphone" name="cus_tel" style="background-color: #fda699" type="text" value="${cusInfo.cus_tel}" />
									</a><br />
									 <a> 주소 &nbsp; <input name="cus_addr" style="background-color: #fda699" type="text" value="${cusInfo.cus_addr}" />
									</a><br /> 
									<a> 참조병원&nbsp; <input name="cus_hospital"style="background-color: #fda699" type="text" value="${cusInfo.cus_hospital}" />
									</a> <br />
									<a> 메모<textarea placeholder="memo" name="cus_memo">${cusInfo.cus_memo}</textarea></a><br/>
								</div>
							</div></a>
        </li>
    </ul>
</div>
</div>
		
    
        <!-- Begin 동물수정 -->
  <div  style=" margin-left:200px ;   float: left ;"  >
	<div id="block2" class="modal-content" style="height: 100%;">
	<table>
		<tr>
			<td><a class="title">반려 동물 목록</a>
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
				<br/><br/>
				 
				  <c:forEach items="${aniInfo}" var="aniInfo">
				   <div id="bigdiv" style="margin-top:20px; ">
			        <div id="cusfile" class="file-upload" data-input-name="file2" name="file2" style="  margin-top:10px; background-image:url(/imageupload/${aniInfo.animalfile_name})  " >
				 	</div>
				 	<div class="animalinfo" >
	                	<a class="name" style="float: left; margin-left:110px;">
	                      <input style="background: none; border: none;"type="text" name="animal_name" value=" ${aniInfo.animal_name}" />
	                    </a> 
	                    <br/>
	                    <a ><br/>
	                        생일 &nbsp; <input name="animal_birth" style="background-color: #DBDBDB" type="text" value=" ${aniInfo.animal_birth}"/>
	                    </a><br/>
	               		<a >
	                        품종 &nbsp; <input name="animal_type" style="background-color: #DBDBDB" type="text" value=" ${aniInfo.animal_type}"/>
	                    </a><br/>
	                    <a >
	                        피모색 &nbsp; <input name="animal_color" style="background-color: #DBDBDB" type="text" value=" ${aniInfo.animal_color}"/>
	                    </a><br/>
	                    <a>
	                        특이사항 &nbsp; <textarea name="animal_memo" style="background-color: #DBDBDB" placeholder="memo">${aniInfo.animal_memo}</textarea><br/>
	                    </a>
	                    <br/><br/><br/><br/>
	                  </div>  
				 	</div>
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
</form>

<!-- End 고객 & 동물 등록 코딩 -->
</div>
