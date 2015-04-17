<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>访问禁止</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("logoutUrl", basePath+"j_spring_cas_security_logout");

%>

<script type="text/javascript">
        var logoutUrl = "${logoutUrl}";
        var statusCode="${statusCode}";
	    if(statusCode=="403"){
	           top.location=logoutUrl;
	     }
	        
 </script>
  </head>
  
  <body>
  <% 
  
    System.out.println("  对不起,你没有权限访问该页面!!");
	request.setCharacterEncoding("UTF-8");
	response.setStatus(HttpServletResponse.SC_FORBIDDEN);
	System.out.println(" application 对不起,你没有权限访问该页面!!");
	//application.getRequestDispatcher(basePath+"j_spring_cas_security_logout").forward(request, response);
	 //response.sendRedirect(basePath+"j_spring_cas_security_logout");
	%>
    对不起,你没有权限访问该页面!! 请<a href="j_spring_cas_security_logout" target="_top">注销</a>后重新登录
  </body>
</html>
