<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	String danStr = request.getParameter("gugudan");
	
	int dan = 0;
	try
	{
		dan = Integer.parseInt(danStr);
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
	String gugudan  = "";
	gugudan += "<ul>";
	for (int i=1; i<=9; i++)
	{
		gugudan += (String.format("<li>%d * %d = %d", dan, i , (dan*i)) + "<br>");
	}
	gugudan += "</ul>";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive09.jsp</title>
</head>
<body>
 <div>
 	<h1>데이터 송수신 실습 09</h1>
 	<hr>
 </div>
 <div>
 	<h2>Send09 [○] → Receive09 [●] </h2>
 	
 	<br><br>
 	<div style="margin: 2%; font-size: 20pt; color: aqua;">
 	<%=gugudan %>
 	</div>
 </div>
</body>
</html>