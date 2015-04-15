/*----------------------------------------------------------------------------\
|                       Cross Browser Tree Widget 1.17                        |
|-----------------------------------------------------------------------------|
|                      For WebFX (http://webfx.eae.net/)                      |
|-----------------------------------------------------------------------------|
| An object based tree widget,  emulating the one found in microsoft windows, |
| with persistence using cookies. Works in IE 5+, Mozilla and konqueror 3.    |
|-----------------------------------------------------------------------------|
| Dependencies: xtree.css (To set up the CSS of the tree classes)             |
\----------------------------------------------------------------------------*/
//alert("import rigth");
//获取该树形控件所在目录
function getJSPath(jsFileName) {
    var jsPath = "";
    for (var i = 0; i < document.scripts.length; i++) {
        jsPath = document.scripts[i].src + "";
        var t = jsPath.indexOf(jsFileName);
        if (t != -1) {
            jsPath = jsPath.slice(0, t);
            break;
        }
    }
    return jsPath;
}

var rootpath = getJSPath("cateXtree.js");
var csslib_path_prefix = rootpath;
//导入css
var importcss = function(css_file,path){
    var css_path = path ||  csslib_path_prefix;
    document.write('<link href="'+ css_path + css_file + '" type="text/css" rel="stylesheet"/>');
};

importcss("cateXtree.css");  

var imagePath = rootpath + "images/";
//----------------------------------------------------------------------
var webFXTreeConfig = {
	rootIcon        : imagePath + 'foldericon.gif',
	openRootIcon    : imagePath + 'openfolder_1.gif',
	folderIcon      : imagePath + 'foldericon.gif',
	openFolderIcon  : imagePath + 'openfolder_1.gif',
	checkOpenFolder : imagePath + 'openfolder_2.gif',
	fileIcon        : imagePath + 'file.gif',
	iIcon           : imagePath + 'I.gif',
	lIcon           : imagePath + 'L.gif',
	lMinusIcon      : imagePath + 'Lminus.gif',
	lPlusIcon       : imagePath + 'Lplus.gif',
	tIcon           : imagePath + 'T.gif',
	tMinusIcon      : imagePath + 'Tminus.gif',
	tPlusIcon       : imagePath + 'Tplus.gif',
	blankIcon       : imagePath + 'blank.gif',
	defaultText     : 'Tree Item',
	defaultAction   : 'javascript:void(0);',
	defaultBehavior : 'classic',
	defaultValue    : '',
	usePersistence	: false, /* 用cookie存储，数据量大时会造成挤掉 session存储，造成session提前失效   ，改为false */
	//used for xml tree
	loadingText : "Loading...",
	loadErrorTextTemplate : "Error loading \"%1%\"",
	emptyErrorTextTemplate : "\"%1%\" does not contain any tree items",
	checkedItemPaths : [],
	globalMutex : false
};

var webFXTreeHandler = {
	idCounter : 0,
	idPrefix  : "webfx-tree-object-",
	all       : {},
	behavior  : null,
	selected  : null,
	onSelect  : null, /* should be part of tree, not handler */
	getId     : function() { return this.idPrefix + this.idCounter++; },
	toggle    : function (oItem) { this.all[oItem.id.replace('-plus','')].toggle(); },
	select    : function (oItem) { this.all[oItem.id.replace('-icon','')].select(); },
	focus     : function (oItem) { this.all[oItem.id.replace('-anchor','')].focus();},
	blur      : function (oItem) { this.all[oItem.id.replace('-anchor','')].blur();},
	keydown   : function (oItem, e) { return this.all[oItem.id].keydown(e.keyCode); },
	cookies   : new WebFXCookie(),
	insertHTMLBeforeEnd	:	function (oElement, sHTML) {
		if (oElement.insertAdjacentHTML != null) {
			oElement.insertAdjacentHTML("BeforeEnd", sHTML)
			return;
		}
		var df;	// DocumentFragment
		var r = oElement.ownerDocument.createRange();
		r.selectNodeContents(oElement);
		r.collapse(false);
		df = r.createContextualFragment(sHTML);
		oElement.appendChild(df);
	}
};

/*
 * WebFXCookie class
 */

function WebFXCookie() {
	if (document.cookie.length) { this.cookies = ' ' + document.cookie; }
}

WebFXCookie.prototype.setCookie = function (key, value) {
	document.cookie = key + "=" + escape(value);
}

WebFXCookie.prototype.getCookie = function (key) {
	if (this.cookies) {
		var start = this.cookies.indexOf(' ' + key + '=');
		if (start == -1) { return null; }
		var end = this.cookies.indexOf(";", start);
		if (end == -1) { end = this.cookies.length; }
		end -= start;
		var cookie = this.cookies.substr(start,end);
		return unescape(cookie.substr(cookie.indexOf('=') + 1, cookie.length - cookie.indexOf('=') + 1));
	}
	else { return null; }
}

/*
 * WebFXTreeAbstractNode class
 */

function WebFXTreeAbstractNode(sText, sAction,sValue) {
	this.childNodes  = [];
	this.id     = webFXTreeHandler.getId();
	this.text   = sText || webFXTreeConfig.defaultText;
	this.action = sAction || webFXTreeConfig.defaultAction;
	this._last  = false;
	this.value  = sValue || webFXTreeConfig.defaultValue;
	webFXTreeHandler.all[this.id] = this;
}

/*
 * To speed thing up if you're adding multiple nodes at once (after load)
 * use the bNoIdent parameter to prevent automatic re-indentation and call
 * the obj.ident() method manually once all nodes has been added.
 */

