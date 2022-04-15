/*========================================
 *	DBConn.java
 *	- 데이터베이스 연결 전용 객체(싱글턴)
 *  - 예외처리 : throws 
 *========================================*/

package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn
{
	private static Connection dbConn;
	
	// connection 타입의 매개변수 없는 메소드 생성
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		if(dbConn==null)
		{
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";			
			String user = "scott";
			String pwd = "tiger";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			dbConn = DriverManager.getConnection(url,user,pwd);
		}
		return dbConn;
	}
	
	// 매개변수 있는거
	public static Connection getConnection(String url, String user, String pwd) throws ClassNotFoundException, SQLException
	{
		if(dbConn==null)
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			dbConn = DriverManager.getConnection(url,user,pwd);
		}
		
		return dbConn;
	}
	
	//close
	public static void close() throws SQLException
	{
		if(dbConn!=null)
		{
			if(!dbConn.isClosed())
				dbConn.close();
		}
		dbConn = null;
	}
}
