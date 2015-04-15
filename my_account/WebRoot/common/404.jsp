<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>页面缺失</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="resources/css5/jh.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
    很抱歉,你所请求的页面不存在！ 具体如下：<br/>
地址： <%=request.getAttribute("javax.servlet.forward.request_uri") %> <br/>
 页面：   ${pageContext.request.requestURL} 不存在!<br>
  </body>
</html>
