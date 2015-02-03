package database;

import java.sql.*;

public class MySQLConnector {
	static public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wiki", "root", "password");
		} catch (ClassNotFoundException e) {
			System.out.println("Do not find driver");
		} catch (SQLException ex) {
			System.out.println("Uncomplete Connection");
		}
		return con; 
	}
}
