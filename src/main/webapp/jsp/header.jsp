
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header">
    <div class="h-main">
        <ul class="layui-nav">
            <li class="layui-nav-item">${student.name}，欢迎您</li>
            <%--<li class="layui-nav-item"><a href="">产品</a></li>--%>
            <%--<li class="layui-nav-item"><a href="">大数据</a></li>--%>
            <%--<li class="layui-nav-item"><a href="">社区</a></li>--%>
            <li class="layui-nav-item fr"><a href="/user/logout.action?isStu=true">退出</a></li>
            <li class="layui-nav-item fr"><a href="javascript:;" id="modify-pwd">修改密码</a></li>
            <li class="layui-nav-item fr"><a href="javascript:;">消息</a></li>
        </ul>
    </div>
</div>
<div id="modify-pwd-box">
    <form method="post">
        <div class="form-item">
            <input type="password" name="sid" class="form-ctrl" placeholder="请输入旧密码">
        </div>
        <div class="form-item">
            <input type="password" name="password" class="form-ctrl"  placeholder="请输入新密码" >
        </div><div class="form-item">
            <input type="password" name="password" class="form-ctrl"  placeholder="请再次确认密码" >
        </div>
    </form>
</div>

<script>
    var layer = layui.layer;
    $("#modify-pwd").on("click", function () {
        layer.open({
            type: 1,
            title: '修改密码',
            shadeClose: false,
            shade: 0.3,
            area: ['315px', '295px'],
            content: $("#modify-pwd-box"),
            btn:['确认修改'],
            btn1:function () {

            },
            cancel: function () {
                $("#modify-pwd-box").hide();
            }
        });
    });
</script>