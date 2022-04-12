<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String rowStr = request.getParameter("su1");
	String colStr = request.getParameter("su2");
	int row =0;
	int col =0;
	int n = 0;
	try
	{
		row = Integer.parseInt(rowStr);
		col = Integer.parseInt(colStr);
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TableOk.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
.table {
	
	text-align: center;
	padding: 2px;
	margin-left: 5%;
	outline-style: groove;

	
}
</style>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 05</h1>
	<hr>
	<p>Table.jsp [○] → TableOk.jsp [●]</p>
</div>



<div>

<table>
<%
	for(int i=0; i<col; i++)
	{
		// 여기서 <tr을 찍어내>
%>		
		<tr >
<%
		for(int j =0; j<row; j++)
		{	// 여기서 td 찍어내
%>		
			<td><input type="text" style="width: 50px;" value="<%=++n %>"></td>
<%
		}
%>
		</tr>
<% 
	}
%>
</table>

</div>

</body>
</html>












