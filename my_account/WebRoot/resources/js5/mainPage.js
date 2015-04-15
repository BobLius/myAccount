//********************************************************************************************************
//文件说明：主框架页面使用的方法
//********************************************************************************************************

//一级菜单事件，只控制二级菜单的显示
function m1(i) {
	for(m=1;m<30;m++) {
		var menu1 = document.getElementById('m1_'+m);
		if(menu1!=null){
		var menu2 = document.getElementById('menu2_'+m);
		if (m!=i) {
			menu1.className='menu1_off';
			menu2.style.display='none';
		} else {
			menu1.className='menu1_on';
			menu2.style.display='';
		}
		}
	}
}

//二级菜单事件，控制二级菜单的点击和标题的显示
function m2(j,i) {
	//alert("in :j"+j+"   i="+i);
	
	leftOpen();
	
	for(n=1;n<130;n++) {
		var menu2item = document.getElementById('m2_'+n);
		var menu3=document.getElementById('div_m3_'+n);
		if(n!=j) {
			if(menu2item!=null){
				if(menu2item.className!='menu2_unused'){
					menu2item.className='menu2_off';
				}
			}
			if(menu3!=null){
				menu3.style.display='none';
			}
		} else {
			if(menu2item!=null){
				if(menu2item.className!='menu2_unused'){
					menu2item.className='menu2_on';
				}
			}
			cur_menu1=i;
			if(menu3!=null){
				menu3.style.display='';
			}
		}
	}
}



//三级菜单
function m3(i){
	for(m=1;m<60;m++) {
		var menu3 = document.getElementById('m3_'+m);
		if(menu3!=null){
			if (m!=i) {
				menu3.className='menu3_off';
			} else {
				menu3.className='menu3_on';
			}
		}
	}

}

//初始化菜单
function menu_onload() {
	for(n=1;n<11;n++) {
		var menu2all = document.getElementById('menu2_'+n);	
		menu2all.style.display='none';
	}
	/* modified by cxl on 20060706 */
	if(firstPage=="F700402.htm") {
		document.getElementById('menu2_'+1).style.display='none';
		document.getElementById('menu2_'+7).style.display='';
	}
	else {
		document.getElementById('menu2_'+7).style.display='none';
		document.getElementById('menu2_'+1).style.display='';
	}
}

//Iframe自动调节大小
function sizeChange() 
{ 
	try{
	    //var pRight=document.getElementById("Page_right");
		//var fLeft=self.document.getElementById("leftframe");
		var pMain=document.getElementById("mainframe");
	    if(self.document.all.mainframe!=null && mainframe.document.body!=null) {
			self.document.all.mainframe.height=mainframe.document.body.scrollHeight + 20; 
			if(self.document.all.mainframe.height<300){
				self.document.all.mainframe.height=300;
			}
		}
		//if(fLeft!=null){
		//	if(self.document.all.leftframe!=null && leftframe.document.body!=null) {
		//		self.document.all.leftframe.height=leftframe.document.body.scrollHeight + 20; 
		//	}
		//}
		//if(pRight!=null&&pMain!=null){
		//	if(document.all.Page_right.offsetWidth>0){
		//	if(screen.width>800)document.all.mainframe.width=document.all.Page_content.offsetWidth- document.all.Page_right.offsetWidth - 55;
		//	}else{
		  //  if(screen.width>800) document.all.mainframe.width=document.all.Page_content.offsetWidth- document.all.Page_right.offsetWidth - 30;
		//	}
		//}
	}catch(e)
	{
	}
}

//左侧区域收起与打开
function leftOpen() {
	if(screen.width>800){
		var pRight=document.getElementById("Page_right");
		if(pRight!=null){
		parent.parent.Page_right.style.display='';
		lclose.style.display='';
		lopen.style.display='none';
		document.all.mainframe.width=document.all.Page_content.offsetWidth- document.all.Page_right.offsetWidth - 55;
		}
	}
}
		
