function scrollLine(){
	if (document.getElementById("switchPoint").className=='MainCMP_CenterLine_R2L'){
		document.getElementById("switchPoint").className='MainCMP_CenterLine_L2R';
		document.getElementById("scrollLine").className='MainCMP_CenterLineMin';
		document.getElementById("MainCMP_Left").style.display='none';
	}
	else{
		document.getElementById("switchPoint").className='MainCMP_CenterLine_R2L';
		document.getElementById("scrollLine").className='MainCMP_CenterLine';
		document.getElementById("MainCMP_Left").style.display='';
	}
}

function expand(obj,str,ind){		
	if(document.getElementById('show'+ind).style.display=='')
		document.getElementById('show'+ind).style.display='none';
	else
		document.getElementById('show'+ind).style.display='';
	if(obj.children[0].className.indexOf('left_menu_less') != -1)
		obj.children[0].className=obj.children[0].className.replace('less','more');	
	else
		obj.children[0].className=obj.children[0].className.replace('more','less');
}
function reverse(obj) {
	var all_list = document.getElementsByTagName("li");
	var i = 0, temp, Send, Sleft;
	for (i = 0; i < all_list.length; i++) {
		temp = all_list[i].className;
		if (temp.length > 3) {
			Send = temp.substring(temp.length - 3, temp.length);
			if (Send == "red") {
				Sleft = temp.substring(0, temp.length - 4);
				all_list[i].className = Sleft;
			}
		}
	}
	obj.className = obj.className + "_red";
}
var tabTemplate = "<li><a href='__{href}__'>__{label}__</a> <span class='ui-icon ui-icon-close' role='presentation'>Remove Tab</span></li>";

function jump(id,title,href){
	var tt = $('#tt');
	if (tt.tabs('exists', title)) { //如果tab已经存在,则选中并刷新该tab    	
	    tt.tabs('select', title);
	    refreshTab({
	        tabTitle: title,
	        url: href
	    });
	} else {
	    if (href) {
	        var content = '<iframe scrolling="yes"  frameborder="0"  src="' + href + '" style="width:100%;height:100%;"></iframe>';
	    } else {
	        var content = '未实现';
	    }
	    tt.tabs('add', {
	        title: title,
	        closable: true,
	        content: content
	    });
	}     
}

/**    
 * 刷新tab
 * @cfg 
 *example: {tabTitle:'tabTitle',url:'refreshUrl'}
 *如果tabTitle为空，则默认刷新当前选中的tab
 *如果url为空，则默认以原来的url进行reload
 */
function refreshTab(cfg){
	var refresh_tab = cfg.tabTitle?$('#tt').tabs('getTab',cfg.tabTitle):$('#tt').tabs('getSelected');
	if(refresh_tab && refresh_tab.find('iframe').length > 0){
	var _refresh_ifram = refresh_tab.find('iframe')[0];
	var refresh_url = cfg.url?cfg.url:_refresh_ifram.src;
	//_refresh_ifram.src = refresh_url;
	_refresh_ifram.contentWindow.location.href=refresh_url;
	}
}
