<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
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
  <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
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
			if(cookies[i].getName().equals("name"))
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
        <li class="layui-nav-item"><a href="eiq.jsp">问卷调查</a></li>
        <li class="layui-nav-item"><a href="">个人信息</a></li>
        <li class="layui-nav-item"><a href="">信息查询</a></li>
        <li class="layui-nav-item"><a href="">修改密码</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
 <blockquote class="layui-elem-quote layui-text">
 测试版本 功能不齐全 如有bug 敬请谅解
</blockquote>
  
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>河北省重大技术需求征集表</legend>
</fieldset>
 

<form class="layui-form " action="" lay-filter="example">

  <div class="layui-form-item">
  	<div  class="layui-inline">
    <label class="layui-form-label"><span style="color: red;">*</span>机构全称</label>
    <div class="layui-input-inline">
      <input type="text" name="JGMC" id="JGMC" lay-verify="required" lay-reqtext="该选项不能为空" placeholder="" autocomplete="off" class="layui-input">
    </div>
    </div>

	<div  class="layui-inline">
        <label class="layui-form-label"><span style="color: red;">*</span>归口管理部门</label>
    <div class="layui-input-inline">
      <input type="text" name="JGMC1" id="JGMC1" lay-verify="required" lay-reqtext="该选项不能为空" placeholder="" autocomplete="off" class="layui-input">
    </div>
    </div>
  </div>
  
  
<!--     <div class="layui-form-item">
    <label class="layui-form-label"><span style="color: red;">*</span>所在地域</label>
    <div class="layui-input-block">
      <input type="text" name="TXDZ" id="TXDZ" lay-verify="required" lay-reqtext="通讯地址为必填项" placeholder="" autocomplete="off" class="layui-input">
    </div>
  </div> -->
  
