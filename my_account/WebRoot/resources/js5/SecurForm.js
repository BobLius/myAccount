var CSPNAME ="Dean Base Cryptographic Provider v1.0";
function formatElement(name, value)
{
	return "<LI>" + "<BOLD>" + name + ":</BOLD> " + value + "\n";
}
function strlength(str){
  var strlen = str.length;
  for(i=0;i<str.length;i++){
    if(escape(str.charAt(i)).indexOf("%u") != -1)
     strlen++;
  }
  return strlen;
}
function TestSwxCryptoLoaded(SwxCrypto)
{
		var nTest;
		//nTest=sjf.InitCSP("M&W eKey XCSP")
		nTest=SwxCrypto.GetCspName();
		//alert(nTest+"!!!");
		return 0;
}
/*
function CollectListData(name)
{
	var elem;
	var ListData="";
	var selectdata = "";
        var RecCount = 0;

	if( name !="")
		ListData = "<" + name + ">";
	for ( i=0;i<document.forms[0].elements.length;i++) {
		elem = document.forms[0].elements[i];
		switch (elem.type) {
                	case "hidden":
					case "button":
                        case "submit":
                        case "reset":
                        case "image":
    //                    case "password":
                        case "file":
			//case "select-multiple":
			//case "radio":		// Radio buttons and checkboxes can be
                        //case "checkbox":
                         //Don't include these elements in the validation.
                        	break;
                        case "select-one":
                        	ListData+="<" + elem.name + ">" + elem.options[elem.selectedIndex].text + "</" + elem.name + ">";
                                break;
                        case "select-multiple":
                        	ListData+="<" + elem.name + ">";
                                for(var op = 0; op < elem.length; op++) {
                                	if(elem.options[op].selected) {
                                        	selectdata += "<VALUE>" + elem.options[op].text + "</VALUE>";
						RecCount++;
					}
                                }
				ListData += "<RecCount>" + RecCount + "</RecCount>";
				if( RecCount != 0 )
					ListData += selectdata;
                                ListData+="</" + elem.name + ">";
                                break;
                        case "radio":		// Radio buttons and checkboxes can be
                        case "checkbox": 	// treated the same way.
                        	if(elem.checked)
                                	ListData += "<" + elem.name + ">" + elem.value + "</" +elem.name + ">";
                                break;
                        default:
				if(elem.name!="")
                        		ListData += "<" + elem.name + ">" + elem.value + "</" +elem.name + ">";
                                break;
                }
        }
	if( name !="")
		ListData += "</" + name + ">";
	return ListData;
}
*/
function XmlAddEle(name,value)
{
	return "<" + name + ">" + value + "</" + name + ">";
}

