	

/**-----------ҳ��<TR>��ӽ��汳��ɫ------------*/
	document.onreadystatechange=function(){
		if(document.readyState=="complete"){
			//var obj = document.getElementsByName("bgc");
			var obj = document.getElementsByTagName('tr');
			for(var i=0;i<obj.length;i++){
				if(i%2!=0){
					obj[i].setAttribute("bgcolor","#E2E6E5");
				}
			}
		}
	}
/**----------------------*/