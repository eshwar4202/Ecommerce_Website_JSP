package ecommerce.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBcon {
	private static Connection connection = null;
	
	public static Connection getconnection() throws ClassNotFoundException, SQLException {
		if(connection == null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection= DriverManager.getConnection("jdbc:mysql://localhost/ecommerce_cart","root","");
			System.out.print("connected");
		}
		return connection;
	}
}
