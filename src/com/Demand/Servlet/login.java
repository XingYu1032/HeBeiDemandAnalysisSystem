package com.Demand.Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Demand.Bean.User;
import com.Demand.Dao.Dao;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		int a=Dao.login_check(name,pwd);
		
		if(a==1) {
			
			Cookie cookie=new Cookie("username", name);
			cookie.setPath("/");
			//设置存活时间
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
			User users=Dao.getUserByUsername(name);
			String jigou=users.getJigou();
			Cookie cookie2=new Cookie("name",jigou);
			cookie2.setPath("/");
			cookie2.setMaxAge(60*60*24);
			response.addCookie(cookie2);
			response.getWriter().write("1");
			
		}else {
			response.getWriter().write("0");
		}

	}

}
