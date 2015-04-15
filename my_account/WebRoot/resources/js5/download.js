// Added all-page-download function
// Modified by Wayne Zheng 2008-12-15
function loadSmallWindow(obj, downAll)
{
var div = document.getElementById("selectDownLoadDiv");

document.jhform.RETURN_ALL.value = downAll;

if(div.style.display =="")
{
div.style.display = "none";
}
else
{
div.style.display = "";
}

/**根据实际情况控制提示div的位置*/

div.style.top = obj.offsetTop-40;
div.style.left= obj.offsetLeft;

//div.style.top = obj.offsetTop + obj.clientHeight; 
//var herghtPosition = document.body.clientHeight;
//var widthPosition = document.body.clientWidth;
//div.style.top = herghtPosition/2;
// div.style.left= widthPosition/2;
}
function submitSelect()
{
      var div = document.getElementById("selectDownLoadDiv"); 
      onSelectRadiobutton(div);
}
function onSelectRadiobutton(divObj)
{
  var count=0; 
  
  var radioB=document.getElementsByName("radiobutton");   

  for(var i=0;i<radioB.length;i++)   
  {   
      if(radioB[i].checked)
	  {
	    var radioValue=radioB[i].value;
		count+=1;
		if(count>1)
		{
		    alert("只能选择一种下载方式");
			return false;
		}
	  }	 
  }
if(radioValue=="2")
{
      //alert("调用xls方式js函数-----下载");//在此处调用excel方式下载函数
      download2();
      }
else if(radioValue=="1")
{
     // alert("调用txt方式js函数-----下载");//在此处调用Txt方式下载函数
	 document.forms[0].target='result1';
     document.all.clientFileName.value="账户列表下载.txt";
      TxtSubmit('TXCODE|','610104|',CC);
	  document.forms[0].target='';
}
else
{	download3();
}

divObj.style.display = "none";
for(var i=0;i<radioB.length;i++)   
{ 
  radioB[i].checked=false;
}
}

function download2(){

  
  document.all.clientFileName.value="账户列表下载.csv";
 // document.all.TXCODE.value="610104";
 document.forms[0].target='result1';
 TxtSubmit('TXCODE|','610104|',CC);
 document.forms[0].target='';
 // document.forms[0].submit();
}

function download3(){

  
  document.all.clientFileName.value="账户列表下载.xls";
 // document.all.TXCODE.value="610104";
 document.forms[0].target='result1';
 TxtSubmit('TXCODE|','610104|',CC);
 document.forms[0].target='';
  document.all.clientFileName.value="";
 // document.forms[0].submit();
}