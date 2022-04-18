<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	StringBuffer str = new StringBuffer();
	
	ScoreDAO dao = null;
	
	String memberCount = "<span id='memberCount'>전체 인원수 : ";
	
	try
	{
		dao = new ScoreDAO();
		
		memberCount += dao.count() + "명</span>";
		
		
		// 표 만들기
		str.append("<table class='list' border='2'>");
		str.append("<tr>");
		str.append("<th class='title'>번호</th><th class='title'>이름</th><th class='title'>국어점수</th>");
		str.append("<th class='title'>영어점수</th><th class='title'>수학점수</th>"); 
		str.append("<th class='title'>총점</th><th class='title'>평균</th>"); 
			   
		for(ScoreDTO member :dao.lists())
		{
			str.append("<tr>");
			str.append("<td class='record'>" + member.getSid() +"</td>");
			str.append("<td class='record'>" + member.getName() +"</td>");
			str.append("<td class='record'>" + member.getKor() +"</td>");
			str.append("<td class='record'>" + member.getEng() +"</td>");
			str.append("<td class='record'>" + member.getMat() +"</td>");
			str.append("<td class='record'>" + member.getTot() +"</td>");
			str.append("<td class='record'>" + String.format("%.1f", member.getAvg())+"</td>");
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
<title>ScoreList.jsp</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
<style type="text/css">
	span { display: none; color: red; font-size: 9pt;}
	.list{ text-align: center; width: 800px;  border-collapse: collapse;}
	input {width: 200px;}
	button {width: 208px; height: 50px; font-weight: bold;}
	.tilte{background-color: #B7B7B7;}
	#memberCount { display: inline; color: black; font-size: 18pt;}
</style>
<script type="text/javascript">
	
	
	function formCheck()
	{
		// 확인 
		//alert("sd");
			
		var nName = document.getElementById("name");

		var nKor = document.getElementById("kor");
		var nEng = document.getElementById("eng");
		var nMat = document.getElementById("mat");
		
		// 점수 숫자
		var kor = Number(nKor.value);
	    // alert(kor); //숫자말고 문자넣으면 NaN 이 뜨는걸 확인 .. → isNaN 처리 필요 밑에서..
		// js 에서 parseInt, Number 둘다 숫자 안넣으면 NaN 넣음 
		// 공백 넣고 숫자로 바꾸면 0
		var eng = Number(nEng.value);
		var mat = Number(nMat.value);

		// span(에러메시지) 의 아이디
		var check1 = document.getElementById("check1");
		var check2 = document.getElementById("check2");
		var check3 = document.getElementById("check3");
		var check4 = document.getElementById("check4");
		
		check1.style.display = "none";
		check2.style.display = "none";
		check3.style.display = "none";
		check4.style.display = "none";
		
		// 유효성 검사
		if(nName.value.indexOf(" ")>-1 ||nName.value == "") // 이름
		{
			check1.style.display = "inline";
			nName.focus()
			return false;
		}
		
		if(nKor.value=="" || kor>100 || kor<0 || isNaN(kor) || nKor.value.indexOf(" ")>-1) // 국어
		{
			check2.style.display = "inline";
			nKor.focus();
			return false;
		}
		
		if(nEng.value=="" || eng>100 || eng<0 || isNaN(eng) || nEng.value.indexOf(" ")>-1) // 영어
		{
			check3.style.display = "inline";
			nEng.focus();
			return false;
		}
		
		if(nMat.value=="" || mat>100 || mat<0 || isNaN(mat) || nMat.value.indexOf(" ")>-1)  // 수학
		{
			check4.style.display = "inline";
			nMat.focus();
			return false;
		}
		
		return true;  // 통과하면 액션 처리
	}

</script>
</head>
<body>

<div>
	<h1>DAO, DTO 를 이용한 성적 처리 (WebApp09와 비교)</h1>
	<hr>
</div>


<div>
 	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
 	<table>
 		<tr>
 			<th>이름(*)</th>
 			<td><input type="text" class="txt" id="name" name="name"></td>
 			<td><span id="check1">이름을 입력하세요</span></td>
 		</tr>
 		<tr>
 			<th>국어점수</th>
 			<td><input type="text" class="txt" id="kor" name="kor"></td>
 			<td><span id="check2">국어점수를 제대로 입력하세요(0~100)</span></td>
 		</tr>
 		<tr>
 			<th>영어점수</th>
 			<td><input type="text" class="txt" id="eng" name="eng"></td>
 			<td><span id="check3">영어점수를 제대로 입력하세요(0~100)</span></td>
 		</tr>
 		<tr>
 			<th>수학점수</th>
 			<td><input type="text" class="txt" id="mat" name="mat"></td>
 			<td><span id="check4">수학점수를 제대로 입력하세요(0~100)</span></td>
 		</tr>
 		<tr>
 			<th colspan="2"><input type="submit" class="btn control" value="성적 추가"></th>
 		</tr>
 	</table>
 	</form>
</div>


<div>
	<%=memberCount %>
</div>

<div>
	<%=str.toString() %>
</div>


</body>
</html>