<%@page import="com.util.DBConn"%>
<%@page import="com.test.ScoreDAO"%>
<%@page import="com.test.ScoreDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 입력 받은 정보로 객체 만들어서 add() 에 넘겨줄거임
	
	ScoreDAO dao = null;

	// 한국어 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	int kor = 0;
	int eng = 0;
	int mat = 0;

	try
	{
		dao = new ScoreDAO();
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
		
		ScoreDTO dto = new ScoreDTO();
		
		dto.setName(name);
		dto.setKor(kor);
		dto.setEng(eng);
		dto.setMat(mat);
		
		dao.add(dto);
	}
	catch(Exception e)
	{
		System.out.println(toString());
	}
	finally
	{
		try
		{
			DBConn.close();
		}
		catch (Exception e)
		{
			System.out.println(toString());
		}
	}
	
	response.sendRedirect("ScoreList.jsp");
	
%>