WebFXTreeAbstractNode.prototype.add = function (node, bNoIdent) {
	node.parentNode = this;
	this.childNodes[this.childNodes.length] = node;
	var root = this;
	if (this.childNodes.length >= 2) {
		this.childNodes[this.childNodes.length - 2]._last = false;
	}
	while (root.parentNode) { root = root.parentNode; }
	if (root.rendered) {
		if (this.childNodes.length >= 2) {
			document.getElementById(this.childNodes[this.childNodes.length - 2].id + '-plus').src = ((this.childNodes[this.childNodes.length -2].folder)?((this.childNodes[this.childNodes.length -2].open)?webFXTreeConfig.tMinusIcon:webFXTreeConfig.tPlusIcon):webFXTreeConfig.tIcon);
			this.childNodes[this.childNodes.length - 2].plusIcon = webFXTreeConfig.tPlusIcon;
			this.childNodes[this.childNodes.length - 2].minusIcon = webFXTreeConfig.tMinusIcon;
			this.childNodes[this.childNodes.length - 2]._last = false;
		}
		this._last = true;
		var foo = this;
		while (foo.parentNode) {
			for (var i = 0; i < foo.parentNode.childNodes.length; i++) {
				if (foo.id == foo.parentNode.childNodes[i].id) { break; }
			}
			if (i == foo.parentNode.childNodes.length - 1) { foo.parentNode._last = true; }
			else { foo.parentNode._last = false; }
			foo = foo.parentNode;
		}
		webFXTreeHandler.insertHTMLBeforeEnd(document.getElementById(this.id + '-cont'), node.toString());
		if ((!this.folder) && (!this.openIcon)) {
			this.icon = webFXTreeConfig.folderIcon;
			this.openIcon = (this.showInput) ? webFXTreeConfig.checkOpenFolder:webFXTreeConfig.openFolderIcon;
		}
		if (!this.folder) { this.folder = true; this.collapse(true); }
		if (!bNoIdent) { this.indent(); }
	}
	return node;
}

WebFXTreeAbstractNode.prototype.toggle = function() {
	if (this.folder) {
		if (this.open) { this.collapse(); }
		else { this.expand(); }
}	}
//getSelectedChild added by crazy_rain
WebFXTreeAbstractNode.prototype.getSelectedChild = function() {
	for(var i = 0 ; i < this.childNodes.length;i++){
		if(this.childNodes[i]._checked) return this.childNodes[i];	
	}
	return [];
}
//getSelectedChildren added by crazy_rain
WebFXTreeAbstractNode.prototype.getSelectedChildren = function() {
	var selectedChildren = [];
	for(var i = 0 ; i < this.childNodes.length;i++){
		if(this.childNodes[i]._checked){
			selectedChildren[selectedChildren.length] = this.childNodes[i];
		}
	}
	return selectedChildren;
}

WebFXTreeAbstractNode.prototype.select = function() {
	document.getElementById(this.id + '-anchor').focus();
}

WebFXTreeAbstractNode.prototype.deSelect = function() {
	document.getElementById(this.id + '-anchor').className = '';
	webFXTreeHandler.selected = null;
}

WebFXTreeAbstractNode.prototype.focus = function() {
	if ((webFXTreeHandler.selected) && (webFXTreeHandler.selected != this)) { webFXTreeHandler.selected.deSelect(); }
	webFXTreeHandler.selected = this;
	if ((this.openIcon) && (webFXTreeHandler.behavior != 'classic')) { document.getElementById(this.id + '-icon').src = this.openIcon; }
	document.getElementById(this.id + '-anchor').className = 'selected';
	document.getElementById(this.id + '-anchor').focus();
	if (webFXTreeHandler.onSelect) { webFXTreeHandler.onSelect(this); }
}

WebFXTreeAbstractNode.prototype.search = function(text) {
	var currentNode = this;
	var isContinue = false;
	//存在选择节点,并且选中节点不是当前节点
	if(webFXTreeHandler.selected && webFXTreeHandler.selected != currentNode){
		var isBack = false;
		//检查当前节点是否是选择节点的子节点
		while(currentNode.parentNode){
			currentNode = currentNode.parentNode;
			if(currentNode == webFXTreeHandler.selected){
				isBack = true;
				break;
			}
		}
		if(!isBack){
			//当前节点不是选择节点的子节点
			currentNode = webFXTreeHandler.selected;
		}else{
			//当前节点是选中节点的子节点
			currentNode = this;
		}
		isContinue = true;
		
	}
	//采用类似like的方式
	if(currentNode.text.indexOf(text)!=-1 && isContinue){
		//当前选中节点即为满足查询条件的节点,则开始检索下一个节点
		currentNode.deSelect();
		//如果有子节点,先检查子节点,否则检查兄弟节点		
		if(currentNode.childNodes && currentNode.childNodes.length > 0){
			currentNode = currentNode.childNodes[0];
		}else if(currentNode.getNextSibling && currentNode.getNextSibling() != null){
			currentNode = currentNode.getNextSibling();
		}
	}
	if(currentNode.text && currentNode.text.indexOf(text)!=-1 ){//没有选中的节点,并且当前节点满足查询条件
		if(currentNode.parentNode.folder && !currentNode.parentNode.open){
			//如果满足条件的节点所在的父节点没有展开,则展开它
			currentNode.parentNode.expand();
		}
		currentNode.focus();
		return true;		
	}
	if(currentNode.childNodes && currentNode.childNodes.length && currentNode.childNodes.length > 0 ){//检查子节点
		var children = currentNode.childNodes;
		for(var i = 0 ; i < children.length;i++){
			if(webFXTreeHandler.selected && webFXTreeHandler.selected == children[i]) continue;
			if(children[i].search(text)) return true;
		}
	}
	if(currentNode.getNextSibling && currentNode.getNextSibling() != null){
		if(webFXTreeHandler.selected){
			webFXTreeHandler.selected.deSelect();
		}
		if(currentNode.getNextSibling().search(text)) return true;
	}
	return false;
}


WebFXTreeAbstractNode.prototype.blur = function() {
	if ((this.openIcon) && (webFXTreeHandler.behavior != 'classic')) { document.getElementById(this.id + '-icon').src = this.icon; }
	document.getElementById(this.id + '-anchor').className = 'selected-inactive';
}

WebFXTreeAbstractNode.prototype.doExpand = function() {
	if (webFXTreeHandler.behavior == 'classic') { document.getElementById(this.id + '-icon').src = this.openIcon; }
	if (this.childNodes.length) {  document.getElementById(this.id + '-cont').style.display = 'block'; }
	this.open = true;
	if (webFXTreeConfig.usePersistence) {
		webFXTreeHandler.cookies.setCookie(this.id.substr(18,this.id.length - 18), '1');
}	}

