<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8"); 
%>

<jsp:useBean id="ob" class="com.test.GuestDTO" scope="page"></jsp:useBean>

<jsp:setProperty property="userName" name="ob"/>
<jsp:setProperty property="subject" name="ob"/>
<jsp:setProperty property="content" name="ob"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
</head>
<body>


<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<hr />
</div>


<!--  작성해서 넘긴 내용 확인 -->
<!-- 이름, 제목, 내용 -->
<div>
<h2>작성 내용 확인</h2>
<table class="table">
	<tr>
		<th>작성자</th> <td><%=ob.getUserName() %></td>
	</tr>
	<tr>
		<th>제 목</th> <td><%=ob.getSubject() %></td>
	</tr>
	<tr>
		<th>내 용</th> <td><%=ob.getContent().replaceAll("\n", "<br>") %></td>
	</tr>
</table>
</div>
</body>
</html>