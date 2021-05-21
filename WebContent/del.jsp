<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" pageEncoding="utf-8"%>
<%@	page import="com.Demand.DBUtil.DBUtil" %>
<html>
<head>
<title>删除需求</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		Connection con=null;
		con=DBUtil.getConn();
		String Inamenum = request.getParameter("Inamenum");
		String str_del = "delete from xuqiu where Inamenum=" + "'" + Inamenum + "'";
		int i = con.prepareStatement(str_del).executeUpdate();
		System.out.println("delete from xuqiu where Inamenum=" + Inamenum);
		if (i == 1) {
			out.println("<script language='javaScript'> alert('删除成功，点击确定后自动跳到需求管理页面！');</script>");
			response.setHeader("refresh", "1;url=NewFile2.jsp");
		} else {
			out.println("<script language='javaScript'> alert('删除失败，点击确定后自动跳到需求管理页面！');</script>");
			response.setHeader("refresh", "1;url=NewFile2.jsp");
		}
		con.close();
	%>
</body>
</html>
