<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%-- <% request.setCharacterEncoding("utf-8"); %> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<script type="text/javascript">
  alert("${message}");
  
  if("${state}"=="yes"){
	  location.href="noticedetail.dodam?notice_num=${notice_num}"
  }else{
	  history.back();
  }
</script>

</body>
</html>