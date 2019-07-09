package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCExample {

	public static void main(String[] args) {

		Connection conn = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "root",
					"admin1111");
			System.out.println("mysql 데이터베이스에 접속했습니다.");

			Statement stmt = conn.createStatement();

//			1.EMP 테이블에 새로운 사원 정보를 입력하는 프로그램을 작성해보자.
			String sqlInsert = "insert into emp values (?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sqlInsert);

			pstmt.setInt(1, 0001);
			pstmt.setString(2, "summer");
			pstmt.setString(3, "CAT");
			pstmt.setInt(4, 0000);
			pstmt.setString(5, "2012-07-07");
			pstmt.setInt(6, 20000);
			pstmt.setInt(7, 10000);
			pstmt.setInt(8, 10);

			int resultCnt = pstmt.executeUpdate();
			if (resultCnt > 0) {
				System.out.println("정상적으로 입력되었습니다.");
				System.out.println("----------------------------");
			}

			String sql1 = "select * from emp order by empno";

			ResultSet rs = stmt.executeQuery(sql1);

//			2.EMP 테이블의 모든 데이터를 출력하는 프로그램을 작성해보자.	
			System.out.println("----------------------------");

			while (rs.next()) {
				System.out.println("사원번호 :" + rs.getInt(1));
				System.out.println("이름 :" + rs.getString(2));
				System.out.println("직업 :" + rs.getString(3));
				System.out.println("관리자 번호 :" + rs.getInt(4));
				System.out.println("입사일 :" + rs.getString(5));
				System.out.println("급여 :" + rs.getInt(6));
				System.out.println("커미션 :" + rs.getInt(7));
				System.out.println("부서번호 :" + rs.getInt(8));
				System.out.println("----------------------------");
			}
//			3.EMP 테이블에서 “SCOTT” 사원의 급여(sal) 정보를 1000으로 바꾸는 프로그램을 작성해보자.
			String sqlUpdate = "update emp set sal='1000' where ename='SCOTT'";
			stmt.executeUpdate(sqlUpdate);


//			4.EMP 테이블에서 “SCOTT” 이름으로 검색한 결과를 출력하는 프로그램을 작성해보자.	
			String sqlFind = "select * from emp where ename='SCOTT'";
			ResultSet rss = stmt.executeQuery(sqlFind);
			System.out.println("---------FIND SCOTT---------");
			System.out.println("----------------------------");

			while (rss.next()) {
				System.out.println("사원번호 :" + rss.getInt(1));
				System.out.println("이름 :" + rss.getString(2));
				System.out.println("직업 :" + rss.getString(3));
				System.out.println("관리자 번호 :" + rss.getInt(4));
				System.out.println("입사일 :" + rss.getString(5));
				System.out.println("급여 :" + rss.getInt(6));
				System.out.println("커미션 :" + rss.getInt(7));
				System.out.println("부서번호 :" + rss.getInt(8));
				System.out.println("----------------------------");
			}

//			5.모든 사원정보를 출력하되 부서정보를 함께 출력하는 프로그램을 작성해보자
			
			String sqlAll = "select * from emp e join dept d where e.deptno = d.deptno";

			ResultSet rsa = stmt.executeQuery(sqlAll);
			System.out.println("-------------P--------------");
			System.out.println("-------------R--------------");
			System.out.println("-------------I--------------");
			System.out.println("-------------N--------------");
			System.out.println("-------------T--------------");
			System.out.println("----------------------------");
			System.out.println("-------------A--------------");
			System.out.println("-------------L--------------");
			System.out.println("-------------L--------------");
			System.out.println("----------------------------");
			while (rsa.next()) {
				System.out.println("사원번호 :" + rsa.getInt(1));
				System.out.println("이름 :" + rsa.getString(2));
				System.out.println("직업 :" + rsa.getString(3));
				System.out.println("관리자 번호 :" + rsa.getInt(4));
				System.out.println("입사일 :" + rsa.getString(5));
				System.out.println("급여 :" + rsa.getInt(6));
				System.out.println("커미션 :" + rsa.getInt(7));
				System.out.println("부서번호 :" + rsa.getInt(8));
				System.out.println("부서이름 :" + rsa.getString(10));
				System.out.println("위치 :" + rsa.getString(11));
				System.out.println("----------------------------");
			}

			rs.close();
			rss.close();
			rsa.close();
			stmt.close();
			pstmt.close();
			conn.close();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
