<%@ page language="java" import="java.util.*" pageEncoding="gbk"  isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="entity.*" %>
<%@ page import="demo.*" %>
<%@ page import="servlet.*" %>
<html>
  <head>
   <title>�޸��û�����ҳ��</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/js.js"></script>
  </head>
  <%
	String userId = request.getParameter("userId");
%>
 <body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">�û�����&gt;&gt;</div>

	</div>
	<form id="form1" name="form1" method="post" action="XiugaiPassword" onsubmit="return szpassword()">
		<div class="content">
			<table class="box">
			<tr>
					<td class="field">�µ����룺<input type="hidden" name="userId" value="<%=userId %>" /></td>		
					<td><input type="password" name="userPassword" class="text" id="setPassword" onBlur="setpassword1();" /><span id="szmm" class="adduser">*</span></td>
				</tr>		

				<tr>
					<td class="field">ȷ�����룺</td>
					<td><input type="password" name="userPassword1" class="text" id="setPassword1" onBlur="setpassword2();" /><span id="szmm1" class="adduser">*</span></td>
				</tr>
			</table>
		</div>
		<div class="buttons">	
			<input type="submit" name="button" id="button" value="�޸�����" class="input-button"/>
			<input type="button" name="button" id="button" onclick="history.back();" value="����" class="input-button"/> 
		</div>
	</form>
</div>
</body>
</html>