<%@page import="org.hibernate.exception.GenericJDBCException"%>
<%@page import="org.apache.commons.lang.exception.ExceptionUtils"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html;charset=utf-8"
	isErrorPage="true"%>
<%@ page import="java.io.*,java.util.*"%>
	<% 
	request.setCharacterEncoding("UTF-8");
	response.setStatus(HttpServletResponse.SC_OK);
	response.setCharacterEncoding("UTF-8");
	%>
<body>
	<hr width=80%>
	程序发生了错误，请联系管理员	<br /> <a href="javascript:history.go(-1)">返回上一页</a>
	<h2>
		<font color=#DB1260>系统正忙......</font>
	</h2>
	<%		
			out.println(exception.getMessage());
	%>
	<%
			Logger logger = Logger.getLogger(this.getClass());
			logger.error(ExceptionUtils.getFullStackTrace(exception));
	%>
</html>
