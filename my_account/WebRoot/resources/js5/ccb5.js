var imgPath="../../images5/";

//**************************************************************

//	显示交易title部分

//	Creation date: (2006-12-19)	

//	@author: huangyupeng

//	@version: 1.0

//	@param：

//	@param说明：

//		输入参数：no

//	@condition：无

//	@调用样例

//	使用说明：

//	//如，

//		<script language="JavaScript">showTXHead()</script>

//**************************************************************



function showTXHead(menu_name,sub_menu_names){

	//if(null!=document.all.txTitle){

	//	document.all.txTitle.innerHTML=parent.cur_m1_name+"&nbsp;<font color='#CCCCCC'>></font>&nbsp;"+parent.cur_m2_name;

	//}

	var tmp_str='<table width="100%" cellspacing="0" cellpadding="0" align="center" height="26" border="0">';

	//tmp_str+='	<tr>';

	//tmp_str+='	<td height="25" width="106" valign="bottom"><img src="'+path+'images5/b2b_logo11.gif" width="106px" height="25px" /></td>';

	//tmp_str+='	<td height="25px" background="'+path+'images5/b2b_logo14.gif" valign="bottom"><img src="'+path+'images5/b2b_logo14.gif" width="2px" height="25px" /></td>';

	//tmp_str+='	<td height="25px" background="'+path+'images5/b2b_logo14.gif" valign="bottom" width="2">';			

	//tmp_str+='	</td>';

	//tmp_str+='	</tr>';

	tmp_str+='	<tr>';

	//tmp_str+='	<td height="21" width="106" valign="top" background="'+path+'images5/b2b_logo13.gif"><img src="'+path+'images5/b2b_logo12.gif" width="106px" height="21px" /></td>';

	tmp_str+='	<td bgcolor="#F0F0F0" style="word-break:break-all;line-height:1.5;" align="right" class="TXhead_1" height="26"><span class="float_left area_title"><b></b></span>&nbsp;'+sub_menu_names+'</td>';

	//tmp_str+='	<td background="'+path+'images5/b2b_logo15.gif" valign="top" width="3"></td>';

	tmp_str+='	</tr>';

	tmp_str+='</table>';

	

	//document.writeln(tmp_str);

}

//**************************************************************

//	显示交易页面开始部分代码

//	Creation date: (2006-12-19)	

//	@author: huangyupeng

//	@version: 1.0

//	@param：

//	@param说明：

//		输入参数：no

//	@condition：无

//	@调用样例

//	使用说明：

//	//如，

//		<script language="JavaScript">showHead()</script>

//**************************************************************

function showHead(){

	var tmp_str='<div class="area_title" id="txTitle">';

		tmp_str+='    ';

		tmp_str+='    </div>';

		tmp_str+='<table width="100%" border="0" cellspacing="0" cellpadding="0">';

		tmp_str+='      <tr>';

		tmp_str+='        <td>';

		tmp_str+='          <table width="100%" border="0" cellspacing="0" cellpadding="4">';

		tmp_str+='            <tr>';

		tmp_str+='              <td align="center">';

		tmp_str+='                <table width="100%" cellspacing="0" cellpadding="0">';

		tmp_str+='                  <tr>';

		tmp_str+='                    <td height="10">&nbsp;</td>';

		tmp_str+='                  </tr>';

		tmp_str+='                </table>';

		tmp_str+='                  <table width="98%" cellspacing="0" cellpadding="0">';

		tmp_str+='                    <tr>';

		tmp_str+='                      <td align="center">';

	document.writeln(tmp_str);

}



//**************************************************************

//	显示交易页面结束部分代码

//	Creation date: (2006-12-19)	

//	@author: huangyupeng

//	@version: 1.0

//	@param：

//	@param说明：

//		输入参数：no

//	@condition：无

//	@调用样例

//	使用说明：

//	//如，

//		<script language="JavaScript">showFooter()</script>

//**************************************************************

