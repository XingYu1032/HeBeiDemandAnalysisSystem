package com.Demand.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Demand.Dao.Dao;

/**
 * Servlet implementation class xqfenlei
 */
@WebServlet("/xqfenlei")
public class xqfenlei extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xqfenlei() {
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
		response.setCharacterEncoding("UTF-8");
		String Inamenum= request.getParameter("Inamenum");
		String bumen=request.getParameter("bumen");
		PrintWriter out = response.getWriter();
		int a= Dao.xq_fenlei(Inamenum,bumen);
		System.out.println(a);
		if(a==1) {
			out.write("<script>alert('分类成功!');</script>");
			request.getRequestDispatcher("xq_select.jsp").forward(request, response);
		}else {
			out.write("<script>alert('分类错误!');</script>");
			request.getRequestDispatcher("xq_s.jsp").forward(request, response);
		}
		
	}

}
