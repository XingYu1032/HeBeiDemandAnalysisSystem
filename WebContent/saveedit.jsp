<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%> 
    	<%@	page import="com.Demand.DBUtil.DBUtil" %>
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

<style type="text/css">
textarea {
	resize: none;
}
</style>

<script>
function onload()
{
	<%
	Cookie[] cookies=request.getCookies();
	String value="";
	String names="";
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
				names=cookies[i].getValue();
				System.out.println(names+" names");
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


if (window.ActiveXObject && !window.XMLHttpRequest) {
	window.XMLHttpRequest = function() {
		return new ActiveXObject((navigator.userAgent.toLowerCase()
				.indexOf('msie 6') != -1) ? 'Microsoft.XMLHTTP'
				: 'Msxml2.XMLHTTP');
	};
}//取得XMLHttpRequest对象 
var req;
var flagSelect;
function testName(flag, value)//使用Ajax访问服务器
{
	flagSelect = flag; //标记一下当前是选择省,还是选择市
	req = new XMLHttpRequest();
	if (req) {
		req.onreadystatechange = setValue;
	}
	req.open('POST', "getinfo.jsp?flag=" + flag + "&value=" + value);//把参数带到服务器中
	req.setRequestHeader('Content-Type',
			'application/x-www-form-urlencoded');
	req.send(null);
}
function setValue() {
	if (req.readyState == 4)//访问到服务器
	{
		if (req.status == 200)//正确返回
		{
			if (flagSelect == "1")//如果选择某个省要更新市和区
			{
				var v = req.responseText.split("||");//req.responseText是服务器返回来的字符串
				paint(document.all("sec"), v[0]);//更新市下拉框
				paint(document.all("thi"), v[1]);//更新区下拉框
			}
			if (flagSelect == "2")//如果选择某市,只需改变区
			{
				var v = req.responseText;//req.responseText是服务器返回来的字符串
				paint(document.all("thi"), v);//更新区下拉框
			}
		}
	}
}
function paint(obj, value)//根据一对数据去更新一个下拉框
{
	var ops = obj.options;
	var v = value.split(";");//得到一些数据,(修改过了..)
	while (ops.length > 0)//先清空原来的数据
	{
		ops.remove(0);
	}
	for (var i = 0; i < v.length - 1; i++)//把新得到的数据显示上去
	{
		var o = document.createElement("OPTION");//创建一个option把它加到下拉框中
		o.value = v[i].split(",")[0];
		o.text = v[i].split(",")[1];
		ops.add(o);
	}
}
//判断是否选择的基础研究，然后隐藏后面的行列
function check_jichu() {
	var jichu = document.getElementsByName("Itype"); //学科分类  领域  lingyu1  lingyu2  行业  应用行业
	if (jichu[0].checked == true) {
		document.getElementById("table2").style.display = "block";
		document.getElementById("table3").style.display = "none";
	} else if (jichu[1].checked == true || jichu[2].checked == true
			|| jichu[3].checked == true || jichu[4].checked == true) {
		document.getElementById("table2").style.display = "none";
		document.getElementById("table3").style.display = "block";
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
     <% if(names.equals("admit")||names.equals("admin")){ %>
			    <li class="layui-nav-item"><a href="xq_check.jsp">需求审核</a></li>
        		<li class="layui-nav-item"><a href="user_manager.jsp">用户管理</a></li>

		<%}
      
      else{
      %>
        
        <li class="layui-nav-item"><a href="main.jsp">需求填表</a></li>
        <li class="layui-nav-item"><a href="Xq_manager.jsp">需求管理</a></li>
        <li class="layui-nav-item"><a href="update_info.jsp">个人信息</a></li>
        <li class="layui-nav-item"><a href="update_pwd.jsp">修改密码</a></li>
        
      <% } %>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
 
      
 
      	<%
		request.setCharacterEncoding("UTF-8");
		Connection con=null;
		con=DBUtil.getConn();
		String Inamenum = (String) request.getParameter("Inamenum");
		String url = "select Iname,Iadd,Iszdy,Iweb,Iemail,Ifrdb,Iyzbm,Iclient,Igh,"
				+ "Iphone,Ifax,Ipeoprety,Iintro,Ixqname,Iyear1,Iyear2,Ixqrequest,Ixqguanjian,Ixqmubiao,"
				+ "Igjz1,Igjz2,Igjz3,Igjz4,Igjz5,Izjze,Icompany,Ixqyyhy from xuqiu where Inamenum=" + "'" + Inamenum
				+ "'";
		ResultSet rs = con.prepareStatement(url).executeQuery();
		rs.next();

		String Iname = rs.getString("Iname");
		String Iadd = rs.getString("Iadd");
		String Iszdy = rs.getString("Iszdy");
		String Iweb = rs.getString("Iweb");
		String Iemail = rs.getString("Iemail");
		String Ifrdb = rs.getString("Ifrdb");
		String Iyzbm = rs.getString("Iyzbm");
		String Iclient = rs.getString("Iclient");
		String Igh = rs.getString("Igh");
		String Iphone = rs.getString("Iphone");
		String Ifax = rs.getString("Ifax");
		String Ipeoprety = rs.getString("Ipeoprety");
		String Iintro = rs.getString("Iintro");
//		System.out.println("saveedit界面的Iintro："+Iintro);
		String Ixqname = rs.getString("Ixqname");
		String Iyear1 = rs.getString("Iyear1");
		String Iyear2 = rs.getString("Iyear2");
		String Ixqrequest = rs.getString("Ixqrequest");
		String Ixqguanjian = rs.getString("Ixqguanjian");
		String Ixqmubiao = rs.getString("Ixqmubiao");
		String Igjz1 = rs.getString("Igjz1");
		String Igjz2 = rs.getString("Igjz2");
		String Igjz3 = rs.getString("Igjz3");
		String Igjz4 = rs.getString("Igjz4");
		String Igjz5 = rs.getString("Igjz5");
		String Izjze = rs.getString("Izjze");
		String Icompany = rs.getString("Icompany");
		String Ixqyyhy = rs.getString("Ixqyyhy");

		System.out.println("saveedit界面的Iname：" + Iname);
		System.out.println("saveedit界面的Inamenum：" + Inamenum);

		rs.close();
	%>
	<form id="form2" method="post" action="SecondAddXuqiu.jsp">
		<table width="900" border="1" align="center">
			<tr>
				<td align="center"><table width="900" border="1" align="center">
						<caption>
							<font size=5>河北省重大需求征集表(修改表)</font>
						</caption>
						<tr>
							<td width="110" align="center">机构全称</td>
							<td colspan="3" align="left"><input name="Iname" type="text" readonly=true
								id="机构名称" size="50" value=<%=Iname%> /></td>
							<td width="140" align="center">归口管理部门</td>
							<td colspan="2" width="168" align="left"><select id="归口管理部门"
								name="Ixqbelong">
									<%
									String gkbm[] = { "保定国家高新技术产业开发区", "保定市科技局", "沧州市科技局", "承德国家高新技术产业开发区", "承德市科技局", "定州市科技局", "邯郸市科技局",
											"河北出入境检验检疫局", "河北钢铁集团有限公司", "河北行政学院", "河北省机构编制委员会办公室", "衡水市科技局", "廊坊市科技局", "秦皇岛市科技局", "省安全生产监督管理局",
											"省财政厅", "省档案局", "省地震局", "省发改委", "省法院", "省妇联", "省工商行政管理局", "省工业和信息化厅", "省公安厅", "省供销合作社 ", "省广播电视局",
											"省国防科技工业局", "省国家安全厅", "省国土资源厅", "省国资委", "省环保厅", "省计生委", "省检察院", "省交通厅", "省教育厅", "省科技厅", "省科协",
											"省科学院", "省林业厅", "省旅游局", "省民政厅", "省农科院", "省农业厅", "省气象局", "省人力资源和社会保障厅", "省人民政府外事办公室", "省商务厅",
											"省社会科学院", "省社科联", "省审计厅", "省食品药品监督管理局", "省水利厅", "省司法厅", "省体育局", "省统计局", "省委办公厅", "省委宣传部", "省委组织部",
											"省卫生厅", "省文化厅", "省物价局", "省新闻出版广电局", "省信访局", "省盐务局", "省政府办公厅", "省政府法制办", "省政府研究室", "省质量技术监督局",
											"省中小企业局", "省中医药管理局", "省住房和城乡建设厅", "省总工会", "石家庄国家高新技术产业开发区", "石家庄市科技局", "唐山国家高新技术产业开发区", "唐山市科技局",
											"团省委", "辛集市科技局", "邢台市科技局", "燕郊国家高新技术产业开发区", "张家口市科技局", "中共河北省委党校" };
										for (int i = 0; i < gkbm.length; i++) {
											String val = gkbm[i];
									%>
									<option value="<%=val%>"><%=val%></option>
									<%
										}
									%>
							</select></td>
						</tr>
						<tr>
							<td align="center">通讯地址</td>
							<td colspan="3" align="left"><input name="Iadd" type="text"
								id="通讯地址" size="50" value=<%=Iadd%> /></td>
							<td width="140" align="center">所在地域</td>
							<td colspan="2" align="left"><input name="Iszdy" type="text"
								id="所在地域" size="32" value=<%=Iszdy%> /></td>
						</tr>
						<tr>
							<td align="center">网址</td>
							<td colspan="3" align="left"><input name="Iweb" type="text"
								id="网址" size="50" value=<%=Iweb%> /></td>
							<td width="140" align="center">电子信箱</td>
							<td colspan="2" align="left"><input type="text"
								name="Iemail" id="电子信箱" size="32" value=<%=Iemail%> /></td>
						</tr>
						<tr>
							<td align="center">法人代表</td>
							<td colspan="3" align="left"><input name="Ifrdb" type="text"
								id="法人代表" size="15" value=<%=Ifrdb%> /></td>
							<td align="center">邮政编码</td>
							<td colspan="2" align="left"><input name="Iyzbm" type="text"
								id="邮政编码" size="32" maxlength="6" value=<%=Iyzbm%> /></td>
						</tr>
						<tr>
							<td height="101" rowspan="2" align="center">联系人</td>
							<td height="101" colspan="2" rowspan="2" align="left"><input
								name="Iclient" type="text" id="联系人" size="15" value=<%=Iclient%> /></td>
							<td width="155" align="center">电话</td>
							<td colspan="3" align="left" nowrap="nowrap"><p>
									1：固话 <input type="text" name="Igh" id="固话" value=<%=Igh%> />
								</p>
								<p>
									2：手机 <input type="text" name="Iphone" id="手机" value=<%=Iphone%> />
								</p></td>
						</tr>
						<tr>
							<td align="center">传真</td>
							<td colspan="3" align="left" nowrap="nowrap"><input
								name="Ifax" type="text" id="传真" size="35" value=<%=Ifax%>></td>
						</tr>
						<tr>
							<td align="center">机构属性</td>
							<td colspan="6" align="left"><p>
									<input type="radio" name="Ipeoprety" id="机构" value="企业" /> <label
										for="机构">企业</label> <input type="radio" name="Ipeoprety"
										id="机构2" value="高等院校" /> <label for="机构2">高等院校</label> <input
										type="radio" name="Ipeoprety" id="机构3" value="研究机构" /> <label
										for="机构3">研究机构</label> <input type="radio" name="Ipeoprety"
										id="机构4" value="其他" /> <label for="机构4">其他</label>
								</p></td>
						</tr>
						<tr>
							<td align="center">机构简介</td>
							<td colspan="6" align="left"><textarea name="Iintro"
									placeholder="主要包括基本情况、现有研究基础等，限500字以内" cols="110" rows="9"
									id="机构简介" 
									onChange="this.value=this.value.substring(0, 500)"
									onKeyDown="this.value=this.value.substring(0, 500)"
									onKeyUp="this.value=this.value.substring(0, 500)"><%=Iintro%></textarea></td>
						</tr>
						<tr>
							<td align="center">技术需求名称</td>
							<td colspan="3" align="left"><input name="Ixqname"
								type="text" id="技术需求名称" size="50" value=<%=Ixqname%> /></td>
							<td align="center">*需求时限</td>
							<td colspan="2" align="center"><p>
									<input name="Iyear1" type="text" id="Iyear1" size="8"
										value=<%=Iyear1%> /> 年至 <input name="Iyear2" type="text"
										id="Iyear2" size="8" value=<%=Iyear2%> /> 年
								</p></td>
						</tr>
						<tr>
							<td height="122" align="center"><p>*技术需求概述主要问题</p>
							<td colspan="6" align="left"><textarea
									placeholder="填写需要解决的重大技术问题，限500字以内" name="Ixqrequest"
									cols="110" rows="9" id="Ixqrequest"
									onChange="this.value=this.value.substring(0, 500)"
									onKeyDown="this.value=this.value.substring(0, 500)"
									onKeyUp="this.value=this.value.substring(0, 500)"><%=Ixqrequest%></textarea></td>
						</tr>
						<tr>
							<td height="122" align="center"><p>*需求技术关键</p>
							<td colspan="6" align="left"><textarea
									placeholder="填写所需的关键技术，主要指标，限500字以内" name="Ixqguanjian"
									cols="110" rows="9" id="Ixqguanjian"
									onChange="this.value=this.value.substring(0, 500)"
									onKeyDown="this.value=this.value.substring(0, 500)"
									onKeyUp="this.value=this.value.substring(0, 500)"><%=Ixqguanjian%></textarea></td>
						</tr>
						<tr>
							<td height="122" align="center"><p>*技术需求概述预期目标</p>
							<td colspan="6" align="left"><textarea
									placeholder="填写技术创新性，经济社会效益，限500字以内" name="Ixqmubiao"
									cols="110" rows="9" id="Ixqmubiao"
									onChange="this.value=this.value.substring(0, 500)"
									onKeyDown="this.value=this.value.substring(0, 500)"
									onKeyUp="this.value=this.value.substring(0, 500)"><%=Ixqmubiao%></textarea></td>
						</tr>
						<tr>
							<td align="center">关键字</td>
							<td colspan="6" align="center"><input name="Igjz1"
								type="text" id="关键字1" size="20" value=<%=Igjz1%> /> <input
								name="Igjz2" type="text" id="关键字2" size="15" value=<%=Igjz2%> />
								<input name="Igjz3" type="text" id="关键字3" size="15"
								value=<%=Igjz3%> /> <input name="Igjz4" type="text" id="关键字4"
								size="15" value=<%=Igjz4%> /> <input name="Igjz5" type="text"
								id="关键字5" size="15" value=<%=Igjz5%> /></td>
						</tr>
						<tr>
							<td align="center"><p>拟投入资金总额</p></td>
							<td colspan="5" align="left"><input name="Izjze" type="text"
								id="Izjze" size="10" value=<%=Izjze%> /> 万元</td>
						</tr>
						<tr>
							<td align="center"><p>技术需求解决方式</p></td>
							<td colspan="6" align="left"><input type="radio"
								name="Ihzms" id="合作" value="独立研发" /> <label for="合作">独立研发</label>
								<input type="radio" name="Ihzms" id="合作2" value="委托研发" /> <label
								for="合作2">委托研发</label> <input type="radio" name="Ihzms" id="合作3"
								value="合作研发" /> <label for="合作3">合作研发</label> <input
								type="radio" name="Ihzms" id="合作4" value="其他" /> <label
								for="合作4">其他</label></td>
						</tr>
						<tr>
							<td align="center">合作意向单位</td>
							<td colspan="5" align="left"><input name="Icompany"
								type="text" id="意向单位" size="108" value=<%=Icompany%>></td>
						</tr>
						<tr>
							<td align="center">*科技活动类型</td>
							<td colspan="6" align="center"><p>
									<input type="radio" name="Itype" id="研究类型" value="基础研究"
										onclick="check_jichu()" /> <label for="研究类型">基础研究</label> <input
										type="radio" name="Itype" id="研究类型2" value="应用研究"
										onclick="check_jichu()" /> <label for="研究类型2">应用研究</label> <input
										type="radio" name="Itype" id="研究类型3" value="试验发展"
										onclick="check_jichu()" /> <label for="研究类型3">试验发展</label> <input
										type="radio" name="Itype" id="研究类型4" value="研究与发展成果应用"
										onclick="check_jichu()" /> <label for="研究类型4">研究与实验发展成果应用<br />
									</label> <input type="radio" name="Itype" id="研究类型5" value="技术推广与科技服务"
										onclick="check_jichu()" /> <label for="研究类型5">技术推广与科技服务</label>
									<input type="radio" name="Itype" id="研究类型6" value="生产性活动"
										onclick="check_jichu()" /> <label for="研究类型6">生产性活动</label>
								</p></td>
						</tr>
						<table border="1" name="table2" id="table2">
							<tr id="学科分类">
								<td width="110" align="center">学科分类</td>
								<%
									ResultSet rs2 = con.prepareStatement("select * from first order by firstID").executeQuery();
								%>
								<td colspan="5" cols="100" align="center" width="800">
									<p id="学科分类">
										一级学科 <select name="fir" onChange="testName(1,this.value);">
											<%
												while (rs2.next()) {
													out.println(
															"<option value='" + rs2.getString("firstID") + "'>" + rs2.getString("firstName") + "</option>");
												}
											%>
										</select>
										<%
											rs2 = con.prepareStatement("select * from second t2 where t2.father=(select min(t1.firstID) from first t1) order by secondID").executeQuery();
										%>
										二级学科 <select name="sec" onChange="testName(2,this.value);">
											<%
												while (rs2.next()) {
													out.println("<option value='" + rs2.getString("secondID") + "'>" + rs2.getString("secondName")
															+ "</option>");
												}
											%>
										</select>
										<%
											rs2 = con.prepareStatement("select * from third t3 where t3.father=(select min(t2.secondID) from second t2 where t2.father=(select min(t1.firstID) from first t1) ) order by thirdID").executeQuery();
										%>
										三级学科 <select name="thi">
											<%
												while (rs2.next()) {
													out.println(
															"<option value='" + rs2.getString("thirdID") + "'>" + rs2.getString("thirdName") + "</option>");
												}
												rs2.close();
											%>
										</select>
									</p>
								</td>
							</tr>
							</table>
							<table border="1" name="table3" id="table3">
							<tr id="所属领域">
								<td width="110" align="center"><p id="领域">需求技术所属领域(非基础研究填写)</p></td>
								<td colspan="5" align="center" id="lingyu"><p id="lingyu1">
										<input type="checkbox" name="Ilingyu" id="领域1" value="电子信息" />
										<label for="领域">电子信息</label> <input type="checkbox"
											name="Ilingyu" id="领域2" value="光机电一体化" /> <label for="领域2">光机电一体化</label>
										<input type="checkbox" name="Ilingyu" id="领域3" value="生物技术与制药" />
										<label for="领域3">生物技术与制药</label> <input type="checkbox"
											name="Ilingyu" id="领域4" value="新材料及应用" /> <label for="领域4">新材料及应用</label>
										<input type="checkbox" name="Ilingyu" id="领域5" value="现代农业" />
										<label for="领域5">现代农业</label> <input type="checkbox"
											name="Ilingyu" id="领域6" value="新能源与高效节能" /> <label for="领域6">新能源与高效节能</label>
										<input type="checkbox" name="Ilingyu" id="领域7" value="资源与环境" />
										<label for="领域7">资源与环境</label> <input type="checkbox"
											name="Ilingyu" id="领域8" value="高技术服务业" /> <label for="领域8">高技术服务业</label>
										<input type="checkbox" name="Ilingyu" id="领域9" value="海洋" />
										<label for="领域9">海洋</label> <input type="checkbox"
											name="Ilingyu" id="领域10" value="社会公共事业" /> <label for="领域10">社会公共事业</label>
										<input type="checkbox" name="Ilingyu" id="领域11" value="医疗卫生" />
										<label for="领域11">医疗卫生</label>
									</p>
									<p id="lingyu2">
										<input type="checkbox" name="Ilingyu" id="领域12" value="其他技术" />
										<label for="领域12">其他技术</label> <input type="text" width="50"
											placeholder="如果选择其他技术，请填写" name="Ilingyu_text" id="其他文本" />
									</p></td>
							</tr>
							<tr id="应用行业">
								<td width="110" align="center"><p id="行业">需求技术应用行业(非基础研究填写)</p></td>
								<td colspan="5" align="left"><input name="Ixqyyhy"
									type="text" id="应用行业" value="" size="108" value=<%=Ixqyyhy%> /></td>
							</tr>
						</table>
					</table> <input type="hidden" name="saveflag" value="编辑保存" /> <input
					type="hidden" name="Inamenum" value=<%=Inamenum%>></td>
			</tr>
		</table>
		<center>
		<br>
		<br>
		<br>
			<input type="submit" name="submit" id="submit" value="保存" style="width:100px;height:30px"> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" name="submit" id="submit" value="提交"  style="width:100px;height:30px"/>
           <input type="hidden" name="saveflag" value="编辑保存" />
           <input type="hidden" name="Inamenum" value=<%=Inamenum%>>
		</center>
	</form>
	<%
		rs.close();
		con.close();
	%>
       

  		<br>
  		<br>
  		<br>
  		<br>
  		<br>
  		<br>
      
   
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
