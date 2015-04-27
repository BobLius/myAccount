<%@page import="com.miteno.myAccount.security.role.entity.Role"%>
<%@page import="com.miteno.myAccount.security.user.entity.User"%>
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
	
	<link href="resources/css5/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/ui.jqgrid.css" rel="stylesheet" type="text/css" />
	<link href="resources/css5/searchFilter.css" rel="stylesheet" type="text/css" />
	
	<script src="resources/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
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
	<!--  zTree 引入的js-->
 	<script type="text/javascript" src="resources/js5/zTree/jquery.ztree.core-3.5.js"></script>
 	<script type="text/javascript" src="resources/js5/zTree/jquery.ztree.excheck-3.5.min.js"></script>
	<link href="resources/css5/zTreeStyle.css" rel="stylesheet" type="text/css" />

	
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
		    //$("#sfz").formValidator({ onShow: "请输入15或18位身份证号",onCorrect: "输入正确" }).regexValidator({ regExp: "idcard", dataType: "enum", onError: "你输入的身份证格式不正确" }); ;
		    $("#username").formValidator({
		        onShow: "",
		        onCorrect: "输入正确"
		    }).regexValidator({
		        regExp: "num1",
		        dataType: "enum",
		        onError: "只能为数字"
		    }).inputValidator({
		        min: "1",
		        max: "12",
		        empty:{leftEmpty:false,rightEmpty:false,emptyError:"前后不能带空格"},
		        onError: "姓名输入不正确"
		    }).ajaxValidator({
		        type: "get",
		        url: "user/existsUsername?id="+$("#id").text(),
		        success: function(data) {
		           return !eval(data);
		        },
		        onError: "用户名已存在,请重新输入"
		    });
		    $("#xm").formValidator({
		        onShow: "",
		        onCorrect: "输入正确"
		    }).inputValidator({
		        min: "1",
		        max: "20",
		        empty:{leftEmpty:false,rightEmpty:false,emptyError:"前后不能带空格"},
		        onError: "姓名输入不正确"
		    });
		    $("#dp").formValidator({
		        onShow: "",
		        onCorrect: "输入正确"
		    }).inputValidator({
		        min: "1",
		        max: "20",
		        empty:{leftEmpty:false,rightEmpty:false,emptyError:"前后不能带空格"},
		        onError: "部门名称输入不正确"
		    });
		    $("#mb").formValidator({
		        onShow: "",
		        onCorrect: "输入正确"
		    }).inputValidator({
		        min: "11",
		        max: "11",
		        onError: "手机号码必须为11位数字"
		    }).regexValidator({
		        regExp: "mobile",
		        dataType: "enum",
		        onerror: "手机号必须为数字"
		    });
		    $("#job").formValidator({
		        empty: true,
		        onShow: "",
		        onCorrect: "输入正确"
		    }).inputValidator({
		        max: "30",
		        onError: "职务输入不正确"
		    });
		    $("#email").formValidator({
		        empty: true,
		        onshow: "",
		        oncorrect: "输入正确"
		    }).inputValidator({
		        min: 6,
		        max: 100,
		        onError: "电子邮箱输入不正确"
		    }).regexValidator({
		        regExp: "email",
		        dataType: "enum",
		        onError: "你输入的邮箱格式不正确"
		    });
		    $("#rl").formValidator({
		        onShow: "",
		        onCorrect: "选择正确"
		    }).inputValidator({
		        min: "1",
		        onError: "角色选择不正确"
		    });
		    $("#ph").formValidator({
		        empty: true,
		        onShow: "",
		        onCorrect: "输入正确"
		    }).inputValidator({
		        min: "1",
		        max: "20",
		        onError: "固话输入不正确"
		    }).regexValidator({
		        regExp: "tel",
		        dataType: "enum",
		        onError: "固话输入不正确"
		    });
		    
		    
		    /** input 加样式 */
		    $("#form1 input").css("float","left");
