package com.zlx.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zlx.selectsql.SelectFromSql;

public class UpdateAdminServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);

		String oldpwd = request.getParameter("oldpwd");
		String newpwd = request.getParameter("newpwd");
		String username = (String) session.getAttribute("username");
		System.out.println(">>>>>>>>>>username:" + username);

		SelectFromSql sfs = new SelectFromSql();
		int flag = sfs.updateAdmin(username, oldpwd, newpwd);

		if (flag == 0) {
			request.getRequestDispatcher("./WEB-INF/updateFaild2.jsp").forward(request, response);
			System.out.println("服务器异常，更新不成功");
		} else if (flag == 1) {
			request.getRequestDispatcher("./WEB-INF/updateFaild1.jsp").forward(request, response);
			System.out.println("旧密码填写不正确");
		} else if (flag == 2) {
			request.getRequestDispatcher("./WEB-INF/updateSuccess.jsp").forward(request, response);
			System.out.println("修改成功");
		}

/*		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if ("mytest".equals(cookie.getName())) {
				try {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().println(
							URLDecoder.decode(cookie.getValue()+":"+cookie.getMaxAge()+":"+cookie.getVersion(), "UTF-8"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}*/

	}

}
