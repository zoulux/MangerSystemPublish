package com.zlx.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zlx.selectsql.SelectFromSql;

public class DeleteUserServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String[] list = req.getParameter("txt").split(",");

		for (int i = 0; i < list.length; i++) {
			SelectFromSql sfs = new SelectFromSql();
			sfs.deleteStudent(list[i]);

		}
		resp.sendRedirect("mangerage.jsp");
		// System.out.println(req.getParameter("txt"));
		// System.out.println(">>>.");
	}
}
