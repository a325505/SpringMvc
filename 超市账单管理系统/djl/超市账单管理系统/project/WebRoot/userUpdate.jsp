<%@ page language="java" import="java.util.*" pageEncoding="gbk"  isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="entity.*" %>
<%@ page import="demo.*" %>
<%@ page import="servlet.*" %>
<html>
  <head>
   <title>�û���ϸ��Ϣҳ��</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/js.js"></script>
  </head>
 <body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">�û���ϸ��Ϣҳ��&gt;&gt;</div>

	</div>
	<form id="form1" name="form1" method="post" action="XiugaiUser" onSubmit="return jj();">
		<input type="hidden" name="flag" value="doAdd">
		<div class="content">
			<table class="box">
			<tr>
					<td class="field">�û���ţ�</td>
					<td><input type="text" name="userId" id="userId" class="text" value="${u.userId}" readonly="readonly" style="background-color: gray"/>
					<input type="hidden" id="userPassword"  value="${u.userPassword}" /></td>
				</tr>
			<tr>
					<td class="field">�û����ƣ�
					</td>		
					<td><input type="text" name="username" class="text" value="${u.userName}" id="username"/></td>
				</tr>		
				<tr>
					<td class="field">�û��Ա�</td>
					<td><select name=userGender id="userGender">
					<c:if test="${u.userGender== 0}">
						<option value="0" selected="selected">Ů</option>
					    <option value="1">��</option>
					</c:if>
					<c:if test="${u.userGender == 1}">
						<option value="0">Ů</option>
					    <option value="1" selected="selected">��</option>
					</c:if>

					  </select>
					 </td>
				</tr>

				<tr>
					<td class="field">�û����䣺</td>
					<td><input type="text" name="userAge" value="${u.userAge}" class="text" id="userAge" /></td>
				</tr>
				<tr>
					<td class="field">�û��绰��</td>
					<td><input type="text" name="userTel" value="${u.userTel}" class="text" id="userTel" /></td>

				</tr>
				<tr>
					<td class="field">�û���ַ��</td>
					<td><textarea name="userAddress"  class="text" cols="45" rows="5" id="userAddress" >${u.userAddress}</textarea></td>
				</tr>
				<tr>
					<td class="field">�û�Ȩ�ޣ�</td>
					<td>
					<input type="radio" name="userRole" id="userRole" value="${u.userRole}" checked="checked"/>
					<c:if test="${u.userRole==0}">
					��ͨ�û�
					</c:if>
					<c:if test="${u.userRole==1}">
					����
					</c:if>
					
					</td>
				</tr>
			</table>
		</div>
		<div class="buttons">
					<input type="button" name="button" id="button" onclick="history.back();" value="����" class="input-button"/> 
			<input type="submit" name="button" id="button" value="�޸�" class="input-button" />
			<input type="button" id="button" value="ɾ��" onClick="deleteuser()" class="input-button" /> 
			<input type="button" name="button" id="button" value="�޸�����" onClick="xiugaipassword()" class="input-button"/>
		</div>
	</form>
</div>
</body>
</html>