function DataSign()
{

	var plaintxt;
	var signature;
	var usersigncert;
	var errcode=1;
	//var plaintxt = CollectListData("");
	var plaintxt;
	var lentxt;
	
	try{
		plaintxt = document.forms[0].elements["SIGNDATA"].value;
		lentxt = strlength(plaintxt);
	
		if(location.protocol=='http:') {
			//alert("this is http");
			return true;  //当在生产上时，需要这句话
		}
		else {
			//alert("this is https");
			var nResult=TestSwxCryptoLoaded(document.forms[0].elements["SwxCrypto"]);
			if (0!=nResult) {
				if (438==nResult) {			    
						window.alert(L_ControlLoadFailed_ErrorMessage);
				} else if (424==nResult) {		    
						window.alert(L_ControlLoadFailedObject_ErrorMessage);
				} else {
						var sErrorNumber="0x"+toHex(nResult);
						window.alert(eval(L_ControlLoadFailedEx_ErrorMessage));
				}
				for (var w = 0 ; w < jhform.length ; w++){
					var Bu = jhform.elements[w].type
					var LC = Bu.toLowerCase()
					if(LC=='submit'||LC=='button'||LC=='reset'){
						document.jhform.elements[w].disabled=false;
					}
				}		
				window.alert("签名数据错误SwxCrypto"+nResult);
				return false;
			}
		}
	}
	catch(e)
	{
		window.alert("签名数据未知错误1："+e);
		for (var w = 0 ; w < jhform.length ; w++){
			var Bu = jhform.elements[w].type
			var LC = Bu.toLowerCase()
			if(LC=='submit'||LC=='button'||LC=='reset'){
				document.jhform.elements[w].disabled=false;
			}
		}
		return false;
	}
	try{
		document.forms[0].elements["PT_SignData"].value = XmlAddEle("PLAINDATA",plaintxt);
		//alert("XmlAdd OK");
		//document.forms[0].elements["SwxCrypto"].InitCSP("M&W eKey XCSP");
		
		errcode=document.forms[0].elements["SwxCrypto"].InitCSP("");
		if(errcode !=0 ) {
			alert("初始化签名通失败，请检查签名通是否正常下载");
			for (var w = 0 ; w < jhform.length ; w++){
				var Bu = jhform.elements[w].type
				var LC = Bu.toLowerCase()
				if(LC=='submit'||LC=='button'||LC=='reset'){
					document.jhform.elements[w].disabled=false;
				}
			}	
			return false;
		}
	}
	catch(e)
	{
		window.alert("签名数据未知错误2："+e);
		for (var w = 0 ; w < jhform.length ; w++){
			var Bu = jhform.elements[w].type
			var LC = Bu.toLowerCase()
			if(LC=='submit'||LC=='button'||LC=='reset'){
				document.jhform.elements[w].disabled=false;
			}
		}
		return false;
	}
	try{
		errcode = document.forms[0].elements["SwxCrypto"].SignMessage(plaintxt,lentxt);
	}
	catch(e)
	{
		window.alert("签名数据未知错误3："+e);
		for (var w = 0 ; w < jhform.length ; w++){
			var Bu = jhform.elements[w].type
			var LC = Bu.toLowerCase()
			if(LC=='submit'||LC=='button'||LC=='reset'){
				document.jhform.elements[w].disabled=false;
			}
		}
		return false;
	}
		if (errcode == 0 )
		{
			// 签名数据
	try{
			signature = document.forms[0].elements["SwxCrypto"].GetSignData();
			document.forms[0].elements["PT_SignData"].value += XmlAddEle("SIGNATURE",signature);
	}
	catch(e)
	{
		window.alert("签名数据未知错误4："+e);
		for (var w = 0 ; w < jhform.length ; w++){
			var Bu = jhform.elements[w].type
			var LC = Bu.toLowerCase()
			if(LC=='submit'||LC=='button'||LC=='reset'){
				document.jhform.elements[w].disabled=false;
			}
		}
		return false;
	}
	try{
	
			// 取得用户签名证书
			usersigncert = document.forms[0].elements["SwxCrypto"].GetUserSignCert();
			document.forms[0].elements["PT_SignData"].value += XmlAddEle("SIGNCERT",usersigncert);
			//window.alert("表单签名成功");
	}
	catch(e)
	{
		window.alert("签名数据未知错误5："+e);
		for (var w = 0 ; w < jhform.length ; w++){
			var Bu = jhform.elements[w].type
			var LC = Bu.toLowerCase()
			if(LC=='submit'||LC=='button'||LC=='reset'){
				document.jhform.elements[w].disabled=false;
			}
		}
		return false;
	}
		}
		else {
			window.alert("签名数据错误");
			for (var w = 0 ; w < jhform.length ; w++){
				var Bu = jhform.elements[w].type
				var LC = Bu.toLowerCase()
				if(LC=='submit'||LC=='button'||LC=='reset'){
					document.jhform.elements[w].disabled=false;
				}
			}		
			return false;
		}
	try{
		document.forms[0].insertAdjacentHTML("AfterBegin", "<input name=\"EntrustSigServer\" type=\"hidden\"  value="+"ccb"+">");
		document.forms[0].insertAdjacentHTML("AfterBegin", "<input name=\"EntrustSigClient\" type=\"hidden\"  value="+"ccb "+">")
		document.forms[0].insertAdjacentHTML("AfterBegin", "<input name=\"EntrustSigSubmit\" type=\"hidden\"  value="+signature+">")
		//document.forms[0].submit();
		return true;
	}
	catch(e)
	{
		window.alert("签名数据未知错误6："+e);
		for (var w = 0 ; w < jhform.length ; w++){
			var Bu = jhform.elements[w].type
			var LC = Bu.toLowerCase()
			if(LC=='submit'||LC=='button'||LC=='reset'){
				document.jhform.elements[w].disabled=false;
			}
		}
		return false;
	}
}


//<Span ID=spnSwxCrypto Style="display:none">
	// SwxCrypto will be inserted here 
