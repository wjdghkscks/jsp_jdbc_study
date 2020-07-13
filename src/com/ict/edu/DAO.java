package com.ict.edu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/* 

DAO : Data Access Object

- DB 의 data 에 접근하기 위한 객체
- CRUD 작업을 처리하는 메소드를 만들어서 제공

*/

public class DAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	/* 싱글톤 패턴
	- 프로그램이 끝날 때까지 하나의 객체를 사용
	- 필요한 객체를 또 만들지 않고, 한 번 만든 객체를 재사용
	*/
	
	private static DAO dao = new DAO();
	
	public static DAO getInstance() {
		return dao;
	}
	
	// 접속하기
	public Connection getConnection() {
		try {
			// Oracle 드라이버 로딩
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@203.236.220.76:1521:xe";
			String user = "c##sprite";
			String password = "7963";
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return conn;
	}
	
// 필요한 메소드 생성 - DB와 관련된 모든 일처리
	
// 1) 로그인 처리 메소드
	public VO getLogin(String m_id, String m_pw) {
		
		// 로그인에 성공하면 값이, 실패하면 null 값이 return
		VO vo = null;
		
		try {
			
			// 접속 - 모든 메소드에 생성
			conn = getConnection();
			
			String sql = "SELECT * FROM member01 WHERE m_id = ? AND m_pw = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_pw);
			
			rs = pstmt.executeQuery();
			
			// rs 가 null이 아닌 경우에만 로그인 성공
			if (rs.next()) {
				// 로그인 성공 시 객체를 생성
				vo = new VO();
				// 데이터를 vo에 저장
				vo.setIdx(rs.getString("idx"));
				vo.setM_id(rs.getString("m_id"));
				vo.setM_pw(rs.getString("m_pw"));
				vo.setM_name(rs.getString("m_name"));
				vo.setM_age(rs.getString("m_age"));
				vo.setM_reg(rs.getString("m_reg"));
			}
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		
		return vo;
	}
	
// 2) 회원가입 메소드 (CREATE)
	
	public int getInsert(String m_id, String m_pw, String m_name, String m_age) {
		int result = 0;
		try {
			conn = getConnection();
			String sql = "INSERT INTO member01 VALUES(members_seq.nextval, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_pw);
			pstmt.setString(3, m_name);
			pstmt.setString(4, m_age);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return result;
	}
	
// 3) 전체 리스트 조회 메소드 (SELECT)
	// INSERT, UPDATE, DELETE 는 항상 반환형이 int
	// SELECT 의 반환형은 매번 달라짐
	
	public ArrayList<VO> getList() {
		ArrayList<VO> list = new ArrayList<VO>();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM member01 ORDER BY idx";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				VO vo = new VO();
				vo.setIdx(rs.getString("idx"));
				vo.setM_id(rs.getString("m_id"));
				vo.setM_pw(rs.getString("m_pw"));
				vo.setM_name(rs.getString("m_name"));
				vo.setM_age(rs.getString("m_age"));
				vo.setM_reg(rs.getString("m_reg"));
				
				// 리스트에 추가
				list.add(vo);
			}
			System.out.println(list.size());
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		return list;
	}
	
// 4) 리스트 삭제 메소드 (DELETE)
	
	public int getDelete(String idx) {
		int result = 0;
		try {
			conn = getConnection();
			String sql = "DELETE FROM member01 WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, idx);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		return result;
	}
	
// 5) 정보 수정 메소드 (UPDATE)
	
	public int getUpdate(String m_name, String m_age, String idx) {
		int result = 0;
		try {
			conn = getConnection();
			String sql = "UPDATE member01 SET m_name = ?, m_age = ? WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m_name);
			pstmt.setString(2, m_age);
			pstmt.setString(3, idx);
				
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		return result;
	}
	
}
