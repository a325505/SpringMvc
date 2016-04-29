<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import="entity.*"%>
<%@ page import="demo.*"%>
<%@ page import="servlet.*"%>
<html >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>�˵�����</title>
		<link type="text/css" rel="stylesheet" href="css/style.css" />
	</head>
	<%
        BillOperate dot=new BillOperate();
        //��ȡ����
		int totalbill=dot.getCount();	
		//ÿҳ��ʾ��������
		int papebill=3;
		//������ҳ��
		
		 int totalpage=totalbill%papebill==0?totalbill/papebill:totalbill/papebill+1;
		//��ȡ��ǰ�ǵڼ�ҳ
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
			<form method="post" action="BillFind">
				��Ʒ���ƣ�
				<input type="text" name="productName" class="input-text" value="${param.productName}" />
				&nbsp;&nbsp;&nbsp;&nbsp; �Ƿ񸶿
				<select name="payStatus">
				<c:if test="${payStatus == '0'}">
						<option value="0" selected="selected">δ����</option>
					    <option value="1">�Ѹ���</option>
					</c:if>
					<c:if test="${payStatus == '1'}">
						<option value="0">δ����</option>
					    <option value="1" selected="selected">�Ѹ���</option>
					</c:if>
					<%--<option value="${payStatus}">��ѡ��</option>
					<option value="1">�Ѹ���</option>
					<option value="0">δ����</option>
				--%></select>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" name="submit" value="��ϲ�ѯ" class="button" />
			</form>
		</div>
		<div class="main">
			<div class="optitle clearfix">
				<em><input type="button" name="button" value="�������"
						class="input-button" onclick="location.href='modify.jsp'" /> </em>
				<div class="title">
					�˵�����&gt;&gt;
				</div>
			</div>
			<div class="content">
				<table class="list">
					<tr>
						<td>�˵����</td>
						<td>��Ʒ����</td>
						<td>��Ʒ����</td>
						<td>���׽��</td>
						<td>�Ƿ񸶿�</td>
						<td>��Ӧ������</td>
						<td>��Ʒ����</td>
						<td>�˵�ʱ��</td>
					</tr>
					<tr/>
						<c:forEach var="Bills" items="${Bills}">
							<td>${Bills.billId}</td>
							<td><a href="BillUpdate?bId=${Bills.billId}">${Bills.billName}</a></td>
							<td>${Bills.billNumber}</td>
							<td>${Bills.billMoney}</td>
							<td>${Bills.billIspay}</td>
							<td>${Bills.billSuplier}</td>
							<td>${Bills.billShopping}</td>
							<td>${Bills.billTime}</td>
							<tr>
						</c:forEach>
					</tr>
				</table>
			</div>
			 <!--��ʾ��ת���� -->
        <c:if test="${pageScope.totalpage!=1}">
           <!--��ҳ��ʾ����ת���� -->
        <c:if test="${pageScope.page_no==1}">
            <p align="left">��[1/${pageScope.totalpage}]ҳ</p>
                  <a href="admin_bill_list.jsp?page_no=2">��һҳ</a>&nbsp;&nbsp;&nbsp;
                  <a href="admin_bill_list.jsp?page_no=${pageScope.totalpage}">���һҳ</a>
            <!--�м�ҳ��ʾ����ת���� -->
        </c:if>
        <c:if test="${pageScope.page_no>1&&pageScope.page_no<pageScope.totalpage}">
            <p align="left">��[${pageScope.page_no}/${pageScope.totalpage}]ҳ</p>
                  <a href="admin_bill_list.jsp?page_no=1">��һҳ</a>&nbsp;&nbsp;&nbsp;
                  <a href="admin_bill_list.jsp?page_no=${pageScope.page_no-1}">��һҳ</a>&nbsp;&nbsp;&nbsp;
                  <a href="admin_bill_list.jsp?page_no=${pageScope.page_no+1}">��һҳ</a>&nbsp;&nbsp;&nbsp;
                  <a href="admin_bill_list.jsp?page_no=${pageScope.totalpage}">���һҳ</a>
        </c:if>
            <!--ĩҳ��ʾ����ת���� -->
        <c:if test="${pageScope.page_no==pageScope.totalpage}">
             <p align="left">��[${pageScope.totalpage}/${pageScope.totalpage}]ҳ</p>
                  <a href="admin_bill_list.jsp?page_no=1">��һҳ</a>&nbsp;&nbsp;&nbsp;
                  <a href="admin_bill_list.jsp?page_no=${pageScope.totalpage-1}">��һҳ</a>
        </c:if>
        </c:if>	
		</div>
	</body>
</html>
