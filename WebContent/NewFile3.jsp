<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
body { 
font: normal 11px auto "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
color: #4f6b72; 
background: #E6EAE9; 
} 

a { 
color: #c75f3e; 
} 

#mytable { 
width: 700px; 
padding: 0; 
margin: 0; 
} 

caption { 
padding: 0 0 5px 0; 
width: 700px; 
font: italic 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
text-align: right; 
} 

th { 
font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
color: #4f6b72; 
border-right: 1px solid #C1DAD7; 
border-bottom: 1px solid #C1DAD7; 
border-top: 1px solid #C1DAD7; 
letter-spacing: 2px; 
text-transform: uppercase; 
text-align: left; 
padding: 6px 6px 6px 12px; 
background: #CAE8EA  no-repeat; 
} 

th.nobg { 
border-top: 0; 
border-left: 0; 
border-right: 1px solid #C1DAD7; 
background: none; 
} 

td { 
border-right: 1px solid #C1DAD7; 
border-bottom: 1px solid #C1DAD7; 
background: #fff; 
font-size:11px; 
padding: 6px 6px 6px 12px; 
color: #4f6b72; 
} 


td.alt { 
background: #F5FAFA; 
color: #797268; 
} 

th.spec { 
border-left: 1px solid #C1DAD7; 
border-top: 0; 
background: #fff no-repeat; 
font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
} 

th.specalt { 
border-left: 1px solid #C1DAD7; 
border-top: 0; 
background: #f5fafa no-repeat; 
font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
color: #797268; 
} 
/*---------for IE 5.x bug*/ 
html>body td{ font-size:11px;} 
body,td,th { 
font-family: 宋体, Arial; 
font-size: 12px; 
} 
</style> 
<body> 
<table id="mytable" cellspacing="0"> 
<caption> </caption> 
<tr> 
<th scope="col">姓名</th> 
<th scope="col">年龄</th> 
<th scope="col">电话</th> 
<th scope="col">居住地点</th> 
</tr> 
<tr> 
<td class="row">badwolf</td> 
<td class="row">100</td> 
<td class="row">010-110</td> 
<td class="row">中国北京</td> 
</tr> 
</table> 

</body> 
</html> 