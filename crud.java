import java.sql.*;
import java.util.Scanner;


public class crud {
	static String url = "jdbc:mysql://localhost:3306/";
	static String user ="root";
	static String password ="camu@123";
	static String dbName ="";
	static String table_name ="";
	

	public static void CreateDB() throws Exception{
		Connection con = DriverManager.getConnection(url,user,password);
		Statement st = con.createStatement();
		Scanner scan = new Scanner(System.in);
		System.out.println("Enter the Database Name : ");
	    dbName = scan.next();
		String query = "create database if not exists  "+ dbName;
		st.executeUpdate(query);
		System.out.println(dbName +" database created");
		con.close();
	}
	
	public static void createTable(Connection con  ) throws Exception  {
		Statement st = con.createStatement();
		
		String query = "use "+dbName;
		st.executeUpdate(query);
		String create = "create table if not exists "+table_name+ " (id int(10) primary key , name varchar(50) not null , salary decimal(10,2) not null)";
		st.executeUpdate(create);
		System.out.println("Table "+table_name+" created");
		
	}
	public static void viewTable(Connection con ) throws Exception {
		Statement st = con.createStatement();
		String query = "use "+dbName;
		st.executeUpdate(query);
		String query2 = "select * from "+ table_name;
		ResultSet set = st.executeQuery(query2);
		int count =0;
		while(set.next()) {
			System.out.println("Employee id is: "+set.getInt(1));
			System.out.println("Employee Name  is: "+set.getString(2));
			System.out.println("Employee salary is: "+set.getDouble(3));
			System.out.println(".......................................");
			count++;
		}
		System.out.println(count+" rows(s) returned");
		
		}
	public static void insertVal(Connection con) throws Exception {
		Scanner scan = new Scanner(System.in);
		System.out.println("Enter the value for first column (id) : ");
		int id = scan.nextInt();
		System.out.println("Enter the value for Second column (Name):");
		String name =scan.next();
		System.out.println("Enter the value for the third column (salary) :");
		int salary = scan.nextInt();
		String querry ="insert into "+table_name+" values (?,?,?)";
		PreparedStatement pst = con.prepareStatement(querry);
		pst.setInt(1, id);
		pst.setString(2, name);
		pst.setInt(3, salary);
		
		int n = pst.executeUpdate();
		System.out.println(n+" row(s) affected");
		scan.close();
	}
	public static void update(Connection con ) throws Exception {
		
	     Statement st = con.createStatement();
	     Scanner scan = new Scanner (System.in);
	     System.out.println("Enter the id where u want to change the name : ");
	     int id = scan.nextInt();
	     System.out.println("Enter the name that u want to update");
	     String name = scan.next();
	     String query = "update "+table_name+ " set name = '"+name +"' where id = "+id;
	     int n= st.executeUpdate(query);	
	     System.out.println(n+" row(s) affected");
	     scan.close();
	     }
	public static void delete(Connection con ) throws Exception {
		Scanner scan = new Scanner (System.in);
		System.out.println("Enter the id that you want to delete : ");
		int id = scan.nextInt();
		String query = " delete from "+table_name +" where id="+id;
		Statement st = con.createStatement();
		int n = st.executeUpdate(query);
		System.out.println(n+" row(s) affected");
		scan.close();
		
		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
       Scanner scan = new Scanner (System.in);
		
		try {
			Connection con = DriverManager.getConnection(url, user, password);
			while (true) {
			    System.out.println("Select the operation you want to perform:");
			    System.out.println("1. Create Database");
			    System.out.println("2. Create Table");
			    System.out.println("3. View Table");
			    System.out.println("4. Insert Value");
			    System.out.println("5. Update");
			    System.out.println("6. Delete");
			    System.out.println("7. Exit");
			    int opp = scan.nextInt();

			    switch (opp) {
			        case 1:
			            CreateDB();
			            break;
			        case 2:
			            createTable(con);
			            break;
			        case 3:
			            viewTable(con);
			            break;
			        case 4:
			            insertVal(con);
			            break;
			        case 5:
			            update(con);
			            break;
			        case 6:
			            delete(con);
			            break;
			        case 7:
			            System.out.println("Thank you!");
			            con.close();  
			            scan.close(); 
			            return;       
			        default:
			            System.out.println("Invalid option, please select a valid option.");
			    }
			}

		}
		catch(Exception e ) {
			e.printStackTrace();
		}

}
}
