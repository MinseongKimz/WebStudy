/*
  Test1.java
*/
package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test1 extends HttpServlet
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
	   // Test1 클래스 → Servlet 구성 ①
	  /* 
      String name = "홍길동";
      String age = "19";
      
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter pw = response.getWriter();
      
      pw.println("<html>");
      pw.println("<head>");
      pw.println("<title>" + "Test1.java" + "</title>");
      pw.println("</head>");
      pw.println("<body>");
      pw.println("<h1>name " + name + "</h1>");
      pw.println("<h1>age " + age + "</h1>");
      pw.println("</body>");
      pw.println("</html>");
    */
	   
	 
	   // Test1 클래스 → Servlet 구성 ②
	   // 『ServletConfig』
	   //  컨테이너가 서블릿을 초기화 할 때...
	   //  즉 init() 메소드를 호출할 때
	   //  서블릿 당 하나씩 ServletConfig을 생성하게 된다.
	   //  즉 배포하게 되면 ①은 html로 바뀌어 우리가 이름 나이를 바꿀 수 없지만
	   //  ②는 web.xml을 통해 name, age 를 수정이 가능하다.
	   ServletConfig config = getServletConfig();
		
	   // web.xml 에 엘리먼트로 『init-param』했던걸 얻어오기
	   String name = config.getInitParameter("name");	  
	   String age = config.getInitParameter("age");
	   
	   /*
	   response.setContentType("text/html;charset=UTF-8");
	   
	   PrintWriter pw = response.getWriter();
	       
       pw.println("<html>");
       pw.println("<head>");
       pw.println("<title>" + "Test1.java" + "</title>");
       pw.println("</head>");
       pw.println("<body>");
       pw.println("<h1>name : " + name + "</h1>");
       pw.println("<h1>age : " + age + "</h1>");
       pw.println("</body>");
       pw.println("</html>");
	   */
	   
	   //③ (② 주석 주의)
	   // 『ServletContext』 
	   // 『ServletConfig』는 서블릿에 대한 환경을 설정하는 과정에서
	   //  필요한 값들을 전달하는 형태로 주로 사용된다면
	   //  ServletContext 는 서블릿에서 사용되는 컨텍스트를 
	   //  구성하는 형태로 활용된다.
	   // 즉 ②는 하나의 서블릿에서 사용되는 거고
	   //  이건 여러 서블릿에서 다 사용 가능함.
	   ServletContext context = getServletContext();
	   
	   
	   // 『web.xml』에 『<context-param>』 사용 가능
	   String type = context.getInitParameter("type");
	   response.setContentType("text/html;charset=UTF-8");
	   
	   PrintWriter pw = response.getWriter();
       
       pw.println("<html>");
       pw.println("<head>");
       pw.println("<title>" + "Test1.java" + "</title>");
       pw.println("</head>");
       pw.println("<body>");
       pw.println("<h1>name : " + name + "</h1>");
       pw.println("<h1>age : " + age + "</h1>");
       
       pw.println("<h1>type : " + type + "</h1>");
       
       pw.println("</body>");
       pw.println("</html>");
   }
}