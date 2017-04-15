<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>个人信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" type="text/css" href="../../layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css" media="all">
    <link rel="stylesheet" type="text/css" href="../../css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="../../css/personal.css" media="all">

    <style>
        .table > thead > tr > th {
            text-align: center;
        }

        .table > tbody > tr > td {
            min-width: 100px;
        }

        .tab-body {
            background-color: white;
            overflow-x: scroll;
        }

        .layui-tab-title {
            border: none;
        }

        .layui-tab-title > li {
            border: none;
        }

        .operation > a {
            margin-right: 5px;
        }

        .search-box {
            max-width: 350px;
        }

        .search-box input {
            max-width: 300px;
            height: 38px;
            border-radius: 0;
        }

        .search-box.layui-this {
            border: none;
        }

        .search-box button {
            margin-top: -2px;
            height: 38px;
            border-radius: 0;
        }
    </style>
</head>
<body>
<section class="">
    <div class="layui-tab">

        <form action="/user/importStus.action" id="import-fm" method="post" enctype="multipart/form-data"
              style="display: none">
            <input type="file" name="file" id="open">
        </form>

        <blockquote class="layui-elem-quote">
            <ul class="layui-tab-title">

                <li class="layui-btn" id="importStus">
                    <i class="layui-icon">&#xe601;</i>导入学生信息</a>
                </li>

                <a href="/user/exportStus.action" class="layui-btn"><i class="layui-icon">&#xe601;</i>导出学生信息</a>
                <li class="layui-btn "><i class="layui-icon">&#xe608;</i>添加学生信息</li>
                <li class="search-box">
                    <div class="input-group">
                        <input type="text" class="form-control" id="search-input" placeholder="输入学号/班级/专业">
                        <span class="input-group-btn">
                            <button class="btn btn-primary" type="button" id="search-btn">查询</button>
                        </span>
                    </div>
                </li>
            </ul>
        </blockquote>
        <div class="larry-separate"></div>
        <div class="layui-tab-content clearfix ">

            <div class="layui-tab-item tab-body layui-field-box layui-show">
                <table class="table table-striped table-hover table-condensed table-responsive text-center"
                       lay-even="" id="listTb"
                       lay-skin="nob">
                    <thead>
                    <tr>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>出生日期</th>
                        <th>民族</th>
                        <th>学号</th>
                        <th>毕业院校</th>
                        <th>所在学院</th>
                        <th>专业</th>
                        <th>班级</th>
                        <th>政治面貌</th>
                        <th>家庭住址</th>
                        <th>QQ</th>
                        <th>邮箱</th>
                        <th>联系电话</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>

            </div>
            <div class="larry-table-page clearfix">
                <div id="page" class="page"></div>
            </div>
            <!-- 登录日志 -->
        </div>
    </div>
</section>
<script src="../../js/jquery-1.11.1.min.js"></script>
<script src="../../js/jquery.form.js"></script>
<script type="text/javascript" src="../../layui/layui.all.js"></script>
<script type="text/javascript">
    var totalPage = 1;
    var layer = layui.layer;
    var laypage = layui.laypage;
    $("#importStus").click(function () {
        $("#open").click();
    });

    $("#open").change(function () {
        $("#import-fm").ajaxSubmit({
            success: function (res) {
                if (res.success) {
                    layer.alert("成功导入学生" + res.count + "个");
                    getStuList(10, 0);
                    pagination();
                } else {
                    layer.alert("导入学生信息失败，请稍后重试");
                }
            }
        })
    })

    $("#search-input").focus(function () {
        $(".search-box").removeClass("layui-this");
    });

    $("#search-btn").click(function () {
        var searchArg = $("#search-input").val().trim();
        getStuList(10, 0, searchArg);
        pagination();
    });
    function delStu(id) {
        layer.confirm("你确定要删除该学生信息？", function () {
            $.post("/user/delStu.action",{"id":id},function (res) {
                if (res.success) {
                    layer.alert("成功删除！");
                    getStuList(10, 0);
                    pagination();
                }else {
                    layer.msg("网络繁忙，请稍后重试");
                }
            },"json");
        })
    }
    function getStuList(rows, page, searchArg) {
        $.ajax({
            url: "/user/getStuList.action",
            data: {"rows": rows, "page": page, "searchArg": searchArg},
            type: "get",
            dataType: "json",
            async: false,
            success: function (data) {
                if (data.success) {
                    var total = data.total;
                    totalPage = total % rows == 0 ? total / rows : total / rows + 1;
                    $("#listTb tbody").empty();


                    $.each(data.result, function (index, item) {
                        $("#listTb tbody").append(
                                "<tr>" +
                                "<td>" + item.name + "</td><td>" + item.gender + "</td><td>" + item.birth + "</td><td>" + item.nation + "</td>" +
                                "<td>" + item.sid + "</td><td>" + item.school + "</td><td>" + item.collage + "</td><td>" + item.major + "</td><td>" + item.grade + "</td>" +
                                "<td>" + item.politics_status + "</td><td class='address'>" + item.address + "</td><td>" + item.qq + "</td><td>" + item.email + "</td>" +
                                "<td>" + item.mobi + "</td><td class='operation'><a href='javascript:;' onclick='delStu("+item.id+")' tip='删除'><i class='layui-icon' >&#xe640;</i></a><a href='javascript:;' tip='编辑'><i class='layui-icon'>&#xe642;</i></a><a href='javascript:;' tip='详情'><i class='layui-icon'>&#xe607;</i></td>" +
                                "</tr>");
                    });
                    $(".operation>a").mouseover(function () {
                        var tip = $(this).attr("tip");
                        layer.tips(tip, $(this), {
                            tips: 4
                        });
                    });
                }
            }
        });
    }
    getStuList(10, 0);
    pagination();
    function pagination() {
        laypage({
            cont: 'page',
            pages: totalPage, //总页数
            groups: 5, //连续显示分页数
            jump: function (obj, first) {
                //得到了当前页，用于向服务端请求对应数据
                var curr = obj.curr;
                if (!first) {
                    getStuList(10, curr - 1, $("#search-input").val().trim());
                }
            }
        });
    }

</script>
</body>
</html>
