package com.Demand.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Demand.Dao.Dao;

/**
 * Servlet implementation class xscheck
 */
@WebServlet("/xscheck")
public class xscheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xscheck() {
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
		request.setCharacterEncoding("utf-8");
		
		String user=request.getParameter("Inamenum");
		String shenhe=request.getParameter("shenhe");
		String jieguo=request.getParameter("jieguo");
		String reason=request.getParameter("reason");
		//String btn=request.getParameter("submit");
		//System.out.println("1"+user+shenhe+btn);\
		Dao.xh_check(user,shenhe,jieguo,reason);
		request.getRequestDispatcher("xq_check.jsp").forward(request, response);
	}

}
