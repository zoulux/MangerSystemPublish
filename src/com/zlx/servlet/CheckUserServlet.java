package com.zlx.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zlx.selectsql.SelectFromSql;

public class CheckUserServlet extends HttpServlet {
	/**
	 * 检查账户的合法性
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		SelectFromSql sfq = new SelectFromSql();
		if (sfq.checkAdmin(username, password)) {
			response.sendRedirect("mangerage.jsp");
		}else {
			response.sendRedirect("error.jsp");
		}

	}
}
