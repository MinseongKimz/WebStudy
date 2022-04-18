package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.util.DBConn;


public class ScoreDAO
{
	// DBConn 연결
	private Connection conn;
	
	// 생성자
	public ScoreDAO()
	{
		conn = DBConn.getConnection();
	}
	
	// add() 정보 추가 메소드 정의
	// → 받아야하는거 : dto 객체, 반환 → 숫자
	public int add(ScoreDTO dto)
	{
		int result = 0;
		
		// 쿼리문 준비 
		String sql = "INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, ?, ?, ?, ?)";
		
		// 작업객체 준비 
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getKor());
			pstmt.setInt(3, dto.getEng());
			pstmt.setInt(4, dto.getMat());
	
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 전체 인원수 구하는 메서드
	public int count()
	{
		int result = 0;
		
		// 쿼리문 준비
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		
		// 작업 객체 준비
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			// ResultSet
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
				result = rs.getInt("COUNT");
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	}
	
	// 리스트 조회 → sid, name, 국영수, 총점, 평균
	// ArrayList<ScoreDTO> 
	public ArrayList<ScoreDTO> lists()
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
				   + ", (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG"
				   + " FROM TBL_SCORE"
				   + " ORDER BY SID";
		try
		{
			// 작업객체 준비
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			// ResultSet
			ResultSet rs = pstmt.executeQuery();
			
			// 반복문 구성
			while (rs.next())
			{
				ScoreDTO dto = new ScoreDTO();
				
				dto.setSid(rs.getString("SID"));
				dto.setName(rs.getString("NAME"));
				dto.setKor(rs.getInt("KOR"));
				dto.setEng(rs.getInt("ENG"));
				dto.setMat(rs.getInt("MAT"));
				dto.setTot(rs.getInt("TOT"));
				dto.setAvg(rs.getDouble("AVG"));
				
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	}
	
	
	
}

























































