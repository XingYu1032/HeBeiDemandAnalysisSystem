package com.Demand.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Demand.Bean.User;
import com.Demand.Dao.Dao;

/**
 * Servlet implementation class update_info
 */
@WebServlet("/update_info")
public class update_info extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public update_info() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		String pwds = request.getParameter("pwds");
		String jigou = request.getParameter("jigou");
		String jigoucode = request.getParameter("jigoucode");
		String address = request.getParameter("address");
		String wangzhi = request.getParameter("wangzhi");
		String email = request.getParameter("email");
		String stand = request.getParameter("stand");
		String postcode = request.getParameter("postcode");
		String lianxiren = request.getParameter("lianxiren");
		String phone = request.getParameter("phone");
		String types = request.getParameter("types");
		String bumen = request.getParameter("bumen");
		String desc = request.getParameter("desc");
		String guhua = request.getParameter("guhua");
		String chuanzhen = request.getParameter("chuanzhen");
		
		
		/*
		 * System.out.println(guhua + chuanzhen); System.out.println(uname);
		 * System.out.println(pwd); System.out.println(pwds); System.out.println(jigou);
		 * System.out.println(jigoucode); System.out.println(address);
		 * System.out.println(wangzhi); System.out.println(email);
		 * System.out.println(stand); System.out.println(postcode);
		 * System.out.println(lianxiren); System.out.println(phone);
		 * System.out.println(types); System.out.println(bumen);
		 * System.out.println(desc);
		 */
		 

		User user = new User();
		user.setUsername(uname);
		user.setPwd(pwd);
		user.setPwds(pwds);
		user.setJigou(jigou);
		user.setJigoucode(jigoucode);
		user.setAddress(address);
		user.setWangzhi(wangzhi);
		user.setEmail(email);
		user.setStand(stand);
		user.setPostcode(postcode);
		user.setLianxiren(lianxiren);
		user.setPhone(phone);
		user.setTypes(types);
		user.setBumen(bumen);
		user.setDesc(desc);
		user.setGuhua(guhua);
		user.setChuanzhen(chuanzhen);
		
		  int a = Dao.update_info(user); 
		  if (a == 1) 
		  { 
			  response.getWriter().write("1"); 
			  }
		  else 
		  { 
			  response.getWriter().write("0"); 
		  }
		 

	}

}
