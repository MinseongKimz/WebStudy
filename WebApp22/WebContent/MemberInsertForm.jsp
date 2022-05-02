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
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" href="<%=cp%>/css/main.css" type="text/css">
</head>
<body>

<div>
	<h2>JSTL 코어(Core)를 활용한 회원 정보 입력</h2>
	<hr />
</div>

<div>

	<form action="MemberInsert.jsp" method="get">
	
		<!-- (이름, 전화번호, 주소) * 5명 분 -->
		<!-- → submit 액션 처리 -->
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<c:forEach var="a" begin="1" end="5" step="1">
					<c:set var="name" value="name${a }"></c:set>
						<input type="text" name="${name }">
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<c:forEach var="a" begin="1" end="5" step="1">
					<c:set var="tel" value="tel${a }"></c:set>
						<input type="text" name="${tel }">
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<c:forEach var="a" begin="1" end="5" step="1">
					<c:set var="addr" value="addr${a }"></c:set>
						<input type="text" name="${addr }">
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" style="width: 100%;" class="btn">제출하기</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>








