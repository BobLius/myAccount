<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<link href="resources/css5/jh.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/ccb.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/B.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/tx.css" rel="stylesheet" type="text/css" />
	
	<script language="JavaScript" src="resources/js5/jquery/jquery.js"></script>
	<script language="JavaScript" src="resources/js5/jh.js"></script>
	<script type="text/javascript" src="common/pager/jquery.pager.js"></script>
	<script type="text/javascript" src="common/pager/list.js"></script>
  </head>
  
 <body bgcolor='#FFFFFF' text='#000000' leftmargin='0' topmargin='0'
	marginwidth='0' marginheight='0'>
	<h3>欢迎使用系统</h3>
  </body>
</html>
