package com.Demand.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Demand.Dao.Dao;

/**
 * Servlet implementation class update_pwd
 */
@WebServlet("/update_pwd")
public class update_pwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_pwd() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String opwd=request.getParameter("opwd");
		String npwd=request.getParameter("npwd");
		String anpwd=request.getParameter("anpwd");
		if(opwd!=null&&npwd!=null&&anpwd!=null) {
				if(!npwd.equals(anpwd)) {
						//System.out.println(opwd+"1");
						out.write("<script>alert('PassWord ERROR!');window.location.href='update_pwd.jsp';</script>");
				}else {
						System.out.println("ÕýÈ·Ö´ÐÐ");
						try {
							int a= Dao.update_pwd(username,opwd,npwd);
							
							if(a==1) {
								request.getRequestDispatcher("main.jsp").forward(request, response);
							}else {
								out.write("<script>alert('PassWord ERROR!');</script>");
								request.getRequestDispatcher("update_pwd.jsp").forward(request, response);
							}
							
							
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						}	
				}
		else {
				out.write("<script>alert('PassWord ERROR!');window.location.href='update_pwd.jsp';</script>");
			}

}
}
