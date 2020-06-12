<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="loginHtml">
<head>
	<meta charset="utf-8">
	<title>登录-汽车出租系统</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="icon" href="../../../../statics/favicon.ico">
	<link rel="stylesheet" href="../../../../statics/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="../../../../statics/css/public.css" media="all" />
</head>
<body class="loginBody">
	<form class="layui-form"  id="loginFrm" method="post" action="${requestScope.contextPath}/userLogin/login">
		<div class="login_face"><img src="../../../../statics/images/face.jpg" class="userAvatar"></div>
		<div class="layui-form-item input-item">
			<label for="loginName">用户名</label>
			<input type="text" placeholder="请输入用户名" id="loginName" autocomplete="off" name="loginName" class="layui-input" lay-verify="required">
		</div>
		<div class="layui-form-item input-item">
			<label for="pwd">密码</label>
			<input type="password" placeholder="请输入密码"  id="pwd" autocomplete="off" name="pwd" class="layui-input" lay-verify="required">
		</div>
		<div class="layui-form-item input-item" id="imgCode">
			<label for="code">验证码</label>
			<input type="text" placeholder="请输入验证码" autocomplete="off" name="verifyCode" id="code" class="layui-input">
			<img src="${requestScope.contextPath}/userLogin/getVerifyCode" onclick="this.src=this.src+'?'">
		</div>
		<div class="layui-form-item">
			<button class="layui-btn layui-block" lay-filter="login" lay-submit>登录</button>
		</div>
		<div class="layui-form-item layui-row" style="text-align: center;color: red">
            ${error}
			<%--<a href="javascript:;" class="seraph icon-qq layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
			<a href="javascript:;" class="seraph icon-wechat layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
			<a href="javascript:;" class="seraph icon-sina layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>--%>
		</div>
	</form>
	<script type="text/javascript" src="../../../../statics/layui/layui.js"></script>
	<script type="text/javascript" src="../../../../statics/page/login/login.js"></script>
	<script type="text/javascript" src="../../../../statics/js/cache.js"></script>
</body>
</html>