function leftClose() {	
	var pRight=document.getElementById("Page_right");
	if(pRight!=null){
		parent.parent.Page_right.style.display='none';
		lclose.style.display='none';
		if(screen.width>800){
			lopen.style.display='';		
			document.all.mainframe.width=document.all.Page_content.offsetWidth- document.all.Page_right.offsetWidth - 40;
		}
	}
}

//判断收起与打开按纽，并显示
function showButton() {
	if (parent.parent.Page_right.style.display!='none') {
		document.write('<table border="0" class="float_right"><tr><td id="lclose" class="icon_size icon_close" onclick="leftClose()" title="关闭右侧辅助区域[ctrl + →]"></td><td id="lopen" class="icon_size icon_open" onclick="leftOpen()" style="display:none;" title="打开右侧辅助区域[ctrl + ←]"></td></tr></table>');
	} else {
		document.write('<table border="0" class="float_right"><tr><td id="lclose" class="icon_size icon_close" style="display:none;" onclick="leftClose()" title="关闭右侧辅助区域[ctrl + →]"></td><td id="lopen" class="icon_size icon_open" onclick="leftOpen()" title="打开右侧辅助区域[ctrl + ←]"></td></tr></table>');
	}
}

function quickJumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

var menu_change_flag=true;
var cur_menu1=1;
function change_menu(){
	if(menu_change_flag==true&&menu1_move_flag==0){
		m1(cur_menu1);
	}
}
function freezeMenu(){
	menu_change_flag=false;
}
function activeMenu(){
	menu_change_flag=true;
	try{
	oElement=document.elementFromPoint(event.x,event.y);
	}catch(e)
{
oElement=null;
}
	   try{ 
		   for(var k=0;null != oElement &&k<10;k++)
		   {
				if((oElement.tagName=="div" ||oElement.tagName=="DIV" )&&oElement.id=="menu"){
					break;
				}
				else
						oElement = oElement.parentElement;
		   }
	  }
	  catch(e)
	  {
	  }
	  
	if(null==oElement||oElement.id!="menu"){
		setTimeout("change_menu();",5000);
	}
	freezeMenu2();
}
function sizeChangeSetTimeOut(){
	sizeChange2();
	sizeChange();
	setTimeout("sizeChangeSetTimeOut()",500);
}
function sizeChange2() 
{ 
	try{
		for(var i=0;i<mainframe.frames.length;i++){
			if(mainframe.frames[i]!=null&&mainframe.frames[i].document.body!=null&&mainframe.frames[i].document.body.scrollHeight!=0) {
				mainframe.frames[i].frameElement.height=mainframe.frames[i].document.body.scrollHeight + 10; 
			}
		}
	}catch(e){}
	
}
//记录鼠标在一级菜单移动时，鼠标所在菜单的id
var menu1_move_flag=0;
//鼠标移动时是否允许一级菜单变化标志
var menu1_moving_flag=true;
//冻结鼠标移动中菜单的变化
function freezeMenu2(){
	menu1_move_flag=0;
}
//指明鼠标移动中菜单变化的一级菜单id
/*function activeMenu2(i){
	menu1_move_flag=i;
}
//鼠标移动时，一级菜单变化
function change_menu_move(i){
	if(menu1_move_flag==i&&menu1_moving_flag==true){
		m1(i);
	}else{
		//setTimeout("change_menu_move("+i+")",1000);
	}
}
//鼠标移动时，一级菜单变化
function m1_setTimeout(i){
		activeMenu2(i);
		setTimeout("change_menu_move("+i+")",800);
}
*/


//快速还原菜单
/*function quick_activeMenu(){
	menu_change_flag=true;
	oElement=document.elementFromPoint(event.x,event.y);
	   try{ 
		   for(var k=0;null != oElement &&k<10;k++)
		   {
				if((oElement.tagName=="div" ||oElement.tagName=="DIV" )&&oElement.id=="menu"){
					break;
				}
				else
						oElement = oElement.parentElement;
		   }
	  }
	  catch(e)
	  {
	  }
	  
	if(null==oElement||oElement.id!="menu"){
		change_menu();
	}
}
document.onmousedown=quick_activeMenu;
*/

