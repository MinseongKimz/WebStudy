/*====================
	DBCPConn.java
======================*/
package com.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn
{
	private static Connection conn = null;

	public static Connection getConnection()
	{
		if (conn == null)
		{
			try
			{
				// ○ 이름과 객체를 바인딩
				// -- 컨텍스트(context)를 얻어내기 가장 쉬운 방법은
				// 『javax.nameing.InitialContext』클래스의
				// 인스턴스를 생성하는 것이다.
				// 『new initialContet();』
				Context ctx = new InitialContext();

				// ※ javax.naming.InitialContext의 메소드
				// - bind(Stinrg str, Object obj)
				// : 서비스할 객체를 특정이름으로 등록한다.
				// - rebind(Stinrg str, Object obj)
				// : 서비스할 객체를 특정이름으로  다시 등록한다.
				// - list(String str)
				// : 특정 이름으로 서비스하는 객체 정보르 반환한다.
				// - unbinding(String str)
				// : 등록된 객체를 메모리에서 해제한다.
				// - Object lookup(String str)
				// : 서비스 중인 객체 정보를 얻어온다.
				
				// 『web.xml』로 부터 환경설정을 얻어오겟다는 코딩
				//  다른형태로 쓸 수 없다. 무조건 똫같이
				Context evt= (Context)ctx.lookup("java:/comp/env");
				
				DataSource ds = (DataSource)evt.lookup("jdbc/myOracle");
				
				conn = ds.getConnection();

			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		return conn;
	}

	public static void close()
	{
		if (conn != null)
		{
			try
			{
				if(!conn.isClosed())
					conn.close();
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		conn = null;
	}

}
