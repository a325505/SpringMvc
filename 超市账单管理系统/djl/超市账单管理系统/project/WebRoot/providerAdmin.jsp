<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import="entity.*"%>
<%@ page import="demo.*"%>
<%@ page import="servlet.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>��Ӧ�̹���</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript">
function doit(flag,id)
{
	if(flag=="del")
	{
		if(confirm("ȷ��ɾ����")!=true)
			return;
	}
	window.location = "provider.do?id="+id+"&flag="+flag;
}
</script>
</head>
<%
        SupplierOperate sot=new SupplierOperate();
        //��ȡ����
		int totalsup=sot.getCount();	
		//ÿҳ��ʾ��������
		int papesup=3;
		//������ҳ��
		
		 int totalpage=totalsup%papesup==0?totalsup/papesup:totalsup/papesup+1;
		//��ȡ��ǰ�ǵڼ�ҳ
		String page_str=request.getParameter("page_no");
		if(page_str==null)
		    page_str="1";
		int page_no=Integer.valueOf(page_str);	     
        List<Supplier> sups=sot.select(page_no,papesup);
		pageContext.setAttribute("sups",sups);
		pageContext.setAttribute("page_no",page_no);
		pageContext.setAttribute("totalpage",totalpage);	
	%>
<body>
<div class="menu">

<table>
<tbody><tr><td><form method="post" action="SupplierFind">
<input name="flag" value="search" type="hidden">
��Ӧ�����ƣ�<input name="providerName" class="input-text" type="text"> &nbsp;&nbsp;&nbsp;&nbsp;
��Ӧ��������<input name="providerDesc" class="input-text" type="text">&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="��ϲ�ѯ" class="button" />
<!--<input value="�� �� �� ѯ" type="submit">
--></form></td></tr>
</tbody></table>
</div>
<div class="main">
<div class="optitle clearfix">
<em><input value="�������" class="input-button" onclick="window.location='providerAdd.jsp'" type="button"></em>
		<div class="title">��Ӧ�̹���&gt;&gt;</div>
	</div>

	<div class="content">
<table class="list">
  <tbody><tr>
    <td width="70" height="29"><div class="STYLE1" align="center">���</div></td>
    <td width="80"><div class="STYLE1" align="center">��Ӧ������</div></td>
    <td width="100"><div class="STYLE1" align="center">��Ӧ������</div></td>
    <td width="100"><div class="STYLE1" align="center">��ϵ��</div></td>

    <td width="100"><div class="STYLE1" align="center">�绰</div></td>
    <td width="100"><div class="STYLE1" align="center">��ַ</div></td>
  </tr>
<tr/>
						<c:forEach var="sups" items="${pageScope.sups}">
							<td>${sups.supId}</td>
							<td><a href="SupplierUpdate?SupId=${sups.supId}">${sups.supName}</a></td>
							<td>${sups.supMiaoshu}</td>
							<td>${sups.supTelname}</td>
							<td>${sups.supTel}</td>
							<td>${sups.supAddr}</td>
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
                  <a href="providerAdmin.jsp?page_no=2">��һҳ</a>&nbsp;&nbsp;&nbsp;
                  <a href="providerAdmin.jsp?page_no=${pageScope.totalpage}">���һҳ</a>
            <!--�м�ҳ��ʾ����ת���� -->
        </c:if>
        <c:if test="${pageScope.page_no>1&&pageScope.page_no<pageScope.totalpage}">
            <p align="left">��[${pageScope.page_no}/${pageScope.totalpage}]ҳ</p>
                  <a href="providerAdmin.jsp?page_no=1">��һҳ</a>&nbsp;&nbsp;&nbsp;
                  <a href="providerAdmin.jsp?page_no=${pageScope.page_no-1}">��һҳ</a>&nbsp;&nbsp;&nbsp;
                  <a href="providerAdmin.jsp?page_no=${pageScope.page_no+1}">��һҳ</a>&nbsp;&nbsp;&nbsp;
                  <a href="providerAdmin.jsp?page_no=${pageScope.totalpage}">���һҳ</a>
        </c:if>
            <!--ĩҳ��ʾ����ת���� -->
        <c:if test="${pageScope.page_no==pageScope.totalpage}">
             <p align="left">��[${pageScope.totalpage}/${pageScope.totalpage}]ҳ</p>
                  <a href="providerAdmin.jsp?page_no=1">��һҳ</a>&nbsp;&nbsp;&nbsp;
                  <a href="providerAdmin.jsp?page_no=${pageScope.totalpage-1}">��һҳ</a>
        </c:if>
        </c:if>	
		</div>
	</body>
</html>
