<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta name="keywords" content="jquery,ui,easy,easyui,web">
<meta name="description"
	content="easyui help you build your web page easily!">
<title>管理系统</title>
<link type="text/css" rel="stylesheet"
	href="resources/easyui/themes/default/easyui.css" />
<link type="text/css" rel="stylesheet"
	href="resources/easyui/themes/icon.css" />

<script type="text/javascript"
	src="resources/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript"
	src="resources/easyui/jquery.easyui.min.js"></script>


<script type="text/javascript" src="resources/js5/cmp.js"></script>
<link href="resources/css5/CmpCSS.css" rel="stylesheet" type="text/css" />

<!-- 提醒小窗口样式开始 -->
<style type="text/css">
#msg_win {
	border: 1px solid #A67901;
	background: #EAEAEA;
	width: 240px;
	position: absolute;
	right: 0;
	font-size: 12px;
	font-family: Arial;
	margin: 0px;
	display: none;
	overflow: hidden;
	z-index: 99;
}

#msg_win .icos {
	position: absolute;
	top: 2px;
	*top: 0px;
	right: 2px;
	z-index: 9;
}

.icos a {
	float: left;
	color: #833B02;
	margin: 1px;
	text-align: center;
	font-weight: bold;
	width: 14px;
	height: 22px;
	line-height: 22px;
	padding: 1px;
	text-decoration: none;
	font-family: webdings;
}

.icos a: hover {
	color: #fff;
}

#msg_title {
	background: #0291E8;
	border-bottom: 1px solid #A67901;
	border-top: 1px solid #FFF;
	border-left: 1px solid #FFF;
	color: #FFF;
	height: 25px;
	line-height: 25px;
	text-indent: 5px;
}

#msg_content {
	margin: 5px;
	margin-right: 0;
	width: 230px;
	height: 126px;
	overflow-y: scroll;
}
</style>
<!-- 提醒小窗口样式结束 -->
<script type="text/javascript" type="text/javascript">	
		 function deleteCookie(name){
           var date=new Date();
           date.setTime(date.getTime()-10000);
           document.cookie=name+"=v; expire="+date.toGMTString()+"; path=/myAccount/ ;domain="+document.domain;
         }
         
         // js 遍历所有Cookie
		function foreach()
		{
		  var strCookie=document.cookie;
		  var arrCookie=strCookie.split("; "); // 将多cookie切割为多个名/值对
		  for(var i=0;i <arrCookie.length;i++)
		  { // 遍历cookie数组，处理每个cookie对
		    var arr=arrCookie[i].split("=");
		    if(arr.length>0)
		       deleteCookie(arr[0]);
		  }
		}
			function sysExit() {
				try{
				   foreach();
				   document.jhform.submit();
				}catch(e){
				
				}
			}	
			

		    var DispClose = true;
		    function CloseEvent()
		    {
		        if (DispClose)
		        {
		        	DispClose = false; //避免出现两次提醒
		            return "是否离开当前页面?";
		        }
		    }
		    
		    function UnLoadEvent()
		    {
		    	sysExit();		        
		        //在这里处理关闭页面前的动作
		    }
		    //利用Ajax检测是否处于登录状态
		    function checkIsLogin(){
		    	$.get("<%=basePath%>checkIsLogin?r="+new Date(),function(result){
		    		if(result != "true"){
		    		//	alert("您已经退出，请重新登录！");
		    			top.location.href="<%=basePath%>login.jsp";
		    		}
		    	}).error(function(result){
		    	//	alert("您已经退出，请重新登录！");
		    		top.location.href="<%=basePath%>login.jsp";
		    	});
		    }

	 
	function refresh(){
		var ttDiv=$("#tt");
		var mmDiv=$("#mm");
		ttDiv.tabs('getTab',mmDiv.data("title")).panel('refresh');
		
	} 
	function closeThis(){
		var ttDiv=$("#tt");
		var mmDiv=$("#mm");
		if(ttDiv.tabs('getTab',mmDiv.data("title")).panel('options').closable){
			ttDiv.tabs('close',mmDiv.data("title"));
		}
	}
	function closeAll(){
		var ttDiv=$("#tt");
		var closeTabsTitle=getAllTabTitle(ttDiv);
		$.each(closeTabsTitle,function(){
			var title=this;
			ttDiv.tabs('close',title);
			
		});
	}	
	function closeOther(){
		var ttDiv=$("#tt");
		var mmDiv=$("#mm");
		var closeTabsTitle=getAllTabTitle(ttDiv);
		$.each(closeTabsTitle,function(){
			var title=this;
			if(title!=mmDiv.data("title")){
				ttDiv.tabs('close',title);
			}
			
		});
	}	
	function getAllTabTitle(tab){
		var closeTabsTitle=[];
		/* tab.tabs('tabs')是取出id为tt的tab下的所有子tab */
		var allTabs=tab.tabs('tabs');
		$.each(allTabs,function(){
		/* 遍历所以子tab，并取出子tab中panel中的options */
			var opt=this.panel('options');
			/* 通过options取出title和closable属性 */
			var title=opt.title;
			var closable=opt.closable;
			/* 只有closable为ture的才可以关闭 */
			if(closable){
				closeTabsTitle.push(title);
			}
		});
		return closeTabsTitle;
	}	 
	function edit(id){
		document.location.href='<%=basePath%>user/view?id='+id;
	}
