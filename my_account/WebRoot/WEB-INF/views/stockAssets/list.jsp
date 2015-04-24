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
    
    <title>股市资产查看</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="股市资产查看">
	<link href="resources/css5/jh.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/ccb.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/B.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/tx.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="resources/js5/jquery/jquery.js"></script>
	<script language="JavaScript" src="resources/js5/jh.js"></script>
	<style type="text/css">
			td{font-size:13px}
	</style>
	<style type="text/css">
	.operation-button li {
		float: left;
		margin-left: 20px;
		list-style-type: none;
	}
	</style>
	<script type="text/javascript">
			function editPrincipal(principal){
			   document.location.href='<%=basePath%>stockAssets/editPrincipal?principal='+principal;
			}
	</script>
  </head>
  
  <body bgcolor='#FFFFFF' text='#000000' leftmargin='0' topmargin='0'
		marginwidth='0' marginheight='0'>
	<table border="1" class="Table_N" cellspacing="0" cellpadding="5"
		align="center" width="100%">
		<tr class="Table_H">
			<td nowrap colspan="2" class="Table_H" height="30">股市资产查看： <font
				color="red"> </font>
			</td>
		</tr>
		<tr class="Table_H">
			<td nowrap colspan="2" class="Table_H" height="30">
				<ul class="operation-button">
					<li><input type="button" value="修改本金"
						onClick="editPrincipal('${stockAssets.principal}')" class="button"></li>
				</ul>
			</td>
		</tr>
		<tr>
			<td width="18%" align="center">截止至当前时间</td>
			<td>
				<fmt:parseDate value="${stockAssets.current_dates}" var="current_date" pattern="yyyyMMddHHmmss"/>  
			    <fmt:formatDate value="${current_date}" type="both" dateStyle="long"/>
			</td>
		</tr>
		<tr>
			<td align="center">总资产</td>
			<td>${stockAssets.total_assets}</td>
		</tr>
		<tr>
			<td align="center">可用资产</td>
			<td>${stockAssets.use_assets}</td>
		</tr>
		<tr>
			<td align="center">证券资产</td>
			<td>${stockAssets.stock_assets }</td>
		</tr>
		<tr>
			<td align="center">本金</td>
			<td>${stockAssets.principal}</td>
		</tr>
		<tr>
			<td align="center">总盈亏</td>
			<td>${stockAssets.profit_loss }</td>
		</tr>
	</table>
  </body>
</html>