function showFooter(){

	
	var tmp_str='<table width="100%"  id="page_footer" class=""><tbody><tr  class="Bottom_Bg">';
	tmp_str+='<td class="Bottom_Bg_copy">&copy;中国建设银行 版权所有&nbsp;&copy;2007 All Rights Reserved by China Construction Bank</td>';
	tmp_str+='</tr></tbody></table>';
					

	document.writeln(tmp_str);

}



//**************************************************************

//	弹出页面的文件头标题

//	Creation date: (2006-07-14)	

//	@author: huangyupeng

//	@version: 1.0

//	@param：linkArray

//	@param说明：

//		输入参数：no

//	@condition：无

//	@调用样例

//	使用说明：

//	//如，

//		<script language="JavaScript">showOpenWinHead()</script>

//**************************************************************

function showOpenWinHead() {

	//document.write("<div id='Header'><span class='float_left'><img src='"+imgPath+"ccb_logo.gif' alt='中国建设银行 简版企业银行'/></span>");

	//document.write("<div class='Area_content'></div><p></p><div class='clear'></div></div><div class='Area_title2'></div></br>");

	var str='<div class="TopCMP">';
	str+='			<div class="TopCMP_Tool">										';
	str+='				<div class="TopCMP_CMP_Logo"></div>                                                             ';
	str+='			</div><!-- End TopCMP_Tool -->                                                                          ';
	str+='			<div class="TopCMP_ToolUnderLine">                                                                      ';
	str+='				<div class="TopCMP_ToolUnderLine_left"></div><!-- End TopCMP_ToolUnderLine_left -->             ';
	str+='			</div><!-- End TopCMP_ToolUnderLine -->                                                                 ';
	str+='		</div><!-- End TopCMP -->											';
	document.write(str);

}



//**************************************************************

//	弹出页面的文件底部

//	Creation date: (2006-06-19)	

//	@author: huangyupeng

//	@version: 1.0

//	@param：无

//	@param说明：

//		输入参数：无

//	@condition：无

//	@调用样例

//	使用说明：如<script language="JavaScript">showOpenWinFooter();</script>

//**************************************************************

function showOpenWinFooter() {

	document.write('</td></tr></table></td></tr></table></td></tr></table><br><div class="Bottom_Bg"><div class="Bottom_Bg_copy">&copy;中国建设银行 版权所有&nbsp;&copy;2007 All Rights Reserved by China Construction Bank</div></div>');
}



//**************************************************************

//非菜单点击时，解发菜单的点击

//Creation date: (2006-07-28)

//@author: huangyp

//@version: 1.0

//@param：menuId

//@param说明：menuId-解发的菜单Id

//@condition：无

//@调用样例

//      使用说明：

//**************************************************************

function mForFrame(menuId)

{

var menuItem = parent.parent.document.getElementById(menuId);

if(menuItem!=null)

{

menuItem.click();

}

}



//**************************************************************

//	提交交易后，灰掉按钮

//	Creation date: (2006-08-30)	

//	@author: huangyp

//	@version: 1.0

//	@param：buttonId

//	@param说明：

//		输入参数：buttonId-按钮的id

//	@condition：无

//	@调用样例

//	使用说明：如<script language="JavaScript">disableButton(document.all.buttonId);</script>

//**************************************************************

function disableButton(buttonId){

buttonId.className="button_dis";

buttonId.disabled=true;

}

//**************************************************************

//	回复按钮样式，使按钮可用

//	Creation date: (2006-08-30)	

//	@author: huangyp

//	@version: 1.0

//	@param：buttonId

//	@param说明：

//		输入参数：buttonId-按钮的id

//	@condition：无

//	@调用样例

//	使用说明：如<script language="JavaScript">ableButton(document.all.buttonId);</script>

//**************************************************************

function ableButton(buttonId){

buttonId.className="button";

buttonId.disabled=false;

}



//************提交表单

//提交交易标志：0为可提交，1为不能提交

