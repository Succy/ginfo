<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件上传测试</title>
</head>
<body>
<form action="/user/uploadAvatar.action" method="post" enctype="multipart/form-data">
    <input type="file" name="avatarFile" value="打开文件"/>
    <input type="submit" value="上传">
</form>
</body>
</html>
