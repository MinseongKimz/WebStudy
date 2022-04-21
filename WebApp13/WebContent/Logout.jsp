<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//Logout.jsp
	//-- 세션 내용을 없애서 로그아웃 액션 처리
	session.removeAttribute("userId");
	session.removeAttribute("userPwd");
	session.removeAttribute("userName");
	// 세션의 사용자 아이디와 패스워드와 이름  삭제
	
	
	// 기존 세션 모든 값들 다 제거하고 세션을 초기화
	session.invalidate();
	
	/// 클라이언트에게 다시 로그인 페이지를 요청할 수 있도록 안내
	response.sendRedirect("TestSession01.jsp");
%>