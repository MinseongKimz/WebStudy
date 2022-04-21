<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 여기서는 ... TestSession01.jsp 에서 받아온 이름과 전화번호를
	// 어떻게 TestSession03.jsp 에게 전달할 지 고민..
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	
	session.setAttribute("name", name);
	session.setAttribute("tel", tel);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<link rel="stylesheet" href="css/main.css" type="text/css">

<script type="text/javascript">
	function sendIt()
	{
		var f = document.forms[0];
		
		if(!f.id.value)
		{
			alert("아이디 입력~!!!");
			f.id.focus();
			return;
		}
		
		if(!f.pwd.value)
		{
			alert("패스워드 입력~!!!");
			f.pwd.focus();
			return;
		}
		
		f.submit();
		
	}
</script>


</head>
<body>

<div>
	<h1>TestSession02.jsp → TestSession03.jsp</h1>
	<hr />
</div>

<div>
	<h5>이름 : <%=name %>, 전화번호 : <%=tel %></h5>
	<hr>
</div>


<div>
	<form action="TestSession03.jsp" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2"><button type="button" onclick="sendIt()" style="width: 100%;">제출하기</button></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>