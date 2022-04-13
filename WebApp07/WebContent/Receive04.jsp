<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 아이디
	String userId = request.getParameter("id");
	
	// 패스워드
	String userPwd = request.getParameter("pwd");
	
	// 이름
	String name = request.getParameter("name");
	
	// 전화번호
	String tel = request.getParameter("tel");
	
	// 성별
	String gender = request.getParameter("gender");

	// 지역
	String city = request.getParameter("city");
	
	// 수강과목
	String[] subArr = request.getParameterValues("subject");
	
	String subject = "";
	
	if (subArr != null)
	{
		for(String str : subArr)
			subject += " [" + str + "]";
	}
	
	//※ 추후에는 수신된 데이터를... 쿼리문을 통해 DB에 입력 하는
	//   처리 과정 등을 포함될 것임을 염두하여 작업을 진행할 수 있도록 하자..


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


 <div>
 	<h1>데이터 송수신 실습 04</h1>
 	<hr>
 </div>


<div>
	<h2>가입 확인</h2>
	
	<p>아이디  :	<%=userId %></p>
	<p>패스워드  :	<%=userPwd %></p>
	<p>이름  :	<%=name %></p>
	<p>전화번호  :	<%=tel %></p>
	<p>성별 : <%=gender %></p>
	<p>지역 : <%=city %></p>
	<p>수강과목 : <%=subject%></p>

</div>




</body>
</html>



























