<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" type="text/css" href="/manage/style.css" />

 
<!-- 왼쪽 메뉴바 스크립트 -->
<script type="text/javascript" src="/manage/modernizr.custom.79639.js"></script>
<noscript><link rel="stylesheet" type="text/css" href="/manage/noJS.css" /></noscript> 
<!-- image upload -->
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
	
<!--end image upload -->	
<!--  search 스타일 -->
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
/*     background-color: #fda699; */
    position: absolute;
    top:220px;
    left: -10px;
    bottom: 200px;
    }
    .cusinfo input{
    float: right;
    }
     .cusinfo a{
    color: black;
    float: right;
    margin-bottom:5px;
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
#block2{
 position: absolute;
 margin-bottom: 50px;
 top:800px;
 left:730px;
}
.avatar
{
float:left;
margin-left: 70px;
}


/* file upload */
.custom-drop-zone{
            width: 600px;
            height: 480px;
            background: cadetblue;
        }
    </style>




<script>
$(document).ready(function(){
   
   $('.header').addClass('hide');
});
</script>


<div class="body">

<!-- 왼쪽 메뉴바 -->
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

<!-- end of menubar -->

<!-- search & table  -->

<div class="container" style="float:left ;">
<div class="line">
	<input type="text" class="form-control" 
	placeholder="Search..." id="search_field">
</div>
  <div class="row">
    <div class="col-md-6">

    <table id="myTable" class="table table-inverse">
      <thead>
        <tr class="myHead">
          <th>고객명</th>
          <th>주소</th>
          <th>전화번호</th>
        </tr>
      </thead>
      <tr>
        <td>박보검</td>
        <td>서울시 </td>
        <td>010-1111-2222</td>
      </tr>
      <tr>
        <td>지창욱</td>
        <td>인천 광역시</td>
         <td>010-1111-2223</td>
      </tr>
      <tr>
        <td>송중기</td>
        <td>미국</td>
         <td>010-1111-2224</td>
      </tr>
      <tr>
        <td>이민호</td>
        <td>뉴질랜드</td>
         <td></td>
      </tr>
      <tr>
        <td>5</td>
        <td>Dalton</td>
         <td></td>
      </tr>
      <tr>
        <td>6</td>
        <td>Bobby</td>
         <td></td>
      </tr>

    </table>
</div>
  </div>
</div>

  
  <!-- 검색 테이블 js -->
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
    <!--  end of search main -->
    
    <!-- 고객수정 -->
  <div  style=" margin-left:100px;   float: left ;"  >
	<div id="block1" class="modal-content" >
	<table>
		<tr>
			<td><a class="title">보호자 목록 <input class="saveBtn" style="float:right; width:10px ; " type="button" src="url(/images/저장.png)" /></a>
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
						<p>please click here and upload your picture</p>

						<div class="file-upload" data-input-name="input1"></div>

					</div>
					<!-- 고객정보div -->
								<div class="cusinfo" style="margin-left: 20px;">
									<a class="name" style="float: left; margin-left: 110px;"> <br />
										박보검
									</a> <br />
									<br />
									<br /> <a> 휴대전화 &nbsp; <input
										style="background-color: #fda699" type="text"
										value="010-1111-2222" />
									</a><br /> <a> 이메일 &nbsp; <input
										style="background-color: #fda699" type="text"
										value="bogum@gmail.com" />
									</a><br /> <a> 우편번호&nbsp; <input
										style="background-color: #fda699" type="text"
										value="010-1111-2222" />
									</a> <br />
								</div>
							</div></a>
        </li>
    </ul>
</div>
</div>
		
    
        <!-- 동물수정 -->
  <div  style=" margin-left:100px;   float: left ;"  >
	<div id="block2" class="modal-content" >
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
			        <div class="file-upload" data-input-name="input1">
			
			        </div>
			     </div>

                    <!-- 고객정보div -->
                <div class="cusinfo" style="margin-left: 20px;">
                	<a class="name" style="float: left; margin-left:110px;">
                       <br/> 
                        콩이
                    </a> 
                    <br/><br/><br/>
                    <a >
                        나이 &nbsp; <input style="background-color: #DBDBDB" type="text" value="8개월"/>
                    </a><br/>
               		<a >
                        성별 &nbsp; <input style="background-color: #DBDBDB" type="text" value="암컷"/>
                    </a><br/>
                    <a>
                        특이사항 &nbsp;  <input style="background-color: #DBDBDB" type="text" value=""/>
                    </a>
                    <br/>
                </div>
                </div>
                 
            </a>
        </li>
    </ul>
</div>
</div>
</div>