//</Span>
//----------------------------------------------------------------
	// Show the message in the status bar and in the middle of the screen (DHTML only)
	function ShowTransientMessage(sMessage) {
		window.status=sMessage;

		spnWorkingMsg.innerText=sMessage;
		tblWorkingMsg.style.display='';
		tblWorkingMsg.style.pixelTop=
			(document.body.clientHeight/2)-(tblWorkingMsg.offsetHeight/2)+(document.body.scrollTop);
		tblWorkingMsg.style.pixelLeft=
			(document.body.clientWidth/2)-(tblWorkingMsg.offsetWidth/2)+(document.body.scrollLeft);

	}

	//----------------------------------------------------------------
	// hide the message box
	function HideTransientMessage() {
		window.status="";

		tblWorkingMsg.style.display='none';

	}
	function toHex(number) {
		var sRight=(number&0x0FFFFFFF).toString(16).toUpperCase();
		sRight="0000000".substring(0, 7-sRight.length)+sRight;
		return ((number>>28)&0x0000000F).toString(16).toUpperCase()+sRight;
	}
	//----------------------------------------------------------------
	// IE SPECIFIC:
	// Download the appropriate version of SwxCrypto if the local
	// version is too old, and wait for the control to finish downloading.
	// sContinueCmd will be executed when the control is ready
	function loadSwxCrypto(sContinueCmd) {

		// clear the current control, if there is one
		spnSwxCrypto.innerHTML="";

		// determine the file name from the CPU type.
		var sCPU=navigator.cpuClass.toLowerCase();
		if ("x86"!=sCPU && "ia64"!=sCPU) {
			alert(eval(L_BadCPU_ErrorMessage));
			g_fnOnLoadFail();
			return;
		}

		// load the control
		spnSwxCrypto.innerHTML=sControl;

		// begin polling to see if the control is loaded
		setTimeout("loadSwxCryptoPhase2(\""+sContinueCmd+"\")", 1);
	}
	function loadSwxCryptoPhase2(sContinueCmd) {
		// continued from above

		// is the control loaded?
		if (4!=SwxCrypto.readyState) { // 4=READYSTATE_COMPLETE
			//alert(SwxCrypto.readyState);
			// no, show a message and wait a while
			ShowTransientMessage(L_DownloadingControl_Message);
			setTimeout("loadSwxCryptoPhase2(\""+sContinueCmd+"\")", 500);
		} else {
			// yes, hide the message
			HideTransientMessage();

			// smoke test the control
			var nResult=ConfirmSwxCryptoLoaded();
			if (0!=nResult) {
				if (438==nResult) {
				//alert(nResult);
					alert(L_ControlLoadFailed_ErrorMessage);
				} else {
					var sErrorNumber="0x"+toHex(nResult);
					alert(eval(L_ControlLoadFailedEx_ErrorMessage));
				}
				g_fnOnLoadFail();
				return;
			}

			// Continue with what the caller wanted us to do
			execScript(sContinueCmd, "JavaScript");
		}
	}
//----------------------------------------------------------------
	// IE SPECIFIC:
	// disable all the controls on this page so the user can't do anything
	function disableAllControls() {

		// some pages do not have any controls
		if (null==document.Demo02) {
			return;
		}

		// disable every control on the page
		var nCount=document.Demo02.elements.length;
		var nIndex;
		for (nIndex=0; nIndex<nCount; nIndex++) { //>
			document.Demo02.elements(nIndex).disabled=true;
		}
	}

	//----------------------------------------------------------------
	// If SwxCrypto fails to load, this function will be called.
	// By default, disable all controls.
	var g_fnOnLoadFail=disableAllControls;
//----------------------------------------------------------------
	// This contains the functions we want executed immediately after load completes
	function postLoad(varobject) {
		// Load an SwxCrypto object into the page
		if(location.protocol=='http:') {
			return true;
		}
		loadSwxCrypto("postLoadPhase2()");

	}
	function postLoadPhase2() {
		// continued from above
		var nResult;
		g_bOkToSubmit=true;
	}

	//----------------------------------------------------------------
	// handle errors from GetCSPList() and GetTemplateList()
	function handleLoadError(nResult, sNoneFound, sUnexpected) {
		if (-1==nResult) {
			alert(sNoneFound);
		} else {
			var sErrorNumber="0x"+toHex(nResult);
			alert(eval(sUnexpected));
		}
		disableAllControls();
	}

	//================================================================
	// PAGE MANAGEMENT ROUTINES


	//----------------------------------------------------------------
	// handle the appearance of the text box when 'other...' is selected
	function handleUsageOID(bFocus) {
		if ("**"==document.Demo02.lbUsageOID.options[document.Demo02.lbUsageOID.selectedIndex].value) {
			spnEKUOther1.style.display='';
			spnEKUOther2.style.display='';
			if (bFocus) {
				document.Demo02.lbUsageOID.blur();
				document.Demo02.tbEKUOther.select();
				document.Demo02.tbEKUOther.focus();
			}
		} else {
			spnEKUOther1.style.display='none';
			spnEKUOther2.style.display='none';
		}
	}

