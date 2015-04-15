var dropdown = function (id, loadid, defaultValue,dataUrl) {
	var thisID = document.getElementById(id);
	this.load = function () {
		if(dataUrl.indexOf("?") != -1)
			dataUrl = dataUrl+"&@RANDOM@";
		else
			dataUrl = dataUrl+"?@RANDOM@";
		var dropdownAttend = new Suggest(dataUrl, loadid, defaultValue);
		dropdownAttend.bind(thisID);
	};
};
var Suggest = function (stringUrl, loadName, Empty) {
	var emptyContent = Empty;
	this.stringKeySpliter = "";
	this.stringRecordSpliter = "|";
	this.arraySystemKeys = new Array();
	this.arrayPrepareKeys = new Array();
	this.intPrepareKeysMaxLength = 50;
	this.stringData = new String();
	
	this.getNearestData = function (stringKey) {
		if (this.arrayPrepareKeys.length == 0) {
			return new String();
		}
		var arrayContainers = new Array();
		for (var i =0; i < this.arraySystemKeys.length; i++) {
			
			if (this.arraySystemKeys[i][0] == stringKey) {
				return this.arraySystemKeys[i][1];
			}
			if (stringKey.match(new RegExp("^.*" + this.arraySystemKeys[i][0], "igm")) != null) {
				
				arrayContainers.push(this.arraySystemKeys[i]);
			}
		}
		
		for (var i = 0; i < this.arrayPrepareKeys.length; i++) {			
			if (this.arrayPrepareKeys[i][0] == stringKey) {
				return this.arrayPrepareKeys[i][1];
			}
			if (stringKey.match(new RegExp("^.*" + this.arrayPrepareKeys[i][0], "igm")) != null) {
				arrayContainers.push(this.arrayPrepareKeys[i]);
			}
		}
		if (arrayContainers.length == 0) {
			return new String();
		}
		else {
			arrayContainers.sort(
				function (arrayA, arrayB) {
					return arrayB[0].length - arrayA[0].length;
				}
			);
			return arrayContainers[0][1];
		}
	};


	this.getResult = function (stringData, stringKey) {
		var stringRegExpSystem = "$()*+.[?\^{|";		
		var stringKeySpliter = (stringRegExpSystem.indexOf(this.stringKeySpliter) < 0 ? "" : "\\") + this.stringKeySpliter;		
		var stringRecordSpliter = (stringRegExpSystem.indexOf(this.stringRecordSpliter) < 0 ? "" : "\\") + this.stringRecordSpliter;
		var exclude =  "[^\\" + stringRecordSpliter + "|" + stringKeySpliter + "]*" + stringKeySpliter + "[^\\" + stringRecordSpliter + "|" + stringKeySpliter + "|\n]*";

		var regExp = new RegExp("" + stringRecordSpliter+(isNaN(parseInt(stringKey)) ? "" : "(s[hz])?") + exclude+ stringKey + "[^\\" + stringRecordSpliter + "|" + stringKeySpliter + "]*" + stringKeySpliter + "[^\\" + stringRecordSpliter + "|" + stringKeySpliter + "|\n]*","g");
		var arrayMatchResult = stringData.match(regExp);
		return arrayMatchResult == null ? new Array() : arrayMatchResult;
	};
	

	this.getQuickResult = function (stringKey) {
		stringKey = stringKey.split(this.stringKeySpliter).join("").split(this.stringRecordSpliter).join("");
		if (stringKey == "") {
			return new Array();
		}
		/* 在已经搜索的缓存中快速查找 */
		var stringNearestData = this.getNearestData(stringKey);
		
		var arrayResult = stringNearestData == "" ?  this.getResult(this.stringData, stringKey) : this.getResult(stringNearestData, stringKey);
		arrayResult = arrayResult == null ? new Array() : arrayResult;
		var booleanIsInSystemKeys = false;
		for (var i = 0; i < this.arraySystemKeys.length; i++) {
			if (this.arraySystemKeys[i][0] == stringKey) {
				booleanIsInSystemKeys = true;
				break;
			}
		}
		var booleanIsInPrepareKeys = false;
		for (var i = 0; i < this.arrayPrepareKeys.length; i++) {
			if (this.arrayPrepareKeys[i][0] == stringKey) {
				booleanIsInPrepareKeys = true;
				break;
			}
		}
		if (!booleanIsInSystemKeys && !booleanIsInPrepareKeys) {
			this.arrayPrepareKeys.push(new Array(stringKey, arrayResult.join("")));
			if (this.arrayPrepareKeys.length > this.intPrepareKeysMaxLength) {
				this.arrayPrepareKeys.sort(
					function (arrayA, arrayB) {
						return arrayA[0].length - arrayB[0].length;
					}
				);
				this.arrayPrepareKeys.pop();
			}
		}		
		return arrayResult;
	};
	this.load = function (stringKey) {
		
		if (stringKey.indexOf(",") != -1 && stringKey.indexOf(",") != 0 && stringKey.indexOf(",") != stringKey.length - 1) {
			var arrayStringKey = stringKey.split(",");
			stringKey = arrayStringKey[arrayStringKey.length - 1];
			
		}
		if (stringKey.indexOf("\\") != -1) {
			return new Array();
		}
		var stringRegExpSystem = "$()*+.[?^{|";
		for (var i = 0; i < stringRegExpSystem.length; i++) {
			if (stringKey.indexOf(stringRegExpSystem.substr(i, 1)) != -1) {
				return new Array();
			}
		}
		var stringMarket = new String();
		var arrayQuickResult = this.getQuickResult(stringKey);
		arrayQuickResult.length = arrayQuickResult.length > 10 ? 10 : arrayQuickResult.length;
		return arrayQuickResult;
	};
	this.show = function () {
		var element = arguments.callee.element;
		if (!element.booleanScan) {
			return;
		}		
		if (element.stringLastValue != element.value && element.value != emptyContent) {
			element.line = null;
			element.stringLastValue = element.value;
			var arrayResult = element.suggest.load(element.value);			
			if (arrayResult.length > 0) {				
				element.divHint.style.display = "block";
				var arrayPosition = GetOffsetPos(element);
				element.divHint.style.left = arrayPosition[0] + "px";
				element.divHint.style.top = arrayPosition[1] + "px";
				element.divHint.style.marginTop = element.clientHeight + 1 + "px";
				element.divHint.style.width = (element.clientWidth < 200 ? 200 : element.clientWidth) + "px";
				var tableContainer = document.createElement("table");
				tableContainer.className = "table";
				tableContainer.cellPadding = 0;
				tableContainer.cellSpacing = 0;
				var trHeader = tableContainer.insertRow(0);
				trHeader.className = "trHeader";
				var tdTitle = trHeader.insertCell(0);
				tdTitle.colSpan = 2;
				tdTitle.innerHTML = "搜索提示↓↑";	
			

				for (var i = 0; i < arrayResult.length; i++) {
					if (isNaN(parseInt(i))) {
						continue;
					};
					var arrayRecord = arrayResult[i].split("|");				
					var arrayCodeAndName = arrayRecord[1].split("-");				
					var trRecord = tableContainer.insertRow(parseInt(i) + 1);			
					var tdKey = trRecord.insertCell(0);
					tdKey.innerHTML = arrayCodeAndName[0] +" "+ arrayCodeAndName[1];
					/*
					不需要第3列
					if (arrayCodeAndName[2] > "") {
						var tdInfo = trRecord.insertCell(1);
						tdInfo.innerHTML = arrayCodeAndName[2];
					}
					*/
					/* 名称或代码,决定了确定输入以后显示到输入框中的值 */
					trRecord.stringCodeAndName = arrayCodeAndName[1];
					trRecord.stringFullCode = arrayCodeAndName[0];
					trRecord.inputTarget = element;
					trRecord.onmouseover = function () {
						this.inputTarget.overLine = this;
						this.className = this.inputTarget.line == this ? "overSelectedLine" : "overLine";
					};
					trRecord.onmouseout = function () {
						this.inputTarget.overLine = null;
						this.className = this.inputTarget.line == this ? "selectedLine" : "";
					};
					trRecord.onmousedown = function () {
						this.inputTarget.booleanScan = true;
						this.inputTarget.setLine(this);
					};
				}
				element.divHint.innerHTML = "";
				element.divHint.appendChild(tableContainer);
				element.tableHint = tableContainer;
			}
			else {
				element.divHint.style.display = "none";
				element.divHint.innerHTML = "";
				element.tableHint = null;
			}
		}
	};
	this.bind = function (element) {
		element.suggest = this;
		element.show = this.show;
		element.show.element = element;
		element.intThread = -1;
		element.arrayData = new Array();
		element.value = emptyContent;
		element.style.color = "#999999";
		element.booleanScan = true;
		element.autocomplete = "off";
		var divDataTable = document.createElement("div");
		divDataTable.style.display = "none";
		element.parentNode.insertBefore(divDataTable, element);
		element.divHint = divDataTable;
		element.tableHint = null;
		element.line = null;
		element.overLine = null;
		divDataTable.className = "dropdown";
		divDataTable.style.zIndex="99";
		divDataTable.style.position="absolute";
		
		
		element.onfocus = function () {
			//清除后面span中显示的文字
		//	element.nextSibling.innerText="";
			$("#pulldownDesc").text("");
			if (this.value == emptyContent) {
				this.value = "";
				this.code = "";
				this.style.color = "";				
			};
			this.stringLastValue = this.value;
			if (this.divHint.innerHTML != "") {
				this.divHint.style.display = "block";
				var arrayPosition = GetOffsetPos(this);
				this.divHint.style.left = arrayPosition[0] + "px";
				this.divHint.style.top = arrayPosition[1] + "px";
				this.divHint.style.marginTop = this.clientHeight + 1 + "px";
				this.divHint.style.width = (this.clientWidth < 200 ? 200 : this.clientWidth) + "px";
				
			}
			this.select();
			this.intThread = setInterval(this.show, 10);
		};
		element.onblur = function () {
			if (this.value == "") {
				this.value = emptyContent;
				this.style.color = "#999999";
			}else if(this.value==" "){
				this.value = "关键词";
				this.style.color = "#999999";
			}
			this.divHint.style.display = "none";
			clearInterval(this.intThread);
			this.intThread = -1;
		};
		/**
		*设定输入框的值 
		* @param line  table 的 一个tr 由insertRow方法产生
		*/
		element.setLine = function (line) {
			var stringKeyFore = "";
			if (this.value.indexOf(",") != -1 && this.value.indexOf(",") != 0 && this.value.indexOf(",") != this.value.length - 1) {
				var arrayStringKeyFore = this.value.split(",");
				arrayStringKeyFore[arrayStringKeyFore.length - 1] = "";
				stringKeyFore = arrayStringKeyFore.join(",");
			}
			if (this.line != null) {
				this.line.className = this.overLine == this.line ? "overLine" : "";
			}
			this.line = line;
			line.className = this.overLine == line ? "overSelectedLine" : "selectedLine";
			this.value = line.stringCodeAndName;
			this.code = line.stringFullCode;		
			$("#pulldownDesc").text(this.code);
		};
		element.onkeydown = function () {
			if (!this.tableHint) {
				return true;
			}
			var stringKeyFore = "";
			if (this.value.indexOf(",") != -1 && this.value.indexOf(",") != 0 && this.value.indexOf(",") != this.value.length - 1) {
				var arrayStringKeyFore = this.value.split(",");
				arrayStringKeyFore[arrayStringKeyFore.length - 1] = "";
				stringKeyFore = arrayStringKeyFore.join(",");
				
			}
			
			var event = arguments[0] || window.event;
			switch (event.keyCode) {
				case 38: //up
					this.booleanScan = false;
					if (this.line == null || this.line.rowIndex == 1) {						
						this.setLine(this.tableHint.rows[this.tableHint.rows.length - 1]);						
					}
					else {
						this.setLine(this.tableHint.rows[this.line.rowIndex - 1]);
					}
					return false;
					break;
				case 40: //down
					this.booleanScan = false;
					if (this.line == null || this.line.rowIndex == this.tableHint.rows.length - 1) {
						this.setLine(this.tableHint.rows[1]);
					}
					else {
						this.setLine(this.tableHint.rows[this.line.rowIndex + 1]);
					}
					return false;
					break;
				case 13: //Enter
					this.booleanScan = true;	
					this.stringLastValue = stringKeyFore + this.value ;
					this.divHint.style.display = "none";
					break;
				default:
					this.booleanScan = true;
					break;
			}
		};
	};

/*
	var model = new Model("script", loadName);
	model.suggest = this;
	this.model = model;
	model.stringUrl = stringUrl
	model.processData = function () {
		var suggest = this.suggest;
		suggest.stringData = suggest.stringRecordSpliter + window["dropdownData"];			
	};
*/


	var model = new Model("ajax", loadName);
	model.suggest = this;
	this.model = model;
	model.stringUrl = stringUrl
	model.processData = function (text) {
		var suggest = this.suggest;
		suggest.stringData = text;			
	};
	model.load();

};
var LoaderScript = function () {
	this.elementContainer = null;
	this.init = function (stringContainerId) {
		if (stringContainerId) {
			this.elementContainer = document.getElementById(stringContainerId);
		}
		else {
			this.elementContainer = document.createElement("div");
			this.elementContainer.style.display = "none";
			document.body.appendChild(this.elementContainer);
		}
	};
	this.load = function (src, callback, valueCallback) {
		var elementLoader = document.createElement("script");
		elementLoader.type = "text/javascript";
		elementLoader.language = "javascript";
		elementLoader.charset = "UTF-8";
		elementLoader.src = src;
		elementLoader.valueCallback = valueCallback;
		elementLoader[document.all ? "onreadystatechange" : "onload"] = this.unload;
		elementLoader.callback = callback;
		this.elementContainer.appendChild(elementLoader);
	};
	this.unload = function () {
		if (document.all) {
			if (this.readyState != "loaded" && this.readyState != "complete") {
				return;
			}
		}
		if (this.callback) {
			this.callback(this.valueCallback);
		}
		this.callback = null;
		this[document.all ? "onreadystatechange" : "onload"] = null;
		this.parentNode.removeChild(this);
	};
};

