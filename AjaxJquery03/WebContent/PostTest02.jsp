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
<title>PostTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			//alert("sdsd");
			
			var title = $("#title").val();
			var content = $("#content").val();
			
			$.post("PostTest02_ok.jsp", {title : title, content : content }, function(data)
			{
				$("#result").html(data);
			});
		});
	});

</script> 


</head>
<body>

<div>
   <h1>jQuery 의 post() 활용 실습</h1>
   <hr />
</div>

<div>
	제목  <input type="text" id="title" class="txt"/><br />
	내용  <input type="text" id="content" class="txt" /><br />
	<input type="button" id="sendBtn" class="btn" value="보내기">
</div>

<div id="result">

</div>

</body>
</html>