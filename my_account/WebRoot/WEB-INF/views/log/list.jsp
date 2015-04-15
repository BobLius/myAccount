<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>日志查看</title>

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
	<style type="text/css">
		.operation-button li{
			float: left;
			margin-left: 20px;
			list-style-type: none;
		}
	
	</style>

<script type="text/javascript">
			function view(){
			    var value = $("#table").find("input[name='cbox']:checked").val();
			    if(value==null){
			    	alert("请选择一条记录进项操作");
			    }else{
			    	document.location.href='<%=basePath%>log/view?id='+value;
			    }
			}
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
			td{font-size:13px}
			.add{background-color:PaleGreen}	
	</style>
</head>
<body bgcolor='#FFFFFF' text='#000000' leftmargin='0' topmargin='0'
	marginwidth='0' marginheight='0'>
	<sf:form modelAttribute="form" method="POST" cssClass="listForm"
		name="form1" id="form1">
		<table border="1" id="table" class="Table_N" cellspacing="0" cellpadding="11"
			align="center" width="100%">
			<tr class="Table_H">
				<td nowrap colspan="12" class="Table_H" height="40">日志</td>
			</tr>
			<tr>
				<td nowrap colspan="12" height="50" valign="middle">
					事件名称：<sf:input path="name"/>
					操作员编号：<sf:input path="user_id"/>
					<br>
					事件时间：
					<sf:input type="text" path="startDateTime"
						onClick="WdatePicker({dateFmt:'yyyyMMdd'})"/>
						至
					<sf:input type="text" path="endDateTime"
						onClick="WdatePicker({dateFmt:'yyyyMMdd'})"/>
					<input type="submit" value="查询" name="queryButton" class="button">
				</td>
			</tr>
			<tr class="Table_H">
					<td nowrap colspan="12" class="Table_H" height="40">
						<ul class="operation-button">
						<li>
						<input type="button" value="查看" class="button2" onclick="view()" />
					    </li>
					</ul>
				</td>
				</tr>
			<tr class="Table_H">
				<td nowrap  align="center"></td>
				<td align="center">日志级别</td>
				<td align="center">事件名称</td>
				<td align="center">事件类型</td>
				<td align="center">事件时间</td>
				<td align="center">操作员编号</td>
				
			</tr>
			<c:forEach items="${form.data}" var="logs" varStatus="i">
				<c:choose>
					<c:when test="${i.count%2==0 }">
						<c:set var="rowClass" value="table_select_bg"></c:set>
					</c:when>
					<c:otherwise>
						<c:set var="rowClass" value=""></c:set>
					</c:otherwise>
				</c:choose>
				<tr onclick="clk(this)">
				<td align="center">
							<input type="checkbox" name="cbox" onClick="box(this)" id="chb" value="${logs.id}"/>
						</td>
					<td nowrap align="center">
						<c:choose>
						<c:when test="${logs.log_level==DEBUG}">DEBUG</c:when>
						<c:when test="${logs.log_level==INFO}">INFO</c:when>
						<c:when test="${logs.log_level==WARN}">WARN</c:when>
						<c:when test="${logs.log_level==FATAL}">FATAL</c:when>
						<c:when test="${logs.log_level==ERROR}">ERROR</c:when>
						</c:choose>
					</td>
					<td nowrap align="center">${logs.name}</td>
					<td nowrap align="center">
					<c:choose>
						<c:when test="${logs.eventType==SECURITY}">系统登录</c:when>
						<c:when test="${logs.eventType==SYSTEM}">系统数据维护</c:when>
						<c:when test="${logs.eventType==BUSINESS}">业务数据的维护</c:when>
						</c:choose>
					</td>
					<td nowrap align="center">${logs.timestamp }</td>
					<td nowrap align="center">${logs.actorId }</td>
				</tr>
			</c:forEach>
		</table>
		<%@include file="/common/pager/pager.jsp"%>
	</sf:form>
</body>
<script language="javascript" type="text/javascript" src="<%=basePath %>resources/My97DatePicker/WdatePicker.js"></script>
<script language="JavaScript" src="resources/js5/bgcolor.js"></script>
</html>
