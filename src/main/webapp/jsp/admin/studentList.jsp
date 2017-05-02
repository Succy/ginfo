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
                <li class="layui-btn add-stu"><i class="layui-icon">&#xe608;</i>添加学生信息</li>
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
        </div>
    </div>
</section>
<%--新增：添加/修改学生信息弹窗--%>
<div class="stu-box" style="display: none;padding-top: 10px">
    <form class="layui-form" id="stuBoxFm" >
        <%--第一行--%>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="name" id="i-name" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">出生日期</label>
                <div class="layui-input-inline">
                    <input type="text" name="birth" id="i-birth" lay-verify="date" placeholder="yyyy-mm-dd"
                           autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">民族</label>
                <div class="layui-input-inline">
                    <select name="nation" id="i-nation">
                        <option value="汉族">汉族</option>
                        <option value="壮族">壮族</option>
                        <option value="满族">满族</option>
                        <option value="回族">回族</option>
                        <option value="苗族">苗族</option>
                        <option value="维吾尔族">维吾尔族</option>
                        <option value="土家族">土家族</option>
                        <option value="彝族">彝族</option>
                        <option value="蒙古族">蒙古族</option>
                        <option value="藏族">藏族</option>
                        <option value="布依族">布依族</option>
                        <option value="侗族">侗族</option>
                        <option value="瑶族">瑶族</option>
                        <option value="朝鲜族">朝鲜族</option>
                        <option value="白族">白族</option>
                        <option value="哈尼族">哈尼族</option>
                        <option value="哈萨克族">哈萨克族</option>
                        <option value="黎族">黎族</option>
                        <option value="傣族">傣族</option>
                        <option value="畲族">畲族</option>
                        <option value="傈僳族">傈僳族</option>
                        <option value="仡佬族">仡佬族</option>
                        <option value="东乡族">东乡族</option>
                        <option value="高山族">高山族</option>
                        <option value="仡佬族">仡佬族</option>
                        <option value="拉祜族">拉祜族</option>
                        <option value="水族">水族</option>
                        <option value="佤族">佤族</option>
                        <option value="水族">水族</option>
                        <option value="纳西族">纳西族</option>
                        <option value="羌族">羌族</option>
                        <option value="土族">土族</option>
                        <option value="仫佬族">仫佬族</option>
                        <option value="锡伯族">锡伯族</option>
                        <option value="柯尔克孜族">柯尔克孜族</option>
                        <option value="达斡尔族">达斡尔族</option>
                        <option value="景颇族">景颇族</option>
                        <option value="毛南族">毛南族</option>
                        <option value="撒拉族">撒拉族</option>
                        <option value="布朗族">布朗族</option>
                        <option value="塔吉克族">塔吉克族</option>
                        <option value="阿昌族">阿昌族</option>
                        <option value="普米族">普米族</option>
                        <option value="鄂温克族">鄂温克族</option>
                        <option value="怒族">怒族</option>
                        <option value="京族">京族</option>
                        <option value="基诺族">基诺族</option>
                        <option value="德昂族">德昂族</option>
                        <option value="保安族">保安族</option>
                        <option value="俄罗斯族">俄罗斯族</option>
                        <option value="裕固族">裕固族</option>
                        <option value="乌孜别克族">乌孜别克族</option>
                        <option value="门巴族">门巴族</option>
                        <option value="鄂伦春族">鄂伦春族</option>
                        <option value="塔塔尔族">塔塔尔族</option>
                        <option value="赫哲族">赫哲族</option>
                        <option value="珞巴族">珞巴族</option>
                    </select>
                </div>
            </div>
        </div>
        <%--性别--%>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block" id="i-gender">
                    <input type="radio" name="gender" value="男" title="男" checked="">
                    <input type="radio" name="gender" value="女" title="女">
                </div>
            </div>
        </div>
        <%--第二行--%>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">学号</label>
                <div class="layui-input-inline">
                    <input type="text" name="sid" id="i-sid" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">学校</label>
                <div class="layui-input-inline">
                    <input type="text" name="school" id="i-school" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">院系</label>
                <div class="layui-input-inline">
                    <input type="text" name="collage" id="i-collage" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">专业</label>
                <div class="layui-input-inline">
                    <input type="text" name="major" id="i-major" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">班级</label>
                <div class="layui-input-inline">
                    <input type="text" name="grade" id="i-grade" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">政治面貌</label>
                <div class="layui-input-inline">
                    <select name="politics_status" id="i-ps">
                        <option value="中共党员">中共党员</option>
                        <option value="中共预备党员">中共预备党员</option>
                        <option value="共青团员">共青团员</option>
                        <option value="群众">群众</option>
                    </select>
                </div>
            </div>
        </div>
        <%--第三行--%>
        <div class="layui-form-item">
            <label class="layui-form-label">家庭住址</label>
            <div class="layui-inline">
                <%--<input type="text" name="address"  autocomplete="off" placeholder="请输入家庭住址" class="layui-input">--%>
                <textarea name="address" id="i-addr" rows="5" cols="25" autocomplete="off" placeholder="请输入家庭住址"
                          class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">QQ</label>
                <div class="layui-input-inline">
                    <input type="text" name="qq" id="i-qq" autocomplete="off" placeholder="请输入QQ号码"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-inline">
                    <input type="email" name="email" id="i-email" autocomplete="off" placeholder="请输入邮箱号码"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">手机号码</label>
                <div class="layui-input-inline">
                    <input type="tel" name="mobi" id="i-mobi" autocomplete="off" placeholder="请输入手机号码"
                           class="layui-input">
                </div>
            </div>
        </div>
    </form>
