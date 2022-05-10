/*
 *  Test03.java
 * 
 * */

package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test03 extends HttpServlet
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
		   
		   // 데이터 수신
		   String id = request.getParameter("id");
		   
		   // id 가 hch 일경우...
		   // Model → DB 액션 처리 요청 → DAO (처리요청)
		   //								--------------
		   //								DTO, Connection 활용		
		   // → SELECT COUNT(*) AS COUNT FROM MEMBER WHERE ID = 'hch';
		   //                  수신 처리 있으면 1 없으면 0
		   
		   // DB 구성 별도로 안했으니 생략하고 컬랙션 자료구조로 대신 진행 하겠음
		   
		   ArrayList<String> db = new ArrayList<String>();
		   db.add("superman");
		   db.add("batman");
		   db.add("admin");
		   
		   int result = 0;
		   
		   for (String item : db)
		   {
			   if(item.equals(id))
			   {
				   result = 1;
			   }	
		   }
		   
		   // 최종 result 가 1 이라면 이미 존재하는 id → 사용불가
		   // 1로 바뀌지 않고 0 이 계속 남아 있으면.. → 사용 가능 id 
		   
		   // 이 최종 result 값을 돌려주기 위해 조각 데이터를 view 에 넘긴다.
		   
		   request.setAttribute("result", result);
		   
		   RequestDispatcher dispatcher = request.getRequestDispatcher("Test03Ok.jsp");
		   dispatcher.forward(request, response);
		   
	   }
	   	
}










