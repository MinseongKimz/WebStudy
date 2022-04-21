<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 여기서는 TestSession02.jsp에서는 submit 해서 request.getParameter("id"); 이런식으로 받아옴..
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	// 이제 TestSession01 에서 받아온 이름과 번호는 session을 통해 만들었기 때문에..
	
	//String name = session.getAttribute("name");  강제 형변환 필요
	String name = (String)session.getAttribute("name"); 
	String tel = (String)session.getAttribute("tel");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03.jsp</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
<style type="text/css">
	table
	{
		border: 3px solid gray;
		text-align: left;
		border-collapse: collapse;
	}
	 th, td {
    border: 1px solid gray;
  }

</style>
</head>
<body>


<div>
	<h1>TestSession03.jsp → 출력 페이지</h1>
	<hr>
</div>


<div>
	<table>
		<tr>
			<th colspan="2">TestSession01.jsp</th>
		</tr>
		<tr>
			<th>이름 (session)</th>
			<td>&nbsp;<%=name %></td>
		</tr>
		<tr>
			<th>전화번호 (session)</th>
			<td>&nbsp;<%=tel %></td>
		</tr>
		<tr>
			<th colspan="2">TestSession02.jsp</th>
		</tr>
		<tr>
			<th>아이디</th>
			<td>&nbsp;<%=id %></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>&nbsp;<%=tel %></td>
		</tr>
	</table>
</div>


</body>
</html>