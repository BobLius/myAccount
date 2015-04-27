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
	<title>储蓄编辑</title>
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="储蓄编辑">
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
		    $("#bank_id").formValidator({
		        onShow: "",
		        onCorrect: "输入正确"
		    }).inputValidator({
		        min: "1",
		        max: "100",
		        empty:{leftEmpty:false,rightEmpty:false,emptyError:"前后不能带空格"},
		        onError: "银行编号输入不正确"
		    });
		    $("#card_no").formValidator({
		        onShow: "",
		        onCorrect: "输入正确"
		    }).inputValidator({
		        min: "1",
		        max: "100",
		        empty:{leftEmpty:false,rightEmpty:false,emptyError:"前后不能带空格"},
		        onError: "卡号输入不正确"
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
		    
		    
			$('#bank_id' ).autocomplete("<%=basePath%>bank/autoCompleteBank",{
					max : 10, //列表里的条目数
					minChars : 0, //自动完成激活之前填入的最小字符
					width : 400, //提示的宽度，溢出隐藏
					scrollHeight : 300, //提示的高度，溢出显示滚动条
					matchContains : true, //包含匹配，就是data参数里的数据，是否只要包含文本框里的数据就显示
					autoFill : false, //自动填充
					//dataType : "json", //json类型
					parse : function(data) {
					return $.map(eval(data), function(row) {
							return {
								data : row,
							value : row.name,
							result : row.to
							}
						}); //对ajax页面传过来的数据进行json转码
					},
				formatItem : function(row, i, max) {
					return i + '/' + max + ':"' + row.name+ '"[' + row.to + ']';
				},
				formatMatch : function(row, i, max) {
					return row.name + row.to;
				},
				formatResult : function(row) {
					return row.to;
				}
			}).result(function(event, row, formatted) {
				$("#bank_id").val(row.to);
				$("#bank_name").val(row.name);
				document.getElementById("bank_name").innerHTML = row.name;
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
	<sf:form modelAttribute="bankSave" name="form1"  id="form1">
		<table border="1" class="Table_N" cellspacing="0" cellpadding="5"
			align="center" width="100%">
			<tr class="Table_H">
				<td nowrap colspan="2" class="Table_H" height="30">储蓄编辑： 
					<font color="red"> </font>
					<input type="hidden" name="referer" value="${referer}"/>
				</td>
			</tr>
			<tr>
				<td align="center" width="20%">银行编号</td>
				<td><sf:input path="bank_id" placeholder="银行编号" maxlength="10" size="30" id="bank_id" required="required"/>
					<span id="bank_name" style="float:left" >${bankSave.bank.bank_name}</span>
					<span id="bank_idTip" style="float:left" ></span>
				</td>
			</tr>
			<tr>
				<td align="center">卡号</td>
				<td><sf:input path="card_no" placeholder="卡号" maxlength="30" size="30"  id="card_no" required="required"/>
					<span id="card_noTip" style="width:300px"></span>
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
