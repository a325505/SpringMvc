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
		<br>商品名称：
	</form>
</div>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">账单详细信息页面&gt;&gt;</div>
	</div>
	<form method="post" id="bills" action="XiugaiBill"  onsubmit="return billsub();">
		<div class="content">
			<table class="box">
			<tr>
					<td class="field">账单编号：</td>
					<td><input type="text" name="billId" class="text" value="${b.billId}"  id="billId" readonly="readonly" style="background-color: gray"/></td>
				</tr>
				<tr>
					<td class="field">交易金额：</td>
					<td><input type="text" name="billMoney" class="text" value="${b.billMoney}" id="billMoney" /></td>
				</tr>
				<tr>
					<td class="field">商品数量：</td>
					<td><input type="text" name="billNumber" class="text" value="${b.billNumber}" id="billNumber" /></td>
				</tr>
				<tr>
					<td class="field">商品名称：</td>
					<td><input type="text" name="billName" class="text" value="${b.billName}"  id="billName" /></td>
				</tr>
				<tr>
					<td class="field">供应商名称：</td>
					<td><select name=billSuplier id="billSuplier">
					<c:if test="${b.billSuplier== 1}">
						<option value="1" selected="selected">呵呵</option>
					    <option value="2">哈哈</option>
					    <option value="3">嘿嘿</option>
					    <option value="4">好好</option>
					</c:if>
					<c:if test="${b.billSuplier== 2}">
						<option value="2" selected="selected">哈哈</option>
					    <option value="1">呵呵</option>
					    <option value="3">嘿嘿</option>
					    <option value="4">好好</option>
					</c:if>
					<c:if test="${b.billSuplier== 3}">
						<option value="2">哈哈</option>
					    <option value="1">呵呵</option>
					    <option value="3" selected="selected">嘿嘿</option>
					    <option value="4">好好</option>
					</c:if>
					<c:if test="${b.billSuplier== 4}">
						<option value="2">哈哈</option>
					    <option value="1">呵呵</option>
					    <option value="3">嘿嘿</option>
					    <option value="4" selected="selected">好好</option>
					</c:if>
					  </select>
					 </td>
				</tr>
				<!--<tr>
					<td class="field">供应商名称：</td>
					<td><input type="text" name="billSuplier" class="text" value="${b.billSuplier}" id="billSuplier" /></td>
				</tr>
				--><tr>
					<td class="field">商品描述：</td>
					<td><textarea name="billShopping"  id="billShopping" onblur="miao();" >${b.billShopping}</textarea></td>
				</tr>

				<tr>
					<td class="field">是否付款：</td>
					<td><select name="billIspay" >
					<c:if test="${b.billIspay == 1 }">
						<option value="0">否</option>
						<option value="1" selected="selected">是</option>
						</c:if>
						<c:if test="${b.billIspay == 0}">
						<option value="0" selected="selected">否</option>
						<option value="1">是</option>
						</c:if>
					</select></td>
				</tr>
			</table>
		</div>
		<div class="buttons">
			<input type="button" value="返回" class="input-button" onClick="history.back();" />
			<input type="submit"  value="修改" class="input-button" />
			<input type="button" id="button"  value="删除" onClick="deletebill()" class="input-button" /> 	
		</div>

	</form>
</div>
</body>
</html>