WebFXTreeAbstractNode.prototype.doCollapse = function() {
	if (webFXTreeHandler.behavior == 'classic') { document.getElementById(this.id + '-icon').src = this.icon; }
	if (this.childNodes.length) { document.getElementById(this.id + '-cont').style.display = 'none'; }
	this.open = false;
	if (webFXTreeConfig.usePersistence) {
		webFXTreeHandler.cookies.setCookie(this.id.substr(18,this.id.length - 18), '0');
}	}

WebFXTreeAbstractNode.prototype.expandAll = function() {
	this.expandChildren();
	if ((this.folder) && (!this.open)) { this.expand(); }
}

WebFXTreeAbstractNode.prototype.expandChildren = function() {
	for (var i = 0; i < this.childNodes.length; i++) {
		this.childNodes[i].expandAll();
} }

WebFXTreeAbstractNode.prototype.collapseAll = function() {
	this.collapseChildren();
	if ((this.folder) && (this.open)) { this.collapse(true); }
}

WebFXTreeAbstractNode.prototype.collapseChildren = function() {
	for (var i = 0; i < this.childNodes.length; i++) {
		this.childNodes[i].collapseAll();
} }

WebFXTreeAbstractNode.prototype.indent = function(lvl, del, last, level, nodesLeft) {
	/*
	 * Since we only want to modify items one level below ourself,
	 * and since the rightmost indentation position is occupied by
	 * the plus icon we set this to -2
	 */
	if (lvl == null) { lvl = -2; }
	var state = 0;
	for (var i = this.childNodes.length - 1; i >= 0 ; i--) {
		state = this.childNodes[i].indent(lvl + 1, del, last, level);
		if (state) { return; }
	}
	if (del) {
		if ((level >= this._level) && (document.getElementById(this.id + '-plus'))) {
			if (this.folder) {
				document.getElementById(this.id + '-plus').src = (this.open)?webFXTreeConfig.lMinusIcon:webFXTreeConfig.lPlusIcon;
				this.plusIcon = webFXTreeConfig.lPlusIcon;
				this.minusIcon = webFXTreeConfig.lMinusIcon;
			}
			else if (nodesLeft) { document.getElementById(this.id + '-plus').src = webFXTreeConfig.lIcon; }
			return 1;
	}	}
	var foo = document.getElementById(this.id + '-indent-' + lvl);
	if (foo) {
	    //fix a bug
	    try{
			var __root = this;
		    while(__root.parentNode){
		   		 __root = __root.parentNode;
		    }
		    var last = __root.childNodes[__root.childNodes.length - 1];
		    var __temp = this;
		    while(__temp.parentNode){
		        __temp = __temp.parentNode;
		        if(__temp == last){
			        foo._last = true;
		        	break;
		        }
		    }
	    }catch(e){
	    	//ignore
	    }
	    //end
		if ((foo._last) || ((del) && (last))) { foo.src =  webFXTreeConfig.blankIcon; }
		else { foo.src =  webFXTreeConfig.iIcon; }
	}
	return 0;
}
//check children,added by crazy_rain 
WebFXTreeAbstractNode.prototype.checkChildren = function(bChecked) {
	var children = this.childNodes;
	
};
//added by crazy_rain
WebFXTreeAbstractNode.prototype.getLevel = function() {
	var level = 0;
	var node = this;
	while(node.parentNode){
		node = node.parentNode;
		level += 1;
	}
	return level;
}
//check the current tree item and children if exists
WebFXTreeAbstractNode.prototype.setChecked = function (bChecked,checkSubTree) {
	if(typeof checkSubTree == "undefined"){
		checkSubTree = true;
	}
	if(!this.showInput) return;
	if(bChecked){
		try{
		//如果存在radio父节点,并且没有选中,则选中它
			var __root = this;
		    while(__root.parentNode){
		   		 __root = __root.parentNode;
		   		 if(__root.inputType =='radio' && !__root._checked){
		   		 	//alert('请先选中当前节点['+ this.text +']的父节点['+ __root.text +']');
		   		 	//document.getElementById(this.id + "-checkbox").checked = false;
		   		 	//return;
		   		 	__root.setChecked(true);
		   		 }
		    }
			if(this.inputType =='radio'){
				//处理对兄弟节点及子节点的互斥动作
				var brothers = this.parentNode.childNodes;
				for(var i = 0 ;i < brothers.length ;i ++){
					if(this.id != brothers[i].id && brothers[i]._checked && brothers[i].showInput && brothers[i].inputType  == 'radio'){
						brothers[i].setChecked(false);
						break;
					}
				}
			}
			 
		}catch(e){
	    	//ignore
	    }
	}
        var divEl = document.getElementById(this.id);
		var inputEl = divEl.getElementsByTagName("INPUT")[0];
		this._checked = inputEl.checked = bChecked;
		if((!(bChecked && this.showInput && this.inputType == 'radio')) && checkSubTree){
			this.checkChildren(bChecked);
		}
		if (typeof this.onCheck == "function")
			this.onCheck(this,bChecked);
		else if (typeof this.onCheck == "string")
			eval(this.onCheck);			
}
//added by crazy_rain:get the children of current tree item
// if this tree has no child ,return an empty array
WebFXTreeAbstractNode.prototype.getChildren = function() {
	return this.childNodes||[];
}
//添加子节点
WebFXTreeAbstractNode.prototype.addChild = function (sText, sAction, bshowInput,inputType, onCheck, bChecked ,sValue ,eParent, sIcon, sOpenIcon) {
	return new WebFXTreeItem(sText, sAction, bshowInput,inputType, onCheck, bChecked ,sValue ,this, sIcon, sOpenIcon);
}; 
/*
 * WebFXTree class
 */
