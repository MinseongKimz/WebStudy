<%@ page contentType="text/html; charset=UTF-8"%>
<%

	String danStr = request.getParameter("dan");
	int dan = 0;
	try
	{
		dan = Integer.parseInt(danStr);
		
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
		
		// 예외 발생시
		// 해당 내용을 서버 log 기록으로 남기는 처리..
		getServletContext().log("오류 : " + e.toString());
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GugudanOk.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 02</h1>
	<hr>
	<p>Gugudan.jsp [○] → GugudanOk.jsp [●]</p>
</div>

<!-- 내가 한 풀이 테이블을 쓸려고 이렇게 해버림.. -->
<%-- <div>  
	<form>
		<table class="table" style="text-align: center;" >
			<tr>
				<th colspan="3"><%=dan %>단</th>
			</tr>
			<tr>
				<td><%=dan %> * 1 = <%=dan*1 %></td> <td><%=dan %> * 2 = <%=dan*2 %></td> <td><%=dan %> * 3 = <%=dan*3 %></td>
			</tr>
			<tr>
				<td><%=dan %> * 4 = <%=dan*4 %></td> <td><%=dan %> * 5 = <%=dan*5 %></td> <td><%=dan %> * 6 = <%=dan*6 %></td>
			</tr>
			<tr>
				<td><%=dan %> * 7 = <%=dan*7 %></td> <td><%=dan %> * 8 = <%=dan*8 %></td> <td><%=dan %> * 9 = <%=dan*9 %></td>
			</tr>	
		</table>
	</form>
</div> 
 --%>

<%-- <%
	for (int i=1; i<=9; i++)
		out.print(dan + " * " + i + " = " + (dan*i) + "<br>");
%> --%>

<%
	for (int i=1; i<=9; i++)
	{
%>

	<%=dan %> * <%=i %> = <%=(dan*i) %> <br>
<%
	}
%>


</body>
</html>