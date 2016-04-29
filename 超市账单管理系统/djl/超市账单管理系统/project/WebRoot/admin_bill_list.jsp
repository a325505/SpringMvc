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
			<form method="post" action="BillFind" >
				��Ʒ���ƣ�
				<input type="text" name="productName" class="input-text" value="${param.productName}"/>
				&nbsp;&nbsp;&nbsp;&nbsp; �Ƿ񸶿
				<select name="payStatus" >
					<option value="">��ѡ��</option>
					<option value="1">�Ѹ���</option>
					<option value="0">δ����</option>
				</select>
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