//WebFXTree(sText, sAction, bshowInput, bChecked ,onCheck, sValue ,sBehavior, sIcon, sOpenIcon)
function WebFXTree(sText, sAction, bshowInput, bChecked , onCheck, sValue , sBehavior, sIcon, sOpenIcon) {
	this.base = WebFXTreeAbstractNode;
	this.base(sText, sAction ,sValue);
	this.onCheck = onCheck || webFXTreeConfig.defaultAction;
	this.showInput = bshowInput || false;
	this.icon      = sIcon || webFXTreeConfig.rootIcon;
	this.openIcon  = sOpenIcon || ((this.showInput) ? webFXTreeConfig.checkOpenFolder:webFXTreeConfig.openRootIcon);
	/* Defaults to open */
	if (webFXTreeConfig.usePersistence) {
		this.open  = (webFXTreeHandler.cookies.getCookie(this.id.substr(18,this.id.length - 18)) == '0')?false:true;
	} else { this.open  = true; }
	this.folder    = true;
	this.rendered  = false;
	this.onSelect  = null;
	this._checked = bChecked || false;
	if (!webFXTreeHandler.behavior) {  webFXTreeHandler.behavior = sBehavior || webFXTreeConfig.defaultBehavior; }
}

WebFXTree.prototype = new WebFXTreeAbstractNode;

WebFXTree.prototype.setBehavior = function (sBehavior) {
	webFXTreeHandler.behavior =  sBehavior;
};

WebFXTree.prototype.getBehavior = function (sBehavior) {
	return webFXTreeHandler.behavior;
};

WebFXTree.prototype.getSelected = function() {
	if (webFXTreeHandler.selected) { return webFXTreeHandler.selected; }
	else { return null; }
}

WebFXTree.prototype.remove = function() { }

WebFXTree.prototype.expand = function() {
	this.doExpand();
}

WebFXTree.prototype.collapse = function(b) {
	if (!b) { this.focus(); }
	this.doCollapse();
}

WebFXTree.prototype.getFirst = function() {
	return null;
}

WebFXTree.prototype.getLast = function() {
	return null;
}

WebFXTree.prototype.getNextSibling = function() {
	return null;
}
//获取所有选中子结点ID
WebFXTree.prototype.getSelectedIds = function() {
  var values = "";
    //whether root is checked;
	if(this.showInput && document.getElementById(this.id + "-checkbox").checked) values = document.getElementById(this.id + "-checkbox").value + ",";
	//get checked children
	var objDiv = document.getElementById(this.id + "-cont");
	var aoCheckbox = objDiv.getElementsByTagName("INPUT");
	for (var i=0;i<aoCheckbox.length;i++)
	{
		if (aoCheckbox[i].checked) values += aoCheckbox[i].value + ",";
	}

	if (values.length>1) values = values.substring(0,values.length-1);

	return values;
}


//获取所有选中子结点ID
WebFXTree.prototype.getSelectedTexts = function() {
  var texts = "";
	if(this.showInput && document.getElementById(this.id + "-checkbox").checked) texts = this.text + ",";
	var objDiv = document.getElementById(this.id + "-cont");
	var aoCheckbox = objDiv.getElementsByTagName("INPUT");
	for (var i=0;i<aoCheckbox.length;i++)
	{
		if (aoCheckbox[i].checked) texts += aoCheckbox[i].nextSibling.nextSibling.innerText + ",";
	}

	if (texts.length>1) texts = texts.substring(0,texts.length-1);
	
	return texts;
}

//设置结点选中
WebFXTree.prototype.setSelectedIds = function(nodeIds) {
	var nodes = [];
	if(nodeIds.indexOf(",") == -1){
	  	nodes = [nodeIds];	
	}else{
	  	nodes = nodeIds.split(",");
	}
	if (nodes.length==0) return;
	//检查根节点是否被选中
	for (var j=0; this.showInput && j<nodes.length;j++){
		if (nodes[j] == this.value) document.getElementById(this.id + "-checkbox").checked = true;
	}
	var objDiv = document.getElementById(this.id + "-cont");
	var aoCheckbox = objDiv.getElementsByTagName("INPUT");
	for (var i=0;i<aoCheckbox.length;i++){
		for (var j=0;j<nodes.length;j++){
			if (nodes[j] == aoCheckbox[i].value) aoCheckbox[i].checked = true;
		}
	}
}
WebFXTree.prototype.selectAll = function() {
  this.setChecked(true);
}
WebFXTree.prototype.clearSelect = function() {
	this.setChecked(false);
}

WebFXTree.prototype.getPreviousSibling = function() {
	return null;
}

WebFXTree.prototype.keydown = function(key) {
	if (key == 39) {
		if (!this.open) { this.expand(); }
		else if (this.childNodes.length) { this.childNodes[0].select(); }
		return false;
	}
	if (key == 37) { this.collapse(); return false; }
	if ((key == 40) && (this.open) && (this.childNodes.length)) { this.childNodes[0].select(); return false; }
	return true;
}

WebFXTree.prototype.toString = function() {
	var hiddenFrame = (document.getElementById('webfx-tree-object-hiddenFrame') == null) ? "<iframe name='webfx-tree-object-hiddenFrame' style='display: none;'></iframe>":"";
	var str = hiddenFrame + "<div id=\"" + this.id + "\" ondblclick=\"webFXTreeHandler.toggle(this);\" class=\"webfx-tree-item\" onkeydown=\"return webFXTreeHandler.keydown(this, event)\">";
	//var str = "<div id=\"" + this.id + "\" ondblclick=\"webFXTreeHandler.toggle(this);\" class=\"webfx-tree-item\" onkeydown=\"return webFXTreeHandler.keydown(this, event)\">";
	if(this.showInput){
			// insert check box
			str += "<input type=\"checkbox\" class=\"tree-check-box\"" +
			" id=\""+this.id+"-checkbox\" " +
			" value=\""+ this.value +"\" " + 
			(this._checked ? " checked=\"checked\"" : "") +
			" onclick=\"webFXTreeHandler.all[this.parentNode.id].setChecked(this.checked)\"/>";
			// end insert checkbox
	}
	str+="<img id=\"" + this.id + "-icon\" class=\"webfx-tree-icon\" src=\"" + ((webFXTreeHandler.behavior == 'classic' && this.open)?this.openIcon:this.icon) + "\" onclick=\"webFXTreeHandler.select(this);\">" +
		"<a href='javascript:void(0);' value='" + this.value+ "'  text='" + this.text+ "' onclick=\"" + this.action + "\" id=\"" + this.id + "-anchor\" onfocus=\"webFXTreeHandler.focus(this);\" onblur=\"webFXTreeHandler.blur(this);\"" +
		" target='webfx-tree-object-hiddenFrame'>" + this.text + "</a></div>" +
		"<div id=\"" + this.id + "-cont\" class=\"webfx-tree-container\" style=\"display: " + ((this.open)?'block':'none') + ";\">";
	var sb = [];
	for (var i = 0; i < this.childNodes.length; i++) {
		sb[i] = this.childNodes[i].toString(i, this.childNodes.length);
	}
	this.rendered = true;
	return str + sb.join("") + "</div>";
};

