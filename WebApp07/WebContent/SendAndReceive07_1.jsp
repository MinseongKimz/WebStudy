<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%


	request.setCharacterEncoding("UTF-8");
	
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");

	Calendar cal = Calendar.getInstance();
	
	int nowYear = cal.get(Calendar.YEAR);			//--2022
	int nowMonth = cal.get(Calendar.MONTH)+1;		//--4
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);	//--13
	
	//최초의 페이지인경우 selectYear = nowYear 최초가 아닌경우 selectYear=sYear
	// ③ 표시할 달력의 년, 월 구성 → 페이지 최초 요정을 감안한 코드
	int selectYear = nowYear;
	int selectMonth = nowMonth;



	if(sYear != null || sMonth != null)
	{
		selectYear =  Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	//  확인한 날짜로 년도 select option 구성 --------------------
	String yOptions = "";
	String mOptions = "";
	
	for (int year=(selectYear-10); year<=(selectYear+10); year++)
	{
		// 상황1. 페이지 최초 요청 → sYear 는 null, 현재 년도와 옵션 값이 같을 때
		// 상황2. 페이지 최초 요청 아닐 때
		// 상황3. 나머지
		if (sYear==null && year==nowYear)
			yOptions += "<option value='"+year+"' selected='selected'>"+year+"</option>";
		else if(sYear!=null && Integer.parseInt(sYear)==year)
			yOptions += "<option value='"+year+"' selected='selected'>"+year+"</option>";
		else
			yOptions += "<option value='"+year+"'>"+year+"</option>";
	}	
	//  -------------------- 확인한 날짜로 년도 select option 구성 
	
	
	
	//  확인한 날짜로 월 select option 구성 --------------------
	
	for (int month=1; month<=12; month++)
	{
		// 상황1. 페이지 최초 요청 → sYear 는 null, 현재 년도와 옵션 값이 같을 때
		// 상황2. 페이지 최초 요청 아닐 때
		// 상황3. 나머지
		if(sMonth==null && month==nowMonth)
			mOptions += "<option value='"+month+"' selected='selected'>"+month+"</option>";
		else if(sMonth!=null && Integer.parseInt(sMonth)==month)
			mOptions += "<option value='"+month+"' selected='selected'>"+month+"</option>";
		else
			mOptions += "<option value='"+month+"'>"+month+"</options>";
		
	}
	//  -------------------- 확인한 날짜로 월 select option 구성 
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//[달력 그리기]
	
	// 그려할 달력의 1일이 무슨 요일인지 확인 필요
	// (만년달력활용)
	
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	if(selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)
		months[1]=29;
	
	// 총 날 수 누적 변수
	int nalsu;
	
	// 요일 항목 배열 구성
	String[] weekNames = {"일요일","월요일","화요일","수요일","목요일","금요일","토요일"};
	
	// 현재 년도 ~ 입력받은 년도 이전 년도까지의 날 수 계산..
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 현재 월 ~ 입력받은 월의 이전 월까지의 날 수 추가
	for (int i=0; i<selectMonth-1; i++)
		nalsu += months[i];
	
	nalsu++;	// + 1 
	
	int week = nalsu%7; 	//-- 요일 변수
	int lastDay = months[selectMonth-1]; // 마지막 날짜 변수
	
	String calStr = "";
	calStr += "<table border='1'>";
	
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
	
	// 빈 칸 공백 td 발생
	calStr += "<tr>";
	for (int i=1; i<=week; i++)
		calStr += "<td></td>";
		
	// 날짜 td 발생
	for (int i=1; i<=lastDay; i++)
	{
		week++;                  // 날짜가 하루씩 찍힐 때 마다 요일도 하루씩 증가..

		//calStr += "<td>" + i + "</td>";
		
		if (selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0) // 토요일인 오늘
			calStr += "<td class='nowSat'>" + i + "</td>";
		else if (selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==1) // 일요일 오늘
			calStr += "<td class='nowSun'>" + i + "</td>";
		else if (selectYear==nowYear && selectMonth==nowMonth && i==nowDay)		 // 평일 오늘
			calStr += "<td class='now'>" + i + "</td>";
		else if (week%7==0)
			calStr += "<td class='sat'>" + i + "</td>";
		else if (week%7==1)
			calStr += "<td class='sun'>" + i + "</td>";
		else 	
			calStr += "<td>" + i + "</td>";		
		
		if (week%7==0)
			calStr += "</tr><tr>";

	}
	// 빈 칸 공백 td 발생
	for (int i=0; i<=week ; i++, week++)
	{
		if(week%7==0)
			break;
		calStr += "<td></td>";
	}
	
	if (week%7!=0)
		calStr += "</tr>";
		
	calStr += "</table>";
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp(with_T)</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	td {text-align: right;}
	td.now {background-color: aqua; font-weight: bold;}
	td.sat {color: blue;}
	td.sun {color: red;}
	td.nowSat {background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun {background-color: aqua; font-weight: bold; color: red;}
</style>

<script type="text/javascript">
function formCalendar(obj)
{
	obj.submit();
}
</script>
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 07
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	   - 연도 구성은 현재의 연도를 기준으로 이전 10년, 이후 10년으로 구성한다.
	     (기본적으로 만년달력을 구성하는데 현재의 연, 월 은 달력 객체로부터 확인할 수 있도록 한다.)
	   - 월 구성은 1월 부터 12월 까지로 구성한다.
	   
	       2012
	         :
	     [ 2022 ▼] 년  [ 4 ▼] 월
	         :
	       2032  
	     
	     -----------------------------
	     -----------------------------
	     -----------------------------
	     -----------------------------
	     
	  - 연도 select 나 월 select 의 내용이 변화되면
	    해당 연 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	    
	  - 사용자 최초 요청 주소는
	    http://localhost:8090/WebApp07/SendAndReceive07.jsp 로 한다.
	    
	○ SendAndReceive07.jsp	         

-->


<div>
	<h1>데이터 송수신 실습 07(with_T)</h1>
	<hr>
</div>


<div>
	<!-- form 의 action 속성 값 생략 → 요청 페이지 / 데이터의 수신처는 자기 자신 -->
	<form action="" method="get">
		<select id="year" name="year" onchange="formCalendar(this.form)">
			<%=yOptions %> 
		</select> 년
		<select id="month" name="month" onchange="formCalendar(this.form)">
			<%=mOptions %>
		</select> 월
	</form>
</div>
<br>

<div>
	<!-- 달력을 그리게 될 지점 -->
	<%=calStr %>
</div>







</body>
</html>