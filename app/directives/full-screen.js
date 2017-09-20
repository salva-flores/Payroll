'use strict';

function fullScreen($timeout) {
	return {
		restrict: 'EA',
		link: function (scope, element, attrs) {
			var body = angular.element('body');
			element.on('click', function (e) {
				e.preventDefault();
				var docElm = document.documentElement;
				var ok = (element[0].id!=='login'&&element[0].id!=='lockscreen');
				if (docElm.requestFullscreen)
					if (document.fullScreenElement && ok) {document.cancelFullScreen()} else {docElm.requestFullscreen()}
					else if (docElm.msRequestFullscreen)
						if (document.msFullscreenElement && ok) {document.msExitFullscreen()} else {docElm.msRequestFullscreen()}
						else if (docElm.mozRequestFullScreen)
							if (document.mozFullScreenElement && ok) {document.mozCancelFullScreen()} else {docElm.mozRequestFullScreen()}
							else if (docElm.webkitRequestFullscreen)
								if (document.webkitFullscreenElement && ok) {scope.app.layout.isFullScreen=true;	document.webkitCancelFullScreen()} else {scope.app.layout.isFullScreen=false;docElm.webkitRequestFullscreen()}
							});
		}
	};
};

angular
.module('payrollApp')
.directive('fullScreen', fullScreen);
