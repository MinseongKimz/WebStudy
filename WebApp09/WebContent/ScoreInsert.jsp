<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ScoreInsert.jsp
	// 데이터 를 ScoreList.jsp 에서 받아와서 
	// DB에 TBL_SCORE 에 저장할 것
	
	// 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	
	String name = request.getParameter("name");
	//확인
	//out.print(name);
	
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	int kor = 0;
	int eng = 0;
	int mat = 0;
	try
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
		
	// db 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비
	String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)" 
							 +" VALUES(SCORESEQ.NEXTVAL, '%s', %d,%d,%d)", name, kor,eng,mat);
	
	// 작업객체 생성
	Statement stmt = conn.createStatement();
	
	int result = 0;
	
	result = stmt.executeUpdate(sql);
	
	// 리소스 반납
	stmt.close();
	DBConn.close();
	
	// 리다이렉트
	if (result<0)
		response.sendRedirect("Error.jsp");
	else 
		response.sendRedirect("ScoreList.jsp"); 

%>