var LoaderAjax = function () {
	this.createXMLHttpObject = function () {
		var obj = null;
		try {
			
			obj =  new XMLHttpRequest();
		}
		catch (e) {
		
		}
		try {
			
			obj =  new ActiveXObject('Msxml2.XMLHTTP');
		}
		catch (e) {
			
		}
		try {
			
			obj =  new ActiveXObject('Microsoft.XMLHTTP');
		}
		catch (e) {
			
		}
		
		return obj;
	};
	/*
	this.load = function (url, callback, content) {
		var xmlhttp = this.createXMLHttpObject();
		if (xmlhttp != null) {
			xmlhttp.open("post", url, true);
			xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xmlhttp.setRequestHeader("Content-Type","text/xml;charset=UTF-8");			
			xmlhttp.onreadystatechange = function () {				
				if (xmlhttp.readyState == 4) {
					alert(xmlhttp.status);
					if (xmlhttp.status == 200) {
						var text = xmlhttp.responseText;
						xmlhttp.abort();
						xmlhttp = null;
						alert(text);
						callback(text);
					}
				}
			};
			content = content == undefined ? null : content;
			xmlhttp.send(content);
		}
	};
};
*/
	this.load = function (url,callback,content){
		jQuery.ajax( {   
				type : 'POST',   
				contentType : "application/x-www-form-urlencoded",   
				url : url,
				dataType : 'text',   
				success : function(data) {
					callback(data);
				},   
				error: function(XMLHttpRequest, textStatus, errorThrown) {
//					alert("error");
//					alert(XMLHttpRequest.status);
//					alert(XMLHttpRequest.readyState);
//					alert(textStatus);
                }
	  });   
	};
};