/*
 * WebFXTreeItem class
 */

function WebFXTreeItem(sText, sAction, bshowInput,inputType, onCheck, bChecked ,sValue ,eParent, sIcon, sOpenIcon) {
	this.base = WebFXTreeAbstractNode;
	this.inputType = inputType;
	this.base(sText, sAction,sValue);
	/* Defaults to close */
	if (webFXTreeConfig.usePersistence) {
		this.open = (webFXTreeHandler.cookies.getCookie(this.id.substr(18,this.id.length - 18)) == '1')?true:false;
	} else { this.open = false; }
	if (sIcon) { this.icon = sIcon; }
	if (sOpenIcon) { this.openIcon = sOpenIcon; }
	if (eParent) { eParent.add(this); }
	//add by crazy_rain
	//whether show checkbox or not ,default is not
	this.showInput = bshowInput || false;
	this.onCheck = onCheck || webFXTreeConfig.defaultAction;
	this._checked = bChecked || false;
}

WebFXTreeItem.prototype = new WebFXTreeAbstractNode;

WebFXTreeItem.prototype.remove = function() {
	var iconSrc = document.getElementById(this.id + '-plus').src;
	var parentNode = this.parentNode;
	var prevSibling = this.getPreviousSibling(true);
	var nextSibling = this.getNextSibling(true);
	var folder = this.parentNode.folder;
	var last = ((nextSibling) && (nextSibling.parentNode) && (nextSibling.parentNode.id == parentNode.id))?false:true;
	this.getPreviousSibling().focus();
	this._remove();
	if (parentNode.childNodes.length == 0) {
		document.getElementById(parentNode.id + '-cont').style.display = 'none';
		parentNode.doCollapse();
		parentNode.folder = false;
		parentNode.open = false;
	}
	if (!nextSibling || last) { parentNode.indent(null, true, last, this._level, parentNode.childNodes.length); }
	if ((prevSibling == parentNode) && !(parentNode.childNodes.length)) {
		prevSibling.folder = false;
		prevSibling.open = false;
		iconSrc = document.getElementById(prevSibling.id + '-plus').src;
		iconSrc = iconSrc.replace('minus', '').replace('plus', '');
		document.getElementById(prevSibling.id + '-plus').src = iconSrc;
		document.getElementById(prevSibling.id + '-icon').src = webFXTreeConfig.fileIcon;
	}
	if (document.getElementById(prevSibling.id + '-plus')) {
		if (parentNode == prevSibling.parentNode) {
			iconSrc = iconSrc.replace('minus', '').replace('plus', '');
			document.getElementById(prevSibling.id + '-plus').src = iconSrc;
}	}	}

WebFXTreeItem.prototype._remove = function() {
	for (var i = this.childNodes.length - 1; i >= 0; i--) {
		this.childNodes[i]._remove();
 	}
	for (var i = 0; i < this.parentNode.childNodes.length; i++) {
		if (this == this.parentNode.childNodes[i]) {
			for (var j = i; j < this.parentNode.childNodes.length; j++) {
				this.parentNode.childNodes[j] = this.parentNode.childNodes[j+1];
			}
			this.parentNode.childNodes.length -= 1;
			if (i + 1 == this.parentNode.childNodes.length) { this.parentNode._last = true; }
			break;
	}	}
	webFXTreeHandler.all[this.id] = null;
	var tmp = document.getElementById(this.id);
	if (tmp) { tmp.parentNode.removeChild(tmp); }
	tmp = document.getElementById(this.id + '-cont');
	if (tmp) { tmp.parentNode.removeChild(tmp); }
}

WebFXTreeItem.prototype.expand = function() {
	this.doExpand();
	document.getElementById(this.id + '-plus').src = this.minusIcon;
}
WebFXTreeItem.prototype.getPath = function() {
	var path = this.text;	
	var tempNode = this.parentNode;
	while(tempNode && (tempNode instanceof WebFXTreeItem)){
		path = tempNode.text + '/' + path;
		tempNode  = tempNode.parentNode;
	}
	return path;
}

WebFXTreeItem.prototype.collapse = function(b) {
	if (!b) { this.focus(); }
	this.doCollapse();
	document.getElementById(this.id + '-plus').src = this.plusIcon;
}
WebFXTreeItem.prototype.getFirst = function() {
	return this.childNodes[0];
}

WebFXTreeItem.prototype.getLast = function() {
	if (this.childNodes[this.childNodes.length - 1].open) { return this.childNodes[this.childNodes.length - 1].getLast(); }
	else { return this.childNodes[this.childNodes.length - 1]; }
}

WebFXTreeItem.prototype.getNextSibling = function() {
	for (var i = 0; i < this.parentNode.childNodes.length; i++) {
		if (this == this.parentNode.childNodes[i]) { break; }
	}
	if (++i == this.parentNode.childNodes.length) { return this.parentNode.getNextSibling(); }
	else { return this.parentNode.childNodes[i]; }
}

WebFXTreeItem.prototype.getPreviousSibling = function(b) {
	for (var i = 0; i < this.parentNode.childNodes.length; i++) {
		if (this == this.parentNode.childNodes[i]) { break; }
	}
	if (i == 0) { return this.parentNode; }
	else {
		if ((this.parentNode.childNodes[--i].open) || (b && this.parentNode.childNodes[i].folder)) { return this.parentNode.childNodes[i].getLast(); }
		else { return this.parentNode.childNodes[i]; }
} }

