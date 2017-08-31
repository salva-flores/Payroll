'use strict';
function kpi($timeout, $http) {
	return {
		restrict: 'EA',
		link: function (scope, element, attrs) {
			var body = angular.element('body');
			element.on('click', function (e) {	e.preventDefault();$http.get('../hhrr/api/kpi').success(function (data) {kpi=data.data})});			
		}
	};
};

angular.module('payrollApp').directive('kpi', kpi);