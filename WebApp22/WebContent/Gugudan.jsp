<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan.jsp</title>
<link rel="stylesheet" href="<%=cp%>/css/main.css" type="text/css">
</head>
<body>

<!-- 원하는 단을 입력받아 구구단을 출력하는 JSP 페이지를 구성한다.
     단, JSTL Core if 문과 forEach 구문을 활용한다. -->

<div>
	<h1>JSTL 코어를 </h1>
	<hr>
</div>


<div>
	<form action="">
		원하는 단 입력 <input type="text" name="dan" class="txt"><br><br>
		
		<button type="submit" class="btn">결과 확인</button>
		<br />
		<br />
	</form>
</div>

<div>
	<!-- 결과 처리 -->
	<c:if test="${!empty param.dan }">
		<c:forEach var="a" begin="1" end="9" step="1">
			${param.dan } * ${a } = ${a*param.dan } <br>
		</c:forEach>
 	</c:if>
</div>

</body>
</html>