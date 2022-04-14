<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Calendar cal = Calendar.getInstance(); 
	
	int nowYear = cal.get(Calendar.YEAR);			//--2022
	int nowMonth = cal.get(Calendar.MONTH)+1;		//--4
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);	//--14
	
	int selectYear = nowYear;       // 먼저 아무것도 없으면 에러나기 때문에 오늘꺼 (첫 화면이 오늘 달력을 보여주면 되니깐..) 넣어주기
	int selectMonth = nowMonth;
	
	String sYear = request.getParameter("year");  // selectYear 에 오늘껄 넣어놨어서 오늘껄 가져옴  // 나중에는 select 값이 변할꺼기 때문에 변한 값을 가져올꺼임
	String sMonth = request.getParameter("month");
	
	if(sYear!=null || sMonth!=null)		// 초기가 아니라 값이 들어오면
	{
		selectYear = Integer.parseInt(sYear);	// 다시 셀렉이어에 가져온 값 대입
		selectMonth = Integer.parseInt(sMonth);
	}
	
	String back = "images/투명.png";
	String dis = "none";
	
	if (selectMonth > 12)  // 12월을 넘긴다면..
	{
		selectYear = selectYear+1;
		selectMonth = 1;
		
		back = "images/폭죽.gif";
		dis = "inline";
	}
	
	if (selectMonth < 1) // 1월 미만이 된다면.
	{
		selectYear = selectYear -1;
		selectMonth = 12;
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////[                달력 그리기                 ]////////////////////////////////////////////////////////////////////////////////////
	
	String[] weekNames = {"일요일","월요일","화요일","수요일","목요일","금요일","토요일"};
	
	cal.set(selectYear, (selectMonth-1),1);
	// 달력 년 , 월, 일의 세팅
	
	// 세팅 요일 가져오기 (1일의 요일)
	int w = cal.get(Calendar.DAY_OF_WEEK) - 1; // 얘내는 일요일이 1임 ... -1 해주자

	String calStr  = "";
	
	calStr += "<table border=1>";
	
	calStr += "<tr>";
	
	for (int i=0; i<weekNames.length; i++)
	{
		if (i==0)
			calStr += "<th style='color:red;'>" + weekNames[i] + "</th>"; // 일요일
		else if(i==6)	
			calStr += "<th style='color:blue;'>" + weekNames[i] + "</th>"; // 토요일
		else	
			calStr += "<th>" + weekNames[i] + "</th>";					  // 평일
	}
	calStr += "</tr>";
	
	
	// 날짜 전까지 공백 발생
	calStr += "<tr>";
	for (int i=1; i<=w; i++)
		calStr += "<td></td>";
		
	// 날짜찍기
	for (int i=1; i<=cal.getActualMaximum(Calendar.DATE); i++)
	{
		w++;                  // 날짜가 하루씩 찍힐 때 마다 요일도 하루씩 증가..

		//calStr += "<td>" + i + "</td>";
		
		if (selectYear==nowYear && selectMonth==nowMonth && i==nowDay && w%7==0) // 토요일인 오늘
			calStr += "<td class='nowSat'>" + i + "</td>";
		else if (selectYear==nowYear && selectMonth==nowMonth && i==nowDay && w%7==1) // 일요일 오늘
			calStr += "<td class='nowSun'>" + i + "</td>";
		else if (selectYear==nowYear && selectMonth==nowMonth && i==nowDay)		 // 평일 오늘
			calStr += "<td class='now'>" + i + "</td>";
		else if (w%7==0)
			calStr += "<td class='sat'>" + i + "</td>";
		else if (w%7==1)
			calStr += "<td class='sun'>" + i + "</td>";
		else 	
			calStr += "<td>" + i + "</td>";		
		
		if (w%7==0)
			calStr += "</tr><tr>";
	}
	// 빈 칸 공백 td 발생
	for (int i=0; i<=w ; i++, w++)
	{
		if(w%7==0)
			break;
		calStr += "<td></td>";
	}
	
	if (w%7!=0)
		calStr += "</tr>";
		
	calStr += "</table>";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>
<link rel="stylesheet" type="text/css" href="css/myKms.css">
<style type="text/css">
	td {text-align: right;}
	td.now {background-color: aqua; font-weight: bold;}
	td.sat {color: blue;}
	td.sun {color: red;}
	td.nowSat {background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun {background-color: aqua; font-weight: bold; color: red;}
	.btn {text-decoration: none; color: black; text-align: center; width: 55px; }
	.txt { width: 100px; height: 30px";}
	.backg {
			;
	}
	
</style>

</head>
<body>

<!-- 
	○ 데이터 송수신 실습 08
		- 달력을 출력하는 JSP 페이지를 구성한다.
		- 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
		- 단, submit 버튼 없이 이벤트 처리한다.
		- 전송한 내용을 수신해서 출력해주는 형태의 단독 페이지로 구성한다.
		
		◀ 2022년 4월 ▶
		
		---------------------------
		---------------------------
		---------------------------
		---------------------------
	 - 『◀』 이나 『▶』 클릭 시 
	   해당 년 월의 달력을 출력해주는 형태의 페이지로 구현한다.
	   
	 - 사용자 최초 요청 주소는
	   http://localhost:8090/WebApp07/SendAndReceive08.jsp 로 한다.
	   
	  ○ SendAndReceive08.jsp
	
 -->

<div class="head">
	<p>데이터 송수신 실습 08</p>
	<hr>
</div> 
<div style="background-image: url('images/강호동 오미자차.gif'); background-size: cover; height: 100vh;"  >
		<div class="main" >
			<a href="SendAndReceive08.jsp?year=<%=selectYear %>&month=<%=selectMonth-1 %>" class="btn" style=" margin-left :0; margin-right: 10px; ">◀</a>
			
			<input type="text" id="year" name="year" value=<%=selectYear %>  readonly="readonly" class="txt"> 년
			<input type="text" id="month" name="month" value=<%=selectMonth %> readonly="readonly"  class="txt"> 월
			
			<a href="SendAndReceive08.jsp?year=<%=selectYear %>&month=<%=selectMonth+1 %>" class="btn" style="margin-left: 10px;" >▶</a>
		</div>
		<div class="main" style="margin-top: 20px;">
			<img alt="폭죽"  src="<%=back %>" style="width: 200px; display: <%=dis %>;"><%=calStr %><img alt="폭죽" src="<%=back %>"  style="width: 200px; display: <%=dis %>;">
		</div>
	
</div>
</body>
</html>