WebFXTreeItem.prototype.keydown = function(key) {
	if ((key == 39) && (this.folder)) {
		if (!this.open) { this.expand(); }
		else { this.getFirst().select(); }
		return false;
	}
	else if (key == 37) {
		if (this.open) { this.collapse(); }
		else { this.parentNode.select(); }
		return false;
	}
	else if (key == 40) {
		if (this.open) { this.getFirst().select(); }
		else {
			var sib = this.getNextSibling();
			if (sib) { sib.select(); }
		}
		return false;
	}
	else if (key == 38) { this.getPreviousSibling().select(); return false; }
	return true;
}
WebFXTreeItem.prototype.toString = function (nItem, nItemCount) {
	var foo = this.parentNode;
	var indent = '';
	if (nItem + 1 == nItemCount) { this.parentNode._last = true; }
	var i = 0;
	while (foo.parentNode) {
		foo = foo.parentNode;
		indent = "<img id=\"" + this.id + "-indent-" + i + "\" src=\"" + ((foo._last)?webFXTreeConfig.blankIcon:webFXTreeConfig.iIcon) + "\">" + indent;
		i++;
	}
	this._level = i;
	if (this.childNodes.length) { this.folder = 1; }
	else { this.open = false; }
	if ((this.folder) || (webFXTreeHandler.behavior != 'classic')) {
		if (!this.icon) { this.icon = webFXTreeConfig.folderIcon; }
		if (!this.openIcon) { this.openIcon = (this.showInput) ? webFXTreeConfig.checkOpenFolder:webFXTreeConfig.openFolderIcon; }
	}
	else if (!this.icon) { this.icon = webFXTreeConfig.fileIcon; }
	
	var label = this.text.replace(/</g, '&lt;').replace(/>/g, '&gt;');
	var str = "<div id=\"" + this.id + "\" ondblclick=\"webFXTreeHandler.toggle(this);\" class=\"webfx-tree-item\" onkeydown=\"return webFXTreeHandler.keydown(this, event)\">" +
		indent +
		"<img id=\"" + this.id + "-plus\" src=\"" + ((this.folder)?((this.open)?((this.parentNode._last)?webFXTreeConfig.lMinusIcon:webFXTreeConfig.tMinusIcon):((this.parentNode._last)?webFXTreeConfig.lPlusIcon:webFXTreeConfig.tPlusIcon)):((this.parentNode._last)?webFXTreeConfig.lIcon:webFXTreeConfig.tIcon)) + "\" onclick=\"webFXTreeHandler.toggle(this);\">" ;
		if(this.showInput){//是否显示一个checkbox框
		    var type = this.inputType ||"checkbox";
			// insert check box
			str += "<input type=\""+type+"\" class=\"tree-check-box\"" ;
			if(type == "radio"){
				str +=" id=\""+this.id+"-checkbox\" " ;
				str += (webFXTreeConfig.globalMutex) ? " name=\"root\" " : " name=\""+this.parentNode.id+ "\" " ;
			}else{//checkbox
				str +=" id=\""+this.id+"-checkbox\" " ;
			}
			str+= " value=\""+ this.value +"\" " + 
				(this._checked ? " checked=\"checked\"" : "") +
				" onclick=\"webFXTreeHandler.all[this.parentNode.id].setChecked(this.checked)\"/>";
			// end insert checkbox
		}
		str +="<img id=\"" + this.id + "-icon\" class=\"webfx-tree-icon\" src=\"" + ((webFXTreeHandler.behavior == 'classic' && this.open)?this.openIcon:this.icon) + "\" onclick=\"webFXTreeHandler.select(this);\">" +
		"<a href='javascript:void(0);' value='" + this.value + "'  text='" + this.text+ "' onclick=\"" + this.action + "\" id=\"" + this.id + "-anchor\" onfocus=\"webFXTreeHandler.focus(this);\" onblur=\"webFXTreeHandler.blur(this);\"" +
		" target='webfx-tree-object-hiddenFrame'>" + label + "</a></div>" +
		"<div id=\"" + this.id + "-cont\" class=\"webfx-tree-container\" style=\"display: " + ((this.open)?'block':'none') + ";\">";
	var sb = [];
	for (var i = 0; i < this.childNodes.length; i++) {
		sb[i] = this.childNodes[i].toString(i,this.childNodes.length);
	}
	this.plusIcon = ((this.parentNode._last)?webFXTreeConfig.lPlusIcon:webFXTreeConfig.tPlusIcon);
	this.minusIcon = ((this.parentNode._last)?webFXTreeConfig.lMinusIcon:webFXTreeConfig.tMinusIcon);
	return str + sb.join("") + "</div>";
}

/*----------------------------------------------------------------------------\
|                               XLoadTree 1.11                                |
|-----------------------------------------------------------------------------|
| An extension to xTree that allows sub trees to be loaded at runtime by      |
| reading XML files from the server. Works with IE5+ and Mozilla 1.0+         |
\----------------------------------------------------------------------------*/
/*
 * WebFXLoadTree class
 */

function WebFXLoadTree(sText, sXmlSrc, sAction,bshowInput, bChecked,sValue, sBehavior, sIcon, sOpenIcon) {
	// call super
	this.WebFXTree = WebFXTree;
	this.WebFXTree(sText, sAction,bshowInput, bChecked, sValue, sBehavior, sIcon, sOpenIcon);
	
	// setup default property values
	this.src = sXmlSrc;
	this.loading = false;
	this.loaded = false;
	this.errorText = "";
	// check start state and load if open
	if (this.open)
		_startLoadXmlTree(this.src, this);
	else {
		// and create loading item if not
		this._loadingItem = new WebFXTreeItem(webFXTreeConfig.loadingText);
		this.add(this._loadingItem);
	}
}

WebFXLoadTree.prototype = new WebFXTree;

// override the expand method to load the xml file
WebFXLoadTree.prototype._webfxtree_expand = WebFXTree.prototype.expand;
WebFXLoadTree.prototype.expand = function() {
	if (!this.loaded && !this.loading) {
		// load
		_startLoadXmlTree(this.src, this);
	}
	this._webfxtree_expand();
};

/*
 * WebFXLoadTreeItem class
 */
