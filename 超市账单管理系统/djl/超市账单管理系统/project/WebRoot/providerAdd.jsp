<%@ page language="java" import="java.util.*" pageEncoding="gbk"  isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="entity.*" %>
<%@ page import="demo.*" %>
<%@ page import="servlet.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>�˵����</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/js.js"></script>
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">��ӹ�Ӧ����Ϣҳ��&gt;&gt;</div>
	</div>
	<form id="form1" name="form1" method="post" action="providerAdd" onsubmit=" ">
		<div class="content">
		<font color="red"></font>
<input name="flag" value="doAdd" type="hidden">
			<table class="box">

			<tbody>
			<tr>
					<td class="field">��Ӧ�����ƣ�</td>
					<td><input name="supName" id="supName" class="text" type="text" onBlur="supNames();" /> <span id="gysmc" class="adduser">*</span></td>

				</tr>
			<tr>
					<td class="field">��Ӧ��������</td>
					<td><textarea name="supMiaoshu" id="supMiaoshu" cols="45" rows="5"></textarea></td>
				</tr>
				<tr>
					<td class="field">��Ӧ����ϵ�ˣ�</td>

					<td><input name="supTelname" id="supTelname" value="" class="text" type="text"></td>
				</tr>
				<tr>
					<td class="field">��Ӧ�̵绰��</td>
					<td><input name="supTel" id="supTel" value="" class="text" type="text"></td>
				</tr>
				<tr>
					<td class="field">��Ӧ�̵�ַ��</td>
					<td><input name="supAddr" id="supAddr" value="" class="text" type="text"></td>
				</tr>
			</tbody></table>
		</div>

		<div class="buttons">
			<input name="button" id="button" value="�ύ" class="input-button" type="submit"> 
			<input name="button" id="button" onclick="history.back();" value="����" class="input-button" type="button"> 
		</div>
	</form>
</div>
</body>
</html>
