<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%-- <% request.setCharacterEncoding("utf-8"); %> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


<script type="text/javascript">
  alert("${message}");
  
  if(${result} > 0 ){
	  location.href="noticeList.dodam";
  }else{
	  history.back();
  }
</script>

</body>
</html>



