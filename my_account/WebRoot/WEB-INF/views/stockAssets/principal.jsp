<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML1.0 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>本金编辑</title>
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="本金编辑">
	<link href="resources/css5/jh.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/ccb.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/B.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/tx.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/ui.jqgrid.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/searchFilter.css" rel="stylesheet" type="text/css" />
	
	<script src="resources/jquery/jquery-1.8.0.min.js" type="text/javascript"></script>
<!-- 	<script src="resources/jquery/jquery-1.10.2.min.js" type="text/javascript"></script> -->
	 <!-- jquery ui 引入的js -->
	<script src="resources/jquery/jqueryUi/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
	<!-- jQGrid引入的js -->
	<script src="resources/jquery/jQGrid/jquery.jqGrid.min.js" type="text/javascript"></script>
	<script src="resources/jquery/jQGrid/grid.locale-cn.js" type="text/javascript"></script>
	<!-- formvalidator -->
	<script src="resources/jquery/formValidator/formValidator-4.1.3.js" type="text/javascript"></script> <!--表单验证必须库-->
	<script src="resources/jquery/formValidator/formValidatorRegex.js" type="text/javascript"></script> <!--表单验证扩展库-->
	<script src="resources/jquery/jquery.placeholder.js" type="text/javascript"></script> <!--jquery_placeholder必须库-->
	<script type="text/javascript" src="resources/js5/jh.js"></script>
	<script type="text/javascript" src="resources/js5/jquery.autocomplete.js"></script>
	<link href="resources/css5/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
	
	<style type="text/css">
			td{font-size:13px}
	</style>
	<!-- 校验表单 -->
	<script type="text/javascript">
		$(document).ready(function() {
		    $.formValidator.initConfig({
		        theme: "126",
		        formID: "form1",
		        submitonce: true,
		        onError: function(msg, obj, errorlist) {
		            alert(msg);
		        }
		    });
		    $("#principal").formValidator({
		        onShow: "",
		        onCorrect: "输入正确"
		    }).inputValidator({
		        min: "1",
		        max: "100",
		        empty:{leftEmpty:false,rightEmpty:false,emptyError:"前后不能带空格"},
		        onError: "本金输入不正确"
		    });			
		});		
	</script>
</head>

<body bgcolor='#FFFFFF' text='#000000' leftmargin='0' topmargin='0'
	marginwidth='0' marginheight='0' >
	<sf:form modelAttribute="stockAssets" name="form1"  id="form1">
		<table border="1" class="Table_N" cellspacing="0" cellpadding="5"
			align="center" width="100%">
			<tr class="Table_H">
				<td nowrap colspan="2" class="Table_H" height="30">本金编辑： 
					<font color="red"> </font>
					<input type="hidden" name="referer" value="${referer}"/>
					<input type="hidden" name="total_assets" value="${stockAssets.total_assets}"/>
					<input type="hidden" name="use_assets" value="${stockAssets.use_assets}"/>
					<input type="hidden" name="stock_assets" value="${stockAssets.stock_assets}"/>
					<input type="hidden" name="profit_loss" value="${stockAssets.profit_loss}"/>
					<input type="hidden" name="current_date" value="${stockAssets.current_dates}"/>
					<input type="hidden" name="id" value="${stockAssets.id}"/>
				</td>
			</tr>
			<tr>
				<td align="center" width="20%">本金金额</td>
				<td><sf:input path="principal" placeholder="本金金额" maxlength="10" size="30" id="principal"/>
					<span id="principalTip" style="float:left" ></span>
				</td>
			</tr>
		</table>
		<br>
		<input type="submit" value="确定" class="button"/>
		<input type="button" value="返回" class="button"
			onclick="javascript: window.location.href=document.referrer;" />
	</sf:form>
</body>
</html>
