<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>非法字符页面提示</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   		 您提交的请求中含有非法字符 ,请检查是否包含如下禁用字符：，and，exec，execute，insert，create，drop，table，from，grant，use，group_concat，column_name， +
        		information_schema.columns，table_schema，union，where，select，delete，update，order，by，count，*， +
        		chr，mid，master，truncate，char，declare，or，-，--，+，like，/，%，# 
   		<a href="#" onclick="javascript:top.history.go(-1);">返回</a>
  </body>
</html>
