<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import="entity.*"%>
<%@ page import="demo.*"%>
<%@ page import="servlet.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title></title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/js.js"></script>
</head>
<body class="frame-bd">
<ul class="left-menu">
	<li><a href="admin_bill_list.jsp" target="mainFrame"><img src="images/btn_bill.gif" /></a></li>
<c:if test="${sessionScope.userRole == '1'}">
	<li><a href="providerAdmin.jsp" target="mainFrame"><img src="images/btn_suppliers.gif" /></a></li>
	<li><a href="userAdmin.jsp" target="mainFrame"><img src="images/btn_users.gif" /></a></li>
	</c:if>

	<li><a href="#" onClick="exit_confirm()"><img src="images/btn_exit.gif" /></a></li>
</ul>
</body>
</html>
