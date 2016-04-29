<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<html>
  <head>
 	<title>用户登录处理页面</title>
  </head>
  <body>
    <%
    	request.setCharacterEncoding("gbk");
    	String name=request.getParameter("userName");
    	String pwd=request.getParameter("password");
    	if(name==null||name.equals("")){
    	request.setAttribute("message","用户名不能为空");
    	request.getRequestDispatcher("login.jsp").forward(request,response);
    	}else if(pwd==null||pwd.equals("")){
    	request.setAttribute("message","密码不能为空");
    	request.getRequestDispatcher("login.jsp").forward(request,response);
    	}
     %>
  </body>
</html>
