<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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

<title>我的股票列表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="我的股票列表">
<link href="resources/css5/jh.css" rel="stylesheet" type="text/css" />
<link href="resources/css5/ccb.css" rel="stylesheet" type="text/css" />
<link href="resources/css5/B.css" rel="stylesheet" type="text/css" />
<link href="resources/css5/tx.css" rel="stylesheet" type="text/css" />

<script language="JavaScript" src="resources/js5/jquery/jquery.js"></script>
<script language="JavaScript" src="resources/js5/jh.js"></script>
<script type="text/javascript" src="common/pager/jquery.pager.js"></script>
<script type="text/javascript" src="common/pager/list.js"></script>
<link href="common/pager/pager.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet"
	href="resources/css5/jquery_dialog.css" />
<script type="text/javascript" src="resources/js5/jquery_dialog.js"></script>
<style type="text/css">
.operation-button li {
	float: left;
	margin-left: 20px;
	list-style-type: none;
}
</style>
<script type="text/javascript">
			function box(cb){
			var obj = document.getElementsByName("cbox");
				 	for (i=0; i<obj.length; i++){   
		             //判断obj集合中的i元素是否为cb，否则表示未被点选  
		             if (obj[i]!=cb) 
		                 obj[i].checked = false;   
		             //若是 原先未被勾选 则变成勾选；反之 则变为未勾选   
		             //else  obj[i].checked = cb.checked;   
		             //若要至少勾选一个的话，则把上面那行else拿掉，换用下面那行   
			            else {
			               obj[i].checked = true;  
			            } 
	         	}   
			} 
			function clk(obj){
				var id=$(obj).children().children().val();
				var a=$(obj);
				var obj = document.getElementsByName("cbox");
				var value;
				for(i=0;i<obj.length;i++){
				value=$(obj[i]).val();
					if(id==value){
						  obj[i].checked = true; 
					}else{
						  obj[i].checked = false; 
						  $("tr").removeClass("add");
					}
				}
				a.addClass("add");
			}
	</script>
<style type="text/css">
td {
	font-size: 13px
}
</style>
</head>
<body bgcolor='#FFFFFF' text='#000000' leftmargin='0' topmargin='0'
	marginwidth='0' marginheight='0'>
	<sf:form modelAttribute="form" method="GET" cssClass="listForm"
		name="form1" id="form1">

		<table id="table" border="1" class="Table_N" cellspacing="0"
			cellpadding="5" align="center" width="100%">
			<tr class="Table_H">
				<td nowrap colspan="13" class="Table_H" height="40">我的股票列表：</td>
			</tr>
			<tr class="Table_H" id="simple">
				<td nowrap colspan="13" height="50" valign="middle">
					股票代码：<sf:input path="stock_id" />
					股票代码：<sf:input path="stock_name" />
					<input type="submit" value="查询" 	name="queryButton" class="button">
				</td>
			</tr>
			<tr class="Table_H">
				<td nowrap align="center"></td>
				<td nowrap align="center">股票代码</td>
				<td nowrap align="center">股票名称</td>
				<td nowrap align="center">买入股数</td>
				<td nowrap align="center">每股成本</td>
				<td nowrap align="center">成交额</td>
				<td nowrap align="center">最低卖出价</td>
			</tr>
			<c:forEach items="${form.data}" var="onhand" varStatus="i">
				<c:choose>
					<c:when test="${i.count%2==0 }">
						<c:set var="rowClass" value="table_select_bg"></c:set>
					</c:when>
					<c:otherwise>
						<c:set var="rowClass" value=""></c:set>
					</c:otherwise>
				</c:choose>
				<tr onclick="clk(this)">
					<td align="center"><input type="checkbox" name="cbox"
						onClick="box(this)" id="chb" value="${onhand.stock_id}" /></td>
					<td align="center">${onhand.stock_id}</td>
					<td align="center">${onhand.stock.stock_name}</td>
					<td align="center">${onhand.buy_mount}</td>
					<td align="center">${onhand.costs}</td>
					<td align="center">${onhand.the_end}</td>
					<td align="center">${onhand.sell_lowest}</td>
				</tr>
			</c:forEach>
		</table>
		<%@include file="/common/pager/pager.jsp"%>
	</sf:form>
</body>
<script language="JavaScript" src="resources/js5/bgcolor.js"></script>
</html>