<!--       <div class="layui-form-item">
    <label class="layui-form-label"><span style="color: red;">*</span>所在地域</label>
    <div class="layui-input-block">
    <input type="radio" name="JGSX" id="JGSX" value="" title="" checked="">
      <input type="radio" name="JGSX" id="JGSX" value="130100" title="石家庄市" >
      <input type="radio" name="JGSX" id="JGSX" value="130200" title="唐山市">
      <input type="radio" name="JGSX" id="JGSX" value="130300" title="秦皇岛市">
      <input type="radio" name="JGSX" id="JGSX" value="130400" title="邯郸市">
      <input type="radio" name="JGSX" id="JGSX" value="130500" title="邢台市" >
      <input type="radio" name="JGSX" id="JGSX" value="130600" title="保定市">
      <input type="radio" name="JGSX" id="JGSX" value="130700" title="张家口市">
      <input type="radio" name="JGSX" id="JGSX" value="130800" title="承德市">
      <input type="radio" name="JGSX" id="JGSX" value="130900" title="沧州市" >
      <input type="radio" name="JGSX" id="JGSX" value="131000" title="廊坊市">
      <input type="radio" name="JGSX" id="JGSX" value="131100" title="衡水市">
      <input type="radio" name="JGSX" id="JGSX" value="130682" title="定州市">
      <input type="radio" name="JGSX" id="JGSX" value="130181" title="辛集市" >
      <input type="radio" name="JGSX" id="JGSX" value="120000" title="其他（河北工大）">
    </div>
  </div> -->
  
          <div class="layui-form-item">
          
          
          	<div  class="layui-inline">
        <label class="layui-form-label"><span style="color: red;">*</span>通讯地址</label>
    <div class="layui-input-inline">
      <input type="text" name="JGMC1" id="JGMC1" lay-verify="required" lay-reqtext="该选项不能为空" placeholder="" autocomplete="off" class="layui-input">
    </div>
    </div>
          
         <div class="layui-inline"> 
    <label class="layui-form-label">*所在地域</label>
    <div class="layui-input-inline">
      <select name="Iszdy" id="所在地域" size="32">
        <option value="">所在地域分区</option>
        <option value="130100" >石家庄市</option>
        <option value="130200">唐山市</option>
        <option value="130300">秦皇岛市</option>
        <option value="130400">邯郸市</option>
        <option value="130500">邢台市</option>
        <option value="130600" >保定市</option>
        <option value="130700">张家口市</option>
        <option value="130800">承德市</option>
        <option value="130900">沧州市</option>
        <option value="131000">廊坊市</option>
        <option value="131100" >衡水市</option>
        <option value="130682">定州市</option>
        <option value="130181">辛集市</option>
        <option value="120000">其他（河北工大）</option>
       
      </select>
    </div> 
    </div> 
    </div>
  
    <div class="layui-form-item">
    <div class="layui-inline">
    <label class="layui-form-label"><span style="color: red;">*</span>网址</label>
    <div class="layui-input-inline">
      <input type="text" name="DWWZ" id="DWWZ" lay-verify="required" lay-reqtext="单位网址为必填项" placeholder="" autocomplete="off" class="layui-input">
    </div>
    </div>
    
        <div class="layui-inline">
      <label class="layui-form-label"><span style="color: red;">*</span>电子邮箱</label>
      <div class="layui-input-inline">
        <input type="text" name="DZYC" id="DZYX" lay-verify="email" autocomplete="off" class="layui-input">
      </div>
    </div>
    
  </div>  
   
  <div class="layui-form-item">
  <div class="layui-inline">
    <label class="layui-form-label"><span style="color: red;">*</span>法人代表</label>
    <div class="layui-input-inline">
      <input type="text" name="FRDB" id="FRDB" lay-verify="required" lay-reqtext="法人代表为必填项" placeholder="" autocomplete="off" class="layui-input">
    </div>
    </div>
    <div class="layui-inline">
        <label class="layui-form-label">邮政编码</label>
    <div class="layui-input-inline">
      <input type="text" name="YZBM" id="YZBM" lay-verify="required" lay-reqtext="邮政编码为必填项" placeholder="" autocomplete="off" class="layui-input">
    </div>
    </div>
    
  </div>  
  
  <div class="layui-form-item">
  	<div class="layui-inline">
    <label class="layui-form-label"><span style="color: red;">*</span>联系人</label>
    <div class="layui-input-inline">
      <input type="text" name="LXR" id="LXR" lay-verify="required" lay-reqtext="联系人为必填项" placeholder="" autocomplete="off" class="layui-input">
    </div>
    </div>
    
    <div class="layui-inline">
        <label class="layui-form-label">传真</label>
    <div class="layui-input-inline">
      <input type="text" name="CZ" id="CZ" lay-verify="title" autocomplete="off" placeholder="" class="layui-input">
    </div>
    </div>
    
    
 
  
    <div class="layui-form-item">
    <div class="layui-inline">
        <label class="layui-form-label"><span style="color: red;">*</span>固话</label>
    <div class="layui-input-inline">
      <input type="text" name="GDDH" id="GDDH" lay-verify="required" lay-reqtext="固定电话为必填项" placeholder="" autocomplete="off" class="layui-input">
    </div>
    </div>
    
    <div class="layui-inline">
      <label class="layui-form-label"><span style="color: red;">*</span>手机</label>
      <div class="layui-input-inline">
        <input type="tel" name="YDDH" id="YDDH" lay-verify="required|phone" autocomplete="off" class="layui-input">
      </div>
    </div>
     

    </div>
    

  
  
  
    <div class="layui-form-item">
    <label class="layui-form-label"><span style="color: red;">*</span>机构属性</label>
    <div class="layui-input-block">
      <input type="radio" name="JGSX" id="JGSX" value="企业" title="企业" checked="">
      <input type="radio" name="JGSX" id="JGSX" value="高等院校" title="高等院校">
      <input type="radio" name="JGSX" id="JGSX" value="研究机构" title="研究机构">
      <input type="radio" name="JGSX" id="JGSX" value="其他" title="其他">
    </div>
  </div>
    
   <div class="layui-form-item layui-form-text">
    <label class="layui-form-label"><span style="color: red;">*</span>机构简介</label>
    <div class="layui-input-block">
      <textarea name="JGJJ" id="JGJJ" placeholder="（单位基本情况，基础研究等，限500字）" class="layui-textarea" lay-verify="required" lay-reqtext="请填写机构简介"  ></textarea>
       <span id="num1">0/500</span>
    </div>
  </div>

  
  
    <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label"><span style="color: red;">*</span>技术需求</label>
      <div class="layui-input-inline">
        <input type="text" name="JSXQMC" id="JSXQMC" lay-verify="required" lay-reqtext="邮政编码为必填项" autocomplete="off" class="layui-input">
      </div>
    </div>
  
    <div class="layui-inline">
      <label class="layui-form-label"><span style="color: red;">*</span>需求年限</label>
      <div class="layui-input-inline" style="width: 100px;">
        <input type="text" name="QSXQNF" id="QSXQNF" placeholder="年" lay-verify="required" lay-reqtext="最小需求年限为必填项"  autocomplete="off" class="layui-input">
      </div>
      <div class="layui-form-mid">-</div>
      <div class="layui-input-inline" style="width: 100px;">
        <input type="text" name="JZXUNF" id="JZXQNF" placeholder="年" autocomplete="off" lay-verify="required" lay-reqtext="最大需求年限为必填项"  class="layui-input">
      </div>
    </div>
  </div>
  
   <div class="layui-form-item layui-form-text">
    <label class="layui-form-label"><span style="color: red;">*</span>需求概述</label>
    <div class="layui-input-block">
      <textarea  name="ZDKJXUGS" id="ZDKJXQGS" placeholder="（主要问题等，限500字）" class="layui-textarea" lay-verify="required" lay-reqtext="请填写机构简介"  ></textarea>
    </div>
      	<div class="layui-input-block">
      	<span id="num2">0/500</span>
      	</div>
    
     <div class="layui-input-block">
      <textarea  name="ZDKJXUGS2" id="ZDKJXQGS2" placeholder="（技术关键等，限500字）" class="layui-textarea" lay-verify="required" lay-reqtext="请填写技术关键"  ></textarea>
    </div>
     	<div class="layui-input-block">
      	<span id="num3">0/500</span>
      	</div>
     <div class="layui-input-block">
      <textarea  name="ZDKJXUGS3" id="ZDKJXQGS3" placeholder="（预期目标等，限500字）" class="layui-textarea" lay-verify="required" lay-reqtext="请填写机预期目标"  ></textarea>
    </div>
     	<div class="layui-input-block">
      	<span id="num4">0/500</span>
      	</div>
    
    
  </div>
  
  
   <div class="layui-form-item">
    <label class="layui-form-label"><span style="color: red;">*</span>关键字:</label>
    <div class="layui-input-inline">
      <input type="text" name="GJZ" id="GJZ" lay-verify="required" lay-reqtext="关键字为必填项" placeholder="请填写关键字 " autocomplete="off" class="layui-input">
    </div>
        <div class="layui-input-inline">
      <input type="text" name="GJZ2" id="GJZ2"  autocomplete="off" class="layui-input">
    </div>
        <div class="layui-input-inline">
      <input type="text" name="GJZ3" id="GJZ3" placeholder=" " autocomplete="off" class="layui-input">
    </div>
        <div class="layui-input-inline">
      <input type="text" name="GJZ4" id="GJZ4" placeholder="" autocomplete="off" class="layui-input">
    </div>
        <div class="layui-input-inline">
      <input type="text" name="GJZ5" id="GJZ5"  placeholder="" autocomplete="off" class="layui-input">
    </div>
  </div>
  
      <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">投资总额</label>
      <div class="layui-input-inline">
        <input type="text" name="JHTZ" id="JHTZ" lay-verify="required" lay-reqtext="单位网址为必填项" placeholder="万元 "  autocomplete="off" class="layui-input">
      </div>
    </div>
     </div>
  
    <div class="layui-form-item">
    <label class="layui-form-label">科技活动类型</label>
    <div class="layui-input-block">
      <select name="YJLX" id="YJLX" lay-filter="aihao">
        <option value="">科技活动类型</option>
        <option value="基础研究">基础研究</option>
        <option value="应用研究">应用研究</option>
        <option value="试验发展">试验发展</option>
        <option value="研究与试验发展成果应用">研究与试验发展成果应用</option>
        <option value="技术推广与科技服务">技术推广与科技服务</option>
      </select>
    </div>
  </div>
  
      <div class="layui-form-item">
  <!--   <label class="layui-form-label">学科分类</label> -->


