<%@page import="com.miteno.myAccount.security.user.entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户信息查看</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="用户信息查看">
	<link href="resources/css5/jh.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/ccb.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/B.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/tx.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="resources/js5/jquery/jquery.js"></script>
	<script language="JavaScript" src="resources/js5/jh.js"></script>
	<style type="text/css">
			td{font-size:13px}
	</style>
  </head>
  
  <body bgcolor='#FFFFFF' text='#000000' leftmargin='0' topmargin='0'
		marginwidth='0' marginheight='0'>
	<table border="1" class="Table_N" cellspacing="0" cellpadding="5"
		align="center" width="100%">
		<tr class="Table_H">
			<td nowrap colspan="2" class="Table_H" height="30">用户信息查看： <font
				color="red"> </font>
			</td>
		</tr>
		<tr>
			<td width="18%" align="center">登录名</td>
			<td>${user.username}</td>
		</tr>
		<tr>
			<td align="center">真实姓名</td>
			<td>${user.realname}</td>
		</tr>
		<tr>
			<td align="center">部门名称</td>
			<td>${user.dept}</td>
		</tr>
		<tr>
			<td align="center">职务</td>
			<td>${user.job }</td>
		</tr>
		<tr>
			<td align="center">email</td>
			<td>${user.email}</td>
		</tr>
		<tr>
			<td align="center">移动电话</td>
			<td>${user.mobile }</td>
		</tr>
		<tr>
			<td align="center">固定电话</td>
			<td>${user.phone}</td>
		</tr>
		<tr>
			<td align="center">是否启用</td>
			<td><c:choose>
					<c:when test="${user.enabled ==1 }">启用</c:when>
					<c:otherwise>禁用</c:otherwise>
				</c:choose></td>
		</tr>
		<tr>
			<td align="center">所属用户角色</td>
			<td><c:choose>
					<c:when test="${user.username=='admin' }">
									内置超级管理员
								</c:when>
					<c:otherwise>
						<c:forEach items="${user.roles }" var="role">${role.name } &nbsp;</c:forEach>
					</c:otherwise>
				</c:choose></td>
		</tr>
		<tr>
			<td align="center">用户类型</td>
			<td><c:choose>
					<c:when test="${user.user_type ==0 }">机构用户</c:when>
					<c:otherwise>平台用户</c:otherwise>
				</c:choose></td>
		</tr>
		<tr>
			<td align="center">数据级别</td>
			<td>
						${user.userDataLevel.datalevel_name }
			</td >
		</tr>
	</table>
	<br>
				<input type="button" value="返回" class="button"
					onclick="javascript:history.go(-1)" />
  </body>
</html>
