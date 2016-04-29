<%@ page language="java" import="java.util.*" pageEncoding="gbk"  isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="entity.*" %>
<%@ page import="demo.*" %>
<%@ page import="servlet.*" %>
<html>
  <head>
   <title>修改用户密码页面</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/js.js"></script>
  </head>
  <%
	String userId = request.getParameter("userId");
%>
 <body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">用户管理&gt;&gt;</div>

	</div>
	<form id="form1" name="form1" method="post" action="XiugaiPassword" onsubmit="return szpassword()">
		<div class="content">
			<table class="box">
			<tr>
					<td class="field">新的密码：<input type="hidden" name="userId" value="<%=userId %>" /></td>		
					<td><input type="password" name="userPassword" class="text" id="setPassword" onBlur="setpassword1();" /><span id="szmm" class="adduser">*</span></td>
				</tr>		

				<tr>
					<td class="field">确认密码：</td>
					<td><input type="password" name="userPassword1" class="text" id="setPassword1" onBlur="setpassword2();" /><span id="szmm1" class="adduser">*</span></td>
				</tr>
			</table>
		</div>
		<div class="buttons">	
			<input type="submit" name="button" id="button" value="修改密码" class="input-button"/>
			<input type="button" name="button" id="button" onclick="history.back();" value="返回" class="input-button"/> 
		</div>
	</form>
</div>
</body>
</html>