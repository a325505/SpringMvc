<%@ page language="java" import="java.util.*" pageEncoding="gbk"  isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="entity.*" %>
<%@ page import="demo.*" %>
<%@ page import="servlet.*" %>
<html>
  <head>
<title>供应商详细信息页面</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/js.js"></script>
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">供应商详细信息页面&gt;&gt;</div>
	</div>
	<form id="form1" name="form1" method="post" action="XiugaiSupplier"  onsubmit="return provid();">
		<div class="content">
		<font color="red"></font>
<input name="flag" value="doAdd" type="hidden">
			<table class="box">

			<tbody><tr>
					<td class="field">供应商编号：</td>
					<td><input name="supId" id="supId" class="text" type="text" value="${s.supId}" readonly="readonly" style="background-color: gray"></td>
				</tr>
				<tr>
					<td class="field">供应商名称：</td>
					<td><input name="supName" value="${s.supName}" class="text" type="text" id="supName" ></td>

				</tr>
			<tr>
					<td class="field">供应商描述：</td>
					<td><textarea name="supMiaoshu" cols="45" rows="5" id="supMiaoshu" >${s.supMiaoshu}</textarea></td>
				</tr>
				<tr>
					<td class="field">供应商联系人：</td>

					<td><input name="supTelname" value="${s.supTelname}" class="text" type="text" id="supTelname" ></td>
				</tr>
				<tr>
					<td class="field">供应商电话：</td>
					<td><input name="supTel" value="${s.supTel}" class="text" type="text" id="supTel" ></td>
				</tr>
				<tr>
					<td class="field">供应商地址：</td>
					<td><input name="supAddr" value="${s.supAddr}" class="text" type="text" id="supAddr" ></td>
				</tr>
			</tbody></table>
		</div>

		<div class="buttons">
					<input type="button" id="button" onClick="history.back();" value="返回" class="input-button" /> 
			<input type="submit" id="button" value="修改" class="input-button" /> 
			<input type="button" id="button" value="删除" onClick="deletesupplier();" class="input-button" /> 
		</div>
	</form>
</div>
</body>
</html>
