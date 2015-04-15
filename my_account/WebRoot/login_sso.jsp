<%@page import="com.miteno.framework.spring.CustomizedPropertyPlaceholderConfigurer"%>
<%@page import="org.springframework.core.env.Environment"%>
<%@page import="org.springframework.beans.factory.config.PropertyPlaceholderConfigurer"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>访问禁止</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <script type="text/javascript">
      var login_url="${login_url}";
       top.location=login_url;
  </script>
  
  <body>
  <%
	String login_url = CustomizedPropertyPlaceholderConfigurer.getContextProperty("cas.localLoginUrl")+"";
	request.setAttribute("login_url", login_url);
   %>
  
  <% 
    System.out.println("bms login_sso ..."+login_url);
	request.setCharacterEncoding("UTF-8");
	response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
	response.setCharacterEncoding("UTF-8");
	//response.sendRedirect(login_url);
	%>
	
  </body>
</html>
