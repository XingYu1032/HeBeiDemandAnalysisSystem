<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
       <%@page import="com.Demand.DBUtil.DBUtil"%>
       <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>修改密码</title>
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
	if(cookies!=null){
		System.out.println("cookie的长度为:"+cookies.length);
		for(int i=0;i<cookies.length;i++)
		{
			if(cookies[i].getName().equals("username"))
			{
				value=cookies[i].getValue();
				System.out.println(value+" value");
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
    Connection con=DBUtil.getConn();
    String usernames=value;
    System.out.println(usernames);
    ResultSet rs1=null;
    String sql1="select * from users where username = '"+usernames+"'";
    
    rs1=con.prepareStatement(sql1).executeQuery();
    rs1.next();    
    String roles=rs1.getString("role");
    
    
    rs1.close();
    con.close();
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
        <% if(roles.equals("用户")){%>
        <li class="layui-nav-item"><a href="main.jsp">需求填表</a></li>
        <li class="layui-nav-item"><a href="Xq_manager.jsp">需求管理</a></li>
        <li class="layui-nav-item"><a href="update_pwd.jsp">修改密码</a></li>
        <li class="layui-nav-item"><a href="update_info.jsp">个人信息</a></li>
        
        
        <%}
      	
      	else if(roles.equals("系统管理员"))
      	{
      	%>
        
        
        <%}else{ %>
        
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
 
      			<form  method="post" action="/Hebei_DemandAnalysisMis/update_pwd" >
      
      				<table>
 						<tr>
 							<th>
     							<label> 请输入旧密码:</label> 
     						</th>
     						<th>
     							<input type="hidden" id="username" name="username" value="<%=value%>">
     							<input type="password" id="opwd" name="opwd">
     						</th>
    					</tr>
    					<tr>
    						<th>
     						<label> 请输入新密码:</label> 
     						</th>
     						<th>
     							<input type="password" id="npwd" name="npwd">
     						</th>
    					</tr>
    					<tr>
    						<th>
     							<label> 请确认新密码:</label> 
     						</th>
     						<th>
     							<input type="password" id="anpwd" name="anpwd">
     						</th>
    					</tr>
    					<tr>
    						<th>
    							<input type="reset" value="重置" >
     						</th>
     						<th>
     							<input type="submit" value="确认" >
     						</th>
     					</tr>
     
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
