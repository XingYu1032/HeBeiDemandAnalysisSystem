<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
 
    <title>register</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="layui/css/style.css">
 
</head>
<body>
 
<div class="login-main">
    <header class="layui-elip" style="width: 85%">注册</header>
    <form class="layui-form">
        <!--输入用户名-->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="text" name="unames" id="unames" required  lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
            </div>
            <!--判断用户名是否可用的图标 -->
            <div class="layui-inline">
                <i class="layui-icon" hidden id="ri" style="color: green; font-weight: bold"></i>
                <i class="layui-icon" hidden id="le" style="color: red; font-weight: bold">ဆ</i>
            </div>
        </div>
        <!--输入密码-->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="password" name="uname" id="pwd" required  lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
            </div>
 
        </div>
        <div class="layui-input-inline login-btn" style="width: 85%">
            <button type="submit" lay-submit lay-filter="sub" class="layui-btn" lay->注册</button>
        </div>
        <br/>
        <p style="width: 85%">
            <a href="index.jsp" class="fl">已有账号？立即登录</a>
            <a href="#" class="fr">忘记密码？</a>
        </p>
    </form>
</div>
 
 
<script src="layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer','jquery'], function () {
        var form  = layui.form;
        var $  = layui.jquery;
        //为表单添加blur事件
      /*  $('#uname').blur(function () {
            //ajax异步刷新
            $.ajax({
                url:'checkuser',
                type:'post',
                dataType:'text',
                data:{uname:$('#unames').val()},
                //验证用户名是否可用
                success:function (data) {
                    if(data=='1'){
                        //layer.msg('可以注册')
                        $('#ri').removeAttr('hidden');
                        $('#le').attr('hidden','hidden');
 
                    }else{
                        //layer.msg('用户名已被占用')
                        $('#ri').attr('hidden','hidden');
                        $('#le').removeAttr('hidden');
                    }
                }
            })
        });*/
        //添加表单监听事件
        form.on('submit(sub)',function () {
        	uname=$('#unames').val();
            $.ajax({
                url:'register',
                type:'post',
                data:{uname:$('#unames').val(),
                    pwd:$('#pwd').val()},
                dataType:'text',
                //判断注册状态
                success:function (data) {
                    if (data==1){
                        //layer.msg('注册成功')
                        alert("注册成功！");
						window.location="index.jsp";
                    }else{
                        layer.msg('注册失败')
                    }
                }
            })
            //防止页面跳转
            return false;
        });
 
    }); 
</script>
</body>
</html>