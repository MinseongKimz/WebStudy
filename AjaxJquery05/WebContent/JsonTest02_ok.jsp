<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	String result = "";
	
	for (int i=1; i<=5; i++)
	{
		StringBuffer sb = new StringBuffer();
		
		if(i>1)
			sb.append(",");
		
		sb.append("{\"num\" :\""+ i +"\""); 				// [{"":""},{"":""},{"":""},{"":""},{"":""}]
		sb.append(", \"name\": \""+name+"\"");
		sb.append(",\"content\" :\"" +content+ "\"}");		// \" 는 따옴표 사이에서 " 로 쓰기 위해
		
		result += sb.toString();
	}
	
	result = "[" + result + "]";
	
	out.println(result);
%>