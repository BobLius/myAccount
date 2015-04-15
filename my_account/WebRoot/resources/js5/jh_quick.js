function isEmpty(Number){
	  if(Number.length == 0){
      return true
      }
      return false
}
function IsEmpty(Number, name){
    var inputValue = jhform.elements[Number].value
    var inputForm  = jhform.elements[Number]
    if (isEmpty(inputValue)){
        alert(name + "不能为空！")
        inputForm.focus()
        return true
    }
	return false
}
function PsswordName(Number, name,Nu){
    var inputValue = jhform[Number].value
    var inputForm  = jhform[Number]
    if (isEmpty(inputValue)){
        alert(name + "不能为空！")
        inputForm.focus()
        return true
		}else if(inputValue.length<6){
			alert(name + "必须大于6位！小于12位！") 
        inputForm.focus()
        return true
    }else
	return false
}
function BoxCheck(BoxString,Name,Num){
		if (jhform[BoxString].length==null){
				if(document.jhform[BoxString].checked){
					return false
				}
		}else{
			var j = 0
			for(var n = 0 ; n < jhform[BoxString].length ; n++ ){
					if(jhform[BoxString][n].checked){
						j=j+1
					if(Num!=null){
						if(j>Num){
							alert(Name+'不能超过'+Num+'个！')
							return true
						}
					}
				}
			}
			for(var m = 0 ; m < jhform[BoxString].length ; m++ ){
				if(jhform[BoxString][m].checked){
					return false
				}
			}
		}
		alert(Name+"不能为空！")
		return true
	}
function isDouble(inputVal){
     inputStr = inputVal.toString()
     oneDecimal = false
     for(var i = 0;i < inputStr.length;i++){
       var oneChar = inputStr.charAt(i)
       if(oneChar == "." && !oneDecimal){
         oneDecimal = true
         continue
       }
		if(i==0){
			var m = -(-1-i)
			var twoChar =inputStr.charAt(m)
		   if((oneChar == "0"&&twoChar=="0")||oneChar < "0"|| oneChar > "9"){
			 return false
		   }
		}else{
		   if(oneChar < "0" || oneChar > "9"){
			 return false
		   }
		}
		if(i==inputStr.length){
			if(oneChar==0) return false
		}
     }
     return true
}
function IsAmt (inputStr,name,Poin){
	var re = /,/g;
	var tag=Poin
	if(Poin==null||Poin=='X'){
		Poin =2
	}
    var inputValue = jhform.elements[inputStr].value.replace(re,"")
	var inputStr1 = inputValue.toString()
	var inputForm  = jhform.elements[inputStr]
	if(isEmpty(inputValue)){
		document.jhform.elements[inputStr+1].value = ''
		return false
	}
	if(tag!='X'){
		if(inputValue==0){
			alert(name + "不能为0！")
			inputForm.focus()
			return false
		}
	}
	if(!isDouble(inputValue)){
			alert(name+"输入必须是标准金额！")
			inputForm.focus()
			return false
	}
	var i = inputStr1.indexOf(".")
	if ( (i == -1 && inputStr1.length > 14 ) || i > 14 )
	{
		alert(name + "整数部分不能大于14位！")
		inputForm.focus()
	    return false
	}else if ( i != -1 && (inputStr1.length - i - 1) > Poin )
	{
		alert(name + "小数部分不能多于"+Poin+"位！")
		inputForm.focus()
		return false
	}
	var StrPo = ""
	var blea = false
	if ((inputValue.length - i - 1)!=0&&i!=-1)
		{
			StrPo = inputValue.substring(i,inputValue.length)
			if(StrPo.length==2&&Poin==2){
				StrPo = StrPo + "0"
			}
			if(Poin!=2){
				var P = StrPo.length
				for(var q=5;q>P;q--){
					StrPo = StrPo + "0"
				}
			}
			blea = true
		}else{
			StrPo = ".00"
			if(Poin!=2){
				StrPo = ".0000"
			}
		}
	var StrInt = inputValue
	if(blea){
		StrInt = inputValue.substring(0,i)
	}
	var h = StrInt.length
	var m = h%3
	var StrZh=""
	var po = true
	if (m!=0&&h>3)
	{
		StrZh=StrInt.substring(0,m)+","
		StrInt = StrInt.substring(m,h)
	}else if (h<4)
	{
		if(h == 0)
		{
		StrInt = h
		}
		StrZh=StrInt+StrPo
		po = false
	}
	var k = (h - m)/3
	if(po){
		for (var n = 1 ;n<k+1 ;n++ )
		{
			StrZh = StrZh+StrInt.substring(0,3)
			if (n!=k)
			{
				StrZh = StrZh + ","
			}else
			{
				StrZh = StrZh  + StrPo
			}
			StrInt = StrInt.substring(3,(h-m))
		}
	}
	
	document.jhform.elements[inputStr+1].value = inputValue
	document.jhform.elements[inputStr].value = StrZh
return true
}
function TxtSubmit(Names,Values,AA,State){
		var i ,j,h,k ;
		var StrName = Names
		var StrValue = Values
		var StrNa = ""
		var StrVa = ""
		var strHidden = ""
		i = StrName.indexOf("|")
		h = StrValue.indexOf("|")
		var oldaction=window.document.jhform.action
		while(i!="-1"){
			StrNa = StrName.substring(0,i)
			StrVa = StrValue.substring(0,h)
			if (StrNa=="TXCODE" || StrNa=="NTXCODE"){
				if (StrNa=="TXCODE"){
					window.document.jhform.action="/NCCB/B2BMainPlat"					
				}else{
					window.document.jhform.action="/NCCB/B2BMainPlat"
					StrNa="TXCODE"
				}
			}			
			strHidden = strHidden + "<input type=hidden name = \"" + StrNa +"\" value = \"" + StrVa + "\">"
			j = StrName.length
			StrName = StrName.substring(i+1,j)
			k = StrValue.length
			StrValue = StrValue.substring(h+1,k)
			i = StrName.indexOf("|")
			h = StrValue.indexOf("|")
		}
		AA.innerHTML = strHidden;
		if(State==null||State==""){
			window.document.jhform.submit()		
		}
		window.document.jhform.action=oldaction
	}

