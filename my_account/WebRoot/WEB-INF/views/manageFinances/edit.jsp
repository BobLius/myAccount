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
	<title>理财产品编辑</title>
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="理财产品编辑">
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
		    $("#name").formValidator({
		        onShow: "",
		        onCorrect: "输入正确"
		    }).inputValidator({
		        min: "1",
		        max: "100",
		        empty:{leftEmpty:false,rightEmpty:false,emptyError:"前后不能带空格"},
		        onError: "理财产品输入不正确"
		    }).ajaxValidator({
		        type: "get",
		        url: "manageFinances/existsName?id="+$("#id").text(),
		        success: function(data) {
		           return !eval(data);
		        },
		        onError: "理财产品已存在,请重新输入"
		    });
		    $("#money").formValidator({
		        onShow: "",
		        onCorrect: "输入正确"
		    }).inputValidator({
		        min: "1",
		        max: "100",
		        empty:{leftEmpty:false,rightEmpty:false,emptyError:"前后不能带空格"},
		        onError: "余额输入不正确"
		    });

		    
		    /** input 加样式 */
		    $("#form1 input").css("float","left");
		    /** tip 加样式 */
		    $("span [att$='Tip']").css("float","left");
		    /** required 属性元素后加一红色星号，表示必填  */
		    $("[required='required']").after("<span style='color:red;padding-left:5px;font-weight:bold;float:left'>*</span>");
			$("#form1 input[type='radio']").css("float","");
		});		
	</script>
</head>

<body bgcolor='#FFFFFF' text='#000000' leftmargin='0' topmargin='0'
	marginwidth='0' marginheight='0' >
	<sf:form modelAttribute="manageFinances" name="form1"  id="form1">
		<table border="1" class="Table_N" cellspacing="0" cellpadding="5"
			align="center" width="100%">
			<tr class="Table_H">
				<td nowrap colspan="2" class="Table_H" height="30">理财产品编辑： 
					<font color="red"> </font>
					<input type="hidden" name="referer" value="${referer}"/>
					<span id="id" style="display: none">${manageFinances.id }</span>
				</td>
			</tr>
			<tr>
				<td align="center" width="20%">理财名称</td>
				<td><sf:input path="name" placeholder="理财名称" maxlength="10" size="30" id="name" required="required"/>
					<span id="nameTip" style="float:left" ></span>
				</td>
			</tr>
			<tr>
				<td align="center">余额</td>
				<td><sf:input path="money" placeholder="余额" maxlength="25" size="30" id="money" required="required"/>
					<span id="moneyTip" style="width:300px"></span>
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
