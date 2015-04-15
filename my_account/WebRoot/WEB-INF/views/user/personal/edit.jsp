<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>用户编辑</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="用户编辑">
<link href="resources/css5/jh.css" rel="stylesheet" type="text/css" />
<link href="resources/css5/ccb.css" rel="stylesheet" type="text/css" />
<link href="resources/css5/B.css" rel="stylesheet" type="text/css" />
<link href="resources/css5/tx.css" rel="stylesheet" type="text/css" />
<script src="resources/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="resources/jquery/formValidator/formValidator-4.1.3.js" type="text/javascript"></script> <!--表单验证必须库-->
<script src="resources/jquery/formValidator/formValidatorRegex.js" type="text/javascript"></script> <!--表单验证扩展库-->
<script src="resources/jquery/jquery.placeholder.js" type="text/javascript"></script> <!--jquery_placeholder必须库-->
<script type="text/javascript" src="resources/js5/jh.js"></script>
	<script type="text/javascript">
			$(document).ready(function () {
            $.formValidator.initConfig({ theme:"126",formID: "form1",submitonce:true,onError: function (msg,obj,errorlist) {alert(msg);}});
				 $("#op").formValidator({
					 onShow: "",onCorrect: "输入正确"
				 }).inputValidator({
					 min:"1",max:"20",onError: "原密码输入不正确"
				 })
				 .ajaxValidator({
				 		type:"get",
				 		url:"user/validator",
				 		/* url:"user/validator?password="+$('#password1').val(), */
				 		success: function(data){
							 if (data == "0") {
			                    return true;
			                } else if (data == "1") {
			                    return false;
			                }
				 		},
				 		onError: "原始密码不正确,请更换"
				 	});
	        	 $("#np").formValidator({
	        		 onshow:"请输入密码",onfocus:"至少1个长度",oncorrect:"密码合法"
	        		 }).inputValidator({
	        			min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"密码两边不能有空符号"},onError:"密码不能为空,请确认"
	        		}).ajaxValidator({
				 		type:"get",
				 		url:"user/nPassword",
				 		/* url:"user/validator?password="+$('#password1').val(), */
				 		success: function(data){
							 if (data == "0") {
			                    return false;
			                } else if (data == "1") {
			                    return true;
			                }
				 		},
				 		onError: "新密码不能和原始密码相同,请更换"
				 	});
	        	 $("#cp").formValidator({
	        		 onshow:"输再次输入密码",onfocus:"至少1个长度",oncorrect:"密码一致"
	        		 })
	        		 .inputValidator({
	        			 min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"重复密码两边不能有空符号"},onError:"重复密码不能为空,请确认"
	        		 })
	        		 .compareValidator({
	        				 desID:"np",operateor:"=",onError:"2次密码不一致,请确认"
	        		 });
				
			});
			
	</script>
	<style type="text/css">
			td{font-size:13px}
	</style>
</head>

<body bgcolor='#FFFFFF' text='#000000' leftmargin='0' topmargin='0'
	marginwidth='0' marginheight='0' >
	<sf:form modelAttribute="personal" name="personal" id="form1">
		<table border="1" class="Table_N" cellspacing="0" cellpadding="5"
			align="center" width="100%">
			<tr class="Table_H">
				<td nowrap colspan="3" class="Table_H" height="30">个人密码修改： <font
					color="red"> </font></td>
			</tr>
			<tr>
				<c:if test="${personal.username != null }">
					<td width=15% align="center">用户编号</td>
					<td>${personal.username}
					</td>
				</c:if>
			</tr>
			<tr> 
					      <td width=15% align="center">原密码:</td>
					      <td><input type="password" id="op" name="oldPassword"/><span id="opTip" style="width:30px"></span></td>
					    </tr>
			<tr> 
					      <td width=15% align="center">新密码:</td>
					      <td><input type="password" id="np" name="newPassword"/><span id="npTip" style="width:30px"></span></td>
					    </tr>
			<tr> 
					      <td width=15% align="center">确认密码:</td>
					      <td><input type="password" id="cp" /><span id="cpTip" style="width:30px"></span></td>
					    </tr>
		</table>
		<br>
		<input type="submit" name="button" class="button" value="确定" />
		<input type="button" value="返回" name="queryButton" class="button"
			onclick="javascript:history.go(-1)" />
	</sf:form>
</body>
</html>
