package addressbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

// addrbook 자료형을 이용하여 주소를 생성, 검색, 수정, 삭제를 담당하는 클래스
public class AddrBookDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 주소 추가
	public void addAddrBook(AddrBook addrBook) {
		// db 연결
		conn = JDBCUtil.getConnection();
		
		try {
			// sql 처리
			String sql = "INSERT INTO addrbook(bnum, username, tel, email, gender) "
					+ "VALUES (seq_bnum.NEXTVAL, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			//폼에 저장된 자료를 가져와서 DB에 저장
			pstmt.setString(1, addrBook.getUsername());
			pstmt.setString(2, addrBook.getTel());
			pstmt.setString(3, addrBook.getEmail());
			pstmt.setString(4, addrBook.getGender());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	// 주소 전체 목록
	public List<AddrBook> getListAll(){
		// db 연결
		conn = JDBCUtil.getConnection();
		List<AddrBook> addrList = new ArrayList<>();
		
		try {
			// sql 처리
			String sql = "SELECT * FROM addrbook ORDER BY bnum ASC";
			pstmt = conn.prepareStatement(sql);
			// db의 주소록을 꺼내옴
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AddrBook addrBook = new AddrBook();
				// db에 있는 주소를 가져와서 주소 객체에 저장(화면 목록)
				addrBook.setBnum(rs.getInt("bnum"));
				addrBook.setUsername(rs.getString("username"));
				addrBook.setTel(rs.getString("tel"));
				addrBook.setEmail(rs.getString("email"));
				addrBook.setGender(rs.getString("gender"));
				addrBook.setRegDate(rs.getTimestamp("regdate"));
				
				// 리스트
				addrList.add(addrBook);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return addrList;
		
	}
	// 주소 정보(1건) 보기
	public AddrBook getAddrBook(int num) {
		// db 연결
		conn = JDBCUtil.getConnection();
		AddrBook addrBook = new AddrBook();
		
		try {
			String sql = "SELECT * FROM addrbook WHERE bnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			// bnum에 일치하는 1개의 주소 가져옴
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// db에 있는 주소를 가져와서 주소 객체에 저장(화면 목록)
				addrBook.setBnum(rs.getInt("bnum"));
				addrBook.setUsername(rs.getString("username"));
				addrBook.setTel(rs.getString("tel"));
				addrBook.setEmail(rs.getString("email"));
				addrBook.setGender(rs.getString("gender"));
				addrBook.setRegDate(rs.getTimestamp("regdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return addrBook;
	}
	
	// 로그인 체크
	public boolean checkLogin(String email) {
		conn = JDBCUtil.getConnection();
		
		try {
			String sql = "SELECT email FROM addrbook "
					+ "WHERE email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return false;
	}
	
	// 주소 삭제
	public void deleteAddrBook(int bnum) {
		// db 연결
		conn = JDBCUtil.getConnection();
		try {
			// sql 처리
			String sql = "DELETE from addrbook WHERE bnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			// sql 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally { // 종료
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	// 주소 수정
	public void updateAddrBook(AddrBook addrBook) {
		// db 연결
		conn = JDBCUtil.getConnection();
		try {
			// sql 처리
			String sql = "UPDATE addrbook "
					+ "SET username = ?, tel=?, email=?, gender=? "
					+ "WHERE bnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, addrBook.getUsername());
			pstmt.setString(2, addrBook.getTel());
			pstmt.setString(3, addrBook.getEmail());
			pstmt.setString(4, addrBook.getGender());
			pstmt.setInt(5, addrBook.getBnum());
			// sql 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally { // 종료
			JDBCUtil.close(conn, pstmt);
		}
		
	}
	
	// 세션으로 사용할 이름 가져오기
	public String getNameByEmail(String email) {
		// db 연결
		conn = JDBCUtil.getConnection();
		String name = "";
		
		try {
			// sql 처리 및 실행
			String sql = "SELECT * FROM addrbook WHERE email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			// sql 검색 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// db 에서 이름을 꺼내옴
				name = rs.getString("username");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return name;
	}
	
}
