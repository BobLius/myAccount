<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML1.0 Transitional//EN">
<html>
	<head>
	<script type="text/javascript">
		/** 按钮没有优先级和菜单级别 */
		function check1(){
			document.getElementById("level").disabled=true;
			document.getElementById("priority").disabled=true;
			document.getElementById("caidanId").style.display="none";
			document.getElementById("caidanId1").style.display="none";
		}
		
		function check(){
			document.getElementById("level").disabled=false;
			document.getElementById("priority").disabled=false;
			document.getElementById("caidanId").style.display="";
			document.getElementById("caidanId1").style.display="";
		}
		/** 页面载入时执行 默认行为 按钮无 优先级和菜单级别 */
		function check2(){
			if(document.getElementById("type2").checked){
				check1();
			}
		}
	</script>
		<base href="<%=basePath%>">
		<title>权限编辑</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="权限树">
		<!--第二步：css文件嵌入(示具体情况而定引用文件)-->
		<link href="resources/css5/jh.css" rel="stylesheet" type="text/css" />
		<link href="resources/css5/ccb.css" rel="stylesheet" type="text/css" />
		<link href="resources/css5/B.css" rel="stylesheet" type="text/css" />
		<link href="resources/css5/tx.css" rel="stylesheet" type="text/css" />	
	</head>

	<body bgcolor='#FFFFFF' text='#000000' leftmargin='0' topmargin='0'
		marginwidth='0' marginheight='0' onload="check2();">
		<sf:form method="post" modelAttribute="resource" id="form1" cssStyle="height:100%">
		     <jsp:include page="/common/from_repeate_submit.jsp"/>
			<table border="1" class="Table_N" cellspacing="0" cellpadding="5"
			align="center" width="100%">
				<tr class="Table_H">
					<td nowrap colspan="2" class="Table_H" height="30">
						权限编辑：
						<font color="red"> </font>
					</td>
				</tr>
				<tr>
					<td align="left" style="vertical-align: middle" width="18%">
						权限名称
					</td>
					<td>
						<sf:input path="name" maxlength="30"/>
						<sf:errors path="name" cssClass="error"></sf:errors>
					</td>
				</tr>
				<tr>
					<td align="left" style="vertical-align: middle" width="18%">
						别名
					</td>
					<td>
						<sf:input path="synonyms" maxlength="30"/>
					</td>
				</tr>
				<tr>
					<td align="left" style="vertical-align: middle" width="18%">
						类型
					</td>
					<td>					
						菜单:<sf:radiobutton path="type" id="type" value="0" onclick="check();"/>
						按钮:<sf:radiobutton path="type" id="type2" value="1" onclick="check1();"/>
						<sf:errors path="type" cssClass="error"></sf:errors>
						
					</td>
				</tr>
				<tr>
					<td align="left" style="vertical-align: middle" width="18%">
						菜单级别
					</td>
					
					<td>
							
						<div ID="caidanId" style="display: ">
						<sf:select path="level" id="level">
							<sf:option value="1" label="一级菜单  "/>
							<sf:option value="2" label="二级菜单  "/>
							<sf:option value="3" label="三级菜单  "/>
							<sf:option value="0" label="【根节点】  "/>
						</sf:select>
						<sf:errors path="level" cssClass="error"></sf:errors>
						</div>
					</td>
				</tr>
				
				<tr>
					<td align="left" style="vertical-align: middle" width="18%">
						优先级
					</td>
					
					<td>
						<div id="caidanId1" style="display: ">
						<sf:input path="priority"  maxlength="2" size="2"/>
						<sf:errors path="priority" cssClass="error"></sf:errors>
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" style="vertical-align: middle" width="18%">
						路径
					</td>
					<td>
						<sf:input path="url" maxlength="200" size="50"/>
						<sf:errors path="url" cssClass="error"></sf:errors>
					</td>
				</tr>
				
				<tr>
					<td align="left" style="vertical-align: middle" width="18%">
						日志级别
					</td>
					<td>
						<sf:select path="log_level">
							<sf:option value="-1" label="不记录  "/>
							<sf:option value="0" label="DEBUG"/>
							<sf:option value="1" label="INFO"/>
							<sf:option value="2" label="WARN"/>
						</sf:select>
						<sf:errors path="log_level" cssClass="error"></sf:errors>
					</td>
				</tr>
				
				<tr>
					<td align="left" style="vertical-align: middle" width="18%">
						事件名称
					</td>
					<td>
						<sf:input path="event_name" maxlength="30"/>
					</td>
				</tr>
				
				
				
				<tr>
					<td align="left" style="vertical-align: middle" width="18%">
						父级名称
					</td>
					<td>
						<sf:input path="parent.name" maxlength="30" readonly="true"/>
						<sf:hidden path="parent.id" />
					</td>
				</tr>
				<tr>
					<td align="left" style="vertical-align: middle" width="18%">
						权限类型
					</td>
					<td>					
						系统权限:<sf:radiobutton path="resources_type" id="resources_type" value="0" checked="true"/>
						业务权限:<sf:radiobutton path="resources_type" id="resources_type2" value="1"/>
					</td>
				</tr>
			</table>
			<br>
				<input type="submit" value="确定" class="button"/>
			<input type="button" value="返回" name="queryButton" class="button"
				onclick="javascript:parent.document.getElementById('resource_info_frame').contentWindow.history.back();" />
		</sf:form>
	</body>
</html>