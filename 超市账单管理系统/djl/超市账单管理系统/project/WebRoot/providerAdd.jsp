<%@ page language="java" import="java.util.*" pageEncoding="gbk"  isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="entity.*" %>
<%@ page import="demo.*" %>
<%@ page import="servlet.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>账单添加</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/js.js"></script>
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">添加供应商信息页面&gt;&gt;</div>
	</div>
	<form id="form1" name="form1" method="post" action="providerAdd" onsubmit=" ">
		<div class="content">
		<font color="red"></font>
<input name="flag" value="doAdd" type="hidden">
			<table class="box">

			<tbody>
			<tr>
					<td class="field">供应商名称：</td>
					<td><input name="supName" id="supName" class="text" type="text" onBlur="supNames();" /> <span id="gysmc" class="adduser">*</span></td>

				</tr>
			<tr>
					<td class="field">供应商描述：</td>
					<td><textarea name="supMiaoshu" id="supMiaoshu" cols="45" rows="5"></textarea></td>
				</tr>
				<tr>
					<td class="field">供应商联系人：</td>

					<td><input name="supTelname" id="supTelname" value="" class="text" type="text"></td>
				</tr>
				<tr>
					<td class="field">供应商电话：</td>
					<td><input name="supTel" id="supTel" value="" class="text" type="text"></td>
				</tr>
				<tr>
					<td class="field">供应商地址：</td>
					<td><input name="supAddr" id="supAddr" value="" class="text" type="text"></td>
				</tr>
			</tbody></table>
		</div>

		<div class="buttons">
			<input name="button" id="button" value="提交" class="input-button" type="submit"> 
			<input name="button" id="button" onclick="history.back();" value="返回" class="input-button" type="button"> 
		</div>
	</form>
</div>
</body>
</html>
