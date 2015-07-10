package com.zlx.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zlx.selectsql.SelectFromSql;
import com.zlx.tools.MyTools;
import com.zlx.tools.UserBean;

public class SelectUserServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String data = request.getParameter("txt");
		SelectFromSql sfs = new SelectFromSql();
		ArrayList<UserBean> list = sfs.selectStudent(MyTools.toChinese(data));
		// System.out.println(list);
		// PrintWriter out = response.getWriter();
		int a=123;
		request.setAttribute("mLists", list);
		request.setAttribute("abc", a);
		
		 //System.out.println(list);
		request.getRequestDispatcher("./WEB-INF/search.jsp").forward(request,response);
		// out.println(list);
	}
}
