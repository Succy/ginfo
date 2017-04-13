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
    <base href="<%=basePath%>%">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>主页</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/commons.css">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/icons.css">

    <script src="../js/jquery-1.11.1.min.js"></script>
    <script src="../layui/layui.all.js"></script>
</head>
<body>
<%@include file="../jsp/header.jsp" %>
<div class="site-main clearfix">
    <div class="left-box fl">
        <fieldset class="layui-elem-field">
            <legend>基本信息</legend>
            <div class="layui-field-box clearfix base-info-box">
                <div class="avatar fl">
                    <c:choose>
                        <c:when test="${student.avatar == null || student.avatar == ''}">
                            <img class="avatar-img" src="../img/default_headpic.png" alt="">
                        </c:when>
                        <c:otherwise>
                            <img class="avatar-img" src="${student.avatar}" alt="">
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="base-info fl">
                    <p class="name">姓名：${student.name}</p>
                    <p>学号：${student.sid}</p>
                    <p>性别：${student.gender}</p>
                    <p>民族：${student.nation}</p>
                    <p>出生日期：${student.birth}</p>

                </div>
                <div class="base-info fl">
                    <p>政治面貌：${student.politics_status}</p>
                    <p>手机号码：${student.mobi}</p>
                    <p>QQ号码：${student.qq}</p>
                    <p>电子邮箱：${student.email}</p>
                    <p>家庭住址：${student.address}</p>
                </div>
            </div>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>院校信息</legend>
            <div class="layui-field-box clearfix">
                <div class="base-info fl">
                    <p>毕业院校：${student.school}</p>
                    <p>所在学院：${student.collage}</p>
                </div>
                <div class="base-info fl">
                    <p>主修专业：${student.major}</p>
                    <p>班级：${student.grade}</p>
                </div>
            </div>
        </fieldset>
    </div>

    <div class="base-info-pop">
        <div class="avatar-upload">
            <c:choose>
                <c:when test="${student.avatar == null || student.avatar == ''}">
                    <img class="avatar-img" src="../img/default_headpic.png" class="layui-circle" alt="">
                </c:when>
                <c:otherwise>
                    <img class="avatar-img" src="${student.avatar}" class="layui-circle" alt="">
                </c:otherwise>
            </c:choose>
            <div class="avatar-upbar">
                <div class="layui-box layui-upload-button">
                    <form target="layui-upload-iframe" method="post" key="set-mine" enctype="multipart/form-data"
                          action="/user/uploadAvatar.action?id=${student.id}">
                        <input type="file" name="avatarFile" class="layui-upload-file" id="uploadAvatar"></form>
                    <span class="layui-upload-icon"><i class="layui-icon">&#xe61f;</i>上传图片</span>
                </div>
            </div>
        </div>
        <form action="" method="post" class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">手机号码：</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="mobi" placeholder="手机号码" value="${student.mobi}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">QQ号码：</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="qq" placeholder="QQ号码" value="${student.qq}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱账号：</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="email" placeholder="邮箱账号" value="${student.email}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">家庭住址：</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="address" placeholder="家庭住址" value="${student.address}">
                </div>
            </div>
        </form>
    </div>

    <div class="right-box fr">
        <div class="site-tree">
            <ul>
                <li class="active">
                    <a href=""><i class="mr-icons mr-base-i active"></i><span>基本信息</span></a>
                </li>
                <li>
                    <a href=""><i class="mr-icons mr-works-i"></i><span>实习经历</span></a>
                </li>
                <li>
                    <a href=""><i class="mr-icons mr-edu-i"></i><span>教育经历</span></a>
                </li>
                <li>
                    <a href=""><i class="mr-icons "></i><span>项目经验</span></a>
                </li>
                <li>
                    <a href=""><i class="mr-icons mr-prod-i"></i><span>作品展示</span></a>
                </li>
                <li>
                    <a href=""><i class="mr-icons mr-hopework-i"></i><span>期望工作</span></a>
                </li>
                <li>
                    <a href=""><i class="mr-icons mr-skill-i"></i><span>技能评价</span></a>
                </li>
            </ul>
        </div>
    </div>
</div>
<%@include file="../jsp/footer.jsp" %>
</body>
<%--js--%>
<script>
    var layer = layui.layer;
    layui.upload({
        url: '/user/uploadAvatar.action?id=${student.id}',
        elem: '#uploadAvatar', //指定原始元素，默认直接查找class="layui-upload-file"
        method: 'post', //上传接口的http类型
        success: function (res) {
           if (res.success) {
               $(".avatar-img").attr("src", res.avatar);
           }
        }
    });
    $(".base-info-box").click(function () {
        layer.open({
            type: 1,
            title: '修改基本信息',
            shadeClose: false,
            shade: 0.3,
            area: ['370px', '510px'],
            content: $(".base-info-pop"),
            btn: ['确认修改', '取消'],
            btn1: function () {

            },
            btn2: function () {
                $(".base-info-pop").hide();
            },
            end: function () {
                $(".base-info-pop").hide();
            }
        });
    });

    $(".site-tree>ul>li>a").click(function (e) {
        e.preventDefault();
        var parent = $(this).parent("li");
        parent.addClass("active").siblings("li").removeClass("active").find("a>i").removeClass("active");
        $(this).find("i").addClass("active");
    });
</script>
</html>

