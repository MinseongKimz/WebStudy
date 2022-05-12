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
<title>AjaxTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			// 넘겨줄 파람구성 
			var params = "title=" + $.trim($("#title").val()) 
					  + "&content=" + $.trim($("#content").val())
			
			$.ajax({
				
				type :"POST"
				, url : "AjaxTest03_ok.jsp"
				, data:params
				, dataType:"xml"
				, success: function(args)
				{
					var out = ""; // 최종 뿌려줄 구문
					
					$(args).find("comment").each(function() // xml 에서 <comment> 를 찾아서 여러개이므로 반복한다
					{
						var item = $(this); // <comment>
						var num = item.attr("num"); // <comment>의 num 속성 값을 가져와라
						var title = item.find("title").text(); // <comment> 태그에서 <title>태그를 찾아라
						var content = item.find("content").text(); // <comment> 태그에서 <content>태그를 찾아라
						
						out += ">> id=" + num + "<br>";
						out += "  - title = " + title + "<br>";
						out += "  - content = " + content + "<br>";
					})
					
					$("#resultDiv").html(out);
					
					$("#title").val("");
					$("#content").val("");
					$("#title").focus();
					
				}
				, beforSend:showRequest
				, error: function(e)
				{
					alert(e.responseText);
				}
				
			})
			
		})
		
	})
	
	function showRequest()
	{
		if (!$.trim($("#title").val()))
		{
			alert("제목을 입력하세요");
			$("#title").focus();
			
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
	<h1>JQuery의 ajax() 활용 실습3</h1>
	<p>xml control</p>
	<hr />
</div>


<div>
	제목 <input type="text" id="title" class="txt" /><br /><br />
	내용 <input type="text" id="content" class="txt" /><br /><br />
	
	<br><br>
	
	<input type="button" value="등록하기" id="sendBtn"/>
</div>

<br><br>

<div id="resultDiv">

<!-- >> id=1
- title = 테스트
- content = 반갑습니다

>> id=2
- title = 테스트
- content = 반갑습니다.
 -->
</div>
</body>
</html>