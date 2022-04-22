<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="ob" class="com.test.FriendDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<%
	String idel = "";
	
	if(ob.getIdelType() != null)
	{
		for (String str : ob.getIdelType())
			idel += " ["+str+"]";
	}
%>	


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jsp</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
</head>
<body>
 

<div>
	<h1>데이터 입력</h1>
	<hr />
</div>
 
<div>
	<table class="table">
		<tr>
			<th>이름</th>
			<td><%=ob.getName() %></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><%=ob.getAge() %></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=ob.getGender() %></td>
		</tr>
		<tr>
			<th>이상형</th>
			<td><%=idel %></td>
		</tr>
	</table>
</div>
 
 
 
 
</body>
</html>