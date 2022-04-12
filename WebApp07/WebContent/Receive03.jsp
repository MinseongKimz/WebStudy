<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String numStr1 = request.getParameter("num1");
	String numStr2 = request.getParameter("num2");

	String buhoStr = request.getParameter("buho");
	
	
	int num1 = 0;
	int num2 = 0;
	int result = 0;
	double result1 = 0.0;
	try
	{
		num1 = Integer.parseInt(numStr1);
		num2 = Integer.parseInt(numStr2);
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
	switch(buhoStr)
	{
	case "+" : 
				result = num1 + num2;
				break;
	case "-" : 
				result = num1 - num2;
				break;
	case "*" : 
				result = num1 * num2;
				break;
	case "/" : 
				result1 = num1 / (double)num2;
				break;	
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
<style type="text/css">

span {
	font-size: 18pt;
	font-weight: bold;
	color: magenta;
}
</style>

</head>
<body>

 <div>
 	<h1>데이터 송수신 실습 03</h1>
 	<hr>
 </div>
<div>

	<h2>결과 확인</h2>
	『입력하신 <span><%=num1 %></span>와(과) <span><%=num2 %></span> 의 연산 결과는 <span><% if (buhoStr.contains("/"))
																 out.print(result1);
															 else
																 out.print(result);%></span>입니다.』

</div>




</body>
</html>