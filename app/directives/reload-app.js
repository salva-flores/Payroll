'use strict';
function reloadApp($timeout, $window) {
	return {
		restrict: 'EA',
		link: function (scope, element, attrs) {
			var body = angular.element('body');
			element.on('click', function (e) {
				new Noty({text:'Cargando la Aplicación...',layout: 'topCenter',type:'info',theme:'sunset',timeout:5,animation:{open:'animated bounceIn',close:'animated bounceOut'}})
				.on('afterShow', function() {window.location.reload(true)})
				.show();
			});
		}
	};
};

angular.module('payrollApp').directive('reloadApp', reloadApp);
