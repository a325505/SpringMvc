<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<html>
  <head>
 	<title>�û���¼����ҳ��</title>
  </head>
  <body>
    <%
    	request.setCharacterEncoding("gbk");
    	String name=request.getParameter("userName");
    	String pwd=request.getParameter("password");
    	if(name==null||name.equals("")){
    	request.setAttribute("message","�û�������Ϊ��");
    	request.getRequestDispatcher("login.jsp").forward(request,response);
    	}else if(pwd==null||pwd.equals("")){
    	request.setAttribute("message","���벻��Ϊ��");
    	request.getRequestDispatcher("login.jsp").forward(request,response);
    	}
     %>
  </body>
</html>
