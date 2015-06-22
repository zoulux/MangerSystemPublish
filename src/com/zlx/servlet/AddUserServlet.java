package com.zlx.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zlx.selectsql.SelectFromSql;
import com.zlx.tools.MyTools;
import com.zlx.tools.UserBean;

public class AddUserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
		String sno = request.getParameter("sno");
		String sname = request.getParameter("sname");
		sname = MyTools.toChinese(sname);
		String sports = request.getParameter("sports");
		String shufen = request.getParameter("shufen");
		String jiexi = request.getParameter("jiexi");
		String gaodai = request.getParameter("gaodai");
		String safe = request.getParameter("safe");
		String english = request.getParameter("english");
		String englishNet = request.getParameter("englishNet");
		String lishi = request.getParameter("lishi");
		String xingshi = request.getParameter("xingshi");
		UserBean user = new UserBean(sno, sname, sports, shufen, jiexi, gaodai,
				safe, english, englishNet, lishi, xingshi);
		SelectFromSql sfs = new SelectFromSql();
		sfs.addStudent(user);
		response.sendRedirect("mangerage.jsp");

		// System.out.println(sno);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
}
