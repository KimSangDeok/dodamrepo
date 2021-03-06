<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    

<link rel="stylesheet" type="text/css" href="/manage/style.css" />
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="/reservationCss/bootstrap.css">
<!-- <link rel="stylesheet" href="/customer-css/profile.css"> -->

<!-- Begin 멀티스텝 링크 -->
<link href="/register/css/jquery-multi-step-form.css" media="screen"
   rel="stylesheet" type="text/css">
<!--  End 멀티스텝 링크 -->
   
   
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

#popupCloseBtn{
   height: 0.85em;
}
#firstform a{text-align: right;}

.cusinfo{
text-align: right;
}
.cusinfo input{
margin-bottom: 5px;
}
#cusform input{
margin-bottom: 5px;
}
#animalform input{
margin-bottom: 5px;
}
.animalinfo{
text-align: right;
}
.animalinfo input{
margin-bottom: 5px;
}
</style>   
<!-- End 고객등록팝업 css -->   


<!-- Begin 메인 스타일 -->
   <style>
/* z-index 값이 작을 수록 아래에 깔리고, 높을 수록 위로 나온다. */
.main {
   z-index: 2;
}

.container {
   z-index: 1;
}
.avatar {
   margin-top: 10px;
   height: 100px;
   width: 100px;
   -webkit-border-radius: 50px;
   -moz-border-radius: 50px;
   -ms-border-radius: 50px;
   border-radius: 50px;
   background: #cca343;
}

.modal-content {
 position: fixed;
   left: 800px;
   width: 320px;
}

.block2 {
   width: 800px;
}
.modal-content a {
   color: #686868;
}


</style>
<!--End 메인 스타일 -->

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
<!-- End 이미지 업로드 -->    



      <!-- Begin 검색 스타일 -->
      <style>
      body {
         background-color: white;
         font-family: 'Roboto';
      }
      .form-control {
         height: 30px;
         width: 250px;
         margin-left: 200px;
         margin-top: -400px;
      }
      
      
      .line {
         margin-top: -50px;
      }
      
      .tablecontainer {
         margin-left: 10px;
         margin-right: 0px;
         max-width: 500px;
      }
      
      .col-md-6 {
         width: 100%;
         left: 200px;
         
      }
      </style> 
<!--  End 검색 스타일  -->

<!-- 왼쪽메뉴스크립트 -->
<script type="text/javascript" src="/manage/modernizr.custom.79639.js"></script>
<noscript><link rel="stylesheet" type="text/css" href="/manage/noJS.css" /></noscript> 


<!-- 팝업js -->
<script src="/js/jquery.popitup.js"></script>
<!-- 고객동물 모달창 스크립트 -->
<script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js"
   type="text/javascript"></script>
<script src="/register/js/jquery-multi-step-form.js"
   type="text/javascript"></script>
<!-- 검색창 js -->
<!-- <script src="/search-js/search.js"></script> -->

   
   
<script>
$(document).ready(function(){
   
   $('.header').addClass('hide');
});


//Begin 고객등록 모달팝업 

function monjinOpen() {
         var byensu = window.innerWidth/2;
         $('#modalpop').popitup({
            widthSet : window.innerWidth*0.8+'',
            chase : false
         });
}
//End 모달팝업
</script>


<script>
   
  /*Begin 고객등록 페이지 전환코딩 */
  $(function(){
     
     $('#firstpopup').show();
      $('.popit-content1').hide();
      $('.popit-content2').hide();
      
     $('.button1').click(function(){
        if ( ($('#textname').val() =='')|| ($('#texttel').val() =='')|| ($('#textaddr').val() =='')){
           alert("정보를 꼭 입력하세요")
           return false;
        }else{
        
           $('#firstpopup').hide();
           $('.popit-content1').show();
           $('.popit-content2').hide();
        }
     });
     
     $('#previous1').click(function(){
        $('#firstpopup').show();
        $('.popit-content1').hide();
        $('.popit-content2').hide();
     });
     
     $('.button2').click(function(){
        if ( ($('#atextname').val() =='')|| ($('#atexttype').val() =='')|| ($('#atextbreed').val() =='')||($('#atextgender').val() =='')){
           alert("정보를 꼭 입력하세요")
           return false;
        }else{
        $('#firstpopup').hide();
        $('.popit-content1').hide();
        $('.popit-content2').show();
        }
     })
  
     $('#previous2').click(function(){
        $('#firstpopup').hide();
        $('.popit-content1').show();
        $('.popit-content2').hide();
     });
     
     $('#save').click(function(){
        
        $('.popitup-overlay').css('display','none');
        $('.popit-wrapper-chase').hide();
          $('#firstpopup').show();
      $('.popit-content1').hide();
      $('.popit-content2').hide();
      
     });
     
     $('#popupCloseBtn').click(function(){
//         location.href="/customer/customerView.dodam";
        $('#texttel').val('');
        $('#textname').val('');
        $('#textaddr').val('');
        $('#texthospital').val('');
        $('#textdate').val('');
        $('#textmemo').val('');
        $('.img').remove(); //img 태그 초기화 
        
        //동물 정보 지우기 
        $('#atextname').val('');
        $('#atexttype').val('');
        $('#atextbreed').val('');
        $('#atextgender').val('');
        $('#atextcolor').val('');
        $('#atextbirth').val('');
        $('#atextmemo').val('');
        $('.img').remove();   
        $('#firstpopup').show();
      $('.popit-content1').hide();
      $('.popit-content2').hide();
        
     });
  });
  //End 모달 팝업 페이지 전환
  </script>