var Model = function (stringType, stringContainerId) {
	this.getRandomString = function () {
		var date = new Date();
		return date.getTime();
	};
	this.stringType = stringType.toLowerCase();
	this.responseText = null;
	this.booleanReturnForced = false;
	switch (this.stringType) {
		case "ajax":
			this.loader = new LoaderAjax();
			break;
		case "script":
			this.loader = new LoaderScript();
			this.loader.init(stringContainerId);
			break;
	}
	this.stringUrl = "";
	this.stringMark = "@RANDOM@";
	this.callback = function (responseText) {
		var model = arguments.callee.model;
		switch (model.stringType) {
			case "ajax":
				if ((model.responseText != responseText || model.booleanReturnForced) && responseText != "") {
					model.responseText = responseText;
					model.processData.model = model;
					model.processData(responseText);
					model.updateView();
				}
				break;
			case "script":
				model.processData(responseText);
				model.updateView(responseText);
				break;
		}
	};
	this.callback.model = this;
	this.processData = function () {};
	this.updateView = function () {};
	this.stringContent = null;
	this.intThread = -1;
	this.intInterval = 5000;
	this.start = function () {
		this.stop();
		this.load();
		this.intThread = setInterval(this.load, this.intInterval);
	};
	this.stop = function () {
		if (this.intThread != -1) {
			clearInterval(this.intThread);
		}
		this.intThread = -1;
	};
	this.arrayUrl = [];
	this.loadScriptUrl = function () {
		var model = arguments.callee.model;
		if (model.arrayUrl.length > 0) {
			var stringUrl = model.arrayUrl.shift();
			model.loader.load(stringUrl.replace(model.stringMark, model.getRandomString()), model.callback, stringUrl);
		}
	};
	this.loadScriptUrl.model = this;
	this.load = function () {
		var model = arguments.callee.model;
		switch (model.stringType) {
			case "ajax":
				model.loader.load(model.stringUrl.replace(model.stringMark, model.getRandomString()), model.callback, model.stringContent);
				break;
			case "script":
				if (model.stringUrl.constructor == Array) {
					model.arrayUrl = [];
					for (var i = 0; i < model.stringUrl.length; i++) {
						model.arrayUrl.push(model.stringUrl[i]);
						setTimeout(model.loadScriptUrl, i * 5000000);
					}
				}
				else if (model.stringUrl != "") {
					model.loader.load(model.stringUrl.replace(model.stringMark, model.getRandomString()), model.callback, model.stringUrl);
				}
				break;
		}
	};
	this.load.model = this;
};
function GetOffsetPos(element) {
	var flag = element.tagName.toUpperCase() == "INPUT" ? true : false;
	var posTop = 0, posLeft = 0;
	do {
		posTop += element.offsetTop || 0;
		posLeft += element.offsetLeft || 0;
		element = element.offsetParent;
	} while (element);
    return [posLeft, posTop];
}