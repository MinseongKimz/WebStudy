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
<title>AjaxTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			//alert("sdad");
			
			//data 구성
			var params = "name=" + $.trim($("#name").val())
						+ "&content=" + $.trim($("#content").val());
			//check~!!
			//jQuery 의 ajax() 함수 사용(호출)
			$.ajax(
			{   /* 
				type:"POST"	 // type:"GET"
				, url:"AjaxTest01_ok.jsp"
				, data:params							// AjaxTest01_ok.jsp 에서 수신하게 되는 데이터
				, success:동작							//success:동작 → 데이터 요청 및 전달이 성공했을 때 처리
				, beforeSend:반환값확인					//beforeSend:반환값확인 → 요청전에 확인해야 할 항목 처리(true/false 가 반환값이여야함)
				, error:동작							// 처리 과정에서 문제가 발생했을 때..
			    */
			    
				type:"POST"	 // type:"GET"
				, url:"AjaxTest01_ok.jsp"
				, data:params							
				, success: function(args)
				{
					$("#resultDiv").html(args);
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();
				}
				, beforeSend:showRequest		// true/false ※showRequest() 아님.. 주의~! 			
				, error: function(e)
				{
					alert(e.responseText);
				}
			});
			
		})
	})
	
	function showRequest()
	{
		if (!$.trim($("#name").val()))
		{
			alert("이름을 입력하세요");
			$("#name").focus();
			
			return false;
		}
		
		if (!$.trim($("#content").val()))
		{
			alert("내용을 입력하세요");
			$("#content").focus();
			return false;
		}
		
		return true;
	}
	
	
</script>

</head>
<body>

<div>
	<h1>JQuery의 ajax() 활용 실습</h1>
	<hr />
</div>


<div>
	이름 <input type="text" id="name" class="txt" /><br /><br />
	내용
	<textarea rows="3" cols="50" id="content"></textarea>
	<br><br>
	<input type="button" value="등록하기" id="sendBtn"/>
</div>

<br><br>

<div id="resultDiv">

</div>

</body>
</html>