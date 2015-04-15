<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.miteno.myAccount.security.log.entity.Log"%>
<%
	pageContext.setAttribute("DEBUG",
			Log.EventLevel.DEBUG);
%>
<%
	pageContext.setAttribute("INFO",
			Log.EventLevel.INFO);
%>
<%
	pageContext.setAttribute("WARN",
			Log.EventLevel.WARN);
%>
<%
	pageContext.setAttribute("FATAL",
			Log.EventLevel.FATAL);
%>
<%
	pageContext.setAttribute("ERROR",
			Log.EventLevel.ERROR);
%>
<%
	pageContext.setAttribute("SUCCESS",
			Log.Result.SUCCESS);
%>
<%
	pageContext.setAttribute("FAIL",
			Log.Result.FAIL);
%>
<%
	pageContext.setAttribute("SECURITY",
			Log.EventType.SECURITY);
%>
<%
	pageContext.setAttribute("SYSTEM",
			Log.EventType.SYSTEM);
%>
<%
	pageContext.setAttribute("BUSINESS",
			Log.EventType.BUSINESS);
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>日志查询</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="日志查询">
<link href="resources/css5/jh.css" rel="stylesheet" type="text/css" />
<link href="resources/css5/jh.css" rel="stylesheet" type="text/css" />
<link href="resources/css5/ccb.css" rel="stylesheet" type="text/css" />
<link href="resources/css5/B.css" rel="stylesheet" type="text/css" />
<link href="resources/css5/tx.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="resources/js5/jquery/jquery.js"></script>
<script language="JavaScript" src="resources/js5/jh.js"></script>
</head>

<body>
<body bgcolor='#FFFFFF' text='#000000' leftmargin='0' topmargin='0'
	marginwidth='0' marginheight='0'>
	<table border="1" class="Table_N" cellspacing="0" cellpadding="5"
		align="center" width="100%">
		<tr class="Table_H">
			<td nowrap colspan="2" class="Table_H" height="30">日志查看： <font
				color="red"> </font></td>
		</tr>
		<tr>
			<td align="left" style="vertical-align: middle" width="15%">日志级别</td>
			<td>
			<c:choose>
			<c:when test="${log.log_level==DEBUG}">DEBUG</c:when>
			<c:when test="${log.log_level==INFO}">INFO</c:when>
			<c:when test="${log.log_level==WARN}">WARN</c:when>
			<c:when test="${log.log_level==FATAL}">FATAL</c:when>
			<c:when test="${log.log_level==ERROR}">ERROR</c:when>
			</c:choose>
			</td>
		</tr>
		<tr>
			<td align="left" style="vertical-align: middle" width="15%">事件时间</td>
			<td>${log.timestamp}</td>
		</tr>
		<tr>
			<td align="left" style="vertical-align: middle" width="15%">发起事件用户的会话标识</td>
			<td>${log.sessionId }</td>
		</tr>
		<tr>
			<td align="left" style="vertical-align: middle" width="15%">操作员编号</td>
			<td>${log.actorId }</td>
		</tr>
		<tr>
			<td align="left" style="vertical-align: middle" width="15%">访问的URL</td>
			<td>${log.url }</td>
		</tr>
		<tr>
			<td align="left" style="vertical-align: middle" width="15%">事件类型</td>
			<td>
			<c:choose>
						<c:when test="${log.eventType==SECURITY}">系统登录</c:when>
						<c:when test="${log.eventType==SYSTEM}">系统数据维护</c:when>
						<c:when test="${log.eventType==BUSINESS}">业务数据的维护</c:when>
						</c:choose>
			</td>
		</tr>
		
		<tr>
			<td align="left" style="vertical-align: middle" width="15%">动作</td>
			<td>${log.action }</td>
		</tr>
		<tr>
			<td align="left" style="vertical-align: middle" width="15%">事件名称</td>
			<td>${log.name }</td>
		</tr>
		<tr>
			<td align="left" style="vertical-align: middle" width="15%">实体类字符串</td>
			<td>${log.entityClass}</td>
		</tr>
		<tr>
		<td align="left" style="vertical-align: middle" width="15%">操作结果</td>
		<td>
		<c:choose>
			<c:when test="${log.result==SUCCESS}">成功</c:when>
			<c:when test="${log.result==FAIL}">失败</c:when>
			</c:choose>
			</td>
		</tr>
		<tr>
			<td align="left" style="vertical-align: middle" width="15%">操作内容或细节</td>
			<td>${log.detail }</td>
		</tr>
	</table>
	<input type="button" value="返回" class="button"
		onclick="javascript:history.go(-1)"  />
</body>
</html>
