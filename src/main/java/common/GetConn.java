package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConn {
	private static Connection conn = null;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/re_Stu";
	private String uesr = "root";
	private String password = "1234";
	
	private static GetConn instance = new GetConn();
	
	public GetConn() {
		try {
			Class.forName(driver);
			//System.out.println("드라이버 검색 성공");
			conn = DriverManager.getConnection(url, uesr, password);
			//System.out.println("DB연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패: " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("DB연결 실패: " +e.getMessage());
		}
	}

	public static Connection getConn() {
		return conn;
	}
	
}
