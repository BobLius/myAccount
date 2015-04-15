//***********************************提交表单的验证 ************************************//
//************提交到文字指定界面

function TxtSubmit(Names,Values,AA,State){
		var i ,j,h,k ;
		var StrName = Names
		var StrValue = Values
		var StrNa = ""
		var StrVa = ""
		var strHidden = ""
		i = StrName.indexOf("|")
		h = StrValue.indexOf("|")
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
	}
	
//*****************选择判断
function BoxCheck(BoxString,Name,Num){
//alert(jhform[BoxString].length)
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
	
//************提交表单
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
