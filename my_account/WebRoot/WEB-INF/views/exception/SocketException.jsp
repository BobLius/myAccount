<%@page import="org.apache.commons.lang.exception.ExceptionUtils"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.lang.Exception"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>出错了-SocketException</title>
	</head>
	<body>
		<%Exception ex=(Exception)request.getAttribute("exception");%>
			WEB服务器与交易系统通讯异常<%=ex.getMessage() %>，请重试或检查网络
		<%
			Logger logger = Logger.getLogger(this.getClass());
			logger.error(ExceptionUtils.getFullStackTrace(ex));
		%>
		 <a href="javascript:history.go(-1)">返回上一页</a>
	</body>
</html>
