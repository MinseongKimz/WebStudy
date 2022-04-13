<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신 (SendAndReceive06.jsp →SendAndReceive06.jsp)
	request.setCharacterEncoding("UTF-8");
	String temp =  "";
	temp = request.getParameter("userInput");
	
	if (temp ==null)
		temp = "";
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive06.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 06</h1>
	<hr>
</div>

<div>
	<!-- <form action="Test999.jsp" method="get">
		입력 <input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">리셋</button>
	</form> -->
	
	<!-- <form action="" method="post">
		입력 <input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">리셋</button>
	</form> -->
	
	<!-- <form  method="get">
		입력 <input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">리셋</button>
	</form> -->
	
	<form method="post">
		입력 <input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">리셋</button>
	</form>
	<!-- ※ form 의 action 속성을 『action=""』과 같이 구성하거나
	        action 속성을 생략하여 『<form method="post">』와 같이 구성하게 되면
	        페이지 요청 및 데이터 전송에 대한 수신처는 자기 자신 
	 -->
</div>

<div>
	<h2>수신된 데이터 확인</h2>
	 <h3>→ <%=temp %></h3>
</div>


</body>
</html>
