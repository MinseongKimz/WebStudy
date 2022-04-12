<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");  // 한글 깨짐 방지
	
	// 이름 
	String nameStr = request.getParameter("name");
	
	// 메모
	String memoStr = request.getParameter("memo"); 
	// 메모에 개행은 어떻게 처리 할 것인가 고민...
	
	// 이상형(중복 선택 가능) → 배열
	String[] grArr = request.getParameterValues("checkGroup");
	
	String checkGroup = "";
	
	if(grArr != null)
	{
		for(String str : grArr)
			checkGroup += " [" + str + "]";
	}	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBoxOk.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 04</h1>
	<hr>
	<p>CheckBox.jsp [○] → CheckBoxOk.jsp [●]</p>
</div>

<div>
	<h2>수신 데이터 확인</h2>
	
	<h3>이름 : <%=nameStr %> </h3>
	
	<h3>메모  </h3>
	<p><%=memoStr.replaceAll("\n", "<br>") %> </p>
	
	<h3>이상형 : <%=checkGroup %></h3>
	
	
</div>


</body>
</html>