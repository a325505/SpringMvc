<%@ page language="java" contentType="text/html;charset=gbk"%>
<html>
	<head>
		<title>�û���¼����ҳ��</title>
		<script language="javaScript">
function checkUserInfo() {
	if (document.myform.userName.value == "") {
		alert("�û�������Ϊ��");
		return false;
	}
	if (document.myform.password.value == "") {
		alert("���벻��Ϊ��");
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
					�û�����
				</td>
				<td>
					<input type="text" name="userName" id="userName" />
				</td>
			</tr>
			<tr>
				<td>
					���룺
				</td>
				<td>
					<input type="password" name="password" id="password" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="��¼">
				</td>
			</tr>
		</table>
	</form>
</html>
