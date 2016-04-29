<%@ page language="java" import="java.util.*" pageEncoding="gbk"  isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="entity.*" %>
<%@ page import="demo.*" %>
<%@ page import="servlet.*" %>
<html>
  <head>
   <title>用户详细信息页面</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/js.js"></script>
  </head>
 <body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">用户详细信息页面&gt;&gt;</div>

	</div>
	<form id="form1" name="form1" method="post" action="XiugaiUser" onSubmit="return jj();">
		<input type="hidden" name="flag" value="doAdd">
		<div class="content">
			<table class="box">
			<tr>
					<td class="field">用户编号：</td>
					<td><input type="text" name="userId" id="userId" class="text" value="${u.userId}" readonly="readonly" style="background-color: gray"/>
					<input type="hidden" id="userPassword"  value="${u.userPassword}" /></td>
				</tr>
			<tr>
					<td class="field">用户名称：
					</td>		
					<td><input type="text" name="username" class="text" value="${u.userName}" id="username"/></td>
				</tr>		
				<tr>
					<td class="field">用户性别：</td>
					<td><select name=userGender id="userGender">
					<c:if test="${u.userGender== 0}">
						<option value="0" selected="selected">女</option>
					    <option value="1">男</option>
					</c:if>
					<c:if test="${u.userGender == 1}">
						<option value="0">女</option>
					    <option value="1" selected="selected">男</option>
					</c:if>

					  </select>
					 </td>
				</tr>

				<tr>
					<td class="field">用户年龄：</td>
					<td><input type="text" name="userAge" value="${u.userAge}" class="text" id="userAge" /></td>
				</tr>
				<tr>
					<td class="field">用户电话：</td>
					<td><input type="text" name="userTel" value="${u.userTel}" class="text" id="userTel" /></td>

				</tr>
				<tr>
					<td class="field">用户地址：</td>
					<td><textarea name="userAddress"  class="text" cols="45" rows="5" id="userAddress" >${u.userAddress}</textarea></td>
				</tr>
				<tr>
					<td class="field">用户权限：</td>
					<td>
					<input type="radio" name="userRole" id="userRole" value="${u.userRole}" checked="checked"/>
					<c:if test="${u.userRole==0}">
					普通用户
					</c:if>
					<c:if test="${u.userRole==1}">
					经理
					</c:if>
					
					</td>
				</tr>
			</table>
		</div>
		<div class="buttons">
					<input type="button" name="button" id="button" onclick="history.back();" value="返回" class="input-button"/> 
			<input type="submit" name="button" id="button" value="修改" class="input-button" />
			<input type="button" id="button" value="删除" onClick="deleteuser()" class="input-button" /> 
			<input type="button" name="button" id="button" value="修改密码" onClick="xiugaipassword()" class="input-button"/>
		</div>
	</form>
</div>
</body>
</html>