<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>学科分类</legend>
</fieldset>
<div id="test12" class="demo-tree-more"></div>
  </div>
  
  
  
    <div class="layui-form-item">
    <label class="layui-form-label">需求技术所属领域</label>
    <div class="layui-input-block">
      <input type="checkbox" name="like[write]" value="电子信息技术" title="电子信息技术" checked="">
      <input type="checkbox" name="like[read]" title="光机一体化" >
      <input type="checkbox" name="like[game]" title="软件">
      <input type="checkbox" name="like[write]" title="生物制药技术">
      <input type="checkbox" name="like[read]" title="新材料及应用技术" >
      <input type="checkbox" name="like[game]" title="先进制造技术">
      <input type="checkbox" name="like[write]" title="现代农业技术">
      <input type="checkbox" name="like[read]" title="新能源与高效节能技术" >
      <input type="checkbox" name="like[game]" title="资源与环境保护新技术">      
      <input type="checkbox" name="like[write]" title="其他技术">
    </div>
  </div>
  
<!--         <div class="layui-form-item">
    <label class="layui-form-label">需求技术行业</label>
    <div class="layui-input-block">
      <select name="XQJSYYHY" id="XQJSYYHY" lay-filter="aihao">
        <option value="">参见国民经济行业分类，非基础研究填写</option>
        <option value="基础研究">基础研究</option>
        <option value="应用研究">应用研究</option>
        <option value="试验发展">试验发展</option>
        <option value="研究与试验发展成果应用">研究与试验发展成果应用</option>
        <option value="技术推广与科技服务">技术推广与科技服务</option>
      </select>
    </div>  
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  	<legend>需求技术行业</legend>
	</fieldset>
	<div id="test55" class="demo-tree-more"></div>
  </div>
    
  </div> -->
  
  
      <div class="layui-form-item">
    <label class="layui-form-label">需求技术合作模式</label>
    <div class="layui-input-block">
      <input type="checkbox" name="like[write]" value="独立研发" title="独立开发" checked="">
      <input type="checkbox" name="like[read]" title="委托研发" >
      <input type="checkbox" name="like[game]" title="合作研发 ">
      <input type="checkbox" name="like[read]" title="其他" >
    </div>
  </div>
  
  <div>
  
  <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  	<legend>需求技术行业</legend>
	</fieldset>
	<div id="test55" class="demo-tree-more"></div>
  </div>
  

