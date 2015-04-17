<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html;charset=utf-8"
	isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>访问禁止</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script src="resources/jquery/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
       var intDiff = parseInt(3);//倒计时总秒数量
	function timer(intDiff){
	         $('#second_show').html('<s></s>'+intDiff+'秒 后自动跳转到登录页面！');
		    window.setInterval(function(){
		    var day=0,
		        hour=0,
		        minute=0,
		        second=0;//时间默认值       
		    if(intDiff > 0){
		        day = Math.floor(intDiff / (60 * 60 * 24));
		        hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
		        minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
		        second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
		    }else{
		       $("#frm").submit();
		    }
		    if (minute <= 9) minute = '0' + minute;
		    if (second <= 9) second = '0' + second;
// 		    $('#day_show').html(day+"天");
// 		    $('#hour_show').html('<s id="h"></s>'+hour+'时');
// 		    $('#minute_show').html('<s></s>'+minute+'分');
		    $('#second_show').html('<s></s>'+second+'秒 后自动跳转到登录页面！');
		    intDiff--;
		    }, 1000);
		} 
			$(function(){
			    timer(intDiff);
			}); 
    </script>
    <style type="text/css">
			  h1 {
    font-family:"微软雅黑";
    font-size:40px;
    margin:20px 0;
    border-bottom:solid 1px #ccc;
    padding-bottom:20px;
    letter-spacing:2px;
}
.time-item strong {
    background:#C71C60;
    color:#fff;
    line-height:49px;
    font-size:36px;
    font-family:Arial;
    padding:0 10px;
    margin-right:10px;
    border-radius:5px;
    box-shadow:1px 1px 3px rgba(0,0,0,0.2);
}
#day_show {
    float:left;
    line-height:49px;
    color:#c71c60;
    font-size:32px;
    margin:0 10px;
    font-family:Arial,Helvetica,sans-serif;
}
.item-title .unit {
    background:none;
    line-height:49px;
    font-size:24px;
    padding:0 10px;
    float:left;
}
	</style>
  
  </head>
  <body>
  <% 
	request.setCharacterEncoding("UTF-8");
	response.setStatus(HttpServletResponse.SC_FORBIDDEN);
	%>
	<h1>用户认证失败</h1>
<div class="time-item">
<!--     <span id="day_show">0天</span> -->
<!--     <strong id="hour_show">0时</strong> -->
<!--     <strong id="minute_show">0分</strong> -->
    <strong id="second_show">10秒</strong>
    <form method="post" id="frm" action="j_spring_cas_security_logout">
    </form>
</div>
  </body>
</html>
