<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloReceive03.jsp</title>
<link rel="stylesheet" href="<%=cp%>/css/main.css" type="text/css">
</head>
<body>

<div>
	<h1>최종결과 수신 페이지</h1>
	<h2>HelloReceive03.jsp</h2>
	<hr />
</div>

<div>
	<ul>
		<li><b>First Name : ${firstName }</b></li>
		<li><b>Last Name : ${lastName }</b></li>
	</ul>
</div>

</body>
</html>