</script>
</head>
<body class="easyui-layout layout panel-noscroll"
	style="text-align:left">
	
	<div data-options="region:'north'" style="height:115px">
		
		<div class="TopCMP_Tool">
			<div class=""></div>
			<div class="TopCMP_CMP_Logo"></div>
		</div>
		<!-- End TopCMP_Tool -->
		<div class="TopCMP_ToolUnderLine">
			<div class="TopCMP_ToolUnderLine_left"></div>
			<!-- End TopCMP_ToolUnderLine_left -->
			<div class="TopCMP_ToolUnderLine_right"></div>
			<!-- End TopCMP_ToolUnderLine_right -->
		</div>
		<!-- End TopCMP_ToolUnderLine -->
		<div class="TopCMP_FirstMenu">
			<div class="TopCMP_FirstMenu_left"><form name="jhform" action="j_spring_cas_security_logout"></form></div>
			<!-- End TopCMP_FirstMenu_left -->
			<div class="TopCMP_FirstMenu_welcomeFont">
				尊敬的
				<c:forEach var="role" items="${user.role}"> ${role.name} </c:forEach>
				<span
					style="font-size:15px;color: yellow; text-decoration: underline; cursor: pointer;"
					onClick="edit('${user.id}')"
					title="点击查看个人信息">
				<%-- <span
					style="font-size:15px;color: yellow; text-decoration: underline; cursor: pointer;"
					onclick="javascript:jump('<%=basePath %>user/personal/edit')"
					title="点击查看个人信息" --%>  <%-- <security:authentication property="principal.username" /> --%>
					${user.username }</span> ，欢迎您使用管理系统!

			</div>
			<div class="TopCMP_FirstMenu_right"></div>
			<!-- End TopCMP_FirstMenu_right -->
			<div class="TopCMP_FirstMenu_sysMenu">
				<ul>
					<li class="TopCMP_FirstMenu_sysExit" onclick="sysExit();">
						安全退出</li>
				</ul>
			</div>
			<!-- End TopCMP_FirstMenu_sysMenu -->
		</div>
		<!-- End TopCMP_FirstMenu -->
	</div>
	<div data-options="region:'west',split:true" title="导航菜单"
		style="width:216px;">
		
		<table style="background: #E0DBD6;width: 209px;height: 100%;border: 0;padding: 0">
		    <tbody>
		        <tr>
		            <td vAlign=top width="100%" class="MainCMP_Left">
		                <div class="TopCMP_FirstMenu_TittleBG">
		                    <div class="TopCMP_FirstMenu_TittleIcon">
		                        全部菜单
		                    </div>
		                </div>
		                <div class="clear">
		                </div>
		                <div class="TopCMP_SecMenuBG">
		                    <ul>
		                        <c:forEach items="${resources}" var="resource">
		                            <!-- L1 start -->
		                                <%-- TopCmp_Sec --%>
		                                    <li class="TopCMP_SecMenuBG_li1" id="num<c:out value='${resource.id }'/>"
		                                    onclick="expand(this,null,'<c:out value='${resource.id }'/>');reverse(this);">
		                                        <div class="left_menu_more">
		                                        	<c:choose>
		                                        		<c:when test="${user_type=='1'}">
		                                        			<c:if test="${resource.synonyms!=null}">
			                                        			<c:out value="${resource.name }" />
		                                        			</c:if>
		                                        			<c:if test="${resource.synonyms==null}">
			                                        			<c:out value="${resource.name }" />
		                                        			</c:if>
		                                        		</c:when>
			                                        	<c:otherwise>
				                                            <c:out value="${resource.name }" />
			                                        	</c:otherwise>
		                                        	</c:choose>
		                                        </div>
		                                    </li>
		                                    <!-- L1 end -->
		                                    <!-- L2 start-->
		                                    <li id="show<c:out value='${ resource.id }'/>" style="display: none; overflow: hidden;"
		                                    class="leftMenu_height_hack">
		                                        <c:forEach items="${resource.children }" var="resource2">
		                                                <ul>
		                                                    <%--${fn:length(rowList)>
		                                                        2 --%>
		                                                        <c:set var="expandable" value="false">
		                                                        </c:set>
		                                                        <c:forEach items="${resource2.children}" var="resource3">
		                                                            <c:if test="${!expandable }">
		                                                                <c:if test="${resource3.type == '0' }">
		                                                                    <c:set var="expandable" value="true">
		                                                                    </c:set>
		                                                                </c:if>
		                                                            </c:if>
		                                                        </c:forEach>
		                                                        <c:choose>
		                                                            <c:when test="${!expandable }">
		                                                                <%--L3 button --%>
		                                                                    <li id="num<c:out value='${resource2.id }'/>" class="TopCMP_SecMenuBG_li2"
		                                                                    onClick="reverse(this);">
		                                                                        <div class="left_menu_less2_2" onClick="jump('<c:url value='${resource2.id }'/>','${resource2.name}','<c:url value='${resource2.url }'/>');">
		                                                                            <c:choose>
										                                        		<c:when test="${user_type=='1'}">
										                                        			<c:if test="${resource2.synonyms!=null}">
											                                        			<c:out value="${resource2.name }" />
										                                        			</c:if>
										                                        			<c:if test="${resource2.synonyms==null}">
											                                        			<c:out value="${resource2.name }" />
										                                        			</c:if>
										                                        		</c:when>
											                                        	<c:otherwise>
												                                            <c:out value="${resource2.name }" />
											                                        	</c:otherwise>
										                                        	</c:choose>
		                                                                        </div>
		                                                                    </li>
		                                                            </c:when>
		                                                            <c:otherwise>
		                                                                <%-- L3 menu --%>
		                                                                    <li id="num<c:out value='${resource2.id }'/>" class="TopCMP_SecMenuBG_li3"
		                                                                    onclick="expand(this,null,'<c:out value='${resource2.id }'/>');reverse(this);">
		                                                                        <div class="left_menu_more2">
		                                                                            <c:choose>
										                                        		<c:when test="${user_type=='1'}">
										                                        			<c:if test="${resource2.synonyms!=null}">
											                                        			<c:out value="${resource2.name }" />
										                                        			</c:if>
										                                        			<c:if test="${resource2.synonyms==null}">
											                                        			<c:out value="${resource2.name }" />
										                                        			</c:if>
										                                        		</c:when>
											                                        	<c:otherwise>
												                                            <c:out value="${resource2.name }" />
											                                        	</c:otherwise>
										                                        	</c:choose>
		                                                                        </div>
		                                                                    </li>
		                                                                    <li id="show<c:out value='${ resource2.id }'/>" style="display: none; overflow: hidden;"
		                                                                    class="leftMenu_height_hack">
		                                                                        <c:forEach items="${resource2.children }" var="resource3">
		                                                                            <c:if test="${resource3.type == 0 }">
		                                                                                    <ul>
		                                                                                        <li id="num<c:out value='${resource3.id }'/>" class="TopCMP_SecMenuBG_li3"
		                                                                                        onClick="reverse(this);">
		                                                                                            <div class="left_menu_less3" onClick="jump('<c:url value='${resource3.id }'/>','${resource3.name}','<c:url value='${resource3.url }'/>');">
		                                                                                                <c:choose>
															                                        		<c:when test="${user_type=='1'}">
															                                        			<c:if test="${resource3.synonyms!=null}">
																                                        			<c:out value="${resource3.name }" />
															                                        			</c:if>
															                                        			<c:if test="${resource3.synonyms==null}">
																                                        			<c:out value="${resource3.name }" />
															                                        			</c:if>
															                                        		</c:when>
																                                        	<c:otherwise>
																	                                            <c:out value="${resource3.name }" />
																                                        	</c:otherwise>
															                                        	</c:choose>
		                                                                                            </div>
		                                                                                        </li>
		                                                                                    </ul>
		                                                                            </c:if>
		                                                                        </c:forEach>
		                                                                    </li>
		                                                            </c:otherwise>
		                                                        </c:choose>
		                                                </ul>
		                                        </c:forEach>
		                                    </li>
		                                    <!-- L2 end -->
		                        </c:forEach>
		                    </ul>
		                </div>
		            </td>
		        </tr>
		    </tbody>
		</table>
	</div>
	<div data-options="region:'center'">
		<!--  data('index',index)在菜单上附加当前tab的index      -->  
		<div id="tt" class="easyui-tabs" data-options="
						onContextMenu:function(e, title,index){
							e.preventDefault();
							$('#mm').menu('show', {  
			                    left: e.pageX,  
			                    top: e.pageY  
		                	}).data('title',title); 
	                	}"  fit="true" >
			<div title="Welcome" href="welcome.jsp"></div>
		</div>
		
	</div>
	
	 <div id="mm" class="easyui-menu" style="width:120px;">
	 	<div data-options="iconCls:'icon-reload'" onclick="refresh()"><b>刷新</b></div>
		 <div data-options="iconCls:'icon-cancel'" onclick="closeThis()"><b>关闭当前页</b></div>
		 <div onclick="closeAll()"><b>全部关闭</b></div>
		 <div onclick="closeOther()"><b>关闭其它</b></div>
    </div> 
</body>
</html>