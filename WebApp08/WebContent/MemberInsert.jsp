<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.REUtil"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	
	
	// 이전페이지(Test002.jsp)로 부터 데이터 수신(userName, userTel)
	
	// 한글 데이터 깨짐 방지
	request.setCharacterEncoding("UTF-8");

	String uName = request.getParameter("userName");
	String uTel = request.getParameter("userTel");
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비 (insert)
	String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL)" 
							+  " VALUES(MEMBERSEQ.NEXTVAL, '%s', '%s')", uName, uTel );
	
	// DB 액션 처리 → 작업 객체 생성 및 쿼리문 수행
	Statement stmt = conn.createStatement();
	int result = 0;
	
	result = stmt.executeUpdate(sql);
	
	
	stmt.close();
	DBConn.close();
	
	if(result<1)
	{
		// 내가 잘 아는 에러페이지를 소개시켜줄게~!!
		response.sendRedirect("Error.jsp");
	}
	else 
	{
		// 이 페이지 오기전에 니가 머물던 리스트 페이지 주소를 다시 요청해서 찾아가~!!
		// 너가 입력한 내용이 추가된 상태로 리스트의 내용이 바뀌어 있을꺼야..
		response.sendRedirect("Test002.jsp");
		
	}


%>
