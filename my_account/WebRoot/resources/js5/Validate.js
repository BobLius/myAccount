	//author:Zhaols
	//email: fooly@qq.com
	//date:  2007-03-15

	/*
	//抛出一个函数，用于验证框架中没有实现的特珠验证
	function setOtherEMsgs(eMsgs) {
		eMsgs.push([$('other'), 'js前台验证不通过！']);
	}
	*/
	
	function Validate(formId) {
		this.scope = $(formId) != null ? $(formId) : document.forms[0] != null ? document.forms[0] : document;
		this.vTags = ['input', 'select', 'textarea', 'span'];
		this.errorMsgTip = 'errorMsgTip';
		this.eMsgs = [];
	}

	Validate.prototype.start = function(arg) {
		this.eMsgs = new Array();
		this.removeErrMsg();
		this.validates();
		try	{
			setOtherEMsgs(this.eMsgs);
		} catch (e) {
		}
		if(this.eMsgs.length > 0) {
			var eMsg;
			while((eMsg = this.eMsgs.shift()) != null) {
				if(arg == 'alert') {
					alert(eMsg[1]);
					eMsg[0].focus();
					return false;
				} else {
					eMsg.shift().outerHTML += '<span id="errorMsgTip">' + eMsg.shift() + '</span>';
				}
			}
			return false;
		}
		return true;
	}
	
	Validate.prototype.validates = function() {
		for(var i in this.vTags) {
			var objs = $T(this.vTags[i], this.scope);
			for(var j = 0; j < objs.length; j++) {
				if(objs[j].vld) this.validate(objs[j]);
			}
		}
	}
	
	Validate.prototype.validate = function(vTag) {
		var rules = vTag.vld.split(',');
		for(var i in rules) {
			switch(rules[i]) {
				case 'fixed': {
					if(vTag.tagName == 'SPAN') {
						var radios = vTag.getElementsByTagName('input')
						var isChecked = false;
						for(var j = 0; j < radios.length; j++) {
							if(radios[j].checked) {
								isChecked = true;
							}
						}
						if(!isChecked) {
							this.eMsgs.push([vTag, vTag.msg != null ? vTag.msg : '必选！']);
						}
					} else if(vTag.value == '') {
						this.eMsgs.push([vTag, vTag.msg != null ? vTag.msg : '不能为空！']);
					}
				} break;
				case 'checkbox': {
					var count = getChecked(vTag.plus).length;
					var range = vTag.range.split(',');
					if(range.length < 2) {
						if(count < parseInt(range[0]))
							this.eMsgs.push([vTag, vTag.msg != null ? vTag.msg : '至少选择[' + range[0] + ']个！']);
					} else if(count < parseInt(range[0]) || count > parseInt(range[1])) {
						this.eMsgs.push([vTag, vTag.msg != null ? vTag.msg : '必选[' + range[0] + ', ' + range[1] + ']个！']);
					}
				} break;
				case 'integer': {
					var reg = /^[0-9][0-9]*$/g;
					if(!reg.test(vTag.value)) {
						this.eMsgs.push([vTag, vTag.msg != null ? vTag.msg : '必为整数！']);
					}
				} break;
				case 'number': {
					if(isNaN(vTag.value)) {
						this.eMsgs.push([vTag, vTag.msg != null ? vTag.msg : '必为数字！']);
					}
				} break;
				case 'length': {
					var range = vTag.range.split(',');
					var v = vTag.value;
					if(v.length < parseInt(range[0]) || v.length > parseInt(range[1])) {
						this.eMsgs.push([vTag, vTag.msg != null ? vTag.msg : '长度为[' + range[0] + ', ' + range[1] + ']！']);
					}
				} break;
			}
		}
	}
	
	Validate.prototype.removeErrMsg = function() {
		var eMsgs = $N(this.errorMsgTip);
		while(eMsgs.length) {
			eMsgs[0].removeNode(true);			
		}
	}
	
	function getChecked(n) {
		var ns = $N(n);
		var temp = new Array();
		for(var i = 0; i < ns.length; i++){
			if(ns[i].checked){
				temp.push(ns[i].value);
			}
		}
		return temp;
	}
	
	function $(arg){
		if(typeof arg == 'string'){
			arg = document.getElementById(arg);
		}
		return arg;
	}	
	
	function $T(arg, ele){
		if(!ele){
			ele = document;
		}
		return $(ele).getElementsByTagName(arg);
	}
	
	function $N(arg){
		return document.getElementsByName(arg);
	}

	function insCss(css) {
		var navigatorName = "Microsoft Internet Explorer";
		var isIE = false;	
		if( navigator.appName == navigatorName ) {
			isIE = true;    
		} 
	   
		if(isIE){
			var oStyles = document.styleSheets;
			if(oStyles.length < 1) document.getElementsByTagName('head')[0].appendChild(document.createElement('style'));
			var oStyle = oStyles[0];
			var a = css.split("\n");
			for(var i = 0; i < a.length; i++){
				if(a[i] == "") continue;
				var ad = a[i].replace(/([\s\S]*)\{([\s\S]*)\}/,"$1|$2").split("|");
				oStyle.addRule(ad[0],ad[1]);
			}
		} else {
			var style = document.createElement("style");
			style.type = "text/css";
			style.innerHTML = css;
			document.getElementsByTagName("HEAD").item(0).appendChild(style);
		}
	}

	insCss(' #errorMsgTip{ background-color:#FFCCCC; height:16px; color: #CC0033; line-height: 17px; padding-left:6px; padding-right:6px; margin:3px; border: 1px solid #FF3399; font-size: 12px; }');
