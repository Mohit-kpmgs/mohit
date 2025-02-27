package packageB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCConnection {

	public static void main(String[] args) throws SQLException {
		Connection conn1 = null;
		Connection conn2 = null;
		Connection conn3 = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String dbURL = "jdbc:mysql://localhost:3306/sql_concepts?user=root&password=pass@word1";
			
			conn1 = DriverManager.getConnection(dbURL);
			
			if(conn1 !=null) {
				System.out.println("connected with connection1");
			}
			String dbURL2 = "jdbc:mysql://localhost:3306/sql_concepts";
			String username = "root";
			String password= "pass@word1";
			conn2 = DriverManager.getConnection(dbURL2,username,password);
			if(conn2 !=null) {
				System.out.println("connected with connection2");
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(conn1 !=null && !conn1.isClosed()) {
				conn1.close();
			}if(conn2 !=null && !conn2.isClosed()) {
				conn1.close ();
			}
		}
	}
}