<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
//MemberInsert.jsp
	// 데이터베이스의 테이블(TBL_MEMBER)에
	// 회원 데이터 추가 액션 처리 수행
	// ...이후, 다시 리스트 페이지(MemberSelect.jsp)를 요청
	
	request.setCharacterEncoding("UTF-8");

	String sidStr = request.getParameter("sid");
	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		MemberDTO dto = new MemberDTO();
		dto.setSid(sidStr);
		dto.setName(uName);
		dto.setTel(uTel);
		
		dao.modify(dto);
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
	
	// check!!
	// 리다이렉트 처리 필요 → MemberSelect.jsp
	response.sendRedirect("MemberSelect.jsp");
	




%>