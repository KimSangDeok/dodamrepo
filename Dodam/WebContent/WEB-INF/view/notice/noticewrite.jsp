<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- 회원가입 화면 -->
<link rel="stylesheet" type="text/css" href="/noticecss/notice.css" />

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/noticecss/resources/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<!-- 스마트에디터 -->
<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "notice_content", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "/noticecss/resources/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
    	  oEditors.getById["notice_content"].exec("UPDATE_CONTENTS_FIELD");
    	  var title = $('#notice_title').val();
    	  var content = ($('#notice_content').val());
    	  
    	  if(title==null || title==""){
    		  alert("제목을 입력해 주세요.");
    		  return;
    	  }else if(content==null || content=="" || content=="<p>&nbsp;</p>"){
    		  alert("내용을 입력해 주세요.");
    		  return;
    	  }else{
              $("#writefrm").submit();
    	  }
      });    
});
 
 
 
</script>
</head>
<body>
	<!-- 상단메뉴 -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="/main/main.dodam">도담도담</a>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse">
				<div class="row">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/main/main.dodam">HOME</a></li>
						<li><a href="/main/main.dodam">로그인</a></li>
						<li><a href="/main/join.dodam">회원가입</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>


	<!-- 글쓰기전체화면 -->
	<div class="contentwrap">
		<article class="container">
			<div class="page-header">
				<h1>공지사항</h1>
			</div>
			<br />

				<!-- 글쓰기화면 -->
				<div class="container notice">
				<h1 class="title">글쓰기</h1>
				<form id="writefrm" action="write_ok.dodam">
					<table class="table">

							<tr>
								<th>제목</th>
								<td><input id="notice_title" name="notice_title" type="text" style="width: 730px;"></td>
							</tr>

						<tbody>
							<tr>
								<!-- 글내용(스마트에디터) -->
								<th style="vertical-align: middle;">내용</th>
								<td><textarea name="notice_content" id="notice_content" rows="10" cols="100" style="padding:0px; width:728px; height:412px; display:none;"></textarea></td>
								
							</tr>
						</tbody>
					</table>
					<hr/>
					<a href="noticeList.dodam" class="btn btn-default pull-right">취소</a>
					<a id="save" class="btn btn-default pull-right">글쓰기</a>
					</form>
				</div>
		</article>
	</div>

</body>
</html>