</div>

</body>
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
    // 新增
    function checkStuInfo() {
        var sidReg = /\d{12}/;
        var qqReg = /\d{5,11}/;
        var emailReg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        var mobiReg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;

        if ($("#i-sid").val().trim() == '') {
            layer.tips("学号不为空", "#i-sid");
            return false;
        }
        if (!sidReg.test($("#i-sid").val().trim())) {
            layer.tips("学号格式不正确", "#i-sid");
            return false;
        }
        if ($("#i-qq").val().trim() == '') {
            layer.tips("QQ号不为空", "#i-qq");
            return false;
        }
        if (!qqReg.test($("#i-qq").val().trim())) {
            layer.tips("QQ号格式不正确", "#i-qq");
            return false;
        }
        if ($("#i-email").val().trim() == '') {
            layer.tips("邮箱号不为空", "#i-email");
            return false;
        }
        if (!emailReg.test($("#i-email").val().trim())) {
            layer.tips("邮箱号格式不正确", "#i-email");
            return false;
        }
        if ($("#i-mobi").val().trim() == '') {
            layer.tips("邮箱号不为空", "#i-mobi");
            return false;
        }
        if (!mobiReg.test($("#i-mobi").val().trim())) {
            layer.tips("邮箱号格式不正确", "#i-mobi");
            return false;
        }
        return true;
    }

    function reset() {
        $("#i-name").val("");
        $("#i-birth").val("");
        $("#i-nation").find("option[value='汉族']").attr("checked", true);
        $("#i-sid").val("");
        $("#i-school").val("");
        $("#i-collage").val("");
        $("#i-grade").val("");
        $("#i-major").val("");
        $("#i-ps").find("option[value='中共党员']").attr("checked", true);
        $("#i-qq").val("");
        $("#i-email").val("");
        $("#i-mobi").val("");
        $("#i-addr").val("");
        $("#i-gender").find("input[value='男']").attr("checked", true);
    }

    function editStu(item) {
        $("#i-name").val(item.name);
        $("#i-birth").val(item.birth);
        var nation = item.nation;
        $("#i-nation").find("option[value=nation]").attr("checked", true);
        $("#i-sid").val(item.sid);
        $("#i-school").val(item.school);
        $("#i-collage").val(item.collage);
        $("#i-grade").val(item.grade);
        $("#i-major").val(item.major);
        var ps = item.politics_status;
        $("#i-ps").find("option[value=ps]").attr("checked", true);
        $("#i-qq").val(item.qq);
        $("#i-email").val(item.email);
        $("#i-mobi").val(item.mobi);
        $("#i-addr").val(item.address);
        var gender = item.gender;
        $("#i-gender").find("input[value=gender]").attr("checked", true);
      //  var url = "/user//updateInfo.action?id="+item.id;

        layer.open({
            type: 1,
            title: "编辑学生",
            shadeClose: false,
            shade: 0.3,
            area: ['390px', '550px'],
            content: $(".stu-box"),
            btn: ['提交', '取消'],
            btn1: function () {
                $("#stuBoxFm").ajaxSubmit({
                    url: "/user//updateInfo.action?id="+item.id,
                    beforeSubmit: checkStuInfo,
                    success: function (res) {
                        if (res.success) {
                            layer.alert("编辑学生成功");
                            layer.closeAll();
                            getStuList(10, 0);
                            pagination();
                        } else {
                            layer.alert("编辑学生失败，请稍后重试");
                        }
                    }
                });
            },
            btn2: function () {
                $(".stu-box").hide();
            },
            end: function () {
                $(".stu-box").hide();
            }
        });// 弹出层结束
    }

    $(".add-stu").click(function () {
        reset();
        layer.open({
            type: 1,
            title: "添加学生",
            shadeClose: false,
            shade: 0.3,
            area: ['390px', '550px'],
            content: $(".stu-box"),
            btn: ['提交', '取消'],
            btn1: function () {
                $("#stuBoxFm").ajaxSubmit({
                    url: "/user/addStu.action",
                    beforeSubmit: checkStuInfo,
                    success: function (res) {
                        if (res.success) {
                            layer.alert("添加学生成功");
                            layer.closeAll();
                            getStuList(10, 0);
                            pagination();
                        } else {
                            layer.alert("添加学生失败，请检查是否是学号不正确！");
                        }
                    }
                });
            },
            btn2: function () {
                $(".stu-box").hide();
            },
            end: function () {
                $(".stu-box").hide();
            }
        });// 弹出层结束
    });
// 新增结束
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
    });

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
            $.post("/user/delStu.action", {"id": id}, function (res) {
                if (res.success) {
                    layer.alert("成功删除！");
                    getStuList(10, 0);
                    pagination();
                } else {
                    layer.msg("网络繁忙，请稍后重试");
                }
            }, "json");
        });
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
                                "<td>" + item.mobi + "</td><td class='operation'><a href='javascript:;' onclick='delStu(" + item.id + ")' tip='删除'><i class='layui-icon' >&#xe640;</i></a><a href='javascript:;' tip='编辑' id='edtStu"+index+"'><i class='layui-icon'>&#xe642;</i></a><a href='/user/getStuById.action?id=" + item.id + "' tip='详情' target='_blank'><i class='layui-icon'>&#xe607;</i></td>" +
                                "</tr>");
                        // 新增 上面一行有修改
                        $("#edtStu"+index).click(function () {
                                    editStu(item);
                                }
                        );
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

</html>
