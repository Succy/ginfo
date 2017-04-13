'use strict';
layui.use(['jquery', 'layer', 'element'], function () {
    window.jQuery = window.$ = layui.jquery;
    window.layer = layui.layer;
    var element = layui.element();

// larry-side-menu向左折叠
    $('.larry-side-menu').click(function () {
        var sideWidth = $('#larry-side').width();
        if (sideWidth === 200) {
            $('#larry-body').animate({
                left: '0'
            }); //admin-footer
            $('#larry-footer').animate({
                left: '0'
            });
            $('#larry-side').animate({
                width: '0'
            });
        } else {
            $('#larry-body').animate({
                left: '200px'
            });
            $('#larry-footer').animate({
                left: '200px'
            });
            $('#larry-side').animate({
                width: '200px'
            });
        }
    });


    $(function () {
        // 刷新iframe操作
        $("#refresh_iframe").click(function () {
            $(".layui-tab-content .layui-tab-item").each(function () {
                if ($(this).hasClass('layui-show')) {
                    $(this).children('iframe')[0].contentWindow.location.reload(true);
                }
            });
        });
        function validate() {
            if ($("#oldPwd").val().trim() == "") {
                layer.tips("请输入密码", "#oldPwd");
                return false;
            }
            if ($("#newPwd").val().trim() == "") {
                layer.tips("请输入新密码", "#newPwd");
                return false;
            }
            if ($("#confirm").val().trim() == "") {
                layer.tips("请再次输入密码", "#confirm");
                return false;
            }
            if ($("#newPwd").val().trim() != $("#confirm").val().trim()) {
                layer.msg("两次输入密码不正确");
                return false;
            }
            return true;
        }

        $("#modify-pwd").on("click", function () {
            layer.open({
                type: 1,
                title: '修改密码',
                shadeClose: false,
                shade: 0.3,
                area: ['315px', '295px'],
                content: $("#modify-pwd-box"),
                btn: ['确认修改'],
                btn1: function () {
                    if (validate()) {
                        $.post("/user/updatePwd.action", {
                            "id": $("#admId").val().trim(),
                            "oldPwd": $("#oldPwd").val().trim(),
                            "newPwd": $("#newPwd").val().trim(),
                            "isStu": false
                        }, function (result) {
                            if (result.success) {
                                layer.msg(result.msg, function () {
                                    layer.closeAll();
                                });
                            } else {
                                layer.msg(result.msg);
                            }
                        }, "json");
                    }
                },
                end: function () {
                    $("#modify-pwd-box").hide();
                }
            });
        });
    });


});
