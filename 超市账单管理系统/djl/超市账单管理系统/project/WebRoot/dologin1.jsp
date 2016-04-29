<%@ page language="java" contentType="text/html;charset=gbk"%>
<%@ page import="java.sql.*"%>
<html>
	<%
request.setCharacterEncoding("gbk");

Connection con=null;
Statement stmt=null;
ResultSet res=null;
Class.forName("Oracle.jbdc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","system");
String sql="select*from name where adminer";
stmt=con.createStatement();
res=stmt.executeQuery(sql);
while(res.next()){
	String name=res.getString("name");
	String password=res.getString("password");
}


res.close();
stmt.close();
con.close();
 %>
	<head>

	</head>

	<body>
		This is my JSP page.
		<br>
	</body>
</html>
