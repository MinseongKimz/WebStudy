<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	// 데이터베이스의 테이블(TBL_MEMBER)에
	// 회원 데이터 추가 액션 처리 수행
	// ...이후, 다시 리스트 페이지(MemberSelect.jsp)를 요청
	
	request.setCharacterEncoding("UTF-8");

	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		
		// MemberDTO 객체 생성 및 속성 구성(→ add() 메소드 호출 위해 필요)
		MemberDTO member = new MemberDTO();
		member.setName(uName);
		member.setTel(uTel);
		
		dao.add(member);
		
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
