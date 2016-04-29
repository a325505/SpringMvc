<%@ page language="java" import="java.util.*" pageEncoding="gbk"  isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="entity.*" %>
<%@ page import="demo.*" %>
<%@ page import="servlet.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title></title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/js.js"></script>
</head>
<%
    BillOperate b=new BillOperate();
	List<Supplier> ls =b.getSupName();
    request.setAttribute("sup",ls);
%>
<body>

<div class="main">
	<div class="optitle clearfix">
		<div class="title">����˵���Ϣҳ��&gt;&gt;</div>
	</div>
	<form method="post" action="billAdd" onsubmit="return bill()">
		<div class="content">
			<table class="box">
				<tr>
					<td class="field">���׽�</td>
					<td><input type="text" name="billMoney" class="text" value="${b.billMoney}" id="bill_Money3" onBlur="bill_Money()" /> <span id="jyje" class="adduser">*</span></td>
				</tr>
				<tr>
					<td class="field">��Ʒ������</td>
					<td><input type="text" name="billNumber" class="text" value="${b.billNumber}" id="billNumber4" onBlur="billNumber1()" /> <span id="spsl" class="adduser">*</span></td>
				</tr>
				<tr>
					<td class="field">��Ʒ���ƣ�</td>
					<td><input type="text" name="billName" class="text" value="${b.billName}"  id="billName" /></td>
				</tr>
				
				<tr>
					<td class="field">��Ӧ�����ƣ�</td>
					<td>
					<select name="billSuplier">
					     <option value="0">----��ѡ��----</option>
						<c:forEach var="sup" items="${sup}">	
						  <c:if test="${sup.supId != null}">		
							    <option value="${sup.supId}">${sup.supName}</option>
						    </c:if>	
						   </c:forEach>
						   </select>
					</td>
					<!--<td><input type="text" name="billSuplier" class="text" value="${b.billSuplier}" id="billSuplier" /></td>
				--></tr>
				<tr>
					<td class="field">��Ʒ������</td>
					<td><textarea name="billShopping"  id="billShopping" onblur="miao();" >${b.billShopping}</textarea></td>
				</tr>

				<tr>
					<td class="field">�Ƿ񸶿</td>
					<td><select name="billIspay">
						<option value="1" selected="selected">��</option>
						<option value="0">��</option>
					</select></td>
				</tr>
			</table>
		</div>
		<div class="buttons">
			<input type="submit" name="submit" value="ȷ��" class="input-button" />
			<input type="button" name="button" value="����" class="input-button" onclick="history.back();" />
		</div>
	</form>
</div>