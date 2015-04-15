<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

		<title>查看权限</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="查看权限">
		<link href="resources/css5/jh.css" rel="stylesheet" type="text/css" />
		<link href="resources/css5/ccb.css" rel="stylesheet" type="text/css" />
		<link href="resources/css5/tx.css" rel="stylesheet" type="text/css" />
		<link href="resources/css5/B.css" rel="stylesheet" type="text/css" />
		<link href="resources/js5/xtree/xtree.css" rel="stylesheet"
			type="text/css" />
		<script src="resources/js5/xtree/xtree.js"></script>
		<script type="text/javascript" src="resources/js5/jquery/jquery.js"></script>
		<script type="text/javascript">
			if(parent.location+"/" == self.location){
				parent.location.reload();
			}
			function view(id){
				$("#resource_info_frame").contents().find("body").html("<string>请稍候......</string>");
				$("#resource_info_frame").attr("src","<%=basePath%>resource/view?id="+id);			
			}				
		</script>
	</head>

	<body bgcolor='#FFFFFF' text='#000000' leftmargin='0' topmargin='0'
		marginwidth='0' marginheight='0'>
		<table border="1" class="Table_N" cellspacing="0" cellpadding="5"
			align="center" width="100%" height="100%">

			<tr class="Table_H">
				<td colspan="2" class="Table_H"
					style="vertical-align: middle; height: 40">
					权限查看&nbsp;
				</td>
			</tr>
			<tr>
				<td style="width: 50%; height: 100%" rowspan="100" align="left"
					valign="top">
					<div style="overflow-y: scroll; height: 400px;">
						<script type="text/javascript"> ${tree} </script>
					</div>
				</td>
			</tr>
			<tr>
				<td valign="top" style="border-top: 0" rowspan="100" width="100%">
					<iframe 
						style="Z-INDEX: 1; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 100%; overflow: auto;"
						id="resource_info_frame"  name="frame_main"
						frameborder="0"  scrolling="yes" width="100%">
					</iframe>					
				</td>
			</tr>
		</table>
	</body>
</html>