function WebFXLoadTreeItem(sText,sXmlSrc, sAction, bshowInput,inputType, onCheck, bChecked,sValue,eParent, sIcon, sOpenIcon) {
	// call super
	this.WebFXTreeItem = WebFXTreeItem;
	this.WebFXTreeItem(sText,sAction,bshowInput,inputType,onCheck,bChecked,sValue, eParent, sIcon, sOpenIcon);
	
	// setup default property values
	this.src = sXmlSrc;
	this.open = false;
	this.loading = false;
	this.loaded = false;
	this.errorText = "";
	
	// check start state and load if open
	if (this.open)
		_startLoadXmlTree(this.src, this);
	else {
		// and create loading item if not
		this._loadingItem = new WebFXTreeItem(webFXTreeConfig.loadingText);
		this.add(this._loadingItem);
	}
}

WebFXLoadTreeItem.prototype = new WebFXTreeItem;

// override the expand method to load the xml file
WebFXLoadTreeItem.prototype._webfxtreeitem_expand = WebFXTreeItem.prototype.expand;
WebFXLoadTreeItem.prototype.expand = function() {
	if (!this.loaded && !this.loading) {
		// load
		_startLoadXmlTree(this.src, this);
	}
	this._webfxtreeitem_expand();
};

// reloads the src file if already loaded
WebFXLoadTree.prototype.reload = 
WebFXLoadTreeItem.prototype.reload = function () {
	// if loading do nothing
	if (this.loaded) {
		var open = this.open;
		// remove
		while (this.childNodes.length > 0)
			this.childNodes[this.childNodes.length - 1].remove();
		
		this.loaded = false;
		
		this._loadingItem = new WebFXTreeItem(webFXTreeConfig.loadingText);
		this.add(this._loadingItem);
		
		if (open)
			this.expand();
	}
	else if (this.open && !this.loading)
		_startLoadXmlTree(this.src, this);
};

/*
 * Helper functions
 */
if((typeof String.prototype.endWith) == "undefined")
	String.prototype.endWith = function(str){
		if(str==null || str=="" || this.length==0 || str.length>this.length)
	 		 return false;
	 	return (this.substring(this.length - str.length) == str);
	};

// creates the xmlhttp object and starts the load of the xml document
function _startLoadXmlTree(sSrc, jsNode) {
	if (jsNode.loading || jsNode.loaded)
		return;
	jsNode.loading = true;
	if(typeof sSrc == "function"){//the input is a function
		
		var xmlDoc = XmlDocument.create();
		xmlDoc.async = true;
		xmlDoc.resolveExternals = true;
		xmlDoc.onreadystatechange = function () {
			if (xmlDoc.readyState == 4) {
				_xmlFileLoaded(xmlDoc, jsNode);
			}
		};
		var xmlString = sSrc(jsNode.value);
		// call in new thread to allow ui to update
		window.setTimeout(function () {
			xmlDoc.loadXML(xmlString);
		}, 10);
	}else if(sSrc.endWith(");")){//read tree from a function
		var xmlDoc = XmlDocument.create();
		xmlDoc.async = true;
		xmlDoc.resolveExternals = true;
		xmlDoc.onreadystatechange = function () {
			if (xmlDoc.readyState == 4) {
				_xmlFileLoaded(xmlDoc, jsNode);
			}
		};
		// call in new thread to allow ui to update
		window.setTimeout(function () {
			xmlDoc.loadXML(eval(sSrc));
		}, 10);
	}else if(sSrc.endWith(".xml")){//read tree from an xml file
		var xmlDoc = XmlDocument.create();
		xmlDoc.async = true;
		xmlDoc.resolveExternals = true;
		xmlDoc.onreadystatechange = function () {
			if (xmlDoc.readyState == 4) {
				_xmlFileLoaded(xmlDoc, jsNode);
			}
		};
		// call in new thread to allow ui to update
		window.setTimeout(function () {
			xmlDoc.load(sSrc);
		}, 10);
	}else{//read tree from an url
		var xmlHttp = XmlHttp.create();
		xmlHttp.open("GET", sSrc, true);	// async
		xmlHttp.onreadystatechange = function () {
			if (xmlHttp.readyState == 4) {
				_xmlFileLoaded(xmlHttp.responseXML, jsNode);
			}
		};
		// call in new thread to allow ui to update
		window.setTimeout(function () {
			xmlHttp.send(null);
		}, 10);
	}
}
// Inserts an xml document as a subtree to the provided node
function _xmlFileLoaded(oXmlDoc, jsParentNode) {
	if (jsParentNode.loaded)
		return;

	var bIndent = false;
	var bAnyChildren = false;
	jsParentNode.loaded = true;
	jsParentNode.loading = false;

	// check that the load of the xml file went well
	if( oXmlDoc == null || oXmlDoc.documentElement == null) {
		if (oXmlDoc && oXmlDoc.parseError != null) {
			alert(oXmlDoc.parseError.reason);
		}
		else {
			alert("XML parse error");
		}
		jsParentNode.errorText = parseTemplateString(webFXTreeConfig.loadErrorTextTemplate,jsParentNode.src);
	}
	else {
		// there is one extra level of tree elements
		var root = oXmlDoc.documentElement;
		//debug(webFXTreeConfig.checkedItemPaths.length);
		// loop through all tree children
		var cs = root.childNodes;
		var l = cs.length;
		for (var i = 0; i < l; i++) {
			if (cs[i].tagName == "tree") {
				bAnyChildren = true;
				bIndent = true;
				jsParentNode.add(_xmlTreeToJsTree(cs[i]), true);				
			}
		}

		// if no children we got an error
		if (!bAnyChildren)
			jsParentNode.errorText = parseTemplateString(webFXTreeConfig.emptyErrorTextTemplate,
										jsParentNode.text);
	}
	
	// remove dummy
	if (jsParentNode._loadingItem != null) {
		jsParentNode._loadingItem.remove();
		bIndent = true;
	}
	
	if (bIndent) {
		// indent now that all items are added
		jsParentNode.indent();
	}
	
	// show error in status bar
	//if (jsParentNode.errorText != "")
	//	window.status = jsParentNode.errorText;
}

