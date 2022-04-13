<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Calendar cal = Calendar.getInstance();

	// 받아올 년도 월
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");

	//숫자형으로 변형 위한 변수 담기
	int year = 0;
	int month = 0;
	
	// 오늘의 년 월 일 ... 
	int tYear = cal.get(Calendar.YEAR);
	int tMonth = cal.get(Calendar.MONTH) + 1;
	int tDate = cal.get(Calendar.DATE);
	// 최초 홈페이지 들어 갔을 때 시작 --- 2022년 4월
	
	// 이걸로 동적으로 +- 10년 씩 해줄꺼임 2022 년 선택 → <option> 
	String yearMenu = "";
	String monthMenu = ""; 
	
	// 숫자형으로 변환
	if (yearStr==null)
	{
		year=tYear;
		month=tMonth;
	}
	else 
	{
		year = Integer.parseInt(yearStr);
		month = Integer.parseInt(monthStr);
	}
	
	// for 문을 이용해 	동적으로 +- 10년 씩 <option> 문 만들어서 yearMenu 에 담을거임
	
	for (int i=(year-10); i<= year+10; i++ )
	{
			if (i == (year))
				yearMenu += "<option value='" + i + "' selected='selected'>" + i + "</option>";
			else	
				yearMenu += "<option value='" + i + "'>" + i + "</option>";
	}
	// for 문을 이용해 	동적으로 +- 10년 씩 <option> 문 만들어서 monthMenu 에 담을거임	
	for (int i = 1 ; i <=12; i++)
	{
		if(i==month)
			monthMenu += "<option value='" + i + "' selected='selected'>" + i + "</option>";
		else	
			monthMenu += "<option value='" + i + "'>" + i + "</option>";
	}
	
	//=============================================================================================================//
	// 달력 그리기
	int[] months = {31,28,31,30,31,30,31,31,30,31,30,31};
	
	if (year%4==0 && year%100!=0 || year%400==0)
		months[1] = 29;
	
	int nalsu;
	// 자바 계산 은 정수
	nalsu = (year-1)*365 + (year-1)/4 - (year-1)/100 + (year-1)/400;
	
	for(int i=0; i<month-1; i++)
	{
		nalsu += months[i];
	}
	
	nalsu++;	 // 1일
	
	int w = nalsu % 7; // 2022 년 4월 기준 [5]  →	 1일은 금요일
	
	// 달력 그리는 구문 작성
	
	
	String calender  = "";
	
	calender += "<table border=1 class='table'>";
	
	calender += "<tr>";
	
	// 일 월 화 수 목 금     층 만들기
	String[] weekend = {"일","월","화","수","목","금","토"};
	
	for (int i=0; i<7; i++)
	{
		if(i==0)
			calender += "<th class='sun'>" + weekend[i] + "</th>";
		else if	(i==6)
			calender += "<th class='sat'>" + weekend[i] + "</th>";
		else
			calender += "<th>" + weekend[i] + "</th>";
		
	}
	// 시작일 전까지 공백 찍기
	calender += "</tr><tr>";
	
	
	for (int i=0; i<w; i++)
	{
		calender += "<td></td>";
	}
	
	 // 날짜 찍기
	for (int i=1; i<=months[month-1]; i++)
	{
		if(w%7==0)
			calender += "<td class='sun'>" + i + "</td>";
		else if	(w%7==6)
			calender += "<td class='sat'>" + i + "</td>";
		else
			calender += "<td>" + i + "</td>";
		
		w++ ;
		
		if(w%7==0)
			calender += "</tr><tr>";
	}
	
	 // 끝날 뒤 빈칸 까지 채워주기
	for (int i=0; i<=w ; i++, w++)
	{
		if(w%7==0)
			break;
			
		calender += "<td></td>";
	} 
	 
	calender += "</tr></table>";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<script type="text/javascript">
	function submit(obj)
	{
		obj.submit();
	}

</script>
<link rel="stylesheet" type="text/css" href="css/myKms.css">
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 07
		- 달력을 출력하는 JSP 페이지를 구성한다.
		- 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성하낟.
		- 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
		- 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
		- 연도 구성은 현재의 연도를 기준으로 이전 10년, 이후 10년으로 구성한다.
			(기본적으로 만년달력을 구성하는데 현재의 연, 월 은 달력 객체로부터 확인할 수 있도록 한다.)
		- 월 구성은 1월 부터 12월 까지로 구성한다.
		
			[ 2022 ▼] 년  [ 4 ▼]월
		------------------------------------
		------------------------------------
		------------------------------------
				
	 - 연도 select 나 월 select 의 내용이 변화되면
	   해당 연 월의 달력을 출력해 주는 형태의 페이지로 구성한다.
	   
	 - 사용자 최초 요청 주소는
	 	http://localhost:8090/WebApp07/SendAndReceive07.jsp 로한다.
	 	
	 ○ SendAndReceive.jsp	  
		
 -->

<div class="head">
	<p>데이터 송수신 실습07</p>
	<p style="font-size: 30pt;">달력 출력하기</p>
	<hr>
</div>

	

<div class="main">
 	<form action="" method="get">
		<select id="year" name="year" onchange="submit(this.form)" class="txt">	
			<%=yearMenu %>
		</select> 년
		<select id="month" name="month" onchange="submit(this.form)" class="txt">
			<%=monthMenu %>
		</select> 월
	</form> 
	<br><br>

</div>
<div class="main" style="text-align: center;">
<!-- 달력의 공간 -->
	<%=calender %>
</div>

</body>
</html>