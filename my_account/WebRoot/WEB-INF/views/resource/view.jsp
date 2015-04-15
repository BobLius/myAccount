<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

		<title>查看权限</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="-1">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="查看权限">
		<link href="resources/css5/jh.css" rel="stylesheet" type="text/css" />
		<link href="resources/css5/ccb.css" rel="stylesheet" type="text/css" />
		<link href="resources/css5/tx.css" rel="stylesheet" type="text/css" />
		<link href="resources/css5/B.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="resources/js5/jquery/jquery.js"></script>
		<script type="text/javascript">
			function edit(id){
				document.location.href="<%=basePath%>resource/edit?id="+id;		
			}
			function del(id){
				if(!confirm("确定要删除权限吗?"))
					return false;
				document.location.href="<%=basePath%>resource/delete?id="+id;				
			}
			function add(id){
				document.location.href="<%=basePath%>resource/new?pid="+id;	
			}
		</script>
	</head>

	<body bgcolor='#FFFFFF' text='#000000' leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' >
		<table border="1" class="Table_N" cellspacing="0" cellpadding="5"
			align="center" width="100%">

			<tr class="Table_H">
				<td colspan="2" class="Table_H"
					style="vertical-align: middle; height: 40">
					权限查看&nbsp;
				</td>
			</tr>
			<tr>
				<td align="left" style="vertical-align: middle" width="15%">
					编号：
				</td>
				<td>
					${resource.id }
				</td>
			</tr>
			<tr>
				<td align="left" style="vertical-align: middle" >
					名称
				</td>
				<td>
					${resource.name }
				</td>
			</tr>
			<tr>
				<td align="left" style="vertical-align: middle" >
					别名
				</td>
				<td>
					${resource.synonyms }
				</td>
			</tr>
			<tr>
				<td align="left" style="vertical-align: middle" >
					类型:
				</td>
				<td>
					<c:choose>
						<c:when test="${resource.type==0 }">菜单</c:when>
						<c:otherwise>按钮</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<c:if test="${resource.type==0 }">
				<tr>
					<td align="left" style="vertical-align: middle" >
						级别:
					</td>
					<td>
						${resource.level==1?'一级菜单':resource.level==2?'二级菜单':'三级菜单' }
					</td>
				</tr>
				<tr>
					<td align="left" style="vertical-align: middle" width="15%">
						优先级：
					</td>
					<td>
						${resource.priority }
					</td>
				</tr>
			</c:if>
			<tr>
				<td align="left" style="vertical-align: middle" width="15%">
					路径：
				</td>
				<td>
					${resource.url }
				</td>
			</tr>
			<tr>
				<td align="left" style="vertical-align: middle" width="15%">
					事件名称：
				</td>
				<td>
					${resource.event_name }
				</td>
			</tr>
			<tr>
				<td align="left" style="vertical-align: middle" width="15%">
					日志级别：
				</td>
				<td>
					<c:choose>
						<c:when test="${resource.log_level==0 }">DEBUG</c:when>
						<c:when test="${resource.log_level==1 }">INFO</c:when>
						<c:when test="${resource.log_level==2 }">WARN</c:when>
					</c:choose>
					
				</td>
			</tr>
			<tr>
				<td align="left" style="vertical-align: middle" >
					权限类型:
				</td>
				<td>
					<c:choose>
						<c:when test="${resource.resources_type==0 }">系统权限</c:when>
						<c:otherwise>业务权限</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
		<br>	
		&nbsp;
			<input type="button" value="编辑" name="queryButton" class="button" onclick="javascript:edit('${resource.id}');" />
			<input type="button" value="删除" name="queryButton" class="button" onclick="javascript:del('${resource.id}');" />
			<input type="button" value="新建子节点" name="queryButton" class="button" onclick="javascript:add('${resource.id}');" />
	</body>
</html>
