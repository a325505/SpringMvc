<%@ page language="java" import="java.util.*" pageEncoding="gbk"  isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="entity.*" %>
<%@ page import="demo.*" %>
<%@ page import="servlet.*" %>
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
<title></title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript" src="js/bill.js"></script>
</head>
<body>
<div class="menu">
	<form method="post" action="BillFind" >  
		<br>��Ʒ���ƣ�
	</form>
</div>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">�˵���ϸ��Ϣҳ��&gt;&gt;</div>
	</div>
	<form method="post" id="bills" action="XiugaiBill"  onsubmit="return billsub();">
		<div class="content">
			<table class="box">
			<tr>
					<td class="field">�˵���ţ�</td>
					<td><input type="text" name="billId" class="text" value="${b.billId}"  id="billId" readonly="readonly" style="background-color: gray"/></td>
				</tr>
				<tr>
					<td class="field">���׽�</td>
					<td><input type="text" name="billMoney" class="text" value="${b.billMoney}" id="billMoney" /></td>
				</tr>
				<tr>
					<td class="field">��Ʒ������</td>
					<td><input type="text" name="billNumber" class="text" value="${b.billNumber}" id="billNumber" /></td>
				</tr>
				<tr>
					<td class="field">��Ʒ���ƣ�</td>
					<td><input type="text" name="billName" class="text" value="${b.billName}"  id="billName" /></td>
				</tr>
				<tr>
					<td class="field">��Ӧ�����ƣ�</td>
					<td><select name=billSuplier id="billSuplier">
					<c:if test="${b.billSuplier== 1}">
						<option value="1" selected="selected">�Ǻ�</option>
					    <option value="2">����</option>
					    <option value="3">�ٺ�</option>
					    <option value="4">�ú�</option>
					</c:if>
					<c:if test="${b.billSuplier== 2}">
						<option value="2" selected="selected">����</option>
					    <option value="1">�Ǻ�</option>
					    <option value="3">�ٺ�</option>
					    <option value="4">�ú�</option>
					</c:if>
					<c:if test="${b.billSuplier== 3}">
						<option value="2">����</option>
					    <option value="1">�Ǻ�</option>
					    <option value="3" selected="selected">�ٺ�</option>
					    <option value="4">�ú�</option>
					</c:if>
					<c:if test="${b.billSuplier== 4}">
						<option value="2">����</option>
					    <option value="1">�Ǻ�</option>
					    <option value="3">�ٺ�</option>
					    <option value="4" selected="selected">�ú�</option>
					</c:if>
					  </select>
					 </td>
				</tr>
				<!--<tr>
					<td class="field">��Ӧ�����ƣ�</td>
					<td><input type="text" name="billSuplier" class="text" value="${b.billSuplier}" id="billSuplier" /></td>
				</tr>
				--><tr>
					<td class="field">��Ʒ������</td>
					<td><textarea name="billShopping"  id="billShopping" onblur="miao();" >${b.billShopping}</textarea></td>
				</tr>

				<tr>
					<td class="field">�Ƿ񸶿</td>
					<td><select name="billIspay" >
					<c:if test="${b.billIspay == 1 }">
						<option value="0">��</option>
						<option value="1" selected="selected">��</option>
						</c:if>
						<c:if test="${b.billIspay == 0}">
						<option value="0" selected="selected">��</option>
						<option value="1">��</option>
						</c:if>
					</select></td>
				</tr>
			</table>
		</div>
		<div class="buttons">
			<input type="button" value="����" class="input-button" onClick="history.back();" />
			<input type="submit"  value="�޸�" class="input-button" />
			<input type="button" id="button"  value="ɾ��" onClick="deletebill()" class="input-button" /> 	
		</div>

	</form>
</div>
</body>
</html>
