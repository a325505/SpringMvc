<%@ page language="java" import="java.util.*" pageEncoding="gbk"  isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="entity.*" %>
<%@ page import="demo.*" %>
<%@ page import="servlet.*" %>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>ϵͳ��¼ - �����˵�����ϵͳ</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body class="blue-style">
<div id="login">
	<div class="icon"></div>
	<div class="login-box">
		<form method="post" action="Login">
			<dl>
				<dt>�û�����</dt>
				<dd><input type="text" name="userName" class="input-text" /></dd>
				<dt>�ܡ��룺</dt>
				<dd><input type="password" name="passWord" class="input-text" /></dd>
			</dl>
			<div class="buttons">
				<input type="submit" value="��¼ϵͳ" class="input-button" />
				<input type="reset"  value="�ء�����" class="input-button" />
			</div>
			<c:if test="${flag!=null}">
					<div align="right" style="color:#F00; margin-top:8px;">${flag}</div>
			</c:if>
		</form>
	</div>
</div>
</body>
</html>