import java.sql.*;
public class workJDBC {
	public static void display() throws Exception{
		 String url = "jdbc:mysql://localhost:3306/session";
		  String user = "root";
		  String password="camu@123";
         Connection con = DriverManager.getConnection(url,user,password);
         Statement st = con.createStatement();
         String query = "select * from manager";
         ResultSet set = st.executeQuery(query);
         while(set.next()) {
       	  System.out.println("Employee id is: "+set.getInt(1));
     		System.out.println("Employee Name  is: "+set.getString(2));
     		System.out.println("Employee salary is: "+set.getDouble(3));
     		System.out.println(".......................................");
         }
         con.close();
	}

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		display();
          
          
	}

}
