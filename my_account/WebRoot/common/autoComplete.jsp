<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="resources/js5/jquery.autocomplete.js"></script>
<link href="resources/css5/jquery.autocomplete.css" rel="stylesheet" type="text/css" />	
<script type="text/javascript">
		//自动完成方法
		function autocomplete(obj,url,fun){
			obj.autocomplete(url,{
				max : 10, //列表里的条目数
				minChars : 0, //自动完成激活之前填入的最小字符
				width : 400, //提示的宽度，溢出隐藏
				mustMatch:true,//如果设置为true，autoComplete只会允许匹配的结果出现在输入框,所有当用户输入的是非法字符时将会得不到下拉框，Default:false 
				scrollHeight : 300, //提示的高度，溢出显示滚动条
				matchContains : true, //包含匹配，就是data参数里的数据，是否只要包含文本框里的数据就显示
				autoFill : false, //自动填充
//					dataType : "json", //json类型
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
				return i  + ':"' + row.name+ '"[' + row.to + ']';
			},
			formatMatch : function(row, i, max) {
				return row.name + row.to;
			},
			formatResult : function(row) {
				return row.to;
			}
			}).result(function(event, row, formatted) {
				if(fun!=undefined){
					fun(event, row, formatted);
				}
			});
		}
</script>