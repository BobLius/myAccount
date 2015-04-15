<%@page import="org.apache.commons.lang.exception.ExceptionUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
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
		<title>出错了-DataIntegrity</title>
	</head>
	<body>
		
		<%
			Exception ex=(Exception)request.getAttribute("exception");
			String exStr = ExceptionUtils.getFullStackTrace(ex);
			int startIndex = StringUtils.indexOf(exStr, "ORA");
			int endIndex = StringUtils.indexOf(exStr, '-', startIndex+5);
			String contraintsMsg = StringUtils.substring(exStr,startIndex, endIndex);
		
			if(StringUtils.contains(exStr, "ORA-01400")){
				out.println(contraintsMsg+"<br/> 数据存在异常，包含空值！");	
			}else if(StringUtils.contains(exStr, "ORA-02292")){
				out.println(contraintsMsg+"<br/>请在删除基本资料前确定是否还存在与基本资料相关的参数记录，如果有，请先删除相关记录后，再删除基本资料");
			}if(StringUtils.contains(exStr, "ORA-01438")){
				out.println(contraintsMsg+"<br/>数据精度输入过大");
			}else if(StringUtils.contains(exStr, "ORA-00001")){
				out.println(contraintsMsg+"<br/>记录重复");
			}else{
				out.println(contraintsMsg+"<br/>");
			}
		
		%>
		<a href="javascript:history.go(-1)">返回上一页</a>
		<%--<%=ex.getLocalizedMessage() %>--%>
		<%--<%ex.printStackTrace(new PrintWriter(out));%>
	--%></body>
</html>
