<%@ page language="java" import="java.util.*" pageEncoding="gbk"  isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="entity.*" %>
<%@ page import="demo.*" %>
<%@ page import="servlet.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>�û����</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/js.js"></script>
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">����û���Ϣҳ��&gt;&gt;</div>

	</div>
	<form id="form1" name="form1" method="post" action="userAdd" onsubmit="return checkuser();">
<input type="hidden" name="flag" value="doAdd">
		<div class="content">
			<table class="box">
			<tr>
					<td class="field">�û����ƣ�</td>
					<td><input type="text" name="username" class="text" id="username" onBlur="usersname();" /> <span id="yhmc" class="adduser">*</span></td>
				</tr>
				<tr>
					<td class="field">�û����룺</td>
					<td><input type="password" name="password" class="text" id="password" onBlur="userpassword();" /> <span id="yhmm" class="adduser">*</span></td>
				</tr>
			<tr>
					<td class="field">ȷ�����룺</td>
					<td><input type="password" name="password1" class="text" id="password1" onBlur="userpassword1();"/> <span id="yhmm1" class="adduser">*</span></td>
				</tr>

				<tr>
					<td class="field">�û��Ա�</td>
					<td><select name="sex" id="select">
    <option value="0">Ů</option>
    <option value="1">��</option>
  </select></td>
				</tr>

				<tr>
					<td class="field">�û����䣺</td>
					<td><input type="text" name="age" class="text" id="age" onBlur="userage();" /> <span id="yhnl" class="adduser">*</span></td>
				</tr>
				<tr>
					<td class="field">�û��绰��</td>
					<td><input type="text" name="mobile" class="text" id="mobile" onBlur="usermobile();" /> <span id="yhdh" class="adduser">*</span></td>

				</tr>
				<tr>
					<td class="field">�û���ַ��</td>
					<td><textarea name="address" id="address" class="text" cols="45" rows="5" ></textarea> <span id="yhdz"> </span></td>
				</tr>
				<tr>
					<td class="field">�û�Ȩ�ޣ�</td>

					<td><input type="radio" name="userRole" id="userRole" value="0" checked="checked"/>��ͨ�û�
					<input type="radio" name="userRole" id="userRole" value="1" />����</td>
				</tr>
			</table>
		</div>
		<div class="buttons">
			<input type="submit" name="button" id="button" value="�����ύ" class="input-button"/>
			  <input type="button" name="button" id="button" onclick="history.back();" value="����" class="input-button"/> 
		</div>

	</form>
</div>
</body>
</html>
