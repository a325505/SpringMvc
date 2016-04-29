<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
    <c:set var="ctx" value="http://${header['host']}${pageContext.request.contextPath}"></c:set>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<!-- 新 Bootstrap 核心 CSS 文件 -->  
    <link rel="stylesheet" type="text/css" href="${ctx }/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="${ctx }/css/smartadmin-production_unminified.css">
    <link rel="stylesheet" type="text/css" media="screen" href="${ctx }/css/base.css">
    <link rel="stylesheet" href="${ctx }/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="shortcut icon" href="${ctx }/img/favicon/favicon.ico" type="image/x-icon">
    <link rel="icon" href="${ctx }/img/favicon/favicon.ico" type="image/x-icon">
</head>
<script type="text/javascript" src="${ctx }/js/jquery-1.8.1.min.js"></script>
  <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <script src="${ctx }/js/libs/jquery-ui-1.10.3.min.js"></script>

    <!-- JARVIS WIDGETS -->
    <script src="${ctx }/js/smartwidgets/jarvis.widget.min.js"></script>


    <!-------datatables Jquery plugin-------->
    <script src="${ctx }/js/plugin/datatables/jquery.dataTables-cust.js"></script>
    <script src="${ctx }/js/plugin/datatables/DT_bootstrap.js"></script>

    <!-- MAIN APP JS FILE -->
    <script src="${ctx }/js/app.js"></script>

    <!-- MAIN COMMON JS FILE -->
    <script src="${ctx }/js/common.js"></script>
    <script src="${ctx }/js/ie8.js"></script>
    <script type="text/javascript" src="${ctx }/js/plugin/bootstrap-datetimepicker/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${ctx }/js/plugin/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

    <link rel="stylesheet" type="text/css" media="screen" href="${ctx }/css/bootstrap/bootstrap-datetimepicker.css">
    
    <title>用户列表</title>
    
	<script type="text/javascript">
	function del(id){
		$.get("${ctx}/user/delUser?id=" + id,function(data){
			if("success" == data.result){
				alert("删除成功");
				window.location.reload();
			}else{
				alert("删除失败");
			}
		});
	}
</script>
  </head>
  
  <body>
    <h6><a href="${ctx }/user/toAddUser">添加用户</a></h6>
	<table border="1">
		<tbody>
			<tr>
				<th>姓名</th>
				<th>密码</th>
				<th>操作</th>
			</tr>
			<c:if test="${!empty userList }">
				<c:forEach items="${userList}" var="user">
					<tr>
						<td>${user.userName }</td>
						<td>${user.password }</td>
						<td>
							<a href="${ctx }/user/getUser?id=${user.id}">编辑</a>
							<a href="javascript:del('${user.id }')">删除</a>
						</td>
					</tr>				
				</c:forEach>
			</c:if>
		</tbody>
	</table>
  </body>
</html>
