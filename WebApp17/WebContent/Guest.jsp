<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest.jsp</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
<script type="text/javascript">

	function sendIt()
	{
		var f = document.form;
		
		f.submit();
	}

</script>
</head>
<body>

<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<hr />
</div>

<div>
	<form action="Guest_ok.jsp" name="form" method="post" >
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" class="txt" name="userName">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" class="txt" name="subject">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="5" cols="30" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="sendIt()" class="btn" style="width: 100%;">방명록 작성</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>