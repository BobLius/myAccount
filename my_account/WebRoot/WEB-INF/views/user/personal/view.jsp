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
    
    <title>用户个人信息查看</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="用户信息查看">
	<link href="resources/css5/jh.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/ccb.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/B.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/tx.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body bgcolor='#FFFFFF' text='#000000' leftmargin='0' topmargin='0'
		marginwidth='0' marginheight='0'>
		<table border="1" class="Table_N" cellspacing="0" cellpadding="5"
				align="center" width="100%">
				<tr class="Table_H">
					<td nowrap colspan="2" class="Table_H" height="30">
						个人信息查看：
						<font color="red"> </font>
					</td>
				</tr>
				<tr>
				<td width="15%">用户编号</td>
				<td>${user.id }</td>
			</tr>
			<tr>
				<td >用户姓名</td>
				<td>${user.username}</td>
			</tr>
			<tr>
				<td >部门名称</td>
				<td>${user.dept}</td>
			</tr>
			<tr>
				<td >职务</td>
				<td>${user.job}</td>
			</tr>
			<tr>
				<td >email</td>
				<td>${user.email}</td>
			</tr>				
			<tr>
				<td>移动电话</td>
				<td>${user.mobile }</td>
			</tr>
			<%-- <tr>
				<td>固定电话</td>
				<td>${user.areaCode }-${user.phoneNo }${empty user.extNo?'':'-' }${user.extNo }</td>
			</tr>
			<tr> --%>
			<tr>
				<td>是否启用</td>
				<td>
					<c:choose>
						<c:when test="${user.enabled ==1 }">启用</c:when>
						<c:otherwise>不启用</c:otherwise>
					</c:choose>					
				</td>
			</tr>				
			<tr>
				<td>所属用户角色</td>
				<td>
					<c:choose>
						<c:when test="${user.username=='admin' }">
							内置超级管理员
						</c:when>
						<c:otherwise>
							<c:forEach items="${user.roles }" var="role">${role.name } &nbsp;</c:forEach>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>上次密码修改时间</td>
				<%
					User user = (User)request.getAttribute("user");
					Date lastModfied = user.getLast_upd_dt();
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(lastModfied);
					calendar.add(Calendar.DAY_OF_YEAR, 90);
					pageContext.setAttribute("expireDate", calendar.getTime());
				%>
				<td><fmt:formatDate value="${user.last_upd_dt }" type="both"/> 将于 <fmt:formatDate value="${pageScope.expireDate }" type="both"/> 失效</td>
			</tr>						
		</table>
		<br>
		<input type="button" value="修改密码" class="button"
				onclick="javascript:document.location.href='<%=basePath%>user/personal/edit';" />
		<input type="button" value="返回" class="button"
					onclick="javascript:history.go(-1);" />
  </body>
</html>
