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
<title>LoadingTest.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			//alert("gd");
			
			var params = "name=" + $.trim($("#name").val())
				+ "&content=" + $.trim($("#content").val());
			
			$.ajax({
				
				type:"POST"
				, url:"LoadingTest_ok.jsp"
				, data:params
				, success: function(args)
				{
					$("#result").html(args);
					
					$("name").val("");
					$("content").val("");
					$("name").focus();
					
				}
				, beforSend:showRequest
				, error: function(e)
				{
					alert(e.responseText);
				}
				
			});
		});
		
		//$(document).ajaxStart(기능, 동작, 행위).ajaxComplete(기능, 동작, 행위); // ajax 시작. ajax 완료
		$(document).ajaxStart(function()
		{
			// AJAX 시작했을 때
			$("#loading").show();
			$("#result").hide();
			
			
		}).ajaxComplete(function()
		{
			// AJAX 요청이 종료(완료)됬을 때
			$("#loading").hide();
			$("#result").show();
		});
		
	});

	function showRequest()
	{
		var flag = true;
		
		if(!$("#name").val())
		{
			alert("이름을 입력해야 합니다.");
			$("#name").focus();
			flag = false;
		}
		
		if(!$("#content").val())
		{
			alert("내용을 입력해야 합니다.");
			$("#content").focus();
			flag = false;
		}
		
		return flag;
	}
	
	

</script>

</head>
<body>

<div>
	<h1>Jquery 의 ajax() 활용 실습</h1>
	<p>로딩 이미지 적용</p>
	<hr>
</div>


<div>
	이름 <input type="text" id="name" class="txt"/><br /><br />
	내용 <input type="text" id="content" class="txt"/><br /><br />
	
	<input type="button" value="등록하기"  id="sendBtn" class="btn"/>
	
</div>

<div id="loading" style="text-align: center; display: none;">
	<img alt="loading" src="images/loading_01.gif" style="align-content: center; " >
</div>

<br><br>
<div id="result">

</div>

</body>
</html>