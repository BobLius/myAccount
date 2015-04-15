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

		<title>用户列表</title>
		
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="用户列表">
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
			function exp(){
				var saved_action = document.form1.action;
				document.form1.action="<%=basePath%>user/downLoad";
				document.form1.submit();
				document.form1.action = saved_action;
			}
	</script>
	<script type="text/javascript">
			function news(){
			    	document.location.href='<%=basePath%>user/add';
			}
			function del(){
				  var value = $("#table").find("input[name='cbox']:checked").val();
				  if(value==null){
				  	alert("请选择数据进行删除操作");
				  }else{
				  	document.location.href='<%=basePath%>user/delete?id='+value;
				  }
			}
			function edit(){
			    var value = $("#table").find("input[name='cbox']:checked").val();
			    if(value==null){
			    	alert("请选择一条记录进项操作");
			    }else{
			    	document.location.href='<%=basePath%>user/edit?id='+value;
			    }
			}
			function view(){
			    var value = $("#table").find("input[name='cbox']:checked").val();
			    if(value==null){
			    	alert("请选择一条记录进行查看");
			    }else{
			    	document.location.href='<%=basePath%>user/view?id='+value;
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
	</style>
	</head>
	<body bgcolor='#FFFFFF' text='#000000' leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' >
		<sf:form modelAttribute="form" method="GET"  cssClass="listForm" name="form1" id="form1">
			
			<table id="table" border="1" class="Table_N" cellspacing="0" cellpadding="5"
				align="center" width="100%">
				<tr class="Table_H">
					<td nowrap colspan="9" class="Table_H" height="40">
						用户列表：
					</td>
				</tr>
				<tr class="Table_H" id="simple">
					<td nowrap colspan="9" height="50" valign="middle">
						登录名：
						<sf:input path="username"/>
						角色：						
						<sf:select path="roleId" >
							<sf:option value="" label="全部"></sf:option>
							<sf:options items="${roles}" itemLabel="name" itemValue="id"/>
						</sf:select>				
						
						<input type="submit" value="查询" name="queryButton" class="button">
							<input type="button" value="新建用户" onClick="news()" class="button"/>
					</td>
				</tr>
				<tr class="Table_H">
					<td nowrap colspan="9" class="Table_H" height="40">
						<ul class="operation-button">
								<li>
									<input type="button" value="修改" onClick="edit()"
										<%-- onClick="javascript:JqueryDialog.Open('','<%=basePath%>user/edit?id=${user.id}',700,400);" --%>
										class="button">
								</li>
							<c:if test="${user.username != 'admin' }">
									<li>
									<input type="button" value="删除" onClick="del()"  class="button">
									</li>
							</c:if>
								<li>
									<input type="button" value="查看" onClick="view()"
										<%-- onClick="javascript:JqueryDialog.Open('','<%=basePath%>user/view?id=${user.id}',700,400);" --%>
										class="button">
								</li>
					</ul>
				</td>
				</tr>
				<tr class="Table_H">
					<td nowrap  align="center" >
					</td>
					<td nowrap  align="center" >
						登录名
					</td>
					<td nowrap  align="center" >
						真实姓名
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
					<c:if test="${user.isdelete=='0'}">
					<tr onclick="clk(this)" >
						<td align="center">
							<input type="checkbox" name="cbox" onClick="box(this)" id="chb" value="${user.id}"/>
						</td>
						<td align="center" >
							${user.username}
						</td>
						<td align="center">
							${user.realname }
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
						
					</tr>	
					</c:if>
				</c:forEach>			
			</table>		
			<%@include file="/common/pager/pager.jsp" %>				
		</sf:form>
		
	</body>
	<script language="JavaScript" src="resources/js5/bgcolor.js"></script>
</html>
