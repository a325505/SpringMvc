<%@ page language="java" contentType="text/html;charset=gbk"%>
<html>
	<head>
		<title>用户登录处理页面</title>
		<script language="javaScript">
function checkUserInfo() {
	if (document.myform.userName.value == "") {
		alert("用户名不能为空");
		return false;
	}
	if (document.myform.password.value == "") {
		alert("密码不能为空");
		return false;
	}
}
</script>
	</head>
	<form name="myform" method="post" action="control.jsp"
		onsubmit="return checkUserInfo()">
		<table>
			<tr>
				<td>
					用户名：
				</td>
				<td>
					<input type="text" name="userName" id="userName" />
				</td>
			</tr>
			<tr>
				<td>
					密码：
				</td>
				<td>
					<input type="password" name="password" id="password" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="登录">
				</td>
			</tr>
		</table>
	</form>
</html>
