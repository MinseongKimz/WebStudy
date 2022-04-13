<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%


	request.setCharacterEncoding("UTF-8");
	
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");

	Calendar cal = Calendar.getInstance();
	
	int nowYear = cal.get(Calendar.YEAR);			//--2019	
	int nowMonth = cal.get(Calendar.MONTH)+1;		//--5
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
	
	for (int year=(selectYear-10); year<=(selectYear+10); year++)
	{
		// 상황1. 페이지 최초 요청 → sYear 는 null, 현재 년도와 옵션 값이 같을 때
		// 상황2. 페이지 최초 요청 아닐 때
		// 상황3. 나머지
		if (sYear==null && year==nowYear)
		{
			yOptions += "<option value='"+year+"' selected='selected'>"+year+"</option>";
		}
		else if(sYear!=null && Integer.parseInt(sYear)==year)
		{
			yOptions += "<option value='"+year+"' selected='selected'>"+year+"</option>";
		}
		else
		{
			yOptions += "<option value='"+year+"'>"+year+"</option>";
		}
	}	
		
	
	
	//  -------------------- 확인한 날짜로 년도 select option 구성 
	
	//  확인한 날짜로 월 select option 구성 --------------------
	//  -------------------- 확인한 날짜로 월 select option 구성 
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
			<option value="99">99</option>
			<option value="1">1</option>
		</select> 월
	</form>
</div>
<br>

<div>
	<!-- 달력을 그리게 될 지점 -->
</div>







</body>
</html>