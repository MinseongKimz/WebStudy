<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name ="";
	String sid = request.getParameter("sid");

	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		MemberScoreDTO score = dao.search(sid);
	    name = score.getName();
		
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css">
<script type="text/javascript">

	function memberScoreSubmit()
	{
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if (kor.value=="" || isNaN(kor.value) || Number(kor.value) <0 || Number(kor.value) >100)
		{
			korMsg.style.display = "inline";
			kor.focus();
			return;
		}
		
		if (eng.value=="" || isNaN(eng.value) || Number(eng.value) <0 || Number(eng.value) >100)
		{
			engMsg.style.display = "inline";
			eng.focus();
			return;
		}
		
		if (mat.value=="" || isNaN(mat.value) || Number(mat.value) <0 || Number(mat.value) >100)
		{
			matMsg.style.display = "inline";
			mat.focus();
			return;
		}
		
		memberScoreForm.submit();	
	}
	
	function memberScoreReset()
	{
		var memberScoreForm = document.getElementById("memberScoreForm");
		
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		
		memberScoreForm.reset();
		kor.focus();
	}

</script>

</head>
<body>


<div>
	<h1>?????? <span style="color: blue;">??????</span> ?????? 
	??? <span style="color: red;">??????</span> ?????????</h1>
	<hr>
</div>

<div>
	<a href="MemberScoreSelect.jsp"><button type="button">?????? ?????? ??????</button></a>
	<br><br>
</div>
<br>

<form action="MemberScoreInsert.jsp?sid=<%=sid %>" method="post" id="memberScoreForm">
	<table class="table">
		<tr>
			<th>??????</th> 
			<td><%=sid %></td>
			<td></td>
		</tr>
		<tr>
			<th>??????</th> 
			<td><%=name %></td>
			<td></td>
		</tr>
		<tr>
			<th>????????????</th> 
			<td><input type="text" id="kor" name="kor" class="txtScore"></td>
			<td><span class="errMsg" id="korMsg">0~100 ????????? ??????????????? ???????????? ?????????.</span>
		</tr>
		<tr>
			<th>????????????</th> 
			<td><input type="text" id="eng" name="eng" class="txtScore"></td>
			<td><span class="errMsg" id="engMsg">0~100 ????????? ??????????????? ???????????? ?????????.</span>
		</tr>
		<tr>
			<th>????????????</th> 
			<td><input type="text" id="mat" name="mat" class="txtScore"></td>
			<td><span class="errMsg" id="matMsg">0~100 ????????? ??????????????? ???????????? ?????????.</span>
		</tr>
	</table>
	<br>
		<a href="javascript:memberScoreSubmit()"><button type="button">????????????</button></a>
		<a href="javascript:memberScoreReset()"><button type="button">????????????</button></a>
		<a href="MemberScoreSelect.jsp"><button type="button">????????????</button></a>
</form>

</body>
</html>