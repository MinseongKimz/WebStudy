<%@ page contentType="text/html; charset=UTF-8"%>
<% 

//   한글 수신을 위한 인코딩 방식 지정
//-- 웹은 UTF-8을 기본 인코딩 방식으로 삼고 있음.
//   그러므로 기본 설정을 UTF-8로 구성하는 것이 좋음.
//   (하지만, 데이터를 전송하는 페이지에서 EUC-KR 과 같이 다른 인코딩 방식으로
//    처리하고 있는 상황이라면... 그에 따른 인코딩 방식이 지정되어야 한글 깨지지 않음.

//   (이 처리는 데이터 처리보다 먼저 수행해야 
//    한글이 깨지지 않은 상태로 수신할 수 있음.)
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String tel = request.getParameter("tel");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive01.jsp</title>
</head>
<body>

 <div>
 	<h1>데이터 송수신 실습 01</h1>
 	<hr>
 </div>
<div>
	<h2>가입 확인 </h2>
	<p style="font-size: 30px; font-family: 나눔고딕코딩;">『<%=name %>님, 회원가입이 완료되었습니다. <br> <br>
		&nbsp; 회원님께서 등록하신 전화번호는 <%=tel %> 입니다.』
	</p>
</div>


</body>
</html>