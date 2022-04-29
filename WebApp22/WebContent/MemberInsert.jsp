<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// MemberInsert.jsp
	
	// 5 명 분 데이터 수신 → 객체 구성 → 자료구조 구성 → setAttribute()
	//                        MemberDTO         

	
	List<MemberDTO> lists = new ArrayList<MemberDTO>();	
	
	for(int i = 1; i<6; i++ )
	{
		MemberDTO dto = new MemberDTO();
		
		dto.setName(request.getParameter("name"+i));
		dto.setTel(request.getParameter("tel"+i));
		dto.setAddr(request.getParameter("addr"+i));
		
		lists.add(dto);
	}
	
	request.setAttribute("lists", lists);
	
	// MemberList.jsp 를 요청할 수 있도록 안내

%>

<jsp:forward page="MemberList.jsp"></jsp:forward>