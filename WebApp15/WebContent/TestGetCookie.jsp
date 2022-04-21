<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Cookie[] ck  = request.getCookies();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestGetCookie.jsp</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
</head>
<body>

<div>
	<h1>쿠키 정보 얻어내기</h1>
	<hr>
</div>

<div>
	<table class="table">
		<tr>
			 <th style="width:120px;">쿠키이름</th>
			 <th style="width:120px;">쿠키 값</th>
		</tr>
		<%
		for(Cookie c:ck)
		{
		%>
		<tr>
			<td><%=c.getName() %></td>
			<td><%=c.getValue() %></td>
		</tr>
		<%} %>	
	</table>
</div>





<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
</body>
</html>




