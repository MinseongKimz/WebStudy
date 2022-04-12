<%@page import="com.sun.javafx.image.impl.IntArgb"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	int kor = 0;
	int eng = 0;
	int mat = 0;
	
	int tot = 0;
	double avg = 0.0;
	
	try
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}

	tot = kor + eng + mat;
	avg = tot / 3.0;

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02.jsp</title>
</head>
<body>

 <div>
 	<h1>데이터 송수신 실습 02</h1>
 	<hr>
 </div>
<div>
	<h2>정보 확인</h2>
	<p style="font-size: 30px; font-family: 나눔고딕코딩;">『<%=name %>님, 성적 처리가 완료 되었습니다. <br> <br>
		&nbsp; 회원님의 점수는 국어:<%=kor %>점, 영어:<%=eng %>점, 수학:<%=mat %>점 입니다. <br> <br>
		&nbsp; 총점은 <%=tot %>점, 평균은 <%=String.format("%.1f",avg) %>점입니다.』
	</p>
</div>

</body>
</html>













