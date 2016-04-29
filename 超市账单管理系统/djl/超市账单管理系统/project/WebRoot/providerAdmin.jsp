<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import="entity.*"%>
<%@ page import="demo.*"%>
<%@ page import="servlet.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>供应商管理</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript">
function doit(flag,id)
{
	if(flag=="del")
	{
		if(confirm("确认删除吗？")!=true)
			return;
	}
	window.location = "provider.do?id="+id+"&flag="+flag;
}
</script>
</head>
<%
        SupplierOperate sot=new SupplierOperate();
        //获取总数
		int totalsup=sot.getCount();	
		//每页显示的数据数
		int papesup=3;
		//计算总页数
		
		 int totalpage=totalsup%papesup==0?totalsup/papesup:totalsup/papesup+1;
		//获取当前是第几页
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
供应商名称：<input name="providerName" class="input-text" type="text"> &nbsp;&nbsp;&nbsp;&nbsp;
供应商描述：<input name="providerDesc" class="input-text" type="text">&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="组合查询" class="button" />
<!--<input value="组 合 查 询" type="submit">
--></form></td></tr>
</tbody></table>
</div>
<div class="main">
<div class="optitle clearfix">
<em><input value="添加数据" class="input-button" onclick="window.location='providerAdd.jsp'" type="button"></em>
		<div class="title">供应商管理&gt;&gt;</div>
	</div>

	<div class="content">
<table class="list">
  <tbody><tr>
    <td width="70" height="29"><div class="STYLE1" align="center">编号</div></td>
    <td width="80"><div class="STYLE1" align="center">供应商名称</div></td>
    <td width="100"><div class="STYLE1" align="center">供应商描述</div></td>
    <td width="100"><div class="STYLE1" align="center">联系人</div></td>

    <td width="100"><div class="STYLE1" align="center">电话</div></td>
    <td width="100"><div class="STYLE1" align="center">地址</div></td>
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
			<!--显示跳转连接 -->
        <c:if test="${pageScope.totalpage!=1}">
           <!--首页显示的跳转连接 -->
        <c:if test="${pageScope.page_no==1}">
            <p align="left">第[1/${pageScope.totalpage}]页</p>
                  <a href="providerAdmin.jsp?page_no=2">下一页</a>&nbsp;&nbsp;&nbsp;
                  <a href="providerAdmin.jsp?page_no=${pageScope.totalpage}">最后一页</a>
            <!--中间页显示的跳转连接 -->
        </c:if>
        <c:if test="${pageScope.page_no>1&&pageScope.page_no<pageScope.totalpage}">
            <p align="left">第[${pageScope.page_no}/${pageScope.totalpage}]页</p>
                  <a href="providerAdmin.jsp?page_no=1">第一页</a>&nbsp;&nbsp;&nbsp;
                  <a href="providerAdmin.jsp?page_no=${pageScope.page_no-1}">上一页</a>&nbsp;&nbsp;&nbsp;
                  <a href="providerAdmin.jsp?page_no=${pageScope.page_no+1}">下一页</a>&nbsp;&nbsp;&nbsp;
                  <a href="providerAdmin.jsp?page_no=${pageScope.totalpage}">最后一页</a>
        </c:if>
            <!--末页显示的跳转连接 -->
        <c:if test="${pageScope.page_no==pageScope.totalpage}">
             <p align="left">第[${pageScope.totalpage}/${pageScope.totalpage}]页</p>
                  <a href="providerAdmin.jsp?page_no=1">第一页</a>&nbsp;&nbsp;&nbsp;
                  <a href="providerAdmin.jsp?page_no=${pageScope.totalpage-1}">上一页</a>
        </c:if>
        </c:if>	
		</div>
	</body>
</html>
