<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
        <%@	page import="com.Demand.DBUtil.DBUtil" %>
    <%@	page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>河北省科技信息通用调查系统需求(审核)</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="apple-mobile-web-app-status-bar-style" content="black"> 
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="format-detection" content="telephone=no">
  
  <link rel="stylesheet" href="layui/css/layui.css?t=1598935358933"  media="all">
</head>



<script>
function onload()
{
	<%
	Cookie[] cookies=request.getCookies();
	String value="";
	String name="";
	if(cookies!=null){
		//System.out.println("cookie的长度为:"+cookies.length);
		for(int i=0;i<cookies.length;i++)
		{
			if(cookies[i].getName().equals("name"))
			{
				value=cookies[i].getValue();
				//System.out.println(value+" value");
			}
			if(cookies[i].getName().equals("username"))
			{
				name=cookies[i].getValue();
				System.out.println(name+" names");
			}
		}
	}
	%>

}
function exitlog(event)
{
	var msg = "您确定要注销吗？"; 
	if (confirm(msg)==true){ 
		event.href="index.jsp";
	}
	else{
		alert("操作取消！");
	}
}
</script>




<body class="layui-layout-body" onload="onload()">
     <%
    request.setCharacterEncoding("utf-8");
    Connection conn=DBUtil.getConn();
    String usernames=name;
    System.out.println(usernames);
    ResultSet rs1=null;
    String sql1="select * from users where username = '"+usernames+"'";
    
    rs1=conn.prepareStatement(sql1).executeQuery();
    rs1.next();    
    String roles=rs1.getString("role");
    
    
    rs1.close();
    System.out.print(roles);
    %>
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">河北省科技信息调查系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item" >
        <a href="javascript:;">
          <img src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" class="layui-nav-img">
        <%=value %>
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="" onclick="exitlog(this)">注销</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
 	<%if(roles.equals("系统管理员")){ %>
	<li class="layui-nav-item"><a href="xq_check.jsp">需求审核</a></li>
 	<li class="layui-nav-item"><a href="user_manager.jsp">用户管理</a></li>
 	
 	<%} else{%>
 	
 	      	<li class="layui-nav-item"><a href="user_manager.jsp">用户管理(形式审核)</a></li>
      	<li class="layui-nav-item"><a href="update_info.jsp">个人信息</a></li>
        <li class="layui-nav-item"><a href="update_pwd.jsp">修改密码</a></li>
 	
 	<%} %>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
 
      
 
      
     用户管理
	<form name="form1" id="form1" action="">
		<table border="1" width="1500" name="table1" id="table1">
			<tr>
				<td>用户编号</td>
				<td>用户名称</td>
				<td>所处机构</td>
				<td>所在角色</td>
				<!-- 				<td>原因</td> -->
				<td>操作</td>
			</tr>
			<%-- <jsp:useBean id="db" class="DBBean.Bean" scope="page" /> --%>
			<%
				request.setCharacterEncoding("utf-8");
				Connection con=null;
				con=DBUtil.getConn();
				
				String Id = "";
				String username = "";
				String jigou = "";
				String role = "";

				String sql = "select * from users where role !='系统管理员'&&role !='形式审核员'";
				ResultSet rs = con.prepareStatement(sql).executeQuery();
				while (rs.next()) {
					//System.out.println(rs.getString(1)); //可以输出Inamenum的所有值  比如Iname为图书馆  那么输出图书馆1  图书馆2  图书馆3
					Id = rs.getString(1);
					username = rs.getString(2);
					jigou = rs.getString(4);
					role=rs.getString("role");
					
					out.println("<tr><td>" + Id + "</td><td>" + username + "</td><td>" + jigou + 
							"</td><td>"+role+"</td>"+
							"<td><a href='quanxian.jsp?Inamenum=" + username
							+ "'>权限设置</a></td></tr>");
					
				}
				
				rs.close();
				con.close();
			%>
		</table>
	</form>
      
   
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    业务咨询电话：0311-85813216     技术服务电话：0311-87936070
  </div>
</div>
<script src="layui/layui.js?t=1598935358933" charset="utf-8"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?d214947968792b839fd669a4decaaffc";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
</body>
</html>
