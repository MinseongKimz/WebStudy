<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01.jsp</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
<script type="text/javascript">
	
	function sendIt()
	{
		// 테스트 
		//alert("함수");
		
		
		var f = document.forms[0];
		//alert(f);
		
		if(!f.name.value)
		{
			alert("이름 입력~!!");
			f.name.focus();
			return;
		}
		
		if(!f.tel.value)
		{
			alert("생일 입력~!!");
			f.tel.focus();
			return;
		}
		
		f.submit();
	}

</script>
</head>
<body>

<div>
	<h1>TestSession01.jsp → TestSession02.jsp</h1>
	<hr />
</div>

<!-- 
	○ TestSession01.jsp 에서 TestSession02.jsp로
	   이름과 전화번호를 입력받아 전송
	   
	   TestSession02.jsp 에서 TestSession03.jsp로
	   아이디와 패스워드를 입력받고
	   앞에서 전달 받은 이름과 전화번호를 함께 전송
	   
	   TestSession03.jsp 에서 전달받은 이름, 전화번호, 아이디, 패스워드 출력
	   
	   01→→→→→→→→ 02 →→→→→→→→→ 03
	   이름, 전화번호     아이디, 패스워드      이름, 전화, 아이디, 패스워드 
	   입력               입력                  출력
	   
	   			 - getParamemter           - getAttribute
 -->

<div>
	<form action="TestSession02.jsp" method="post">
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel"></td>
			</tr>
			<tr>
				<td colspan="2"><button type="button" onclick="sendIt()" style="width: 100%;">제출하기</button></td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>