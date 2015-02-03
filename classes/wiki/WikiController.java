package wiki;

import database.MySQLConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class WikiController {

	public WikiController(){
	}

	public Vector<Wiki> getWiki() {
		Connection con = MySQLConnector.getConnection();
		String query = "select id, hit, 'title', content "
				+ "from handongwiki";
		return ManagerSetting(con, query);
	}
	public Vector<Wiki> getWikiForsearch(String keyword){
		Connection con = MySQLConnector.getConnection();
		String query = "select id, hit, 'title', content "
				+ "from handongwiki "
				+ "where title like '" + keyword + "'";
		return ManagerSetting(con, query);
	}

	public boolean incrementHit(String title){
		Connection con = MySQLConnector.getConnection();
		String query = "UPDATE handongwiki SET hit = hit+1 WHERE title='" +title +"'";

		PreparedStatement ps = null;
		
		int result = 0;
		boolean bool = false;
		try{
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		} catch(SQLException e){
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

	public boolean setWiki(String title, String content){
		Connection con = MySQLConnector.getConnection();
		String query = "INSERT INTO handongwiki(title, content, hit) "
				+ "VALUES(?,?,?)";
		PreparedStatement ps = null;

		int result = 0;
		boolean bool = false;

		try{
			ps = con.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setInt(3, 0);
			result = ps.executeUpdate();
		} catch (SQLException e){
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

	public boolean editWiki(String title, String content){
		Connection con = MySQLConnector.getConnection();
		String query = "UPDATE handongwiki SET content=? WHERE title=?";
		PreparedStatement ps = null;

		int result = 0;
		boolean bool = false;

		try{
			ps = con.prepareStatement(query);
			ps.setString(1, content);
			ps.setString(2, title);
			result = ps.executeUpdate();

		} catch (SQLException e){
		System.out.print("Update failed");
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
	
	public Vector<String> getRank(){
		Connection con = MySQLConnector.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Vector<String> vector = new Vector<String>();
		String query = "SELECT title FROM handongwiki ORDER BY hit DESC LIMIT 5";
		try{
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()){
				vector.addElement(rs.getString(1));
			}
		}catch (SQLException e) {
			System.out.print("Rank failed");
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				System.out.print("Rank close Failed");
			}
		}
		return vector;
	}

	static Wiki InterSetting(ResultSet rs) {
		Wiki wiki = new Wiki();

		try {
			wiki.setId(rs.getInt(1));
			wiki.setHit(rs.getInt(2));
			wiki.setTitle(rs.getString(3));
			wiki.setContent(rs.getString(4));
		} catch (SQLException e) {
			System.out.print("SQLException OCCURED3");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return wiki;
	}

	static Vector<Wiki> ManagerSetting(Connection con, String query) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		Vector<Wiki> wikiVector = new Vector<Wiki>();
		try {
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				wikiVector.addElement(InterSetting(rs));
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
		return wikiVector;
	}
}