<!--     <div class="layui-inline">
      <label class="layui-form-label">企业自筹</label>
      <div class="layui-input-inline">
        <input type="text" name="QYZC" id="QYZC" lay-verify="required" lay-reqtext="单位网址为必填项" placeholder="万元 "  autocomplete="off" class="layui-input">
      </div>
    </div>
        <div class="layui-inline">
      <label class="layui-form-label">银行贷款</label>
      <div class="layui-input-inline">
        <input type="text" name="YHDK" id="YHDK" lay-verify="required" lay-reqtext="单位网址为必填项" placeholder="万元 " autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">其它融资</label>
      <div class="layui-input-inline">
        <input type="text" name="QTRZ" id="QTRZ" lay-verify="required" lay-reqtext="单位网址为必填项" placeholder="万元"  autocomplete="off" class="layui-input">
      </div>
    </div> -->

 
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button type="submit" class="layui-btn" lay-submit="" lay-filter="sub">保存并退出</button>
    </div>
  </div>
</form>
      
 
      
      
      
   
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © layui.com - 底部固定区域
  </div>
</div>
<script src="layui/layui.js?t=1598935358933" charset="utf-8"></script>
<script>
//JavaScript代码区域

        window.onload = function(){
            $("#JGJJ").on('input propertychange',function(e){
                $("#num1").html(e.target.value.length+"/500");
            });
            
            $("#ZDKJXUGS").on('input propertychange',function(e){
                $("#num2").html(e.target.value.length+"/500");
            });
            
            $("#ZDKJXUGS1").on('input propertychange',function(e){
                $("#num3").html(e.target.value.length+"/500");
            });
            
            $("#ZDKJXUGS2").on('input propertychange',function(e){
                $("#num4").html(e.target.value.length+"/500");
            });
        }








