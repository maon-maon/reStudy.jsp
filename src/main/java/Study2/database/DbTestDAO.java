package Study2.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DbTestDAO {
	private Connection conn = null;
	private PreparedStatement pstmp = null;
	private ResultSet rs = null;
	
	String sql = "";
	
	DbTestVO vo = null;
	
	public DbTestDAO() {
		String url = "jdbc:mysql://localhost:3306/re_Stu";
		String user = "re_stu";
		String password = "1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//System.out.println("드라이버 검색 성공");
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("Database 연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패" + e.getMessage());
			//e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("데이터베이스 연동 실패" + e.getMessage());
		}
	}
	
	public void connClose() {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {}
		}
	}
	
	public void pstmpClose() {
		if(pstmp != null) {
			try {
				pstmp.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmp.close();
			} catch (SQLException e) {}
		}
	}


	// 개별 자료 검색...1건
	public DbTestVO getTestSearch() {
		vo = new DbTestVO();
		
		try {
			sql = " select * from signup limit 1";
			pstmp = conn.prepareStatement(sql);
			rs = pstmp.executeQuery();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : "+ e.getMessage());
		}finally {
			rsClose();
		}
		return vo;
	}
	
	//전체 자료 출력 
	public ArrayList<DbTestVO> getDbTestList(String name) {
		ArrayList<DbTestVO> vos = new ArrayList<DbTestVO>();
		try {
			if(name.equals("")) {
				sql = "select * from signup order by idx ";
				//sql = "select * from signup order by idx desc";
				pstmp = conn.prepareStatement(sql);
			}
			else {
				sql = "select * from signup where name = ?";
				pstmp = conn.prepareStatement(sql);
				pstmp.setString(1, name);
			}
			rs = pstmp.executeQuery();
			
			while (rs.next()) {
				vo = new DbTestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setNation(rs.getString("nation"));
				vo.setAddress(rs.getString("address"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : "+ e.getMessage());
		}	finally {
			rsClose();
			pstmpClose();
		}
		return vos;
	}
	
	
	
	
	
	
}
