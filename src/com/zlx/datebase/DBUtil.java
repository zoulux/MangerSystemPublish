package com.zlx.datebase;

import java.sql.DriverManager;
import java.sql.ResultSet;

import com.mysql.jdbc.Connection;

public class DBUtil {

	private static String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf8";
	private static String user = "root";
	private static String userpwd = "root";

	public static Connection getconn() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection(url, user, userpwd);
			System.out.println("mysql is connection success!");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}

	public static boolean closeDB(java.sql.Connection con,
			java.sql.Statement stmt, ResultSet rs) {
		try {

			if (con != null) {
				con.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (rs != null) {
				rs.close();
			}
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

}
