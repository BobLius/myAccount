<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.miteno.myAccount.security.util.UserInfoUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@page import="org.springframework.security.core.context.SecurityContextImpl"%>
<%@page import="org.springframework.security.core.Authentication"%>

<%@ page import="org.springframework.security.web.WebAttributes" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
  <head>
    <base href="<%=basePath%>">    
    <title>管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="登录页">
		<link href="resources/css5/CmpCSS.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript">
			if (self != top) {  
				top.location = self.location;  
			}		
			function doSubmit(){
				if(document.getElementById("username").value==""||document.getElementById("password").value==""){
					alert("用户名或密码为空");					
					return false;
				}
				/* if(document.getElementById("j_captcha").value==""){
					alert("验证码不能为空");
					document.getElementById("j_captcha").focus();
					return false;
				}
				*/
				document.form1.submit()
				document.getElementById("subBtn").disabled="true";
			}
			function init(){
				document.form1.j_username.focus();
			}
		</script>		
  </head>
  
  <body onload="init()"> 
  <span style="color:red"><% Object authException = session.getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION); %>
	
	<form action="j_spring_security_check" method="post" name="form1">
		<div class="LoginCMP_container">
			<div class="LoginCMP_BodyLogo"></div>
			<div class="LoginCMP_BodyInput_left"></div>
			<div class="LoginCMP_BodyInput_Pic"></div>
			<div class="LoginCMP_BodyInput_Input">
				<div class="LoginCMP_BodyInput_Text">
					用户编号：
					<br/>
					登录密码：
					<br/>
					 验证码：
					 <br/>
				</div>
				<div class="LoginCMP_BodyInput_InputText">
					<font color="red">						
						<c:choose>
							<c:when test="${fn:contains(sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message,'Bad credentials')}">
								用户编号或密码错误								
							</c:when>
							<c:when test="${fn:indexOf(sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message,'Cannot pass null') != -1 }">
								用户编号或密码错误
							</c:when>
							<c:when test="${not empty sessionScope.validCodeResult && !sessionScope.validCodeResult }">
								验证码错误
							</c:when>
							<c:when test="${fn:contains(sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message,'User account is locked')}">
								密码错误次数过多，账号已锁定
							</c:when>
							<c:when test="${fn:contains(sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message,'User credentials have expired')}">
								密码已过期，请<a href="<c:url value="/user/personal/newPwd"/>">修改密码</a> 
							</c:when>
							<c:otherwise>
								${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}
							</c:otherwise>
						</c:choose>
						<% 
							
							session.removeAttribute("SPRING_SECURITY_LAST_EXCEPTION"); 
							session.removeAttribute("validCodeResult");
						
						%>
					</font>
					<input name="j_username" id="username" type="text" maxlength="6" style="width: 150px;"/>
					<input name="j_password" id="password" type="password"  maxlength="12" style="width: 150px;"/>
					<input type='text' name='j_captcha' id="j_captcha" class="required" size='5' /> <div style="float: left"><img id="captchaImg" src="<c:url value="/jcaptcha.jpg"/>" onclick="this.src ='<c:url value="/jcaptcha.jpg"/>?r='+new Date()" width="70px" height="30px" title="看不清，点击换一张"/></div>
				</div>
			</div>
			
			<div class="LoginCMP_BodyInput_right"></div>
			<div class="LoginCMP_BodyBotton">
				<div class="LoginCMP_BodyInput_button" >
						<input type="image" src="resources/Images/meitainuo_06.jpg" id="subBtn" onclick="javascript:return doSubmit();"
						onMouseOver="this.src='resources/Images/meitainuo_06_1.jpg'"
						onMouseOut="this.src='resources/Images/meitainuo_06.jpg'" />
				</div>
			</div>
		</div>
		<div class="LoginCMP_Copyright">
				&copy;  版权所有 &copy; 2012 All Rights Reserved 
			</div>
			</form>	
	</body>
</html>