layui.use(['tree', 'util'], function(){
  var tree = layui.tree
  ,layer = layui.layer
  ,util = layui.util
  
  //模拟数据
  ,data = [{
    title: '08工学'
    ,id: 1
    ,field: 'name1'
    ,checked: true
    ,spread: false
    ,children: [{
      title: '0801力学'
      ,id: 3
      ,field: 'name11'
      ,href: ''
      ,
    },{
      title: '0802机械工程学'
      ,id: 4
      ,spread: true
      ,
    },{
      title: '二级1-3'
      ,id: 20
      ,field: ''
      ,
    }]
  },{
    title: '09农学'
    ,id: 2
    ,field: ''
    ,spread: false
    ,children: [{
      title: '二级2-1'
      ,id: 5
      ,field: ''
      ,spread: true
      ,children: [{
        title: '三级2-1-1'
        ,id: 11
        ,field: ''
      },{
        title: '三级2-1-2'
        ,id: 12
        ,field: ''
      }]
    },{
      title: '二级2-2'
      ,id: 6
      ,field: ''
      ,children: [{
        title: '三级2-2-1'
        ,id: 13
        ,field: ''
      },{
        title: '三级2-2-2'
        ,id: 14
        ,field: ''
        ,disabled: true
      }]
    }]
  },{
    title: '10医学'
    ,id: 16
    ,field: ''
    ,children: [{
      title: '二级3-1'
      ,id: 17
      ,field: ''
      ,fixed: true
      ,children: [{
        title: '三级3-1-1'
        ,id: 18
        ,field: ''
      },{
        title: '三级3-1-2'
        ,id: 19
        ,field: ''
      }]
    },{
      title: '二级3-2'
      ,id: 27
      ,field: ''
      ,children: [{
        title: '三级3-2-1'
        ,id: 28
        ,field: ''
      },{
        title: '三级3-2-2'
        ,id: 29
        ,field: ''
      }]
    }]
  }]
  
  
  ,data55 = [{
	    title: '08工学'
	    ,id: 1
	    ,field: 'name1'
	    ,checked: true
	    ,spread: false
	    ,children: [{
	      title: '0801力学'
	      ,id: 3
	      ,field: 'name11'
	      ,href: ''
	      ,
	    },{
	      title: '0802机械工程学'
	      ,id: 4
	      ,spread: true
	      ,
	    },{
	      title: '二级1-3'
	      ,id: 20
	      ,field: ''
	      ,
	    }]
	  },{
	    title: '09农学'
	    ,id: 2
	    ,field: ''
	    ,spread: false
	    ,children: [{
	      title: '二级2-1'
	      ,id: 5
	      ,field: ''
	      ,spread: true
	      ,children: [{
	        title: '三级2-1-1'
	        ,id: 11
	        ,field: ''
	      },{
	        title: '三级2-1-2'
	        ,id: 12
	        ,field: ''
	      }]
	    },{
	      title: '二级2-2'
	      ,id: 6
	      ,field: ''
	      ,children: [{
	        title: '三级2-2-1'
	        ,id: 13
	        ,field: ''
	      },{
	        title: '三级2-2-2'
	        ,id: 14
	        ,field: ''
	        ,disabled: true
	      }]
	    }]
	  },{
	    title: '10医学'
	    ,id: 16
	    ,field: ''
	    ,children: [{
	      title: '二级3-1'
	      ,id: 17
	      ,field: ''
	      ,fixed: true
	      ,children: [{
	        title: '三级3-1-1'
	        ,id: 18
	        ,field: ''
	      },{
	        title: '三级3-1-2'
	        ,id: 19
	        ,field: ''
	      }]
	    },{
	      title: '二级3-2'
	      ,id: 27
	      ,field: ''
	      ,children: [{
	        title: '三级3-2-1'
	        ,id: 28
	        ,field: ''
	      },{
	        title: '三级3-2-2'
	        ,id: 29
	        ,field: ''
	      }]
	    }]
	  }]
  
  
  
  //模拟数据1
  ,data1 = [{
    title: '江西'
    ,id: 1
    ,children: [{
      title: '南昌'
      ,id: 1000
      ,children: [{
        title: '青山湖区'
        ,id: 10001
      },{
        title: '高新区'
        ,id: 10002
      }]
    },{
      title: '九江'
      ,id: 1001
    },{
      title: '赣州'
      ,id: 1002
    }]
  },{
    title: '广西'
    ,id: 2
    ,children: [{
      title: '南宁'
      ,id: 2000
    },{
      title: '桂林'
      ,id: 2001
    }]
  },{
    title: '陕西'
    ,id: 3
    ,children: [{
      title: '西安'
      ,id: 3000
    },{
      title: '延安'
      ,id: 3001
    }]
  }]
  
  //模拟数据2
  ,data2 = [{
    title: '早餐'
    ,id: 1
    ,children: [{
      title: '油条'
      ,id: 5
    },{
      title: '包子'
      ,id: 6
    },{
      title: '豆浆'
      ,id: 7
    }]
  },{
    title: '午餐'
    ,id: 2
    ,checked: true
    ,children: [{
      title: '藜蒿炒腊肉'
      ,id: 8
    },{
      title: '西湖醋鱼'
      ,id: 9
    },{
      title: '小白菜'
      ,id: 10
    },{
      title: '海带排骨汤'
      ,id: 11
    }]
  },{
    title: '晚餐'
    ,id: 3
    ,children: [{
      title: '红烧肉'
      ,id: 12
      ,fixed: true
    },{
      title: '番茄炒蛋'
      ,id: 13
    }]
  },{
    title: '夜宵'
    ,id: 4
    ,children: [{
      title: '小龙虾'
      ,id: 14
      ,checked: true
    },{
      title: '香辣蟹'
      ,id: 15
      ,disabled: true
    },{
      title: '烤鱿鱼'
      ,id: 16
    }]
  }];
 
  //基本演示
  tree.render({
    elem: '#test12'
    ,data: data
    ,showCheckbox: true  //是否显示复选框
    ,id: 'demoId1'
    ,isJump: true //是否允许点击节点时弹出新窗口跳转
    ,click: function(obj){
      var data = obj.data;  //获取当前点击的节点数据
      layer.msg('状态：'+ obj.state + '<br>节点数据：' + JSON.stringify(data));
    }
  });
  
  tree.render({
	    elem: '#test55'
	    ,data: data55
	    ,showCheckbox: true  //是否显示复选框
	    ,id: 'demoId1'
	    ,isJump: true //是否允许点击节点时弹出新窗口跳转
	    ,click: function(obj){
	      var data = obj.data;  //获取当前点击的节点数据
	      layer.msg('状态：'+ obj.state + '<br>节点数据：' + JSON.stringify(data));
	    }
	  });
  
  //按钮事件
  util.event('lay-demo', {
    getChecked: function(othis){
      var checkedData = tree.getChecked('demoId1'); //获取选中节点的数据
      
      layer.alert(JSON.stringify(checkedData), {shade:0});
      console.log(checkedData);
    }
    ,setChecked: function(){
      tree.setChecked('demoId1', [12, 16]); //勾选指定节点
    }
    ,reload: function(){
      //重载实例
      tree.reload('demoId1', {
        
      });
      
    }
  });
 
  //常规用法
  tree.render({
    elem: '#test1' //默认是点击节点可进行收缩
    ,data: data1
  });
  
  //无连接线风格
  tree.render({
    elem: '#test13'
    ,data: data1
    ,showLine: false  //是否开启连接线
  });
 
  //仅节点左侧图标控制收缩
  tree.render({
    elem: '#test2'
    ,data: data1
    ,onlyIconControl: true  //是否仅允许节点左侧图标控制展开收缩
    ,click: function(obj){
      layer.msg(JSON.stringify(obj.data));
    }
  });
  //手风琴模式
  tree.render({
    elem: '#test4'
    ,data: [{
      title: '优秀'
      ,children: [{
        title: '80 ~ 90'
      },{
        title: '90 ~ 100'
      }]
    },{
      title: '良好'
      ,children: [{
        title: '70 ~ 80'
      },{
        title: '60 ~ 70'
      }]
    },{
      title: '要努力奥'
      ,children: [{
        title: '0 ~ 60'
      }]
    }]
    ,accordion: true 
  });
 
  //点击节点新窗口跳转
  tree.render({
    elem: '#test5'
    ,data: data
    ,isJump: true  //link 为参数匹配
  });
 
  //开启复选框
  tree.render({
    elem: '#test7'
    ,data: data2
    ,showCheckbox: true
  });
 
  //开启节点操作图标
  tree.render({
    elem: '#test9'
    ,data: data1
    ,edit: ['add', 'update', 'del'] //操作节点的图标
    ,click: function(obj){
      layer.msg(JSON.stringify(obj.data));
    }
  });
});



















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
  
  //监听指定开关
  form.on('switch(switchTest)', function(data){
    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
      offset: '6px'
    });
    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
  });
  
  //监听提交
  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    return false;
  });
 
  
  //表单取值
  layui.$('#LAY-component-form-getval').on('click', function(){
    var data = form.val('example');
    alert(JSON.stringify(data));
  });
  
});





