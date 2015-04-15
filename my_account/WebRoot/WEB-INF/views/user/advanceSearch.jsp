<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

		<title>用户高级查询</title>
		
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
		<link href="common/pager/pager.css" rel="stylesheet" type="text/css">
			<link type="text/css" rel="stylesheet" href="resources/css5/jquery_dialog.css" />
	<script type="text/javascript" src="resources/js5/jquery_dialog.js"></script>
		<%--<script type="text/javascript">
			function del(id){
				if(confirm("确定要删除此用户吗?"))
					document.location.href="<%=basePath%>user/delete?id="+id;
			
			}
	</script>
	--%><script type="text/javascript">
			function exp(){
				var saved_action = document.form1.action;
				document.form1.action="<%=basePath%>user/downLoad";
				document.form1.submit();
				document.form1.action = saved_action;
			}
	</script>
	</head>

	<body bgcolor='#FFFFFF' text='#000000' leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' >
		
		<sf:form modelAttribute="form" action="user/advanceSearch" method="POST" cssClass="listForm" name="form1" id="form1">
		<table border="1" class="Table_N" cellspacing="0" cellpadding="5"
			align="center" width="100%">
			<tr class="Table_H">
				<td nowrap colspan="9" class="Table_H" height="30">用户高级查询： <font
					color="red"> </font>
				</td>
			</tr>
			<tr>
				<td nowrap colspan="9" height="50" valign="middle">
					&nbsp;&nbsp;用户编号：
					<sf:input path="id"/>
					&nbsp;&nbsp;用户姓名：
					<sf:input path="username"/>
					&nbsp;&nbsp;用户角色：
					<sf:select path="roleId" >
							<sf:option value="" label="全部"></sf:option>
							<sf:options items="${roles }" itemLabel="name" itemValue="id"/>
						</sf:select>
					&nbsp;&nbsp;用户部门：
					<sf:input path="dept"/>
					&nbsp;&nbsp;用户状态：
					<sf:radiobutton path="enabled" label="启用" value="1"/>
					<sf:radiobutton path="enabled" label="禁用" value="0"/>
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" value="查询" name="queryButton" class="button">
					&nbsp;&nbsp;
					<span  style="cursor:hand" onclick="javascript:document.location.href='<%=basePath%>user';"><sub>进入普通查询</sub></span>
					&nbsp;&nbsp;
							<input type="button" value="导出" class="button" onClick="exp()"/>
				</td>
			</tr>
			<tr class="Table_H">
					<td nowrap  align="center" >
						用户编号
					</td>
					<td nowrap  align="center" >
						用户姓名
					</td>
					<td nowrap  align="center" >
						部门名称
					</td>
					<td nowrap  align="center" >
						职务
					</td>	
					<td nowrap  align="center" >
						用户状态
					</td>	
					<td nowrap  align="center" >
						用户角色
					</td>					
					<td nowrap  align="center" >
						操作
					</td>
				</tr>
		
				<c:forEach items="${form.data}" var="user" varStatus="i"> 
					<c:choose>
						<c:when test="${i.count%2==0 }">
							<c:set var="rowClass" value="table_select_bg"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="rowClass" value=""></c:set>
						</c:otherwise>
					</c:choose>
					
					<tr class="${rowClass }">
						<td align="center">
							${user.id}
						</td>
						<td align="center">
							${user.username }
						</td>
						<td align="center">
							${user.dept }
						</td>
						<td align="center">
							${user.job }
						</td>
						<td align="center">
							<c:choose>
								<c:when test="${user.enabled==1 }">启用</c:when>
								<c:otherwise>禁用</c:otherwise>
							</c:choose>
						</td>
						<td align="center">
							<c:choose>
								<c:when test="${user.username=='admin' }">
									内置超级管理员
								</c:when>
								<c:otherwise>
									<c:forEach items="${user.roles }" var="role">${role.name } &nbsp;</c:forEach>
								</c:otherwise>
							</c:choose>
						</td>						
						<td>
								<input type="button" value="查看" onClick="javascript:JqueryDialog.Open('','<%=basePath%>user/view?id=${user.id}',700,400);"
									class="button2">
								<input type="button" value="修改"
								onClick="javascript:JqueryDialog.Open('','<%=basePath%>user/edit?id=${user.id}',700,400);" class="button2">
							<c:if test="${user.username != 'admin' }">
									<input type="button" value="删除" onClick="javascript:del('${user.id}');"
										class="button2">
							</c:if>	
						</td>
					</tr>	
				</c:forEach>			
		</table>
		<%@include file="/common/pager/pager.jsp" %>
		<%--<br/>
		<input type="submit" value="查询" name="queryButton" class="button">	
		<input type="button" value="返回" class="button" onclick="javascript:history.go(-1);" >	
		--%></sf:form>
		
	</body>
</html>