// Converts an xml tree to a js tree. See article about xml tree format
function _xmlTreeToJsTree(oNode) {
	// retreive attributes
	var src = oNode.getAttribute("src");
	var text = oNode.getAttribute("text");
	var icon = oNode.getAttribute("icon");
	var openIcon = oNode.getAttribute("openIcon");
	var action = oNode.getAttribute("onclick");
	
	var bshowInput = false ;
	var bChecked = false || oNode.getAttribute("checked") == "true";
	var oncheck = oNode.getAttribute("oncheck");
	var value = oNode.getAttribute("value");
	var parent = null;
	var inputType = null;
	
	if(oNode.getAttribute("showRadio") == "true"){
		bshowInput = true;
		inputType = "radio";
	}
	if(oNode.getAttribute("showCheckbox") == "true"){
		bshowInput = true;
		inputType = "checkbox";
	}
	// create jsNode
	var jsNode;
	if (src != null && src != ""){
        jsNode = new WebFXLoadTreeItem(text, src, action,bshowInput,inputType,oncheck,bChecked, value,parent, icon, openIcon);
	}else{
		jsNode = new WebFXTreeItem(text,action,bshowInput,inputType,oncheck,bChecked, value,parent, icon, openIcon);
	}
	// go through childNOdes
	var cs = oNode.childNodes;
	var l = cs.length;
	for (var i = 0; i < l; i++) {
		if (cs[i].tagName == "tree")
			jsNode.add( _xmlTreeToJsTree(cs[i]), true );
	}
	
	return jsNode;
}

// parses a string and replaces %n% with argument nr n
function parseTemplateString(sTemplate) {
	var args = arguments;
	var s = sTemplate;
	
	s = s.replace(/\%\%/g, "%");
	
	for (var i = 1; i < args.length; i++)
		s = s.replace( new RegExp("\%" + i + "\%", "g"), args[i] )
	
	return s;
}
////////////////////////////////////////////////////////////////////
//<script>
//////////////////
// Helper Stuff //
//////////////////

// used to find the Automation server name
function getDomDocumentPrefix() {
	if (getDomDocumentPrefix.prefix)
		return getDomDocumentPrefix.prefix;
	
	var prefixes = ["MSXML2", "Microsoft", "MSXML", "MSXML3"];
	var o;
	for (var i = 0; i < prefixes.length; i++) {
		try {
			// try to create the objects
			o = new ActiveXObject(prefixes[i] + ".DomDocument");
			return getDomDocumentPrefix.prefix = prefixes[i];
		}
		catch (ex) {};
	}
	
	throw new Error("Could not find an installed XML parser");
}
function getXmlHttpPrefix() {
	if (getXmlHttpPrefix.prefix)
		return getXmlHttpPrefix.prefix;
	
	var prefixes = ["MSXML2", "Microsoft", "MSXML", "MSXML3"];
	var o;
	for (var i = 0; i < prefixes.length; i++) {
		try {
			// try to create the objects
			o = new ActiveXObject(prefixes[i] + ".XmlHttp");
			return getXmlHttpPrefix.prefix = prefixes[i];
		}
		catch (ex) {};
	}
	
	throw new Error("Could not find an installed XML parser");
}

//////////////////////////
// Start the Real stuff //
//////////////////////////


// XmlHttp factory
function XmlHttp() {}

XmlHttp.create = function () {
	try {
		if (window.XMLHttpRequest) {
			var req = new XMLHttpRequest();
			
			// some versions of Moz do not support the readyState property
			// and the onreadystate event so we patch it!
			if (req.readyState == null) {
				req.readyState = 1;
				req.addEventListener("load", function () {
					req.readyState = 4;
					if (typeof req.onreadystatechange == "function")
						req.onreadystatechange();
				}, false);
			}
			
			return req;
		}
		if (window.ActiveXObject) {
			return new ActiveXObject(getXmlHttpPrefix() + ".XmlHttp");
		}
	}
	catch (ex) {}
	// fell through
	throw new Error("Your browser does not support XmlHttp objects");
};
// XmlDocument factory
function XmlDocument() {}

XmlDocument.create = function () {
	try {
		// DOM2
		if (document.implementation && document.implementation.createDocument) {
			var doc = document.implementation.createDocument("", "", null);
			
			// some versions of Moz do not support the readyState property
			// and the onreadystate event so we patch it!
			if (doc.readyState == null) {
				doc.readyState = 1;
				doc.addEventListener("load", function () {
					doc.readyState = 4;
					if (typeof doc.onreadystatechange == "function")
						doc.onreadystatechange();
				}, false);
			}
			
			return doc;
		}
		if (window.ActiveXObject)
			return new ActiveXObject(getDomDocumentPrefix() + ".DomDocument");
	}
	catch (ex) {}
	throw new Error("Your browser does not support XmlDocument objects");
};

// Create the loadXML method and xml getter for Mozilla
if (window.DOMParser &&
	window.XMLSerializer &&
	window.Node && Node.prototype && Node.prototype.__defineGetter__) {

	// XMLDocument did not extend the Document interface in some versions
	// of Mozilla. Extend both!
	XMLDocument.prototype.loadXML = 
	Document.prototype.loadXML = function (s) {
		
		// parse the string to a new doc	
		var doc2 = (new DOMParser()).parseFromString(s, "text/xml");
		
		// remove all initial children
		while (this.hasChildNodes())
			this.removeChild(this.lastChild);
			
		// insert and import nodes
		for (var i = 0; i < doc2.childNodes.length; i++) {
			this.appendChild(this.importNode(doc2.childNodes[i], true));
		}
	};
	
	
	/*
	 * xml getter
	 *
	 * This serializes the DOM tree to an XML String
	 *
	 * Usage: var sXml = oNode.xml
	 *
	 */
	// XMLDocument did not extend the Document interface in some versions
	// of Mozilla. Extend both!
	XMLDocument.prototype.__defineGetter__("xml", function () {
		return (new XMLSerializer()).serializeToString(this);
	});
	Document.prototype.__defineGetter__("xml", function () {
		return (new XMLSerializer()).serializeToString(this);
	});
}
