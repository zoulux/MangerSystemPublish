package com.zlx.selectsql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.zlx.datebase.DBUtil;
import com.zlx.tools.MyTools;
import com.zlx.tools.UserBean;

public class SelectFromSql {

	public boolean checkAdmin(String username, String password) {
		// TODO Auto-generated method stub
		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		boolean flag = false;

		try {
			con = DBUtil.getconn();
			stmt = con.createStatement();
			String sql = String
					.format("select * from admin where adminname='%s' and password='%s'",
							username, password);
			// String sql = "select * from admin where adminname='" + username
			// + "'and password='" + password + "' ";

			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			// System.out.println(sql);
			while (rs.next()) {
				flag = true;
				// System.out.println(rs.getString(1)+"   "+rs.getString(2));
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			flag = false;
		} finally {
			DBUtil.closeDB(con, stmt, rs);
		}
		return flag;
	}

	public boolean deleteStudent(String stu) {
		// TODO Auto-generated method stub
		Connection con = null;
		int rs = 0;
		Statement stmt = null;
		try {
			con = DBUtil.getconn();
			stmt = con.createStatement();
			String sql = String.format("delete from score where sno='%s'", stu);

			rs = stmt.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeDB(con, stmt, null);
		}
		if (rs == 1) {
			System.out.println("删除成功");
			return true;
		} else {
			return false;
		}

	}

	public boolean addStudent(UserBean stu) {
		Connection con = null;
		int rs = 0;
		Statement stmt = null;
		try {
			con = DBUtil.getconn();
			stmt = con.createStatement();
			String sql = String
					.format("insert into score values('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')",
							stu.getSno(), stu.getSname(), stu.getSports(),
							stu.getShufen(), stu.getJiexi(), stu.getGaodai(),
							stu.getSafe(), stu.getEnglish(),
							stu.getEnglishNet(), stu.getLishi(),
							stu.getXingshi());
			System.out.println(sql);
			rs = stmt.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeDB(con, stmt, null);
		}
		if (rs == 1) {
			System.out.println("添加成功");
			return true;
		} else {
			return false;
		}

	}

	public ArrayList<UserBean> selectAll() {
		ArrayList<UserBean> userBeans = new ArrayList<UserBean>();

		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		try {
			con = DBUtil.getconn();
			stmt = con.createStatement();
			String sql = "";
			sql = String.format("select * from score");
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				UserBean bean = new UserBean(rs.getString(1), rs.getString(2),
						rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8),
						rs.getString(9), rs.getString(10), rs.getString(11));
				userBeans.add(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeDB(con, stmt, rs);
		}
		// System.out.println(userBeans);
		return userBeans;

	}

	public ArrayList<UserBean> selectStudent(String data) {
		ArrayList<UserBean> userBeans = new ArrayList<UserBean>();

		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		// PreparedStatement ps = null;
		try {
			con = DBUtil.getconn();
			stmt = con.createStatement();
			String sql = "";
			if (MyTools.isDigit(data)) {
				sql = String.format(
						"select * from score where sno like '%%%s%%' ", data);
			} else {
				sql = String.format(
						"select * from score where sname like '%%%s%%' ", data);
			}

			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				UserBean bean = new UserBean(rs.getString(1), rs.getString(2),
						rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8),
						rs.getString(9), rs.getString(10), rs.getString(11));
				userBeans.add(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeDB(con, stmt, rs);
		}
		// System.out.println(userBeans);
		return userBeans;

	}

	public static boolean updateStudent(UserBean stu) {

		Connection con = null;
		int rs = 0;
		Statement stmt = null;
		try {
			con = DBUtil.getconn();
			stmt = con.createStatement();
			String sql = String
					.format("update score set sports='%s',shufen='%s',jiexi='%s',gaodai='%s',safe='%s',english='%s',englishNet='%s',lishi='%s',xingshi='%s' where sno='%s'",
							stu.getSports(), stu.getShufen(), stu.getJiexi(),
							stu.getGaodai(), stu.getSafe(), stu.getEnglish(),
							stu.getEnglishNet(), stu.getLishi(),
							stu.getXingshi(), stu.getSno());

			rs = stmt.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeDB(con, stmt, null);
		}
		if (rs == 1) {
			System.out.println("更新成功");
			return true;
		} else {
			return false;
		}

	}

	public static void main(String[] args) {
		System.out.println(new SelectFromSql().selectAll());

		UserBean userBean = new UserBean("188888889", "邹鲁", "70", "80", "80",
				"80", "80", "80", "80", "80", "80");
		new SelectFromSql().updateStudent(userBean);
	}
}
