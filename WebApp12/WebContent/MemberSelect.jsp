
<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	StringBuffer str = new StringBuffer();

	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		
		str.append("<table class='table'>");		
		str.append("<tr>");		
		str.append("<th style='width: 50px;'>번호</th>");		
		str.append("<th style='width: 100px;'>이름</th>");		
		str.append("<th style='width: 150px;'>전화번호</th>");		
		str.append("<th style='width: 200px;'>회원관리</th>");		
		str.append("</tr>");		
		
		
		for(MemberDTO dto : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>" + dto.getSid() + "</td>");
			str.append("<td>" + dto.getName() + "</td>");
			str.append("<td>" + dto.getTel() + "</td>");
			str.append("<td>");
			
			str.append("<a href='MemberUpdateForm.jsp?sid=");
			str.append(dto.getSid()); // 수정을 위한 sid를 넘겨주기 위해.. 
			str.append("'><button type='button' class='btn01'>수정</button></a>");
			str.append(" ");
			
			/* str.append("<a href='javascript:memberDelete(1, \"고길동\")'>"); */
			// 이스케이프 문법 : \"내용\"
			// ※ 자바스크립트에서 사용할 수 있는 
			//    따옴표의 종류 : ① "" ② '' ③ \"\"
			//  일반적으로 따옴표가 두 번 중첩되어 사용하게 되면
			//  ①과 ② 를 사용하면 된다.
			//  하지만, 따옴표가 세번 중첩되어 사용될 경우
			//  ③ escape 를 사용해야 한다.
			
 			str.append("<a href='javascript:memberDelete(" + dto.getSid() +  ", \"" + dto.getName() + "\" )'>");
			str.append("<button type='button' class='btn01'>삭제</button>");
			str.append("</a>");
			
			str.append("</td>");
			str.append("</tr>");
		}
		str.append("</table>");
		
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
<title>MemberSelect.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css">

<script type="text/javascript">
	 
	 function memberDelete(sid, name)
	{
		//확인  
		//alert("SDSD");
		//alert("번호:" + sid + ", 이름:" + name);
		
	    var res = confirm("번호 : " + sid + ", 이름 : " + name + "\n이 회원의 정보를 정말 삭제하겠습니까??");
		
		//alert(res);
		// confirm() 함수를 통해 호출되는 창은
		// true(확인) or false(취속)를 반환 
		
		if(res)
			window.location.href='MemberDelete.jsp?sid=' + sid;
	}
</script>

</head>
<body>

<div>
	<h1>회원 <span style="color: red">명단</span> 관리 및 출력 페이지</h1>
	<hr>
</div>


<div>
	<a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a>
	<a href="MemberInsertForm.jsp"><button type="button">신규 회원 등록</button></a>
</div>
<br>
<div>
	<!-- 리스트 출력 -->
	<!-- <table class="table">
		<tr>
			<th style="width: 50px;">번호</th>
			<th style="width: 100px;">이름</th>
			<th style="width: 150px;">전화번호</th>
			<th style="width: 200px;">회원관리</th>
		</tr>
		<tr>
			<td>1</td>
			<td>희동이</td>
			<td>010-1111-1111</td>
			<td>
				<a><button type="button" class="btn01">수정</button></a>
				<a><button type="button" class="btn01">삭제</button></a>
			</td>
		</tr>
		<tr>
			<td>2</td>
			<td>도우너</td>
			<td>010-2222-2222</td>
			<td>
				<a><button type="button" class="btn01">수정</button></a>
				<a><button type="button" class="btn01">삭제</button></a>
			</td>
		</tr>
		<tr>
			<td>3</td>
			<td>마이콜</td>
			<td>010-3333-3333</td>
			<td>
				<a><button type="button" class="btn01">수정</button></a>
				<a><button type="button" class="btn01">삭제</button></a>
			</td>
		</tr>
	</table> --> 
		<!-- 윗 구문을 동적으로 db와 연계해서 해보자 --> 
		<%=str.toString() %>		

</div>

</body>
</html>