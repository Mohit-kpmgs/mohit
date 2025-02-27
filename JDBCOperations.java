package packageB;
import java.sql.*;

public class JDBCOperations {
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
		}
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		Connection conn=null;
		Statement smt = null;
		ResultSet rs = null;
		String dbURL="jdbc:mysql://localhost:3306/mysql?user=root&password=pass@word1";
	  try {
		  conn=DriverManager.getConnection(dbURL);
		  conn.setAutoCommit(false);
		  smt=conn.createStatement();
		  int i = 0;
		  //String dropSQL="drop table db";
		  //int i=smt.executeUpdate(dropSQL);
		  //if(i==0) {
			//  System.out.println("db table is dropped");
		  //}else {
			//  System.out.println("db table doesnt exist");
		  //}
		  
//		  String createQuery="create table emp_tab("+
//				  "ID int not null,"+
//						  "first_name varchar(200),"+
//				  "last_name varchar(200),"+
//						  " designation varchar(200));";
//				  i=smt.executeUpdate(createQuery);
				  if(i==0) {
					  System.out.println("table created successfully");
				  }else {
					  System.out.println("table not created");
				  }
				  String insertQuery="insert into emp_tab values(111,'A','B','CEO')";
				  i=smt.executeUpdate(insertQuery);
				  if(i!=0) {
					  System.out.println("row inserted");
				  }
				  else {
					  System.out.println("row not inserted");
				  }
				  
				  conn.commit();
				  String selectQUERY = "SELECT * from emp_tab";
				  rs = smt.executeQuery(selectQUERY);
				  while(rs.next()) {
					  System.out.println("ID : " + rs.getInt(1));
					  System.out.println("first name : " + rs.getString(2));
					  System.out.println("last name : " + rs.getString(3));
					  System.out.println("designstion :" + rs.getString(4));
				  }
				  }catch(SQLException e){
		  e.printStackTrace();
	  } finally {
		  try {
			if(conn != null && !conn.isClosed()) {
				  conn.close();
			  }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  }
	}
}

