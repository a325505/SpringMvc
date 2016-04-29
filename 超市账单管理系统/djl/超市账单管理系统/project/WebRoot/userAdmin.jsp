<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import="entity.*"%>
<%@ page import="demo.*"%>
<%@ page import="servlet.*"%>
<html><head>

<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>用户管理页面</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript">
function doit(flag,id)
{
	if(flag=="del")
	{
		if(confirm("确认删除吗？")!=true)
			return;
	}
}
</script>
</head>

<%
        UserOperate uot=new UserOperate();
        //获取总数
		int totaluser=uot.getCount();	
		//每页显示的数据数
		int papeuser=3;
		//计算总页数
		
		 int totalpage=totaluser%papeuser==0?totaluser/papeuser:totaluser/papeuser+1;
		//获取当前是第几页
		String page_str=request.getParameter("page_no");
		if(page_str==null)
		    page_str="1";
		int page_no=Integer.valueOf(page_str);	     
        List<User> users=uot.select(page_no,papeuser);
		pageContext.setAttribute("users",users);
		pageContext.setAttribute("page_no",page_no);
		pageContext.setAttribute("totalpage",totalpage);	
	%>
<body>




<div class="menu">

<table>
<tbody><tr><td><form method="post" action="UserFind">
<input name="flag" value="search" class="input-text" type="hidden">
用户名称：<input name="userName" class="input-text" type="text" >&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="submit" value="查询" class="button" /> <!--<input value="查 询" type="submit">
--></form></td></tr>
</tbody></table>
</div>
<div class="main">

<div class="optitle clearfix">
<em><input value="添加数据" class="input-button" onclick="window.location='userAdd.jsp'" type="button"></em>
		<div class="title">用户管理&gt;&gt;</div>
	</div>
	<div class="content">
<table class="list">
  <tbody><tr>
    <td width="70" height="29"><div class="STYLE1" align="center">编号</div></td>
    <td width="80"><div class="STYLE1" align="center">用户名称</div></td>
    <td width="100"><div class="STYLE1" align="center">性别</div></td>
    <td width="100"><div class="STYLE1" align="center">年龄</div></td>

    <td width="150"><div class="STYLE1" align="center">电话 </div></td>
    <td width="150"><div class="STYLE1" align="center">地址 </div></td>
    <td width="150"><div class="STYLE1" align="center">权限 </div></td>
    <td width="150"><div class="STYLE1" align="center">密码 </div></td>
  </tr>
  <tr/>
						<c:forEach var="users" items="${pageScope.users}">
							<td>${users.userId}</td>
							<td><a href="UserUpdate?Uid=${users.userId}">${users.userName}</a></td>			
							<td>${users.userGender}</td>
							<td>${users.userAge}</td>
							<td>${users.userTel}</td>
							<td>${users.userAddress}</td>
							<td>${users.userRole}</td>
							<td>${users.userPassword}</td>
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
                  <a href="userAdmin.jsp?page_no=2">下一页</a>&nbsp;&nbsp;&nbsp;
                  <a href="userAdmin.jsp?page_no=${pageScope.totalpage}">最后一页</a>
            <!--中间页显示的跳转连接 -->
        </c:if>
        <c:if test="${pageScope.page_no>1&&pageScope.page_no<pageScope.totalpage}">
            <p align="left">第[${pageScope.page_no}/${pageScope.totalpage}]页</p>
                  <a href="userAdmin.jsp?page_no=1">第一页</a>&nbsp;&nbsp;&nbsp;
                  <a href="userAdmin.jsp?page_no=${pageScope.page_no-1}">上一页</a>&nbsp;&nbsp;&nbsp;
                  <a href="userAdmin.jsp?page_no=${pageScope.page_no+1}">下一页</a>&nbsp;&nbsp;&nbsp;
                  <a href="userAdmin.jsp?page_no=${pageScope.totalpage}">最后一页</a>
        </c:if>
            <!--末页显示的跳转连接 -->
        <c:if test="${pageScope.page_no==pageScope.totalpage}">
             <p align="left">第[${pageScope.totalpage}/${pageScope.totalpage}]页</p>
                  <a href="userAdmin.jsp?page_no=1">第一页</a>&nbsp;&nbsp;&nbsp;
                  <a href="userAdmin.jsp?page_no=${pageScope.totalpage-1}">上一页</a>
        </c:if>
        </c:if>	
		</div>
	</body></html>