<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import="entity.*"%>
<%@ page import="demo.*"%>
<%@ page import="servlet.*"%>
<html >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>账单管理</title>
		<link type="text/css" rel="stylesheet" href="css/style.css" />
	</head>
	<%
        BillOperate dot=new BillOperate();
        //获取总数
		int totalbill=dot.getCount();	
		//每页显示的数据数
		int papebill=3;
		//计算总页数
		
		 int totalpage=totalbill%papebill==0?totalbill/papebill:totalbill/papebill+1;
		//获取当前是第几页
		String page_str=request.getParameter("page_no");
		if(page_str==null)
		    page_str="1";
		int page_no=Integer.valueOf(page_str);	     
        List<Bill> bills=dot.select(page_no,papebill);
		pageContext.setAttribute("bills",bills);
		pageContext.setAttribute("page_no",page_no);
		pageContext.setAttribute("totalpage",totalpage);	
	%>
	<body>
		<div class="menu">
			<form method="post" action="BillFind" >
				商品名称：
				<input type="text" name="productName" class="input-text" value="${param.productName}"/>
				&nbsp;&nbsp;&nbsp;&nbsp; 是否付款：
				<select name="payStatus" >
					<option value="">请选择</option>
					<option value="1">已付款</option>
					<option value="0">未付款</option>
				</select>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" name="submit" value="组合查询" class="button" />
			</form>
		</div>
		<div class="main">
			<div class="optitle clearfix">
				<em><input type="button" name="button" value="添加数据"
						class="input-button" onclick="location.href='modify.jsp'" /> </em>
				<div class="title">
					账单管理&gt;&gt;
				</div>
			</div>
			<div class="content">
				<table class="list">
					<tr>
						<td>账单编号</td>
						<td>商品名称</td>
						<td>商品数量</td>
						<td>交易金额</td>
						<td>是否付款</td>
						<td>供应商名称</td>
						<td>商品描述</td>
						<td>账单时间</td>
					</tr>
					<tr/>
						<c:forEach var="bills" items="${pageScope.bills}">
							<td>${bills.billId}</td>
							<td><a href="BillUpdate?bId=${bills.billId}">${bills.billName}</a></td>
							<td>${bills.billNumber}</td>
							<td>${bills.billMoney}</td>
							<td>${bills.billIspay}</td>
							<td>${bills.billSuplier}</td>
							<td>${bills.billShopping}</td>
							<td>${bills.billTime}</td>
							<tr>
						</c:forEach>
					</tr>
				</table>
			</div>
			 <!--显示跳转连接 -->
        <c:if test="${pageScope.totalpage!=1}">
           <!--首页显示的跳转连接 -->
        <c:if test="${pageScope.page_no==1}">
            <p align="left">第[1/${pageScope.totalpage}]页</p>
                  <a href="admin_bill_list.jsp?page_no=2">下一页</a>&nbsp;&nbsp;&nbsp;
                  <a href="admin_bill_list.jsp?page_no=${pageScope.totalpage}">最后一页</a>
            <!--中间页显示的跳转连接 -->
        </c:if>
        <c:if test="${pageScope.page_no>1&&pageScope.page_no<pageScope.totalpage}">
            <p align="left">第[${pageScope.page_no}/${pageScope.totalpage}]页</p>
                  <a href="admin_bill_list.jsp?page_no=1">第一页</a>&nbsp;&nbsp;&nbsp;
                  <a href="admin_bill_list.jsp?page_no=${pageScope.page_no-1}">上一页</a>&nbsp;&nbsp;&nbsp;
                  <a href="admin_bill_list.jsp?page_no=${pageScope.page_no+1}">下一页</a>&nbsp;&nbsp;&nbsp;
                  <a href="admin_bill_list.jsp?page_no=${pageScope.totalpage}">最后一页</a>
        </c:if>
            <!--末页显示的跳转连接 -->
        <c:if test="${pageScope.page_no==pageScope.totalpage}">
             <p align="left">第[${pageScope.totalpage}/${pageScope.totalpage}]页</p>
                  <a href="admin_bill_list.jsp?page_no=1">第一页</a>&nbsp;&nbsp;&nbsp;
                  <a href="admin_bill_list.jsp?page_no=${pageScope.totalpage-1}">上一页</a>
        </c:if>
        </c:if>	
		</div>
	</body>
</html>
