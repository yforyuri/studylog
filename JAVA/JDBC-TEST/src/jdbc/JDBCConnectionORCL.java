package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCConnectionORCL {

	public static void main(String[] args) {
		
//		1. 데이터 베이스에 드라이버를 로드한다.
//		2. 데이터 베이스 연결
		
		Connection conn=null;
//		JDBC_URL : oracle 
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
//		USER 
		String user = "SCOTT";
//		Password
		String pw = "TIGER";
		
	try{
//		1. 드라이버 로드 : oracle 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
//		2. 데이터베이스 연결 
		conn =DriverManager.getConnection(jdbcUrl, user, pw);
		
		System.out.println("데이터베이스 연결 성공");
		
//		데이터베이스 작업 
		
//		3.데이터베이스의 연결 종료 : 데이터베이스 작업 종료 후 
		
	}catch(ClassNotFoundException e) {
		e.printStackTrace();
	}catch(SQLException e) {
		e.printStackTrace();
	}

	}

}
