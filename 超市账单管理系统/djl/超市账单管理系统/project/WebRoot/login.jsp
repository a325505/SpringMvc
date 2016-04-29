<%@ page language="java" import="java.util.*" pageEncoding="gbk"  isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="entity.*" %>
<%@ page import="demo.*" %>
<%@ page import="servlet.*" %>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>系统登录 - 超市账单管理系统</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body class="blue-style">
<div id="login">
	<div class="icon"></div>
	<div class="login-box">
		<form method="post" action="Login">
			<dl>
				<dt>用户名：</dt>
				<dd><input type="text" name="userName" class="input-text" /></dd>
				<dt>密　码：</dt>
				<dd><input type="password" name="passWord" class="input-text" /></dd>
			</dl>
			<div class="buttons">
				<input type="submit" value="登录系统" class="input-button" />
				<input type="reset"  value="重　　填" class="input-button" />
			</div>
			<c:if test="${flag!=null}">
					<div align="right" style="color:#F00; margin-top:8px;">${flag}</div>
			</c:if>
		</form>
	</div>
</div>
</body>
</html>