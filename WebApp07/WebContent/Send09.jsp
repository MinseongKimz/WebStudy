<%@ page contentType="text/html; charset=UTF-8"%>
<%
/* 	String dan = "";
	
	dan += "<ul>";	
	for (int i=1; i<=9; i++)
		dan += "<li><a href='Receive09.jsp?dan="+i+"' >"+ i +"단</a><br>";
	dan += "</ul>";	 */	
	
	String result = "";
	result += "<ul>";
	for(int i=1 ; i<=9 ; i++)
	{
		result += String.format("<li><a href='Receive09.jsp?gugudan=%1$d'>%1$d단</a></li>", i);
	}
	result += "</ul>";
	/* 1$는 순번을 뜻함....  */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send09.jsp</title>
<style type="text/css">
a { margin : 2%;
	margin-left :0%;
	color : magenta;
	font-size: 20pt;
	text-decoration: none;
}
li { color: magenta;}
</style>
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 09
		- a 태그 (링크 태그)에 대한 반복문 처리를 하는 JSP 페이지를 구성한다.
		- 이를 활용하여 구구단 리스트를 동적으로 구성하여
		  선택에 따른 결과 페이지를 출력해 주는 형태의 페이지로 구현한다.
		- submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
		
		구구단 선택
		
		1 단 → (목록 구성) 
 		2 단
 		3 단
 		4 단
          : 	
		  :	 	
 		9 단
 		
 		- 리스트의 특정 단을 클랙 했을 때
 		  구구단을 출력해주는 형태의 페이지(Receive09.jsp)로 구현한다.
 		
 		- 사용자 최초 요청 주소는
 		  http://localhost:8090/WebApp07/Send09.jsp  
 	
 	○ Sen09.jsp
 	   Receive09.jsp  
 -->
 <div>
 	<h1>데이터 송수신 실습 09</h1>
 	<hr>
 </div>
 
 <div>
 	<h2>Send09 [●] → Receive09 [○] </h2>	<br><br>
 	
 	<!-- <a href="Receive09.jsp" >1단</a>  이거 9개 만들자-->
 	<%= result %>
 </div>


</body>
</html>