

	var _st = window.setTimeout;
	window.setTimeout = function(fRef, mDelay) {
	
	    if (typeof fRef == 'function') {
	
	        var argu = Array.prototype.slice.call(arguments,2);
	
	        var f = (function(){ fRef.apply(null, argu); });
	
	        return _st(f, mDelay);
	
	    }
	
	    return _st(fRef,mDelay);
	
	}
	
	
	var tm = window.setTimeout;
	
	screenWidth = window.screen.width;
	leftBlankWidth = ( screenWidth - 778 ) / 2;
	layerStyleright = leftBlankWidth + 140;

	function popmenu( obj ) {
		//alert("aa");
		for ( var i = 1; i <= 6; i++ ) {
			var objall = eval( "document.all.menu" + i + "_div" );
			//alert(objall+" "+i);
			objall.style.visibility = "hidden";
		}
		clearTimeout(tm);
		var objdiv = eval( "document.all." + obj.id + "_div" );
		var arrayspan = getoffset( obj );
		objdiv.style.visibility = "";
		objdiv.style.left = arrayspan[1] - 2;
		objdiv.style.top = arrayspan[0] + obj.offsetHeight + 2;
	}
	
	function getoffset( e ) { 
		var t = e.offsetTop; 
		var l = e.offsetLeft; 
		while( e = e.offsetParent ) { 
			t += e.offsetTop; 
			l += e.offsetLeft; 		
		} 
		var rec = new Array(1);
		rec[0] = t;
		rec[1]= l;
		return rec;
	}




	function test(x){
	
	    alert(x);
	
	}
	
	//window.setTimeout(test,1000,'fason');




	function hhide ( obj ) {
		//alert(obj.id);
		var objstr = obj.id;
		clearTimeout(tm);
        tm = window.setTimeout( hidemenu,1000,objstr);
	}

	function hidemenu(obj){
		//alert(obj);
		var objdiv = eval( "document.all." + obj + "_div" );
		//alert( objdiv.id );
		objdiv.style.visibility = "hidden";
	}

	function hhideOutDiv( obj ) {
		var objstr = obj.id;
		clearTimeout(tm);
		tm = window.setTimeout( hidemenuOutDiv, 1000, objstr );
	}

	function hidemenuOutDiv( obj ) {
		var objdiv = eval( "document.all." + obj );
		objdiv.style.visibility = "hidden";
	}
	
	function mouseoverMenu( objID ) {
	var obj = eval( "document.getElementById('" + objID + "')" );
	obj.style.backgroundColor='#E70008';
	obj.className = 'font_white';
	}
	function mouseoutMenu( objID ) {
		var obj = eval( "document.getElementById('" + objID + "')" );
		obj.style.backgroundColor='';
		obj.className = 'font_black';
	}