layui.use(['form', 'layer','jquery'], function () {
    var form  = layui.form;
    var $  = layui.jquery;
    //添加表单监听事件
    form.on('submit(sub)',function () {
    	jgsx=$("input[name='JGSX']:checked").val();
    	gjzs=$('#GJZ').val()+","+$('#GJZ2').val()+","+$('#GJZ3').val()+","+$('#GJZ4').val()+","+$('#GJZ5').val();
    	//alert(gjzs);
    	test=$('#XKFL').val();
    	txdz=$("input[name='TXDZ']:checked").val();
    	alert(txdz);
    	$.ajax({
   
            url:'eiq',
            type:'post',
            data:{
            	jgmc:$('#JGMC').val(),
                txdz:txdz,
                dwwz:$('#DWWZ').val(),
                frdb:$('#FRDB').val(),
                yzbm:$('#YZBM').val(),
                lxr:$('#LXR').val(),
                gddh:$('#GDDH').val(),
                yddh:$('#YDDH').val(),
                dzyx:$('#DZYX').val(),
                cz:$('#CZ').val(),
                jgsx:jgsx,
                jgjj:$('#JGJJ').val(),
                jsxqmc:$('#JSXQMC').val(),
                qsxqnf:$('#QSXQNF').val(),
                jzxqnf:$('#JZXQNF').val(),
                zdkjxqgs:$('#ZDKJXQGS').val(),
                gjz:$('#GJZ').val(),
                yjlx:$('#YJLX').val(),
                xkfl:$('#XKFL').val(),//技术需求所属领域
                xqjsyyhy:$('#XQJSYYHY').val(),//需求技术合作模式
                jhtz:$('#JHTZ').val(),
                qyzc:$('#QYZC').val(),
                yhdk:$('#YHDK').val(),
                qtrz:$('#QTRZ').val(),
                },
            dataType:'text',
            //判断注册状态
            success:function (data) {
                if (data==1){
                    //layer.msg('注册成功')
                    alert("提交成功！");
					//window.location="index.jsp";
                }else{
                	alert("提交失败！");
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