var submitFlag=0;

function go() {

if((typeof check) == "undefined"||null==check||check()){

sForms = document.forms[0]

for (var w = 0 ; w < sForms.length ; w++){

var Bu = sForms.elements[w].type;//

var LC = Bu.toLowerCase()

if(LC=='submit'||LC=='button'||LC=='reset'){

sForms.elements[w].className="button_dis";

sForms.elements[w].disabled=true;

}

}

if(submitFlag==0){

submitFlag=1;

return true;

}else{

return false;

}

}

return false;

}





//**************************************************************

//	屏蔽页面部分按键和右键操作，以防用户误操作

//	Creation date: (2006-08-29)	

//	@author: huangyp

//	@version: 1.0

//	@params：

//	@params说明：

//	@condition：无

//	使用说明： KeyDown()

//**************************************************************

function KeyDown(){
	//Ctrl+左箭头展开辅助区域
  if((window.event.ctrlKey)&&(window.event.keyCode==37)){
	parent.leftOpen();

  }
  //Ctrl+右箭头关闭辅助区域
  if((window.event.ctrlKey)&&(window.event.keyCode==39)){
	parent.leftClose();

  }
 
if ((window.event.altKey)&& 

((window.event.keyCode==37)||   //屏蔽 Alt+ 方向键 ← 

(window.event.keyCode==39)))   //屏蔽 Alt+ 方向键 → 

{ 

event.returnValue=false; 

} 

//8屏蔽退格删除键//116屏蔽 F5 刷新键//82Ctrl + R//F11

if ((event.keyCode==114)||(event.keyCode==116)||(event.ctrlKey && event.keyCode==82)||event.keyCode==122){

event.keyCode=0;

event.returnValue=false;

}

if ((event.keyCode==8)){		

var sType=window.event.srcElement.type;

if (sType!=null)

{

sType=sType.toUpperCase();

}

if(sType!=null&&(sType=='TEXT'||sType=="PASSWORD"||sType=="TEXTAREA"))

;

else {

event.keyCode=0;

event.returnValue=false;

}

}

//屏蔽 Ctrl+n

if ((event.ctrlKey)&&(event.keyCode==78)) event.returnValue=false;

//屏蔽 shift+F10

if ((event.shiftKey)&&(event.keyCode==121)) event.returnValue=false;

if ((window.event.altKey)&&(window.event.keyCode==115)){ //屏蔽Alt+F4

window.showModelessDialog("about:blank","","dialogWidth:1px;dialogheight:1px");

return false;

}

}

//自动使用屏蔽操作

//function document.onkeydown(){KeyDown();} 
document.onkeydown = KeyDown;

//function document.oncontextmenu(){event.returnValue=false;}

/***************如果页面下面有滚动条，自动提示*****--begin--***********/
function movescroll(){
	var dsocleft=document.body.scrollLeft;
	if(dsocleft>0){document.body.title="按键[←]和[→]可以移动横向滚动条";}
}
//移动滚动条时触发
window.onscroll=movescroll;
//鼠标点击body时关闭显示
function showEnd(){
	document.body.title="";
}
//点击body时触发
document.onclick =showEnd;
/*********************************--end--*******************************/


function showNoTXHead(linkArray) {

	document.write("<div id='Header'><span class='float_left'><img src='../../images5/ccb_logo.gif' alt='中国建设银行 个人网上银行'/></span>");

	if (arguments.length == 1){

		if(linkArray.length>0){

			document.write("<span class='float_right top_margin'>");

			for(var i=0;i<linkArray.length;i++)	{	

				var alink=Array();

				alink=linkArray[i].split("|");

				document.write("<a href='"+alink[1]+"'>"+alink[0]+"</a>");

				if(linkArray.length!=(i+1)){

					document.write(" |");

				}

			}

			document.write("</span>");

		}

	}

	document.write("<div class='clear'></div></div>");

	

}

//二级菜单事件，控制二级菜单的点击和标题的显示

