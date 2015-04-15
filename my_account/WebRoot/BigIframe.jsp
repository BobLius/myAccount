<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>Title</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="登录页">
		<link href="resources/css5/CmpCSS.css" rel="stylesheet"
			type="text/css" />
		<script language="javascript">
			function submitTX(i, urlstr) {
				window.frames["sub_frame_main"].document.location.href = urlstr;
				for ( var k = 1; k < 300; k++) {
					if (document.getElementById("Tab_Menu_" + k) != null) {
						document.getElementById("Tab_Menu_" + k).className = "MainCMP_Right_Tab_OutRight";
						document.getElementById("Tab_Menu_L_" + k).className = "MainCMP_Right_Tab_OutLeft";
					}
				}
				document.getElementById("Tab_Menu_" + i).className = "MainCMP_Right_Tab_OnRight";
				document.getElementById("Tab_Menu_L_" + i).className = "MainCMP_Right_Tab_OnLeft";
		
			};
	
		</script>
	</head>


	<link href="../css5/CmpCSS.css" rel="stylesheet" type="text/css" />
	<body style="overflow: hidden;" onload="submitTX(999, 'welcome.jsp');">
		<table width="100%" height="100%" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td valign="top">
					<div class="MainCMP_Right_Tab_TittleBG">
						<div class="MainCMP_Right_Tab_Menu">
							<ul id="welcome" style="display: ">
								<li onClick="submitTX(999,'welcome.htm');" id="Tab_Menu_999">
									<span id="Tab_Menu_L_999"></span>welcome!
								</li>
							</ul>
						</div>
						<div class="MainCMP_Right_Tab_TRight"></div>		
					</div>				
				</td>
			</tr>
			<tr>
				<td valign="top" width="100%" height="100%">
					<iframe 
						style="Z-INDEX: 1; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 100%; overflow: auto;"
						id="mainframe"  name="sub_frame_main" src="views/welcome.jsp"
						frameborder="0" scrolling="yes" width="100%"></iframe>
				</td>
			</tr>
		</table>

	</body>
</html>
