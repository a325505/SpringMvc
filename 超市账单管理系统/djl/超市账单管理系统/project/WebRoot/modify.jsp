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
		<div class="title">添加账单信息页面&gt;&gt;</div>
	</div>
	<form method="post" action="billAdd" onsubmit="return bill()">
		<div class="content">
			<table class="box">
				<tr>
					<td class="field">交易金额：</td>
					<td><input type="text" name="billMoney" class="text" value="${b.billMoney}" id="bill_Money3" onBlur="bill_Money()" /> <span id="jyje" class="adduser">*</span></td>
				</tr>
				<tr>
					<td class="field">商品数量：</td>
					<td><input type="text" name="billNumber" class="text" value="${b.billNumber}" id="billNumber4" onBlur="billNumber1()" /> <span id="spsl" class="adduser">*</span></td>
				</tr>
				<tr>
					<td class="field">商品名称：</td>
					<td><input type="text" name="billName" class="text" value="${b.billName}"  id="billName" /></td>
				</tr>
				
				<tr>
					<td class="field">供应商名称：</td>
					<td>
					<select name="billSuplier">
					     <option value="0">----请选择----</option>
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
					<td class="field">商品描述：</td>
					<td><textarea name="billShopping"  id="billShopping" onblur="miao();" >${b.billShopping}</textarea></td>
				</tr>

				<tr>
					<td class="field">是否付款：</td>
					<td><select name="billIspay">
						<option value="1" selected="selected">是</option>
						<option value="0">否</option>
					</select></td>
				</tr>
			</table>
		</div>
		<div class="buttons">
			<input type="submit" name="submit" value="确认" class="input-button" />
			<input type="button" name="button" value="返回" class="input-button" onclick="history.back();" />
		</div>
	</form>
</div>