package com.Demand.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Demand.Bean.XuQiu;
import com.Demand.DBUtil.DBUtil;
import com.google.gson.Gson;

/**
 * Servlet implementation class xuqiu
 */
@WebServlet("/xuqiu")
public class xuqiu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xuqiu() {
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
		Cookie[] cookies=request.getCookies();
		String jigou="";
		String name="";
		if(cookies!=null){
			System.out.println("cookie的长度为:"+cookies.length);
		for(int i=0;i<cookies.length;i++)
			{
				if(cookies[i].getName().equals("name"))
				{
					jigou=cookies[i].getValue();
					System.out.println(jigou+" value");
				}
				if(cookies[i].getName().equals("username"))
				{
					name=cookies[i].getValue();
					System.out.println(name+" value");
				}
			}
		}
		
		Connection con=null;
		con=DBUtil.getConn();
		
	
	
	
		String Inamenum = "";
		String Iresult = "";
		String Ixqname = "";
		XuQiu xq=new XuQiu();
		String sql = "select Inamenum,Iresult,Ixqname from xuqiu where Iname=" + "'" + jigou + "'";
		ResultSet rs = null;
		try {
			rs = con.prepareStatement(sql).executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			while (rs.next()) {
				//System.out.println(rs.getString(1)); //可以输出Inamenum的所有值  比如Iname为图书馆  那么输出图书馆1  图书馆2  图书馆3
				Inamenum = rs.getString(1);
				Iresult = rs.getString(2);
				Ixqname = rs.getString(3);
				
				xq.setId(Inamenum);
				xq.setName(Ixqname);
				xq.setStatus(Iresult);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			rs.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Gson gson = new Gson();
		gson.toJson(xq);
		System.out.println(xq);
		
	}


}
