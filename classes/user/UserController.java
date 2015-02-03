package user;

import database.MySQLConnector;

import java.sql.*;
import java.util.Vector;

public class UserController {

	public UserController(){
	}
	
	public boolean setUserId(String stuId, String password){
		AES256CryptTool aes = new AES256CryptTool();
		String passworde = aes.Encryption(password, "67890123456789ab");
		Connection con = MySQLConnector.getConnection();
		String query = "INSERT INTO user(stuId, password) "
				+ "VALUES(?,?)";
		PreparedStatement ps = null;

		int result = 0;
		boolean bool = false;

		try{
			ps = con.prepareStatement(query);
			//ps.setString(1, id);
			ps.setString(1, stuId);
			ps.setString(2, passworde);
			
			result = ps.executeUpdate();
		} catch (SQLException e){
			System.out.print("Register Failed");
			return false;
		} finally {
			try{
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch(SQLException e){
			
			}
		}

		if(result != 0){
			bool = true;
		}

		return bool;
	}
	
	public User login(String stuID)
	{
		Connection con = MySQLConnector.getConnection();
		String query = "SELECT stuID, password from user WHERE stuID = '"+stuID+"'";
		User user = new User();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				user.setStuId(rs.getString(1));
				user.setPassword(rs.getString(2));
			}
		} catch (SQLException e){ 
			System.out.print("Login Failed");
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				System.out.print("Login close failed");
			}
		}
		return user;
		
	}
	
	
	public boolean isUser(String stuId){
		Connection con = MySQLConnector.getConnection();
		String query = "SELECT stuID from user WHERE stuId = '"+stuId+"'";
		PreparedStatement ps = null;
		ResultSet rs = null;
		String users;
		try{
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			if(rs==null)
				return false;
			else
				return true;
			
		}catch(Exception e){
			System.out.print("user check exception");
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				System.out.print("SQLException OCCURED");
			}
		}
	return true;
	}

	static User InterSetting(ResultSet rs) {
		User user = new User();

		try {
			user.setId(rs.getString(1));
			user.setStuId(rs.getString(2));
			user.setPassword(rs.getString(3));
		} catch (SQLException e) {
			System.out.print("SQLException OCCURED3");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}
	
	static User loginSetting(ResultSet rs) {
		User user = new User();

		try {
			user.setStuId(rs.getString(1));
			user.setPassword(rs.getString(2));
		} catch (SQLException e) {
			System.out.print("SQLException OCCURED3");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}

	static Vector<User> ManagerSetting(Connection con, String query) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		Vector<User> userVector = new Vector<User>();
		try {
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				userVector.addElement(InterSetting(rs));
			}
		} catch (SQLException e) {
			System.out.print("SQLException OCCURED2");
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				System.out.print("SQLException OCCURED");
			}
		}
		return userVector;
	}
}