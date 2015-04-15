<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>角色编辑</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="角色编辑">
		<link rel="stylesheet" href="resources/js5/xtree/xtree.css"
			type="text/css"></link>
		<script type="text/javascript" src="resources/js5/xtree/xtree.js"></script>
		<link href="resources/css5/jh.css" rel="stylesheet" type="text/css" />
		<link href="resources/css5/ccb.css" rel="stylesheet" type="text/css" />
		<link href="resources/css5/B.css" rel="stylesheet" type="text/css" />
		<link href="resources/css5/tx.css" rel="stylesheet" type="text/css" />
		<script src="resources/jquery/jquery-1.4.4.min.js" type="text/javascript"></script> <!--jquery必须库-->
<script src="resources/jquery/formValidator/formValidator-4.1.3.js" type="text/javascript"></script> <!--表单验证必须库-->
<script src="resources/jquery/formValidator/formValidatorRegex.js" type="text/javascript"></script> <!--表单验证扩展库-->
		<script type="text/javascript" src="resources/js5/jh.js"></script>
		<script type="text/javascript">
			jQuery(function($){
				$("#submitButton").click(function(event){
					event.preventDefault();
					$("#resources").val(root.getSelectedIds());
					$("#form1").submit();
				});
			});
		</script>
		<script type="text/javascript">
		function getUrlParam(name){
			var reg  = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
			var r = window.location.search.substr(1).match(reg);
			if (r!=null) 
				return unescape(r[2]); 
			return null;
		}
		
			$(document).ready(function () {
					 $.formValidator.initConfig({ theme:"126",formID: "form1",submitonce:true,onError: function (msg,obj,errorlist) {alert(msg);}});
					 $("#name").formValidator({
					 		onShow: "请输入名称",
					 		onCorrect: "输入正确" 
					 	})
					 	.inputValidator({
					 		min:"1",
					 		max:"60",
					 		onError: "角色名输入不正确" 
					 	})
					 	.ajaxValidator({
					 		type:"POST",
					 		dataType:"HTML",
					 		url:"role/existsRoleName",
					 		data:"id="+getUrlParam("id"),
					 		success: function(data){
								return !eval(data);
					 		},
					 		onError: "角色名已存在,请更换",
					 		onWait:"正在校验角色名字是否重复"
					 	});
			});
		</script>
		<style type="text/css">
			td{font-size:13px}
	</style>
	</head>
	<body>
		<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
		<sf:form modelAttribute="role" name="form1"  id="form1">
		     <jsp:include page="/common/from_repeate_submit.jsp"/>
			<table border="1" class="Table_N" cellspacing="0" cellpadding="5"
				align="center" width="100%">
				<tr class="Table_H">
					<td nowrap colspan="2" class="Table_H" height="30">
						角色编辑：
						<font color="red"> </font>
					</td>
				</tr>
				<tr>
					<td width="15%">角色名称</td>
					<td>
						<sf:input path="name" placehoder="角色名称不能为空且最多15个汉字或30个英文或数字字符" maxlength="30" id="name"/>
						<span id="nameTip" style="width:300px" ></span>
						<input type="hidden" name="referer" value="${referer}"/>
					</td>
					
				<tr>
				<tr>
					<td>分配权限</td>
					<td>
						<sf:hidden path="resources"/>
						<script type="text/javascript">${tree}</script>
					</td>
				</tr>
			</table>
			<br/>
			<input id="submitButton" type="submit" value="确定" class="button"/>
			<input type="button" value="返回" class="button"
					onclick="javascript:history.go(-1)" />
		</sf:form>		
	</body>
</html>
