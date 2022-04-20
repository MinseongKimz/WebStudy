<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();

	MemberScoreDAO dao = new MemberScoreDAO();
	
	String sid = request.getParameter("sid");

	try 
	{
		dao.connection();
		
		str.append("<table class='table'>");
		str.append("<tr>");
		str.append("<th class='numTh'>번호</th>");
		str.append("<th class='nameTh'>이름</th>");
		str.append("<th style='width: 80px;'>국어점수</th>");
		str.append("<th style='width: 80px;'>수학점수</th>");
		str.append("<th style='width: 80px;'>영어점수</th>");
		str.append("<th style='width: 80px;'>총점</th>");
		str.append("<th style='width: 80px;'>평균</th>");
		str.append("<th style='width: 50px;'>석차</th>");
		str.append("<th style='width: 200px;'>성적 처리</th>");
		str.append("</tr>");
		
		
		for (MemberScoreDTO dto : dao.lists(sid))
		{
			str.append("<tr>");
			str.append("<td>" + dto.getSid() + "</td>");
			str.append("<td>" + dto.getName() + "</td>");
			str.append("<td class='txtScore'>" + dto.getKor() + "</td>");
			str.append("<td class='txtScore'>" + dto.getEng() + "</td>");
			str.append("<td class='txtScore'>" + dto.getMat() + "</td>");
			str.append("<td class='txtScore'>" + dto.getTot() + "</td>");
			str.append("<td class='txtScore'>" + String.format("%.2f", dto.getAvg()) + "</td>");
			str.append("<td class='txtScore'>" + dto.getRank() + "</td>");
			
			
			
			// 성적 등록되있는사람은 수정 삭제
			// 안되있는 사람은 입력
			if (dto.getKor()==-1 && dto.getEng()==-1 && dto.getMat()==-1)
			{
				str.append("<td><a href='MemberScoreInsertForm.jsp?sid=" +dto.getSid()+"'>");
				str.append("<button type='button' class='btn01'>입력</button></a>");
				
				str.append(" ");
				str.append("<button type='button' class='btn02' disabled='disabled'>수정</button>");
				
				str.append(" ");
				str.append("<button type='button' class='btn02' disabled='disabled'>삭제</button></td>");
			}
			else 
			{
				str.append("<td>");
				str.append("<button type='button' class='btn02' disabled='disabled'>입력</button>");
				
				str.append(" ");
				str.append("<a href='MemberScoreUpdateForm.jsp?sid=" + dto.getSid() + "'>");
				str.append("<button type='button' class='btn01'>수정</button></a>");
				
				str.append(" ");
				str.append("<a href='javascript:memberScoreDelete(" + dto.getSid() +  ", \"" + dto.getName() + "\" )'>");
				str.append("<button type='button' class='btn01'>삭제</button></a></td>");
			}	
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
<title>MemberScoreSelect.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css">

<script type="text/javascript">
	function memberScoreDelete(sid, name)
	{
		//확인  
		//alert("SDSD");
		//alert("번호:" + sid + ", 이름:" + name);
		
	    var res = confirm("번호 : " + sid + ", 이름 : " + name + "\n이 회원의 성적 정보를 정말 삭제하겠습니까??");
		
		//alert(res);
		// confirm() 함수를 통해 호출되는 창은
		// true(확인) or false(취속)를 반환 
		
		if(res)
			window.location.href='MemberScoreDelete.jsp?sid=' + sid;
	}
</script>



</head>
<body>

<div>
	<h1>회원 <span style="color: blue;">성적</span> 관리 및 출력 페이지</h1>
	<hr />
</div>


<div>
	<a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
</div>

<!-- 번호 이름 국어점수 영어점수 수학점수 총점 평균 석차    성적 처리 -->
<!-- 												      입력 수정 삭제-->
<br />
<%=str.toString() %>
</body>
</html>