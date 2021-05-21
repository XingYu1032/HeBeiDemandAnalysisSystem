<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@page import="com.Demand.DBUtil.DBUtil"%>
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
    
    <%
    request.setCharacterEncoding("utf-8");
    Connection conn=DBUtil.getConn();
    String sql="select * from users where username = '"+value+"'";
    
    ResultSet rs=conn.prepareStatement(sql).executeQuery();
    rs.next();
    
    String uname=rs.getString("username");
    String pwd=rs.getString("pwd");
    String jigou=rs.getString("jigou");
    String jigoucode=rs.getString("jigoucode");
    String add=rs.getString("address");
    String wangzhi=rs.getString("wangzhi");
    String email=rs.getString("email");
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
    %>
 
 	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>用户个人信息修改( <span style="color: red;">*</span>必填)</legend>
</fieldset>
 
<form class="layui-form layui-form-pane" action="" lay-filter="example">
  <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;">*</span>账号</label>
    <div class="layui-input-block">
      <input type="text" name="username" id="username" lay-verify="title"  value=<%=uname %> readonly="readonly"  autocomplete="off" lay-verify="required" lay-reqtext="请输入账号"  placeholder="请输入账号" class="layui-input">
    </div>
  </div>
  
      <input type="hidden" name="password" id="password" placeholder="请输入密码"  value=<%=pwd %>  lay-verify="required" lay-reqtext="请输入密码"  autocomplete="off" class="layui-input">
  
   
      <input type="hidden" name="passwords" id="passwords" lay-verify="required" value=<%=pwd %>  lay-reqtext="请确认两次密码是否一致"  placeholder="请重复输入密码" autocomplete="off" class="layui-input">
 
  
  
  <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;">*</span>机构名称</label>
    <div class="layui-input-block">
      <input type="text" name="jigou" id="jigou" placeholder="请输入机构名称"  value=<%=jigou %>  lay-verify="required" lay-reqtext="请输入机构名称"  autocomplete="off" class="layui-input">
    </div>
  </div>
  
    <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;">*</span>机构代码</label>
    <div class="layui-input-block">
      <input type="text" name="jigoucode" id="jigoucode" placeholder="请输入机构代码" value=<%=jigoucode %>  lay-verify="required" lay-reqtext="请输入机构代码"  autocomplete="off" class="layui-input">
    </div>
  </div>
  
    <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;">*</span>通讯地址</label>
    <div class="layui-input-block">
      <input type="text" name="address"  id="address" placeholder="请输入所在地" value=<%=add%>   lay-verify="required" lay-reqtext="请输入通讯地址"  autocomplete="off" class="layui-input">
    </div>
  </div>
  
    <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;">*</span>单位网址</label>
    <div class="layui-input-block">
      <input type="text" name="wangzhi" id="wangzhi" placeholder="请输入企业官网" value=<%=wangzhi %>    lay-verify="required" lay-reqtext="请输入单位网址"  autocomplete="off" class="layui-input">
    </div>
  </div>
  
    <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;">*</span>电子邮箱</label>
    <div class="layui-input-block">
      <input type="text" name="email"  id="email" placeholder="请输入邮箱"  value=<%=email %>  lay-verify="email" autocomplete="off" class="layui-input">
    </div>
  </div>
  
    <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;">*</span>法人代表</label>
    <div class="layui-input-block">
      <input type="text" name="stand" id="stand" placeholder="请输入法人代表"  value=<%=stand %>  lay-verify="required" lay-reqtext="请输入法人代表"  autocomplete="off" class="layui-input">
    </div>
  </div>
  
    <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;">*</span>邮政编码</label>
    <div class="layui-input-block">
      <input type="text" name="postcode" id="postcode" placeholder="请输入所属地区邮政编码" value=<%=postcode %>  lay-verify="required" lay-reqtext="请输入邮政编码"  autocomplete="off" class="layui-input">
    </div>
  </div>
  
    <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;">*</span>联系人</label>
    <div class="layui-input-block">
      <input type="text" name="lianxiren" id="lianxiren" placeholder="请务必使用真实姓名"  value=<%=lianxiren %> lay-verify="required" lay-reqtext="请输入联系人姓名"  autocomplete="off" class="layui-input">
    </div>
  </div>
  
    <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;">*</span>电话</label>
    <div class="layui-input-block">
      <input type="text" name="phone" id="phone" placeholder="请输入联系电话" value=<%=phone %>  lay-verify="required|phone"   autocomplete="off" class="layui-input">
    </div>
  </div>
      <div class="layui-form-item">
    <label class="layui-form-label"> 固定电话</label>
    <div class="layui-input-block">
      <input type="text" name="guhua" id="guhua" placeholder="请输入固定电话" value=<%=guhua %>    autocomplete="off" class="layui-input">
    </div>
  </div>
      <div class="layui-form-item">
    <label class="layui-form-label"> <span style="color: red;">*</span>传真</label>
    <div class="layui-input-block">
      <input type="text" name="chuanzhen" id="chuanzhen" placeholder="请输入传真"   value=<%=chuanzhen %>   autocomplete="off" class="layui-input">
    </div>
  </div>
  
  
  
    <div class="layui-form-item">
    <label class="layui-form-label">机构属性</label>
    <div class="layui-input-block">
    <% if(type.equals("企业")){ %>
      <input type="radio" name="types" id="types" value="企业" title="企业" checked="checked">  
      <input type="radio" name="types" id="types" value="高等院校" title="高等院校"> 
      <input type="radio" name="types" id="types" value="研究机构" title="研究机构">
      <input type="radio" name="types" id="types" value="其他" title="其他">
      
      <%
    }
      
    else if(type.equals("高等院校")){%>
      
      <input type="radio" name="types" id="types" value="企业" title="企业" >  
      <input type="radio" name="types" id="types" value="高等院校" title="高等院校" checked="checked"> 
      <input type="radio" name="types" id="types" value="研究机构" title="研究机构">
      <input type="radio" name="types" id="types" value="其他" title="其他">
      <% 
      
 
    }
      
      
    else if(type.equals("研究机构")){
      
      %>
      <input type="radio" name="types" id="types" value="企业" title="企业">  
      <input type="radio" name="types" id="types" value="高等院校" title="高等院校" > 
      <input type="radio" name="types" id="types" value="研究机构" title="研究机构" checked="checked">
      <input type="radio" name="types" id="types" value="其他" title="其他">
      
      <%
      
    } 
      
    else if(type.equals("其他")){%>
      <input type="radio" name="types" id="types" value="企业" title="企业">  
      <input type="radio" name="types" id="types" value="高等院校" title="高等院校"> 
      <input type="radio" name="types" id="types" value="研究机构" title="研究机构" >
      <input type="radio" name="types" id="types" value="其他" title="其他" checked="checked">
      
      <%
        
    }
    else{%>
    
       <input type="radio" name="types" id="types" value="企业" title="企业" >  
      <input type="radio" name="types" id="types" value="高等院校" title="高等院校"> 
      <input type="radio" name="types" id="types" value="研究机构" title="研究机构">
      <input type="radio" name="types" id="types" value="其他" title="其他" >
    
    <% 
 
    } %>
    </div>
  </div>
  

      <input type="hidden" name="bumen" id="bumen" placeholder="请输入企业所属的管理部门" value=<%=bumen %>  lay-verify="required" lay-reqtext="用户名是必填项，岂能为空？"  autocomplete="off" class="layui-input">

    <div class="layui-form-item layui-form-text">
    <label class="layui-form-label"> 描述</label>
    <div class="layui-input-block">
      <textarea placeholder="请输入内容" class="layui-textarea" name="desc" id="desc" ><%=descs %> </textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
     <!--  <button type="button" class="layui-btn layui-btn-normal" id="LAY-component-form-setval">赋值</button>
      <button type="button" class="layui-btn layui-btn-normal" id="LAY-component-form-getval">取值</button> -->
      <button type="submit" class="layui-btn" lay-submit="" lay-filter="sub">确认修改</button>
             <!--  <p style="width: 85%">
            <a href="index.jsp" class="fl">已有账号？立即登录</a>
            <a href="#" class="fr">忘记密码？</a> -->
        </p>
    </div>
  </div>
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
layui.use(['form', 'layedit', 'laydate'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate;
	  
	  //日期
	  laydate.render({
	    elem: '#date'
	  });
	  laydate.render({
	    elem: '#date1'
	  });
	  
	  //创建一个编辑器
	  var editIndex = layedit.build('LAY_demo_editor');
	 
	  //自定义验证规则
	  form.verify({
	    title: function(value){
	      if(value.length < 5){
	        return '标题至少得5个字符啊';
	      }
	    }
	    ,pass: [
	      /^[\S]{6,12}$/
	      ,'密码必须6到12位，且不能出现空格'
	    ]
	    ,content: function(value){
	      layedit.sync(editIndex);
	    }
	  });
	  
	  
	});




