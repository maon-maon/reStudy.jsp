package Study2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.GetConn;
import member.MemberVO;

public class StudyDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql = "";
	
	private void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	private void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {}
				finally {
					pstmtClose();
			}
		}
	}
	
	// member테이블의 아이디 검색후 성명 돌려보내기
	public String getIdSearch(String mid) {
		String name = "";
		try {
			sql = "select name from member where mid = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) name = rs.getString("name");
			
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage() );
		}finally {
			rsClose();
		}
		return name;
	}
	
//포인트가 최대인 회원 검색 // member테이블에서 최대 포인트 아이디 검색후 성명 돌려보내기
	public MemberVO getAjaxPointCheck() {
		MemberVO vo = new MemberVO();
		try {
			sql = "select max(point) as point, mid,name from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setPoint(rs.getInt("point"));
				vo.setMid(rs.getString("mid"));
				vo.setName(rs.getString("name"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage() );
		}finally {
			rsClose();
		}
		return vo;
	}
	
	
	
	
	
}
