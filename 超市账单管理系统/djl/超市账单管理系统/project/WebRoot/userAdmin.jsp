<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import="entity.*"%>
<%@ page import="demo.*"%>
<%@ page import="servlet.*"%>
<html><head>

<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>�û�����ҳ��</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript">
function doit(flag,id)
{
	if(flag=="del")
	{
		if(confirm("ȷ��ɾ����")!=true)
			return;
	}
}
</script>
</head>

<%
        UserOperate uot=new UserOperate();
        //��ȡ����
		int totaluser=uot.getCount();	
		//ÿҳ��ʾ��������
		int papeuser=3;
		//������ҳ��
		
		 int totalpage=totaluser%papeuser==0?totaluser/papeuser:totaluser/papeuser+1;
		//��ȡ��ǰ�ǵڼ�ҳ
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
�û����ƣ�<input name="userName" class="input-text" type="text" >&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="submit" value="��ѯ" class="button" /> <!--<input value="�� ѯ" type="submit">
--></form></td></tr>
</tbody></table>
</div>
<div class="main">

<div class="optitle clearfix">
<em><input value="�������" class="input-button" onclick="window.location='userAdd.jsp'" type="button"></em>
		<div class="title">�û�����&gt;&gt;</div>
	</div>
	<div class="content">
<table class="list">
  <tbody><tr>
    <td width="70" height="29"><div class="STYLE1" align="center">���</div></td>
    <td width="80"><div class="STYLE1" align="center">�û�����</div></td>
    <td width="100"><div class="STYLE1" align="center">�Ա�</div></td>
    <td width="100"><div class="STYLE1" align="center">����</div></td>

    <td width="150"><div class="STYLE1" align="center">�绰 </div></td>
    <td width="150"><div class="STYLE1" align="center">��ַ </div></td>
    <td width="150"><div class="STYLE1" align="center">Ȩ�� </div></td>
    <td width="150"><div class="STYLE1" align="center">���� </div></td>
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
			 <!--��ʾ��ת���� -->
        <c:if test="${pageScope.totalpage!=1}">
           <!--��ҳ��ʾ����ת���� -->
        <c:if test="${pageScope.page_no==1}">
            <p align="left">��[1/${pageScope.totalpage}]ҳ</p>
                  <a href="userAdmin.jsp?page_no=2">��һҳ</a>&nbsp;&nbsp;&nbsp;
                  <a href="userAdmin.jsp?page_no=${pageScope.totalpage}">���һҳ</a>
            <!--�м�ҳ��ʾ����ת���� -->
        </c:if>
        <c:if test="${pageScope.page_no>1&&pageScope.page_no<pageScope.totalpage}">
            <p align="left">��[${pageScope.page_no}/${pageScope.totalpage}]ҳ</p>
                  <a href="userAdmin.jsp?page_no=1">��һҳ</a>&nbsp;&nbsp;&nbsp;
                  <a href="userAdmin.jsp?page_no=${pageScope.page_no-1}">��һҳ</a>&nbsp;&nbsp;&nbsp;
                  <a href="userAdmin.jsp?page_no=${pageScope.page_no+1}">��һҳ</a>&nbsp;&nbsp;&nbsp;
                  <a href="userAdmin.jsp?page_no=${pageScope.totalpage}">���һҳ</a>
        </c:if>
            <!--ĩҳ��ʾ����ת���� -->
        <c:if test="${pageScope.page_no==pageScope.totalpage}">
             <p align="left">��[${pageScope.totalpage}/${pageScope.totalpage}]ҳ</p>
                  <a href="userAdmin.jsp?page_no=1">��һҳ</a>&nbsp;&nbsp;&nbsp;
                  <a href="userAdmin.jsp?page_no=${pageScope.totalpage-1}">��һҳ</a>
        </c:if>
        </c:if>	
		</div>
	</body></html>