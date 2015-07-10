package com.zlx.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zlx.selectsql.SelectFromSql;
import com.zlx.tools.UserBean;

public class SelectServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		SelectFromSql sfs = new SelectFromSql();
		ArrayList<UserBean> list = sfs.selectAll();
	
		int abc=123;
		req.setAttribute("List", list);
		req.setAttribute("a",abc );
		req.getRequestDispatcher("./WEB-INF/mangerage.jsp").forward(req, resp);
	}
}
