	

		var preloaded = [];

		// here is a lame preloading script i am putting in just for demonstration
		for (var i = 1; i <= 6; i++) {
			preloaded[i] = [loadImage(i + "-0.gif"), loadImage(i + "-1.gif")];
		}

		function init() {
			//alert(11111111);
		
			// whatever stuff you need to do onload goes here.

			//==========================================================================================
			// if supported, initialize mtdropdowns
			//==========================================================================================
			// Check isSupported() so that menus aren't accidentally sent to non-supporting browsers.
			// This is better than server-side checking because it will also catch browsers which would
			// normally support the menus but have javascript disabled.
			//
			// If supported, call initialize() and then hook whatever image rollover code you need to do
			// to the .onactivate and .ondeactivate events for each menu.
			//==========================================================================================
			if (mtDropDown.isSupported()) {
				mtDropDown.initialize();
			}
		}

		// this is a crappy example preloader. Use whichever one you want.
		function loadImage(sFilename) {
			var img = new Image();
			img.src ="../images/" + sFilename;
			return img;
		}

		// this is a crappy example image swapper. Use whichever you want.
		function swapImage(imgName, sFilename) {
			document.images[imgName].src = sFilename;
		}