package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCTest {

	public static void main(String[] args) {
		Connection conn = null;
		
		String driverClass = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://127.0.0.1:3306/jwebdb?serverTime=Asia/Seoul";
		String user = "jweb";
		String password = "pwjweb";
		
		try {
			Class.forName(driverClass); // 오라클 연결 드라이버
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("db 연결 성공: " + conn);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