function openWin(Names,Values,AA){
			document.jhform.target='new';
			TxtSubmit(Names,Values,AA)
			document.jhform.target='';
}
function Back(State) {
	 if(State==null){
	 State='-1'
	 }
     history.go(State);
 }
function LoadDisabled(m){
	if(jhform.elements[m].checked){
		return true
	}
	else
		return false
}
function RadioDisabled(inputStr){
	for (var w = 0 ; w < jhform.length ; w++){
		document.jhform.elements[w].disabled=false;
	}
	var StrAll = inputStr
	var i ,j ;
	var Str = ""
	i = StrAll.indexOf("|")
	Str = StrAll.substring(0,i)
	while(i!="-1"){
		Str = StrAll.substring(0,i)
		document.jhform.elements[Str].disabled=true;
		j = StrAll.length
		StrAll = StrAll.substring(i+1,j)
		i = StrAll.indexOf("|")
	}
}
function Menu_Change(Nun,code,name,NunN)
{
	var num,n, i, m ,k;
	num= Nun;
	m = document.jhform.elements[num].selectedIndex-1;
	if(NunN ==""||NunN ==null){
		k = num + 1
	}else{
		k = NunN
	}
		n = document.jhform.elements[k].length
	for(i = n - 1; i >= 0; i--)
		document.jhform.elements[k].options[i] = null;
	if (m>=0) {
	for(i = 0; i < code[m].length; i++){
		NewOptionName = new Option(name[m][i], code[m][i]);
		document.jhform.elements[k].options[i] = NewOptionName;
	}
		document.jhform.elements[k].options[0].selected = true;
	}
}
function go() {
     if(check()){
		for (var w = 0 ; w < jhform.length ; w++){
			var Bu = jhform.elements[w].type
			var LC = Bu.toLowerCase()
			if(LC=='submit'||LC=='button'||LC=='reset'){
				if(document.jhform.elements[w].disabled) return false
				else document.jhform.elements[w].disabled=true;
			}
		}
        return true
     }else
        return false
 }
 function FormatAmt(Amt){
	var inputStr = Amt
	var w = inputStr.indexOf("-")
	if(w==0){
		inputStr = inputStr.substring(1,inputStr.length)
	}
	var i = inputStr.indexOf(".")
	var StrPo = ""
	var blea = false
	if ((inputStr.length - i - 1)!=0&&i!=-1)
		{
			StrPo = inputStr.substring(i,inputStr.length)
			if(StrPo.length==2){
			StrPo = StrPo + "0"
			}
			blea = true
		}else{
			StrPo = ".00"
		}
	var StrInt = inputStr
	if(blea){
		StrInt = inputStr.substring(0,i)
	}
	var h = StrInt.length
	var m = h%3
	var StrZh=""
	var po = true
	if (m!=0&&h>3)
	{
		StrZh=StrInt.substring(0,m)+","
		StrInt = StrInt.substring(m,h)
	}else if (h<4)
	{
		if(h == 0)
		{
		StrInt = h
		}
		StrZh=StrInt+StrPo
		po = false
	}
	var k = (h - m)/3
	if(po){
		for (var n = 1 ;n<k+1 ;n++ )
		{
			StrZh = StrZh+StrInt.substring(0,3)
			if (n!=k)
			{
				StrZh = StrZh + ","
			}else
			{
				StrZh = StrZh  + StrPo
			}
			StrInt = StrInt.substring(3,(h-m))
		}
	}
	if(w==0){
		StrZh = "-" +StrZh
	}
	document.write(StrZh)
}