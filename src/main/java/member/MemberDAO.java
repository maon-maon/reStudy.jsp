package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.GetConn;

public class MemberDAO {
	//싱글톤 사용
	private Connection conn = GetConn.getConn();
	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql ="";
	MemberVO vo = null;
	
	private void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {}
		}
	}
	private void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmt.close();
			} catch (Exception e) {}
		}
	}
	
	//Member테이블에서 아이디 검색하기
	//아이디 중복 확인
	//닉네임 중복 확인
	public MemberVO getMemberIdCheck(String mid) {
		vo = new MemberVO();
		
		try {
			sql = "select * from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setContent(rs.getString("content"));
				vo.setPhoto(rs.getString("photo"));
				vo.setLevel(rs.getInt("level"));
				vo.setUserInfo(rs.getString("userInfo"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				//vo.setSalt(rs.getString("salt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: " +e.getMessage());
		}	finally {
			rsClose();
		}		
		return vo;
	}
	
	//방문 포인트 10씩 증가시켜주기
	public void setPointPlus(String mid) {
		try {
			sql = "update member set point=point+10, visitCnt=visitCnt+1, todayCnt=todayCnt+1, lastDate=now() where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate(); 
		} catch (SQLException e) {
			System.out.println("SQL 오류: " +e.getMessage());
		}	finally {
			pstmtClose();
		}		
	}
	
	// 회원가입 처리
	public int setMemberJoinOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "insert into member values(default,?,?,?,?,?,?,?,?,?,?,?,?,default,default,default,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getBirthday());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(10, vo.getContent());
			pstmt.setString(11, vo.getPhoto());
			pstmt.setString(12, vo.getUserInfo());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류: " +e.getMessage());
		}	finally {
			pstmtClose();
		}		
		return res;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
