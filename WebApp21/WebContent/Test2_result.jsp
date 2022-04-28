<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String str = (String)request.getAttribute("result");
	// http://localhost:8090/WebApp21/test2 최종 주소 !

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test2_result.jsp</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
</head>
<body>

<div>
	<h1>최종 결과값 수신</h1>
	<hr>
</div>

<%=str %>
</body>
</html>