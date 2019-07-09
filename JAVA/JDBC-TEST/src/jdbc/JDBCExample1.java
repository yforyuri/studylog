package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCExample1 {

	public static void main(String[] args) {
		
		Connection conn = null; 
		
		try {
//			1. load DB driver
			Class.forName("com.mysql.jdbc.Driver");
			
//			2. connect DB 
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "root", "admin1111");
			System.out.println("mysql 데이터베이스에 접속했습니다.");
			
//			3. make obj statement 
			Statement stmt = conn.createStatement();
			
//			insert syntax
			String sqlInsert = "insert into dept values (?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sqlInsert);
			pstmt.setInt(1, 80);
			pstmt.setString(2, "MARKETING");
			pstmt.setString(3, "JEJU");
			int resultCnt = pstmt.executeUpdate();
			if(resultCnt>0) {
				System.out.println("정상적으로 입력되었습니다.");
				System.out.println("----------------------------");
			}

//			4. run SQL : SELECT / INSERT / UPDATE / DELETE
			String sql1="select * from dept order by deptno";
			
			ResultSet rs = stmt.executeQuery(sql1);
			
//			5. print result
			System.out.println("----------------------------");
			while(rs.next()) {
				System.out.println("부서번호 :" + rs.getInt("deptno"));
				System.out.println("부서이름 :" + rs.getString(2));
				System.out.println("부서위치 :" + rs.getString(3));
				System.out.println("----------------------------");
			}

//			6. close used obj : ResultSet, Statement, PreparedStatement, Connection
			rs.close();
			stmt.close();
			pstmt.close();
			conn.close();
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
