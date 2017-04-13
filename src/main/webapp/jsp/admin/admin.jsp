<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>后台管理系统</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<!-- load css -->
	<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css" >
	<link rel="stylesheet" type="text/css" href="../../css/global.css">
	<link rel="stylesheet" type="text/css" href="../../css/adminstyle.css">
	<%--<link rel="stylesheet" type="text/css" href="../../css/commons.css">--%>

</head>

<body>
	<div class="layui-layout layui-layout-admin" id="layui_layout">
		<!-- 顶部区域 -->
		<div class="layui-header header header-demo">
			<div class="layui-main">
				<!-- logo区域 -->
				<div class="admin-logo-box">
                    <div class="larry-side-menu">
                        <i class="fa fa-bars" aria-hidden="true"></i>
                    </div>
                    <a class="logo" href="javascript:;" title="logo">后台管理系统</a>
				</div>
				<!-- 右侧导航 -->
				<ul class="layui-nav larry-header-item">
                    <li class="layui-nav-item">
                        <input type="hidden" id="admId" value="${admin.id}">
                        <a href="javascript:;" id="modify-pwd">
                            <i class="iconfont icon-iconfuzhi01" data-icon='icon-iconfuzhi01'></i> 修改密码
                        </a>
                    </li>
					<li class="layui-nav-item">
						<a href="/user/logout.action?isStu=false">
							<i class="iconfont icon-exit"></i> 退出
						</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- 左侧侧边导航开始 -->
		<div class="layui-side layui-side-bg layui-larry-side" id="larry-side">
			<div class="layui-side-scroll" id="larry-nav-side" lay-filter="side">
				<!-- 左侧菜单 -->
				<ul class="layui-nav layui-nav-tree">
					<li class="layui-nav-item layui-this">
						<a href="javascript:;" data-url="jsp/admin/main.jsp">
							<i class="iconfont icon-home1" data-icon='icon-home1'></i>
							<span>后台首页</span>
						</a>
					</li>
					<!-- 用户管理 -->
					<li class="layui-nav-item">
						<a href="javascript:;">
							<i class="iconfont icon-jiaoseguanli2"></i>
							<span>学生管理</span>
							<em class="layui-nav-more"></em>
						</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" data-url="jsp/admin/studentList.jsp">
									<i class="iconfont icon-yonghu1" data-icon='icon-yonghu1'></i>
									<span>学生列表</span>
								</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>

		<!-- 左侧侧边导航结束 -->
		<!-- 右侧主体内容 -->
		<div class="layui-body" id="larry-body" style="bottom: 0;border-left: solid 2px #1AA094;">
			<div class="layui-tab layui-tab-card larry-tab-box" id="larry-tab" lay-filter="demo" lay-allowclose="true">
				<ul class="layui-tab-title">
					<li class="layui-this" id="admin-home"><i class="iconfont icon-diannao1"></i><em>后台首页</em></li>
				</ul>
				<div class="layui-tab-content" style="min-height: 150px; ">
					<div class="layui-tab-item layui-show">
						<iframe class="larry-iframe" data-id='0' src="jsp/admin/main.jsp"></iframe>
					</div>
				</div>
			</div>


		</div>
		<!-- 底部区域 -->
		<div class="layui-footer layui-larry-foot" id="larry-footer">
			<p class="p-admin">
				<span>2017 &copy;</span> <a href="/">www.wcj.com</a>. 版权所有
			</p>
			<!--</div>-->
		</div>
	</div>

    <div id="modify-pwd-box">
        <form method="post">
            <div class="form-item">
                <input type="password" name="sid" class="form-ctrl" id="oldPwd" placeholder="请输入旧密码">
            </div>
            <div class="form-item">
                <input type="password" name="password" class="form-ctrl" id="newPwd" placeholder="请输入新密码">
            </div>
            <div class="form-item">
                <input type="password" name="password" class="form-ctrl" id="confirm" placeholder="请再次确认密码">
            </div>
        </form>
    </div>
	<!-- 加载js文件-->
    <script src="../../js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="../../layui/layui.all.js"></script>
	<script type="text/javascript" src="../../js/larryAdmin.js"></script>
	<script type="text/javascript" src="../../js/indexAdmin.js"></script>



</body>
</html>