<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

		<title>角色列表</title>

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
			function news(){
			    	document.location.href='<%=basePath%>role/new';
			}
			function del(){
				  var value = $("#table").find("input[name='cbox']:checked").val();
				  if(value==null){
				  	alert("请选择数据进行删除操作");
				  }else{
				  	document.location.href='<%=basePath%>role/delete?id='+value;
				  }
			}
			function edit(){
			    var value = $("#table").find("input[name='cbox']:checked").val();
			    if(value==null){
			    	alert("请选择一条记录进项操作");
			    }else{
			    	document.location.href='<%=basePath%>role/edit?id='+value;
			    }
			}
			function view(){
			    var value = $("#table").find("input[name='cbox']:checked").val();
			    if(value==null){
			    	alert("请选择一条记录进行查看");
			    }else{
			    	document.location.href='<%=basePath%>role/view?id='+value;
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
	<body bgcolor='#FFFFFF' text='#000000' leftmargin='0' topmargin='0'
		marginwidth='0' marginheight='0'>
		<sf:form modelAttribute="form" method="GET" cssClass="listForm"
			id="form1" name="form1">
			<table id="table" border="1" class="Table_N" cellspacing="0" cellpadding="5"
				align="center" width="100%">
				<tr class="Table_H">
					<td nowrap colspan="9" class="Table_H" height="40">
						角色列表：
					</td>
				</tr>
				<!-- 查询条件开始  -->
				<tr class="Table_H">
					<td nowrap colspan="9" height="50" valign="middle">
						&nbsp;&nbsp;角色名称：
						<sf:input path="roleName" />
						&nbsp;&nbsp; &nbsp;&nbsp;
						<input type="submit" value="查询" name="queryButton" class="button">
							<input type="button" value="新增角色" onClick="news()" class="button">
					</td>
				</tr>
				<!-- 查询条件结束 -->
				<tr class="Table_H">
					<td  nowrap colspan="9" class="Table_H" height="40">
						<ul class="operation-button">
						<li>
							<input type="button" value="查看" onClick="view()" class="button">
						</li>
						<li>
							<input type="button" value="修改" onClick="edit()" class="button">
						</li>
						<li>
							<input type="button" value="删除" onClick="del()"  class="button">
						</li>
						</ul>
						</td>
					</tr>
				<tr class="Table_H">
				<td nowrap  align="center" >
					</td>
					<td nowrap  align="left"  height="15" >
						角色名称
					</td>
				</tr>
				<c:forEach items="${form.data }" var="role">
					<tr onclick="clk(this)">
						<td nowrap  align="center" width="5%">
							<input type="checkbox" name="cbox" onClick="box(this)" id="chb" value="${role.id}"/>
						</td>
						<td nowrap  align="left" >
							${role.name }
						</td>
					</tr>
				</c:forEach>
			</table>
			<%@include file="/common/pager/pager.jsp" %>		
		</sf:form>
	</body>
	<script language="JavaScript" src="resources/js5/bgcolor.js"></script>
</html>
