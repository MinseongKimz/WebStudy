<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 여기선 리스트 를 만들 구문 작성

	// 리스트 뿌릴 변수 /* <=str> */
	String str = "";
	
	// dbconn 객체 생성
    Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비
	String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG FROM TBL_SCORE ORDER BY SID";
	
	// 작업 객체 생성
	Statement stmt = conn.createStatement();
	 
	// 셀렉문 → ResultSet
	ResultSet rs = stmt.executeQuery(sql);
	
	// 반복문 구성
	
	str += "<table class='list' border='2'>";
	str += "<tr>";
	str += "<th class='title'>번호</th><th class='title'>이름</th><th class='title'>국어점수</th>" + 
		   "<th class='title'>영어점수</th><th class='title'>수학점수</th>" + 
		   "<th class='title'>총점</th><th class='title'>평균</th>";

	str += "</tr>";
	
	while(rs.next())
	{
		str += "<tr>";
		
		str += "<td>"+ rs.getInt("SID") + "</td>"; 				// 번호
		str += "<td>"+ rs.getString("NAME") + "</td>"; 			// 이름
		str += "<td>"+ rs.getInt("KOR") + "</td>";				// 국어점수
		str += "<td>"+ rs.getInt("ENG") + "</td>"; 				// 영어점수
		str += "<td>"+ rs.getInt("MAT") + "</td>"; 				// 수학점수
		str += "<td>"+ rs.getInt("TOT") + "</td>"; 				// 총점
		str += "<td>"+ String.format("%.1f", rs.getFloat("AVG")) + "</td>"; 				// 평균
		str += "</tr>";
	}	
	
	// 리소스 반납
	rs.close();
	stmt.close();
	DBConn.close();	
	
	str += "</table>";
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

<!-- 
	○ WebApp09
		- 여러명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
		  총점과 평균을 계산하여 출력해 줄 수 있는 프로그램을 구현한다.
		- 리스트 출력시 번호 오름차순 정렬하여 출력할 수 있도록 한다.
		- 데이터베이스 연동하여 처리한다.
		  (TBL_SCORE, SCORESEQ활용) 
		- 즉, 성적 처리 프로그램을 데이터베이스 연동하여
		  jsp 로 구성할 수 있도록 한다.
		  
		  
		  데이터 베이스 연결 및 데이터 처리
		  -------------------------------------------------------------------------
		  성적 처리
		  
		  이름(*) 	[textbox]   → 이름 입력 확인
		  국어점수  [textbox]   → 0~100사이의 정수가 확인 되었는지 확인
		  영어점수  [textbox]   → 0~100사이의 정수가 확인 되었는지 확인
		  수학점수  [textbox]   → 0~100사이의 정수가 확인 되었는지 확인

		  <성적 추가> ← button
		  
		  번호      이름       국어점수   영어점수  수학점수    총점     평균
		  1         이시우     90         80        70          xxx      xx.x
		  2         이윤태     80         70        60          xxx      xx.x
		  3         홍은혜     90         80        70          xxx      xx.x
		  
		○ WebApp09_scott.sql	 ●	
		   ScoreList.jsp
		   ScoreInsert.jsp
		   com.util.DBConn.java  
 -->

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
 
<div style="margin-top: 1%;">
	<!-- 이곳은 리스트를 뽑을 공간 -->
	<%=str %>
	 
</div>

</body>
</html>

































