<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

		<title>角色查看</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="角色查看">
		<link href="resources/css5/jh.css" rel="stylesheet" type="text/css" />
		<link href="resources/css5/ccb.css" rel="stylesheet" type="text/css" />
		<link href="resources/css5/B.css" rel="stylesheet" type="text/css" />
		<link href="resources/css5/tx.css" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript" src="resources/js5/xtree/xtree.js"></script>
		<link href="resources/css5/jh.css" rel="stylesheet" type="text/css" />		
		<script language="JavaScript" src="resources/js5/jquery/jquery.js"></script>
		<script language="JavaScript" src="resources/js5/jh.js"></script>
		<style type="text/css">
			td{font-size:13px}
	</style>
	</head>

	<body>
		<table border="1" class="Table_N" cellspacing="0" cellpadding="5"
			align="center" width="100%">
			<tr class="Table_H">
				<td nowrap colspan="2" class="Table_H" height="30">
					角色信息：
					<font color="red"> </font>
				</td>
			</tr>
			<tr>
				<td width="15%">
					角色名称
				</td>
				<td>
					${role.name }
				</td>
			<tr>
			
			<tr>
				<td>
					分配权限
				</td>
				<td>
					<script type="text/javascript">
						${tree}		
					</script>
				</td>
			</tr>
			<tr>
				<td width="15%">
					创建操作员编号
				</td>
				<td>
					${role.c_operator_id }
				</td>
			<tr>
			<tr>
				<td width="15%">
					创建日期时间
				</td>
				<td>
					${role.create_dt }
				</td>
			<tr>
			<tr>
				<td width="15%">
					修改操作员编号
				</td>
				<td>
					${role.u_operator_id }
				</td>
			<tr>
			<tr>
				<td width="15%">
					修改日期时间
				</td>
				<td>
					${role.last_upd_dt }
				</td>
			<tr>
		</table>
		<br />

		<input type="button" value="返回" class="button"
			onclick="javascript:history.go(-1)" />
	</body>
</html>
