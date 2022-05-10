package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test02 extends HttpServlet
{
	   private static final long serialVersionUID = 1L;

	   @Override
	   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	   {
	      doGetPost(request, response);
	   }

	   @Override
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	   {
	      doGetPost(request, response);
	   }
	   
	   protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	   {
		   // 서블릿 관련 코딩
		   
		   // 데이터 수신(AjaxTest02.jsp 페이지로 부터 넘오온 데이터)
		   int n1 = Integer.parseInt(request.getParameter("n1"));
		   int n2 = Integer.parseInt(request.getParameter("n2"));
		   
		   // 로직 연산
		   int result = n1 + n2;
		   
		   // 반환할 결과값 준비
		   request.setAttribute("result", result);
		   
		   RequestDispatcher dispatcher = request.getRequestDispatcher("Test02Ok.jsp");
		   dispatcher.forward(request, response);
				   
	   }


}
