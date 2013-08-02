//
//  	VolumeSlider.js
//  	Volume Slider PhoneGap Plugin
//
//  	Created by Tommy-Carlos Williams on 20/07/25.
//  	Copyright 2011 Tommy-Carlos Williams. All rights reserved.
//      MIT Licensed
//

var cordovaRef = window.PhoneGap || window.Cordova || window.cordova;

var VolumeSlider = function() {
};

/**
 * Create a volume slider.
 */
VolumeSlider.prototype.createVolumeSlider = function(originx,originy,width,height) {
	cordovaRef.exec(null, null, "VolumeSlider","createVolumeSlider", [originx, originy, width, height]);
};

/**
 * Show the volume slider
 */
VolumeSlider.prototype.showVolumeSlider = function() {
	cordovaRef.exec(null, null, "VolumeSlider","showVolumeSlider", []);
};
/**
 * Hide the volume slider
 */
VolumeSlider.prototype.hideVolumeSlider = function() {
	cordovaRef.exec(null, null, "VolumeSlider","hideVolumeSlider", []);
};

if (cordovaRef) {
	if (!window.plugins) {
		window.plugins = {};
	}
	if (!window.plugins.volumeSlider) {
		window.plugins.volumeSlider = new VolumeSlider();
	}
}
