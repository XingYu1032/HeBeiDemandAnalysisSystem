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
 
	<li class="layui-nav-item"><a href="xq_check.jsp">需求审核</a></li>
 	<li class="layui-nav-item"><a href="user_manager.jsp">用户管理</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
 
      
 
      
     用户管理
	    <%
    request.setCharacterEncoding("utf-8");
    Connection conn=DBUtil.getConn();
    String username=request.getParameter("Inamenum");
    String sql="select * from users where username = '"+username+"'";
    
    ResultSet rs=conn.prepareStatement(sql).executeQuery();
    rs.next();    
    String uname=rs.getString("username");
    String pwd=rs.getString("pwd");
    String jigou=rs.getString("jigou");
    String jigoucode=rs.getString("jigoucode");
    String add=rs.getString("address");
    String wangzhi=rs.getString("wangzhi");
    String email=rs.getString("wangzhi");
    String stand=rs.getString("stand");
    String postcode=rs.getString("postcode");
    String lianxiren=rs.getString("lianxiren");
    String phone=rs.getString("phone");
    String type=rs.getString("types");
    String bumen=rs.getString("bumen");
    String descs=rs.getString("descs");
    String guhua=rs.getString("guhua");
    String chuanzhen=rs.getString("chuanzhen");
    String role=rs.getString("role");
    System.out.print(role);
    %>
 
 	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>用户权限修改</legend>
</fieldset>
 
<form class="layui-form layui-form-pane" action="" lay-filter="example">
  <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;"></span>账号</label>
    <div class="layui-input-block">
      <input type="text" name="username" id="username" lay-verify="title"  value=<%=uname %> readonly="readonly"  autocomplete="off" lay-verify="required" lay-reqtext="请输入账号"  placeholder="请输入账号" class="layui-input">
    </div>
  </div>
  
      <input type="hidden" name="password" id="password" placeholder="请输入密码"  value=<%=pwd %>  lay-verify="required" lay-reqtext="请输入密码"  autocomplete="off" class="layui-input">
  
   
      <input type="hidden" name="passwords" id="passwords" lay-verify="required" value=<%=pwd %>  lay-reqtext="请确认两次密码是否一致"  placeholder="请重复输入密码" autocomplete="off" class="layui-input">
 
  
  
  <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;"></span>机构名称</label>
    <div class="layui-input-block">
      <input type="text" name="jigou" id="jigou" placeholder="请输入机构名称"  value=<%=jigou %>  readonly="readonly"   autocomplete="off" class="layui-input">
    </div>
  </div>
  
    <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;"></span>机构代码</label>
    <div class="layui-input-block">
      <input type="text" name="jigoucode" id="jigoucode" placeholder="请输入机构代码" value=<%=jigoucode %>  readonly="readonly"   autocomplete="off" class="layui-input">
    </div>
  </div>
  
    <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;"></span>通讯地址</label>
    <div class="layui-input-block">
      <input type="text" name="address"  id="address" placeholder="请输入所在地" value=<%=add%>   readonly="readonly"   autocomplete="off" class="layui-input">
    </div>
  </div>
  
    <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;"></span>单位网址</label>
    <div class="layui-input-block">
      <input type="text" name="wangzhi" id="wangzhi" placeholder="请输入企业官网" value=<%=wangzhi %>    readonly="readonly"   autocomplete="off" class="layui-input">
    </div>
  </div>
  
    <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;"></span>电子邮箱</label>
    <div class="layui-input-block">
      <input type="text" name="email"  id="email" placeholder="请输入邮箱"  value=<%=email %>  readonly="readonly" autocomplete="off" class="layui-input">
    </div>
  </div>
  
    <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;"></span>法人代表</label>
    <div class="layui-input-block">
      <input type="text" name="stand" id="stand" placeholder="请输入法人代表"  value=<%=stand %>  readonly="readonly"   autocomplete="off" class="layui-input">
    </div>
  </div>
  
    <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;"></span>邮政编码</label>
    <div class="layui-input-block">
      <input type="text" name="postcode" id="postcode" placeholder="请输入所属地区邮政编码" value=<%=postcode %> readonly="readonly"   autocomplete="off" class="layui-input">
    </div>
  </div>
  
    <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;"></span>联系人</label>
    <div class="layui-input-block">
      <input type="text" name="lianxiren" id="lianxiren"   value=<%=lianxiren %> readonly="readonly"   autocomplete="off" class="layui-input">
    </div>
  </div>
  
    <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;"></span>电话</label>
    <div class="layui-input-block">
      <input type="text" name="phone" id="phone"  value=<%=phone %>  readonly="readonly"    autocomplete="off" class="layui-input">
    </div>
  </div>
      <div class="layui-form-item">
    <label class="layui-form-label"> 固定电话</label>
    <div class="layui-input-block">
      <input type="text" name="guhua" id="guhua" readonly="readonly"  value=<%=guhua %>    autocomplete="off" class="layui-input">
    </div>
  </div>
      <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;"></span>传真</label>
    <div class="layui-input-block">
      <input type="text" name="chuanzhen" id="chuanzhen"   value=<%=chuanzhen %> readonly="readonly"    autocomplete="off" class="layui-input">
    </div>
  </div>
  
  
    <div class="layui-form-item">
    <label class="layui-form-label"><span style="color: red;">用户权限</span></label>
    <div class="layui-input-block">
      <select name="qx" id="qx" >
      <%if(role.equals("用户")){ %>
      
        <option value="用户">用户</option>
        <option value="形式审核员">形式审核员</option>
        <option value="管理员">管理员</option>
        <%}else if(role.equals("形式审核员")){ %>
         <option value="形式审核员">形式审核员</option>
         <option value="用户">用户</option>  
         <option value="管理员">管理员</option>
		<%}else{ %>
        <option value="管理员">管理员</option>
		 <option value="用户">用户</option>
        <option value="形式审核员">形式审核员</option>
		<%} %>
      </select>
    </div>
  </div>

      <input type="hidden" name="bumen" id="bumen"  value=<%=bumen %>  readonly="readonly"  autocomplete="off" class="layui-input">