// 		    $("#form1 select").css("float","left");
		    /** tip 加样式 */
		    $("span [att$='Tip']").css("float","left");
		    
		    /** required 属性元素后加一红色星号，表示必填  */
		    $("[required='required']").after("<span style='color:red;padding-left:5px;font-weight:bold;float:left'>*</span>");
		
		
			$("#form1 input[type='radio']").css("float","");
		
		});		
	</script>
		
	<!-- 搜索角色弹层  -->	
	<script type="text/javascript">
		function openRoleSearchDialog() {
		    /* 请求后台数据组成表格的js代码 */
		    $("#roleList").jqGrid({
		        url: '<%=basePath%>role/q',
		        datatype: "json",
		        colNames: ["记录编号","角色名称","操作"],
		        colModel: [{
		        	name:'id',
		        	index:'id',
		            hidden:true
		        },{
		            name: 'name',
		            index: 'name',
		            align:'center'
		        },{
		        	name:'operation',
		        	index:'operation',
		        	width:30
		        }],
		        rowNum: 10,
		        rowList: [10, 20, 30],
		        pager: '#rolePager',
		        sortname: 'create_dt', //创建时间
		        viewrecords: true,
		        sortorder: "desc",
		        width: 460,		       
		        gridComplete: function() {
		            var ids = jQuery("#roleList").jqGrid('getDataIDs');
		            for (var i = 0; i < ids.length; i++) {
		                var id = ids[i];
		                selectBtn = "<input type='button' value='选定' onclick=\"getSelectRow('" + id + "');\" />";
		                jQuery("#roleList").jqGrid('setRowData', ids[i], {
		                    operation: selectBtn
		                });
		            }
		        }
		    });
		    /* jqGrid组成表格后下面带的查询和刷新按钮,现在只保留了刷新按钮 */
		    jQuery("#roleList").jqGrid('navGrid', '#pager2', {
		        edit: false,
		        add: false,
		        del: false,
		        search: false
		    });
		    /* 点击输入框弹层的方法 */
		    $("#roleDialog").dialog({
		        modal: true,
		        height: 330,
		        width: 480
		    });
		}
		/* 点击查看后的方法 */
		function gridReload() {
		    var roleName = jQuery("#roleName").val();
		    var url = '<%=basePath%>role/q?roleName='+roleName;
		    jQuery("#roleList").jqGrid('setGridParam', {
		        url: url,
		        page: 1
		    }).trigger("reloadGrid");
		}
		/* 得到选中行的编号 */
		function getSelectRow(id) {
		    /* var id = jQuery("#list2").jqGrid('getGridParam', 'selrow');  */
		    if (id) {
		        var ret = jQuery("#roleList").jqGrid('getRowData', id);
		        var roleId = ret.id;
		        if (roleId) {
		        	//清空下拉 
		        	//$("#rl").html("");
		        	$("#role").text(ret.name);
		        	$("#rl").val(roleId);
		        	
		        	//.append("<option >-- 请选择 --</option><option selected value='"+roleId+"' selected>"+ret.name+"</option>");		           
		            $("#roleDialog").dialog("close");
		        }
		    } else {
		        alert("请选中一行记录");
		    }
		}
		function instform(){
			$("#inst").attr("disabled",false);
			$("#inst").removeAttr("style");
		}
		function platform(){
			$("#inst").attr("disabled",true);
			$("#inst").attr("style", "display:none");
		}
		jQuery(function($){
			$("#submitButton").click(function(event){
				$("#form1").submit();
			});
		});
	</script>
	<script type="text/javascript">
		/* 点击回调事件 */
		function zTreeOnExpand(event, treeId, treeNode) {
			var nodeId=treeNode.id;
			var nodeName=treeNode.name;
			 $("#datalevel_id").val(nodeId); 
			 $("#datalevel_name").text(nodeName); 
			 $( "#userDataLevelDiv" ).dialog( "close" );
		}
		var setting = {
			async : {
				enable : true,
				url : "<%=basePath%>user/getUserDataLevelTreeById",
				autoParam:["id", "name=n"],
				allParentIds:[],
				dataFilter: filter
			},
			
			callback: {
				onClick:zTreeOnExpand
			}
		};
		function filter(treeId, parentNode, childNodes) {
			 if (!childNodes) return null; 
			for (var i=0, l=childNodes.length; i<l; i++) {
				childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
			}
			return childNodes;
		}
		var treeObj;
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting);
			treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		});
		
		/* 打开层 */
		function openUserDataLevelDialog(){
			$("#userDataLevelDiv").dialog({
				modal : false,
				height : 330,
				width : 480,
				buttons:{
				  "添加":function(){
				       var checkedNodes = treeObj.getCheckedNodes(true);
					   var nodeName= "";
				       var nodeId= "";
				       $.each(checkedNodes,function(index,data){
				            if((index+1)!=checkedNodes.length){
				            	nodeId+=data.id+",";
				            	nodeName+=data.name+",";
				            	
				            }else {
				            	nodeId+=data.id;
				            	nodeName+=data.name;
				            }
				       });
				       $("#datalevel_name").text(nodeName);
				       $("#datalevel_id").val(nodeId); 
				       $( "#userDataLevelDiv" ).dialog( "close" );
				   },
				   "取消":function(){
				      $( "#userDataLevelDiv" ).dialog( "close" );
				   }
				},
			});
		}
	</script>
</head>

