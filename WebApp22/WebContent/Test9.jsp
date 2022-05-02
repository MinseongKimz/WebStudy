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
<title>Test9.jsp</title>
<link rel="stylesheet" href="<%=cp%>/css/main.css" type="text/css">
</head>
<body>


<div>
	<h1>JSTL 코어 import문 실습</h1>
	<hr />
</div>


<div>
<p>『c:import』는 URL 처리에 관여하며,
    URL 을 활용하여 다른 자원의 결과를 삽입할 때 사용한다.</p>
</div>
<br />

<!-- 변수 지정 -->
<c:set var="url" value="Gugudan.jsp"></c:set>

<!-- import 를 수행하며 해당 페이지가 필요로 하는 파라미터값 넘기기 -->
<c:import url="${url }" var="impt">
	<c:param name="dan" value="7"></c:param>
</c:import>

<!-- 결과 화면 출력 -->
<c:out value="${impt }"></c:out>
<!-- 결과 화면 출력 과정에서 HTML 코드를 그대로 출력하는 구문 -->
<%-- 	『<c:out>』에는 escapeXml 속성값 존재. 기본값 true 는 그대로 출력해버림 --%>

<br /><br />
<!-- 결과 화면 출력 -->
<c:out value="${impt }" escapeXml="false"></c:out>

</body>
</html>