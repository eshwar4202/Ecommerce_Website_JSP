package ecommerce.dao;

import java.sql.*;

import ecommerce.model.User;
public class userdao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public userdao(Connection con) {
		this.con = con;
	}
	
	public User userlogin(String email, String password) {
		User user = null;
		try {
			query = "select * from users where email=? and password=?";
			 pst = this.con.prepareStatement(query);
	            pst.setString(1, email);
	            pst.setString(2, password);
	            rs = pst.executeQuery();
	            if(rs.next()){
	            	user = new User();
	            	user.setId(rs.getInt("id"));
	            	user.setName(rs.getString("name"));
	            	user.setEmail(rs.getString("email"));
	            	
	            }
		}catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		
		return user;
	}
	
	public User usersignup(String name,String email, String password) {
		User user = null;
		try {
			query = "select max(id) from users";
			 pst = this.con.prepareStatement(query);
			 ResultSet max = pst.executeQuery(query);
			 max.next();
			 int max1 = max.getInt(1);
			 
			query = "insert into users (id,name,email,password) values (?,?,?,?)";
			 pst = this.con.prepareStatement(query);
			 	pst.setInt(1, (max1+1));
			 	pst.setString(2, name);
	            pst.setString(3, email);
	            pst.setString(4, password);
	            pst.executeUpdate();
	            query = "select * from users where email=? and password=?";
	            pst = this.con.prepareStatement(query);
	            pst.setString(1, email);
	            pst.setString(2, password);
	            rs = pst.executeQuery(query);
	            if(rs.next()){
	            	user = new User();
	            	user.setId(rs.getInt("id"));
	            	user.setName(rs.getString("name"));
	            	user.setEmail(rs.getString("email"));
	            	
	            }
		}catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		
		return user;
	}
}
