<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String sid = request.getParameter("sid");

	MemberDAO dao = new MemberDAO();
	
	String strAddr = "";
	
	
	try
	{
		dao.connection();
		
		// 막 sid 를 지울 수가 없다..
		// 왜냐하면 score 가 있는 정보는 참조되있는 정보기때문에..
		// 지울 수 없다.
		
		
		
		
		
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