<body bgcolor='#FFFFFF' text='#000000' leftmargin='0' topmargin='0'
	marginwidth='0' marginheight='0' >
	<sf:form modelAttribute="user" name="form1"  id="form1">
	     <jsp:include page="/common/from_repeate_submit.jsp"/>
		<table border="1" class="Table_N" cellspacing="0" cellpadding="5"
			align="center" width="100%">
			<tr class="Table_H">
				<td nowrap colspan="2" class="Table_H" height="30">用户编辑： <font
					color="red"> </font></td>
			</tr>
			<tr>
				<c:choose>
					<c:when test="${user.id != null }">
						<td width=15% align="center">登录名</td>
						<td>
							<sf:input path="username" style="background-color:#eee"  readonly="true" maxlength="12" size="30"
								autocomplete="off"  id="username" />
							<span id="id" style="display: none">${user.id }</span>
						</td>
					</c:when>
					<c:otherwise>
						<td width="10%" align="center">登录名</td>
						<td>							 
							<sf:input path="username" placeholder="用户名不为空且最多12位字符" maxlength="12" size="30"
								autocomplete="off"  id="username" required="required"/>
							<span id="usernameTip" ></span>
						</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td width="10%" align="center">真实姓名</td>
				<c:choose>
					<c:when test="${user.realname == 'admin' }">
						<td>${user.realname } <sf:hidden path="realname" /></td>
					</c:when>
					<c:otherwise>
						<td>
							<sf:input path="realname" placeholder="姓名非空且最大10个汉字" maxlength="10" size="30"
								autocomplete="off"  id="xm"  required="required"/><span id="xmTip"></span>
						</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td align="center">部门名称</td>
				<td><sf:input path="dept" placeholder="部门名称不能为空且最多10个汉字" maxlength="10" size="30" id="dp"  required="required"/>
					<span id="dpTip" style="float:left" ></span>
					<input type="hidden" name="referer" value="${referer}"/>
				</td>
			</tr>
			<tr>
				<td align="center">职务</td>
				<td><sf:input path="job" placeholder="职务最多30个汉字" maxlength="30" size="30"  id="job"/>
					<span id="jobTip" style="width:300px"></span>
				</td>
			</tr>
			<tr>
				<td align="center">email</td>
				<td><sf:input path="email" placeholder="格式如 btg@btg.com.cn" maxlength="25" size="30" id="email"/>
					<span id="emailTip" style="width:300px"></span>
				</td>
			</tr>
			<tr>
				<td align="center">手机</td>
				<td><sf:input path="mobile" placeholder="手机号不能为空且只能为11位数字" maxlength="11" size="30"  id="mb"  required="required"/>
				<span id="mbTip" style="width:300px"></span>
				</td>
			</tr>
			<tr>
				<td align="center">固话</td>
				<td>
					<span id="areaCodeTip" class="tip">分别填写区号，电话号码，分机号</span>
					<sf:input path="phone" id="ph"/>
					<span id="phTip" style="width:300px"></span>
				</td>
			</tr>
			<c:if test="${user.realname!='admin' }">
				<tr>
					<td align="center">状态</td>
					<td>禁用:<sf:radiobutton path="enabled" value="0" class="g-ipt"/> 启用:<sf:radiobutton
							path="enabled" value="1" class="g-ipt"/></td>
				</tr>
				<tr>
					<td align="center">角色</td>
					<td height="28px">
						<%
							User u = (User)request.getAttribute("user");
							Set<Role> roles = u.getRole();
							Iterator<Role> roleIter = roles.iterator();
							//取一个
							if(roleIter.hasNext()){
								request.setAttribute("role", roleIter.next());
							}
						 %>
						 <span class="g-ipt" id="role" onclick="openRoleSearchDialog()">${role.name ==null?'<font color="#FF8C00">请选择角色</font>&nbsp;&nbsp; ':role.name }</span>
						 <input type="hidden" name="roles" id="rl" value="${role.id }" readonly="readonly" />	 
					 <span id="rlTip" style="width:300px"></span>
					</td>
				</tr>
				<tr>
					<td align="center">用户类型</td>
					<td>
					</td>
				</tr>
			</c:if>
		</table>
		<br>
		<input type="button" id="submitButton" name="button" class="button" value="确定" />
		<input type="button" value="返回" class="button"
			onclick="javascript: window.location.href=document.referrer;" />
	</sf:form>
	
	<!-- 角色弹出层 -->
	<div id="roleDialog" title="搜索角色" style="display: none">
		<div>			
			角色名称<input type="text" id="roleName" /><br/>
			<button onclick="gridReload()" id="submitButton">查询</button>
		</div><br>
		<table id="roleList"></table> 
		<div id="rolePager"></div>
	</div>
</body>
</html>
