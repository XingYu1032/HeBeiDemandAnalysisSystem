<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@	page import="com.Demand.DBUtil.DBUtil" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>需求添加</title>
<script language="javascript">
	var mydate = new Date();
	mydate.toLocaleString(); //获取日期与时间
	var year = mydate.getFullYear();
	var month = mydate.getMonth(); //获取当前月份(0-11,0代表1月)
	var day = mydate.getDate();
	var hour = mydate.getHours(); // 0-23
	var minute = mydate.getMinutes();// 0-59
	var second = mydate.getSeconds();// 0-59
</script>

</head>
<body>


<%

java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
java.util.Date currentTime = new java.util.Date();//得到当前系统时间
String str_date = formatter.format(currentTime); //将日期时间格式化 

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


request.setCharacterEncoding("utf-8");


	Connection con=null;
	PreparedStatement pstmts=null;
	Statement state=null;
	ResultSet rs=null;
	con=DBUtil.getConn();
	System.out.println(name+" name");
	String str="select * from users where username ='"+name +"' and jigou ='"+jigou+"'";
	pstmts=con.prepareStatement(str);
	rs=pstmts.executeQuery();
	rs.next();
		String Iadd = rs.getString("address"); 
		String Ifrdb = rs.getString("stand"); 
		String Iemail = rs.getString("email"); 
		String Iyzbm = rs.getString("postcode");
		String Iweb = rs.getString("wangzhi"); 
		String Iclient = rs.getString("lianxiren");
		String Igh = rs.getString("guhua");
		String Iphone = rs.getString("phone"); 
		String Ifax = rs.getString("chuanzhen");
		
		String Ixqbelong = request.getParameter("Ixqbelong"); //归口管理部门
		String Iszdy = request.getParameter("Iszdy");  //所在地域
		String Ipeoprety =  request.getParameter("Ipeoprety"); //机构属性
		String Iintro =  request.getParameter("Iintro");  //机构简介
		String Ixqname =  request.getParameter("Ixqname"); //技术需求名称
		String Iyear1 =  request.getParameter("Iyear1");	//起始年限
		String Iyear2 =  request.getParameter("Iyear2");	//终止年限
		String Ixqrequest =  request.getParameter("Ixqrequest"); //重大技术问题
		String Ixqguanjian =  request.getParameter("Ixqguanjian"); //需求技术关键
		String Ixqmubiao =  request.getParameter("Ixqmubiao");  //技术需求概述预期目标
		String Igjz1 =  request.getParameter("Igjz1"); //关键字
		String Igjz2 =  request.getParameter("Igjz2");
		String Igjz3 =  request.getParameter("Igjz3");
		String Igjz4 =  request.getParameter("Igjz4");
		String Igjz5 =  request.getParameter("Igjz5");
		String Izjze =  request.getParameter("Izjze"); //拟投资总金额
		String Ihzms =  request.getParameter("Ihzms"); //技术需求解决方式
		String Icompany =  request.getParameter("Icompany"); //合作意向
		String Itype =  request.getParameter("Itype");  //科技活动类型
		String fir =  request.getParameter("fir"); //学科分类
		String sec =  request.getParameter("sec");
		String thi =  request.getParameter("thi");
		
		
		String sqlfir="select firstName from first where firstid="+"'"+fir+"'";
		System.out.println("sqlfir="+sqlfir);
		ResultSet rs1=con.prepareStatement(sqlfir).executeQuery();
		rs1.next();
		String firname=rs1.getString("firstName");
		System.out.println("firname="+firname);
		
		String sqlsec="select secondName from second where secondid="+"'"+sec+"'";
		System.out.println("sqlsec="+sqlsec);
		ResultSet rs2=con.prepareStatement(sqlsec).executeQuery();
		rs2.next();
		String secname=rs2.getString("secondName");
		System.out.println("secname="+secname);
		String thiname="";
		if(thi!=null){
		String sqlthi="select thirdName from third where thirdid="+"'"+thi+"'";
		System.out.println("sqlthi="+sqlthi);
		ResultSet rs3=con.prepareStatement(sqlthi).executeQuery();
		rs3.next();
		thiname=rs3.getString("thirdName");
		System.out.println("thiname="+thiname);
		}
		
		String[] check = request.getParameterValues("Ilingyu");
		String sumlingyu = ""; //把领域变成长字符串。
		if (check != null) {
			for (int i = 0; i < check.length; i++)
				sumlingyu = sumlingyu + check[i] + ",";
			System.out.println("需求技术所属领域：" + sumlingyu);
		}
		
		String Ixqyyhy = request.getParameter("Ixqyyhy");
		
		String btnname1 = request.getParameter("submit");

		
		//找出该设置Iname第几个需求的sql语句，比如前面有5个Iname的需求，现在该写Iname6了
/* 				int numadd = 1;
				String Inamenum = "";
				String str_ChaNameNum = "select Iname from xuqiu where Iname like '" + jigou + "%'";
				System.out.println("str_ChaNameNum=" + str_ChaNameNum);
				ResultSet rs4 = con.prepareStatement(str_ChaNameNum).executeQuery();
				while (rs4.next()) {
					numadd++;
				}
				Inamenum = jigou + String.valueOf(numadd);
				System.out.println("Inamenum=" + Inamenum); */
				String Inamenum=request.getParameter("Inamenum");
				String result = "";
				if (btnname1.equals("保存"))
					result = "已保存";
				else
					result = "已提交";
				System.out.println("result=" + result);
				
				String str_del = "delete from xuqiu where Inamenum=" + "'" + Inamenum + "'";
				int d=con.prepareStatement(str_del).executeUpdate();
				
				
				String Insert = "insert into xuqiu values('" + Inamenum + "','" + jigou + "','" + Ixqbelong + "','" + Iadd
						+ "','" + Iszdy + "','" + Iweb + "','" + Iemail + "','" + Ifrdb + "','" + Iyzbm + "','" + Iclient
						+ "','" + Igh + "','" + Iphone + "','" + Ifax + "','" + Ipeoprety + "','" + Iintro + "','" + Ixqname
						+ "','" + Iyear1 + "','" + Iyear2 + "','" + Ixqrequest + "','" + Ixqguanjian + "','" + Ixqmubiao
						+ "','" + Igjz1 + "','" + Igjz2 + "','" + Igjz3 + "','" + Igjz4 + "','" + Igjz5 + "','" + Izjze
						+ "','" + Ihzms + "','" + Icompany + "','" + Itype + "','" + firname + "','" + secname + "','" + thiname + "','"
						+ sumlingyu + "','" + Ixqyyhy + "','" + result + "','" + str_date + "')";
				System.out.println("Insert:"+Insert);
				int i = con.prepareStatement(Insert).executeUpdate();
				System.out.println(i);
				
				
				if (i == 1) {
					if (result.equals("已保存"))
						out.println("<script language='javaScript'>alert('保存成功，点击确定返回页面！');</script>");
					else if (result.equals("已提交"))
						out.println("<script language='javaScript'>alert('提交成功，点击确定返回页面！');</script>");
					response.setHeader("refresh", "1;url=main.jsp");
				} else {
					out.println("<script language='javaScript'>alert('操作失败，点击确定返回原页面！');</script>");
					response.setHeader("refresh", "1;url=main.jsp");
				}
				rs.close();
				con.close();











%>


</body>
</html>