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

/**����ʵ�����������ʾdiv��λ��*/

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
		    alert("ֻ��ѡ��һ�����ط�ʽ");
			return false;
		}
	  }	 
  }
if(radioValue=="2")
{
      //alert("����xls��ʽjs����-----����");//�ڴ˴�����excel��ʽ���غ���
      download2();
      }
else if(radioValue=="1")
{
     // alert("����txt��ʽjs����-----����");//�ڴ˴�����Txt��ʽ���غ���
	 document.forms[0].target='result1';
     document.all.clientFileName.value="�˻��б�����.txt";
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

  
  document.all.clientFileName.value="�˻��б�����.csv";
 // document.all.TXCODE.value="610104";
 document.forms[0].target='result1';
 TxtSubmit('TXCODE|','610104|',CC);
 document.forms[0].target='';
 // document.forms[0].submit();
}

function download3(){

  
  document.all.clientFileName.value="�˻��б�����.xls";
 // document.all.TXCODE.value="610104";
 document.forms[0].target='result1';
 TxtSubmit('TXCODE|','610104|',CC);
 document.forms[0].target='';
  document.all.clientFileName.value="";
 // document.forms[0].submit();
}