function m2ForFrame(j,i) {

	//alert("in :j"+j+"   i="+i);

	for(n=1;n<60;n++) {

		var menu2item = parent.parent.document.getElementById('m2_'+n);

		var menu3item = parent.parent.document.getElementById('div_m3_'+n);

		if(n!=j) {

			if(menu2item!=null){

				if(menu2item.className!='menu2_unused'){

					menu2item.className='menu2_off';

				}

			}

			if(menu3item!=null){

				menu3item.style.display="none";

			}

	} else {

			if(menu2item!=null){

				if(menu2item.className!='menu2_unused'){

					menu2item.className='menu2_on';

				}

			}

			if(menu3item!=null){

				menu3item.style.display="";

			}

			parent.parent.cur_menu1=i;

		}

	}	

	for(m=1;m<11;m++) {

		var menu1 = parent.parent.document.getElementById('m1_'+m);

		//alert("find menu1"+menu1);

		var menu2 = parent.parent.document.getElementById('menu2_'+m);

		if(menu1!=null){

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

function ad() {

	var adv = '<a href="" target="_blank"><img src="../../images5/ad_image.jpg" alt="建行营销图片" border="0" /></a>';

	document.write(adv);

}

function showNoTXFooter() {

	document.write("<div id='Footer'>&copy;中国建设银行 版权所有&nbsp;<img src='../../images5/2.gif' />DEMO<br/>&copy;2006 All Rights Reserved by China Construction Bank</div>");	

}

function aClock(){

  var now=new Date();

  var hour=now.getHours();

  var min=now.getMinutes();

  var sec=now.getSeconds();

  var year=now.getYear();

  var month=now.getMonth()+1;

  var date=now.getDate();

  var dateStr = year+"-"+month+"-"+date;

  var timeStr = " " + hour;

  timeStr+=((min<10)?":0":":")

                  +min;

  timeStr+=((sec<10)?":0":":")+sec;

  document.all.clock_date.innerText = dateStr;

  document.all.clock_time.innerText = timeStr;

  clockId = setTimeout("aClock()",1000);

}



function info() {

		var nfo = '尊敬的 XXXX（客户号：PPPPP） 操作员，您好！：<br />';

	nfo += '此次是您第<span class="text_info text_bold"> 68次 </span>登录网上银行<br />';

	nfo += '您上次登录网上银行的时间是：<br /><span class="text_info text_bold">2006年4月20日 20:58</span><br /><br /> ';
	nfo += '为方便您及时对账，请使用电子对账功能';
	

	document.write(nfo);

}



function commonLoads(){
	/*var main_frame = parent.document.getElementById('mainframe');
	if(main_frame!=null){		
		if(parent.mainframe.document.body.scrollWidth>750)
		{		
			if(screen.width>800&&screen.width<=1024){
				parent.leftClose();				
			}
			if(screen.width>1024&&screen.width<=1280&&parent.mainframe.document.body.scrollWidth>793){
				parent.leftClose();
			}
		}	
	}*/
	var iBottom = 0;
    
	    if (document.all) {
	        if (parseInt(document.body.scrollHeight) > parseInt(document.body.clientHeight)) {
	            iBottom = parseInt(document.body.scrollHeight);
	            document.all["page_footer"].style.pixelTop=iBottom;
				document.all["page_footer"].className="Bottom_Bg_scroll";
	        }else{
	        	iBottom = parseInt(document.body.clientHeight);
	        	document.all["page_footer"].style.pixelTop=iBottom-63;
				document.all["page_footer"].className="Bottom_Bg_Notscroll";
	        }
	        document.all["page_footer"].style.visibility = "visible";
	    }
}

function commonUnloads(){}

function commonBeforeUnloads(){}
//鼠标经过改变表中一行的颜色
function tdOver(tr){
	tr.className="table_select_bg";
}
//鼠标经过还原表中行的颜色
function tdOut(tr){
	tr.className="";
}
