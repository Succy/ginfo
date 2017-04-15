<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>登录系统</title>
    <link rel="stylesheet" href="css/commons.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<header>
</header>
<div class="login-box">
    <form method="post" action="/user/login.action" id="login-form">
        <div class="form-item">
            <input type="text" name="sid" id="sid" class="form-ctrl" placeholder="请输入学号/工号">
        </div>
        <div class="form-item">
            <input type="password" name="pwd" id="password" class="form-ctrl" placeholder="请输入密码">
        </div>
        <p class="error-msg">${msg}</p>
        <div class="form-item text-right">
            <a href="javascript:;" class="forgot">忘记密码？</a>
        </div>

        <div class="form-item">
            <div class="choose">
                <p>我是：</p>
                <span class="checked first">学生</span><span>老师</span>
                <input type="hidden" value="true" name="isStu" id="isStu"/>
            </div>
        </div>
        <div class="form-item">
            <button class="login-btn" type="submit">立即登录</button>
        </div>
    </form>
</div>
<footer>
    <h4 class="f-msg">- 更加专注的毕业生信息管理 -</h4>
</footer>
<div class="forgetPwd">
    <form action="/user/forgetPwd.action" method="post" id="ud-base">
        <input type="hidden" value="true" name="isStu" id="isStu1"/>
        <div class="layui-form-item">
            <label class="layui-form-label">学号/工号：</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" lay-verify="required" name="sid" id="sid1" placeholder="请输入学号/工号"
                >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱号：</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" lay-verify="required" name="email" id="email" placeholder="请输入邮箱号"
                >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码：</label>
            <div class="layui-input-block">
                <input type="password" class="layui-input" lay-verify="required" name="pwd" id="pwd" placeholder="请输入新密码"
                >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码：</label>
            <div class="layui-input-block">
                <input type="password" class="layui-input" lay-verify="required" id="confirm" placeholder="请再次输入密码"
                >
            </div>
        </div>
    </form>
</div>


</body>
<%--js--%>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery.form.js"></script>
<script src="layui/layui.all.js"></script>
<script>
    var layer = layui.layer;

    $(".choose span").on("click", function () {
        var index = $(this).index();
        if (index == 1) {
            $("#isStu").val(true);
            $("#isStu1").val(true);
        } else {
            $("#isStu").val(false);
            $("#isStu1").val(false);
        }
        $(this).addClass("checked").siblings("span").removeClass("checked");
    });
    $("#login-form").submit(function () {
        if ($("#sid").val().trim() == "") {
            layer.tips("请输入学号/工号", "#sid");
            return false;
        }
        if ($("#password").val().trim() == "") {
            layer.tips("请输入密码", "#password");
            return false;
        }
    });

    $(".forgot").click(function () {
        layer.open({
            type: 1,
            title: '重置密码',
            shadeClose: false,
            shade: 0.3,
            area: ['370px', '350px'],
            content: $(".forgetPwd"),
            btn: ['确认修改', '取消'],
            btn1: function () {
                $("#ud-base").ajaxSubmit({
                    type: "post",
                    beforeSubmit: function () {
                        if ($("#sid1").val().trim() == "") {
                            layer.tips("学号/工号不为空", "#sid1");
                            return false;
                        }
                        if ($("#email").val().trim() == "") {
                            layer.tips("邮箱不为空", "#email");
                            return false;
                        }
                        if ($("#pwd").val().trim() == "") {
                            layer.tips("新密码不为空", "#pwd");
                            return false;
                        }
                        if ($("#confirm").val().trim() == "") {
                            layer.tips("确认密码不为空", "#confirm");
                            return false;
                        }
                        if ($("#confirm").val().trim() != $("#pwd").val().trim()) {
                            layer.msg("两次输入密码不相同");
                            return false;
                        }
                        return true;
                    },
                    success: function (res) {
                        if (res.success) {
                            layer.msg(res.msg, function () {
                                layer.closeAll();
                            });
                            window.location.reload();
                        } else {
                            layer.msg(res.msg);
                        }
                    }
                })
            },
            btn2: function () {
                $(".forgetPwd").hide();
            },
            end: function () {
                $(".forgetPwd").hide();
            }
        });
    });
</script>
</html>
