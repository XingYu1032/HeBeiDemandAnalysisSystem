<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@	page import="com.Demand.DBUtil.DBUtil" %>
    <%@	page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>河北省科技信息通用调查系统需求</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="apple-mobile-web-app-status-bar-style" content="black"> 
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="format-detection" content="telephone=no">
  
  <link rel="stylesheet" href="layui/css/layui.css?t=1598935358933"  media="all">
</head>



<script>
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


function onload()
{
	<%
	Cookie[] cookie=request.getCookies();
	String value="";
	if(cookie!=null){
		System.out.println("cookie的长度为:"+cookie.length);
		for(int i=0;i<cookie.length;i++)
		{
			if(cookie[i].getName().equals("name"))
			{
				value=cookie[i].getValue();
				System.out.println(value+" value");
			}
		}
	}
	%>

}
</script>




<body class="layui-layout-body" onload="onload()">
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
        <li class="layui-nav-item"><a href="main.jsp">需求填表</a></li>
        <li class="layui-nav-item"><a href="Xq_manager.jsp">需求管理</a></li>
        <li class="layui-nav-item"><a href="update_pwd.jsp">修改密码</a></li>
        <li class="layui-nav-item"><a href="update_info.jsp">个人信息</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
 
      
 	需求管理
	<form name="form1" id="form1" action="">
		<table border="1" width="1500" name="table1" id="table1">
			<tr>
				<td>需求编号</td>
				<td>需求名称</td>
				<td>需求状态</td>
				<!-- 				<td>原因</td> -->
				<td>操作</td>
			</tr>
			<%-- <jsp:useBean id="db" class="DBBean.Bean" scope="page" /> --%>
			<%
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

				String sql = "select Inamenum,Iresult,Ixqname from xuqiu where Iname=" + "'" + jigou + "'";
				ResultSet rs = con.prepareStatement(sql).executeQuery();
				while (rs.next()) {
					//System.out.println(rs.getString(1)); //可以输出Inamenum的所有值  比如Iname为图书馆  那么输出图书馆1  图书馆2  图书馆3
					Inamenum = rs.getString(1);
					Iresult = rs.getString(2);
					Ixqname = rs.getString(3);
					
 					
					
					out.println("<tr><td>" + Inamenum + "</td><td>" + Ixqname + "</td><td>" + Iresult + 
							"</td><td><a href='del.jsp?Inamenum=" + Inamenum
							+ "'>删除</a>&nbsp;<a href='saveedit.jsp?Inamenum=" + Inamenum + "'>修改</a></td></tr>");
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