<!-- Begin 특정 번호로 검색하여 정보를 가져오는 함수 -->
<script>

function showList(cus_tel){
   
   $('#phoneNum').val(cus_tel);
   
   var count = 0;
   
   $.ajax({
      url : "/customer/infoSearchbyTel.dodam",
      type : 'get',
      data : { "cus_tel" : cus_tel},
      dataType : "json",
      success : function(data){
         
         var i;

         for (i in data) {
             if (data.hasOwnProperty(i)) {
                 count++;
             }
         }
         
         $('#animalUl').text(''); //div를 클리어함
         
       //data의 개수 만큼 (count) append로 li를 그려준다 
			for(var i = 0; i<count; i++){
				
				$('#animalUl').append('<li class="group">' +
			        '<a class="modal-user-link group" >'+
					 '<div class="user2">'+
				       '<img class="avatar" src="/imageupload/'+data[i].animalfile_name+'" alt="Medium"></img>' +
				         '<p id="animalname" class="name">'+ data[i].animal_name +'</p> </div> '+
				    '<div class="animalinfo" style="margin-left: 20px; text-align:right; margin-right:30px;">'+
				      '<a >품종<input id="type" type="text" disabled="disabled" value='+ data[i].animal_type+' /></a><br/>'+
				      '<a >성별<input id="gender" type="text" disabled="disabled" value='+ data[i].animal_gender+' /></a><br/>'+
	                  '<a >생일<input id="birth" type="text" disabled="disabled" value='+ data[i].animal_birth+' /></a><br/>'+
	                  '<a> 첫 방문일<input id="firstdate" type="text" disabled="disabled" value='+ data[i].animal_firstdate+' /></a>'+	
	                  '메모<textarea id="memo" disabled="disabled" type="text">'+ data[i].animal_memo+'</textarea><br/><br/><br/></div>'
	                  );
			}
      },
      
       error:function(request, status,error){
             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
   });
   
   //스크립트 내에서 값 받기
   var result = new Array();
   
   <c:forEach items="${listModel}" var="info">
   
      var json = new Object();
      
      
      json.cus_tel="${info.cus_tel}";
      json.cus_name="${info.cus_name}";
      json.cus_addr="${info.cus_addr}";
      json.cus_firstdate="${info.cus_firstdate}";
      json.cus_memo="${info.cus_memo}";
      json.cusfile_name="${info.cusfile_name}";
      
      if(cus_tel=="${info.cus_tel}"){
         
         result.push(json);
         
      }
      
   </c:forEach>
   
   $('#showimage').text("");
   $('#showimage').append('<img id="showimage" class="avatar" src="/imageupload/'+ result[0].cusfile_name +' " alt="Medium">'+
   '<p id="customername" class="name">'+result[0].cus_name +'</p> </img>');
   $('#cusphone').val(result[0].cus_tel);
   $('#cusaddress').val(result[0].cus_addr);
   $('#cusfirstdate').val(result[0].cus_firstdate);
   $('#cusmemo').text(result[0].cus_memo);
   
}

</script>
<script>
 $(function(){
	 //고객을 더블클릭 하지 않았을 경우 고객을 선택해야 수정가능
	 $('#editbutton').click(function(){
	 
		 var phoneNum=$('#phoneNum').val();
		 if(phoneNum=='' || phoneNum==null){
			 
			 alert('고객을 선택하세요!');
		 }else{
			 $('#editForm').submit();
		 }
	 });
	 
 });
 
</script>


<div class="body">
<!-- Begin  왼쪽 메뉴바 -->
         <section class="main">
            <div class="wrapper-demo">
               <div id="dd" class="wrapper-dropdown-3" tabindex="1">
                  <span>고객관리</span>
                  <ul class="dropdown">                  
                     <li><div id="registerDiv"><a href="javascript:monjinOpen()"><i class="icon-envelope icon-large"></i>고객등록</a></div></li>
                     <li><a href="/customer/smsView.dodam"><i class="icon-plane icon-large"></i>SMS발송</a></li>
                  </ul>
               </div>
             </div>
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
<!-- End  왼쪽 메뉴바 -->

<!-- Begin 메인부분 -->      
<div id="containers" style="min-width: 310px; height: 400px; margin: 0 auto">
      
<!--Begin 고객 & 동물 부분 -->

<div style=" max-width: 30% ; float: right; ">
<div id="block2" class="modal-content" style=" margin-left: 330px; height: 400px; overflow-y: scroll;" >
   <table>
      <tr>
         <td><a class="title" style="font-size: 13pt;">반려 동물 목록</a>
          </td>
      </tr>
   </table>
    <br/>
    <ul id="animalUl" class="modal-user-index group">
        <li class="group">
            <a class="modal-user-link group" >
                <div class="user2">
                    <img class="avatar" src="/imageupload/바탕화면.PNG" alt="Medium"></img>
                    <p id="animalname" class="name">
                    </p>
                    <br/>
                </div>
                <!-- 동물정보 div -->
                <div class="animalinfo" style=" text-align:right; margin-left: 20px; margin-right:30px;">
                    <a>
                        품종<input id="type" type="text" />
                    </a><br/>
                    <a>
                        성별<input id="gender" type="text" />
                    </a><br/>
                    <a>
                        생일<input id="birth" type="text" />
                    </a><br/>
                    <a>
                        첫 방문일<input id="firstdate" type="text" />
                        <br/>
                    </a>
                        메모<textarea id="memo" type="text"  >
                    </textarea>
                    <br/>
                </div>
            </a>
        </li>
        
        
    </ul>
 </div>
 </div>
      <div  style=" max-width: 30%; float:right; " >
   <div id="block1" class="modal-content" style="height: 400px;">
   <table>
      <tr>
         <td><a class="title" style="font-size: 13pt;">보호자 목록 </a>
          </td>
      </tr>
   </table>
    <br/>
    <ul class="modal-user-index group">
       

        <li class="group">
            <a class="modal-user-link group" >
                <div id ="showimage" class="user">
                    <img id="showimage" class="avatar" src="/imageupload/바탕화면.PNG" alt="Medium"></img>
                    <p id="customername"class="name" >
                    </p>
                    <br/>
                </div>
                 <!-- 고객정보div -->
                <div class="cusinfo" style=" text-align:right; margin-left: 20px; margin-right:30px; ">
                     <a>
                        휴대전화<input id="cusphone" disabled="disabled" style="background-color: #fda699" type="text" value=""/>
                    </a><br/>
                    <a>
                        주소<input id="cusaddress"  disabled="disabled" style="background-color: #fda699" type="text" value=""/>
                    </a>
                    <br/>
                    <a>
                        첫 방문일<input id="cusfirstdate" disabled="disabled" style="background-color: #fda699" type="text" />
                    </a>
                    <br/>
                        메모<textarea id="cusmemo" disabled="disabled" style="background-color: #fda699" type="text"  >
                    </textarea>
                    <br/>
                </div>
            </a>
        </li>
    </ul>
</div>
</div>
      </div>
      
      
<!-- Begin 팝업 내용 -->
   <div id="modalpop" class="popit-wrapper popit-wrapper-chase" style="left: 0px; opacity: 0;  ">
   
      <div class="popit-content" style=" width:100%; height:5%;">
         <button id="popupCloseBtn" type="button" class="popitup-close close">
            <span class="">X</span>
         </button>
      </div>
      <!-- ------------------------------------------------------------------------------------------------------- -->
      
      <div id="step" >
      <form id="firstform" method="post" action="/customer/infoInsert.dodam"    enctype="multipart/form-data">
      <div id="multistepform-example-container"  >
      
         <div id="firstpopup" style=" margin-left:50px; width:80%; height:65%; ">
            
               <h2 class="fs-title">Step 1. 고객 등록</h2>
               <h3 class="fs-subtitle">Please register your information</h3>
               <br/>
               <div class="file-upload" data-input-name="file" name="file" style="float: left;"></div>
               <div id="cusform" style=" text-align: right;  margin-right: 30px;">
                  <a>이름 <input id="textname" type="text" name="cus_name" placeholder="이름"></a><br/> 
                  <a>전화번호   <input id="texttel" type="text" name="cus_tel" placeholder="010-1111-1111"></a><br/>
                  <a>주소 <input id="textaddr" type="text" name="cus_addr" placeholder="서울 구로구"></a><br/>
                  <a>병원 <input id="texthospital" type="text" name="cus_hospital" placeholder="보검병원"></a><br/>
                  <a>첫 방문일 <input id="textdate" type="text" name="cus_firstdate" placeholder="2017.08.04"></a><br/>
                  <a>메모 <textarea id="textmemo"  placeholder="memo" name="cus_memo"></textarea></a><br/>
               </div>
               <br/>
               <input type="button" name="next" class="next button1" value="Next">
                           

         </div>
         
         </div>
         <div class="popit-content1" style=" margin-left:50px; width:80%; height:65%; ">
         
         <div id="secondpopup">

               <h2 class="fs-title">Step 2. 동물 등록</h2>
               <h3 class="fs-subtitle">Please register your animal's picture</h3>
               <br/>
               <div class="file-upload" data-input-name="file2" name="file2"  style="float: left;"></div>
               <div id="animalform" style=" text-align: right; margin-right: 30px;">
                  <a>이름 <input id="atextname" type="text" name="animal_name" placeholder="이름"></a><br/>
                  <a>타입 <input id="atexttype" type="text" name="animal_type" placeholder="강아지"></a><br/>
                  <a>품종 <input id="atextbreed" type="text" name="animal_breed" placeholder="시츄"></a><br/>
                  <a>성별 <input id="atextgender" type="text" name="animal_gender" placeholder="암컷"></a><br/>
                  <a>피모색 <input id="atextcolor" type="text" name="animal_color" placeholder="흰색"></a><br/>
                  <a>생일 <input id="atextbirth" type="text" name="animal_birth" placeholder="17/04/08"></a><br/>
                  <a>메모 <textarea id="atextmemo" type="text" name="animal_memo" placeholder="메모"></textarea></a><br/>
               </div>
               <br/>
               <input id="previous1" type="button" name="previous" class="previous button"
                  value="Previous"> <input type="button" name="next"
                  class="next button2" value="Next">
            </div>
         </div>
         
         <div class="popit-content2" style="; width:80%; height:65%; margin-left: 50px;">
         <div id="lastpopup" >

               <h2 class="fs-title">저장</h2>
               <h3 class="fs-subtitle">check your information</h3>

               <input id="previous2" type="button" name="previous" class="previous button"
                  value="Previous"> 
               <input id="save" type="submit" name="submit" class="next button" value="Save">
         
         </div>
         </div>
         </form>
      </div>
   </div>
   <!-- End 팝업 내용  -->
   
   
      <!--Begin table 코딩 -->
      <div class="tablecontainer">
         <div class="line">
         <form id="editForm" action="/customer/editCustomer.dodam">
         <input style="" type="text" class="form-control" placeholder="Search.. ex) 서울시,고객명"id="search_field">
				<input id="editbutton" style="margin-left:618px; background-color: #fafafa; font-family: 맑은고딕; 
						font-weight: bold;" type="button" value="EDIT" title="고객을 더블클릭한 후 수정페이지로 넘어갈 수 있어요">
				<br/><br/>
            
         </div>   
         <div class="row">
         
            
            <input type="hidden" id="phoneNum" name="phoneNum" value="" />
         
            <div class="col-md-6" style="overflow-y: scroll; height: 300px;">

               <table id="myTable" class="table table-inverse">
                  <thead>
                     <tr class="myHead">
                        <th>고객명</th>
                        <th>전화번호</th>
                        <th>주소</th>
                        <th>첫방문일</th>
                     </tr>
                  </thead>
               <c:choose>
                  <c:when test="${listModel == null}">
                     <tr><td colspan='7'>등록된 고객이 없습니다.</td></tr>
                  </c:when>
                  
                  <c:otherwise>
                  <c:forEach items="${listModel}" var ="a">
                  <tr ondblclick="javascript:showList('${a.cus_tel}')"  height="25" 
                     onMouseOver="this.style.background='#fda699'"
                     onMouseOut="this.style.background='white'" >
                     
                     <td>${a.cus_name}</td>
                     <td>${a.cus_tel}</td>
                     <td>${a.cus_addr}</td>
                     <td>${a.cus_firstdate}</td>
                     
                  </c:forEach>
                 </c:otherwise>   
                </c:choose> 
               </table>
               </div>
               <br/>
                  
               </form>
            </div>
         </div>
      </div>

      <!-- End 테이블 코딩  -->
      
      <!--Begin 검색 테이블  -->
  <script src="/search-js/search.js"></script>
  
    <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
   
<!-- End 검색 테이블 -->   
      
      

</div>