<%--     <div class="layui-form-item layui-form-text">
    <label class="layui-form-label"> 描述</label>
    <div class="layui-input-block">
      <textarea placeholder="请输入内容" class="layui-textarea" name="desc" id="desc" ><%=descs %> </textarea>
    </div>
  </div> --%>
  	<br>
  	<br>
  	<br>
  <div class="layui-form-item">
    <div class="layui-input-block">
     <!--  <button type="button" class="layui-btn layui-btn-normal" id="LAY-component-form-setval">赋值</button>
      <button type="button" class="layui-btn layui-btn-normal" id="LAY-component-form-getval">取值</button> -->
      <button type="submit" class="layui-btn" lay-submit="sub" lay-filter="sub">确认修改</button>
             <!--  <p style="width: 85%">
            <a href="index.jsp" class="fl">已有账号？立即登录</a>
            <a href="#" class="fr">忘记密码？</a> -->
        </p>
    </div>
  </div>
  <br>
  <br>
  <br>
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


layui.use(['tree', 'util'], function(){
  var tree = layui.tree
  ,layer = layui.layer
  ,util = layui.util
  

 

 
  //开启复选框
  tree.render({
    elem: '#test7'
    ,data: data2
    ,showCheckbox: true
  });
 

});


layui.use(['form', 'layer','jquery'], function () {
    var form  = layui.form;
    var $  = layui.jquery;
    //添加表单监听事件
    
    	form.on('submit(demo1)', function(data){
		layer.alert(JSON.stringify(data.field), {
			   title: '最终的提交信息'
			})
			return false;
			  });
    
    
    
    
    form.on('submit(sub)',function () {
    	
    	quanxian=$('#qx').val();
    	username=<%=username%>
    	$.ajax({
            url:'update_qx',
            type:'post',
            data:{
            	quanxian:quanxian,
            	username:username               
                },
            dataType:'text',
            //判断注册状态
            success:function (data) {
                if (data==1){
                    //layer.msg('注册成功')
                    alert("用户权限修改成功！");
					window.location="user_manager.jsp";
                }else{
                	alert("用户权限修改失败！");
                }
            }
        })
        //防止页面跳转
        return false;
    });

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