layui.use(['form', 'layer','jquery'], function () {
    var form  = layui.form;
    var $  = layui.jquery;
    //添加表单监听事件
    form.on('submit(sub)',function () {
    	uname=$('#username').val();
    	types=$("input[name='types']:checked").val();
    	$.ajax({
            url:'update_info',
            type:'post',
            data:{uname:$('#username').val(),
                pwd:$('#password').val(),
                pwds:$('#passwords').val(),
                jigou:$('#jigou').val(),
                jigoucode:$('#jigoucode').val(),
                address:$('#address').val(),
                wangzhi:$('#wangzhi').val(),
                email:$('#email').val(),
                stand:$('#stand').val(),
                postcode:$('#postcode').val(),
                lianxiren:$('#lianxiren').val(),
                phone:$('#phone').val(),
                types:types,
                bumen:$('#bumen').val(),
                desc:$('#desc').val(),
                guhua:$('#guhua').val(),
                chuanzhen:$('#chuanzhen').val()
                },
            dataType:'text',
            //判断注册状态
            success:function (data) {
                if (data==1){
                    //layer.msg('注册成功')
                    alert("修改成功！");
					window.location="mainpage.jsp";
                }else{
                    layer.msg('修改失败')
                }
            }
        })
        //防止页面跳转
        return false;
    });

}); 








layui.use('element', function(){
  var element = layui.element;
  
});







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
