package guest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GuestDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql ="";
	
	GuestVO vo = null;
	
	public GuestDAO() {
		String url = "jdbc:mysql://localhost:3306/re_Stu";
		String user = "root";
		String password = "1234";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("드라이버 검색 성공");
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("DB 접속 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패 " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("DB 접속 실패 " + e.getMessage());
		}
	}
	
	public void connClose() {
		if(conn != null) {
			try {
				conn.close();
			} catch (Exception e) {}
		}
	}
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {}
		}
	}
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmt.close();
			} catch (Exception e) {}
		}
	}


	
	// DB에 있는 방명록 전체자료 가져오기
	public List<GuestVO> getGuestList(int startIndexNo, int pageSize) {
		List<GuestVO> vos = new ArrayList<GuestVO>();
		try {
//			sql = "select * from guest order by idx desc";
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
			sql = "select * from guest order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new GuestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setContent(rs.getString("content"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setVisitDate(rs.getString("visitDate"));
				vo.setHostIp(rs.getString("hostIp"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}finally {
			rsClose();
		}
		return vos;
	}

	// 방명록 등록
	public int setGuestInputOk(GuestVO vo) {
		int res = 0;
		try {
			sql = "insert into guest values (default,?,?,?,?,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getHomePage());
			pstmt.setString(5, vo.getHostIp());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}finally {
			pstmtClose();
		}
		return res;
	}

	// 방명록 삭제
	public int GuestDeleteOk(int idx) {
		int res = 0;
		try {
			sql = "delete from guest where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}finally {
			pstmtClose();
		}
		return res;
	}
	
	// DB에 저장된 총 레코드 수를 확인
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from guest";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}finally {
			rsClose();
		}
		return totRecCnt;
	}

	
//방명록에 올린 글 횟수 가져오기
	public int getGuestCnt(String mid, String name, String nickName) {
		int guestCnt = 0;
		try {
			sql = "select count(idx) as guestCnt from guest where name=? or name=? or name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);					
			pstmt.setString(2, name);					
			pstmt.setString(3, nickName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				guestCnt = rs.getInt("guestCnt");
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return guestCnt;
	}
	
	
	
	
	
}
