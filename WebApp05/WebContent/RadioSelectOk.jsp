<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역 → 이전 페이지(RadioSelect.jsp)로부터 전소된 데이터 수신(→ name, gender, major, hobby)
	
	request.setCharacterEncoding("UTF-8"); // check~!! 받아올 값들이 한글이야~
	
	String nameStr = request.getParameter("name"); 					  //-- 텍스트박스... 단일값 수신
	String genderStr = request.getParameter("gender");                //-- 라디오버튼... 다중값.아님 단일값 수신
	String majorStr = request.getParameter("major");                  //-- 선택상자 .. 단일값!
	//String hobbyStr = request.getParameter("hobby");				  //-- 선택상자.. .다중값이다!!!!!!
 	String[] hobbyArr = request.getParameterValues("hobby");		  // getParameterValues, String[] 차이 확인! 

 	
 	// name 수신 및 처리 → 특이사항 없음~!!
 	
 	// gender 수신 및 처리
 	String gender = "";
 	if(genderStr.equals("M"))
 		gender = "남자";
 	else if(genderStr.equals("F"))
 		gender = "여자";
 	else 
 		gender = "성별확인불가";
 	
 	// major 수신 및 처리 → 특이사항 없음.
 	
 	// hobby 수신 및 처리
 	String hobby = "";
 	// 배열을 받을때는 항상 배열이 null 인지 아닌지 먼저 확인하는게 좋다..
 	if( hobbyArr != null)
 	{
 		for(String item: hobbyArr)
 			hobby += " [" + item + "]";
 	}
 	
 	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelectOk.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 03</h1>
	<hr>
	<p>RadioSelect.jsp [○] → RadioSelectOk.jsp [●]</p>
</div>


<div>
	<h2>radio, select 데이터 수신 결과 확인</h2>
	
	<div>
		<p>이름 : <%=nameStr %> </p>
		<p>성별 : <%=genderStr %> (<%=gender %>) </p>
		<p>전공 : <%=majorStr %> </p>
		<p>취미 : <%=hobby %> </p>
	</div>
</div>

</body>
</html>


