//根据url选择主页面
var strHref = window.document.location.href; 
var intPos = strHref.indexOf("?"); 
var strRight = strHref.substr(intPos + 1); 

//请选择功能快速链接
function quickMenuLink() {
		var qkmnu = document.getElementById('qkmnu');
		if(qkmnu!=null){
			if(qkmnu.value!=null && qkmnu.value!='')
			{
				var dvId=document.getElementById(qkmnu.value);
				if(dvId!=null){
					dvId.click();
				}
			}
		}
}
// add by lifeng begin 20060714
function m4(i) {
	//alert("1   :"+i);
	for(m=1;m<3;m++) {
		var menu1 = document.getElementById('m1_'+m);
		//alert("find menu1"+menu1);
		//var menu2 = document.getElementById('menu2_'+m);

		if (m!=i) {
			menu1.className='menu1_off';
			//menu2.style.display='none';
		} else {
			menu1.className='menu1_on';
			//menu2.style.display='';
		}
	}
}
//add by lifeng end 


//**************************************************************
//	根据屏幕分辩率调整页面宽度，并判断显示两边广告
//	Creation date: (2006-09-01)	
//	@author: huangyp
//	@version: 1.0
//	@param：
//	@param：
//	@param说明：
//		输入参数：无
//	@condition：无
//	@调用样例
//**************************************************************
function showSideAd(){
	var sideAdString='<div id="leftSideAd" style="position:absolute;left:7px;top:100px;display:none;">'; 
    sideAdString+='<table width="60"  height="200" border="0" cellpadding="0" cellspacing="0"><tr><td bgcolor="#000000" height="190"><img src="../images5/left0.gif" width="90" height="300" border="1"></td></tr><tr><td bgcolor="#000000" align="center" height=10 style="padding-top:2px;padding-right:3px;"><a href="javascript:closeSideAd();" style="font-size:12px;color:#FFFFFF;text-decoration:none;">关闭</a></td></tr></table>';
	sideAdString+='</div>';
	sideAdString+='<div id="rightSideAd" style="position:absolute;left:0px;top:100px;display:none;">'; 
	sideAdString+='<table width="60"  height="200" border="0" cellpadding="0" cellspacing="0"><tr><td bgcolor="#000000" height="190"><img src="../images5/right0.gif" width="90" height="300" border="1"></td></tr><tr><td bgcolor="#000000" align="center" height=10 style="padding-top:2px;padding-right:3px;"><a href="javascript:closeSideAd();" style="font-size:12px;color:#FFFFFF;text-decoration:none;">关闭</a></td></tr></table>';
	sideAdString+='</div>';
	
	if(screen.width>=1280){
		document.write(sideAdString);
		rightSideAd.style.left=screen.width-90-7-21;
		leftSideAd.style.display="";
		rightSideAd.style.display="";
		if(screen.width>=1600){
			document.all.Page_content.style.width="84%";			
		}else if(screen.width>=1280){
			document.all.Page_content.style.width="80%";
		}
	}
}
//关闭两边广告
function closeSideAd(){
	leftSideAd.style.display="none";
	rightSideAd.style.display="none";
}

//800x600显示器处理
function smallScreenDeal(){
	if(screen.width<=800){
		split_str.innerHTML = "<div class='clear'></div>";
		document.all.Page_content.style.width="100%";
		document.all.Page_content.style.padding="0 5px";
		document.all.tb.width="100%";
		//document.all.qkmnu.style.display='none';
		leftClose();
		//lopen.style.display='none';
		//document.all.Menu2.style.padding="14px 20px 25px 42px";
	}
	
}
//角色的变化
function changeRole()
{
	var str_tmp = document.all.selectname.value;
	
	if(str_tmp=='1')
	{
		parent.location='../account/F690302.htm';
	}
	if(str_tmp=='2')
	{
		parent.location='../check/F690302.htm';
	}

}