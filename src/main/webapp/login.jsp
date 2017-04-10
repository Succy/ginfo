<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()
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
                    <input type="password" name="pwd" id="password" class="form-ctrl"  placeholder="请输入密码" >
                </div>
                <p class="error-msg">${msg}</p>
                <div class="form-item text-right">
                    <a href="#" class="forgot">忘记密码？</a>
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
    </body>
    <%--js--%>
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="layui/layui.all.js"></script>
    <script>
        var layer = layui.layer;

        $(".choose span").on("click", function () {
            var index = $(this).index();
            if (index == 1) {
                $("#isStu").val(true);
            } else {
                $("#isStu").val(false);
            }
            $(this).addClass("checked").siblings("span").removeClass("checked");
        });
        $("#login-form").submit(function () {
            if ($("#sid").val().trim() == "") {
                layer.tips("请输入学号", "#sid");
                return false;
            }
            if ($("#password").val().trim() == "") {
                layer.tips("请输入密码", "#password");
                return false;
            }
        })
    </script>
</html>
