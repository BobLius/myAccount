function SplitPage(APage,Cpage,inputStr,inputValue,AA){
var iPages = 5;
var iSubPage = (Cpage%iPages);
var StartPage = Cpage - (iSubPage-1) 	
var EndPage = -(iSubPage - iPages - Cpage)
if(iSubPage==0){
EndPage =Cpage
StartPage=Cpage -4
}
if(EndPage-APage>0 ){
EndPage = APage
}
document.write('��'+APage+'ҳ��')
//if(Cpage!=1)
document.write('<a href=javascript:TxtSubmit("PAGE|'+inputStr+'","1|'+inputValue+'",'+AA+')>��ҳ</a>&nbsp;')
document.write('��')

if(StartPage>1){
var page = StartPage - 1
document.write('<a href=javascript:TxtSubmit("PAGE|'+inputStr+'","'+page+'|'+inputValue+'",'+AA+')><< </a>&nbsp;');
}	

for(var i=StartPage;i<=EndPage;i++) { 
if (i!=Cpage) {
document.write('<a href=javascript:TxtSubmit("PAGE|'+inputStr+'","'+i+'|'+inputValue+'",'+AA+')>'+i+'</a>&nbsp;');
}else {
document.write(i + '&nbsp;');
}

}

if(EndPage-APage<0){
var page = -(-1-EndPage)
document.write('<a href=javascript:TxtSubmit("PAGE|'+inputStr+'","'+page+'|'+inputValue+'",'+AA+')> >></a>&nbsp;');

}	

document.write('��')
document.write('<a href=javascript:TxtSubmit("PAGE|'+inputStr+'","'+APage+'|'+inputValue+'",'+AA+')>ĩҳ</a>&nbsp;');

}

/**
* ��ת������ҳ
*/

function skipTo(aa,bb,cc){
		    
		  var totalPage = 8;
			totalPageNum =parseInt(totalPage);
			var skiPage = document.getElementById(bb).value;
			skiPage=parseInt(skiPage);
			
			if(skiPage<=totalPage && skiPage >0){
				TxtSubmit("PAGE|"+aa,skiPage+"|"+cc,AA);
			}else{
				alert("���������ҳ�볬������ҳ����ҳ������Ƿ���");
			}
}