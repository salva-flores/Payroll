'use strict';
function resourcesCtrl($rootScope, $scope, $filter, $http, payrollService) {
	// console.log($rootScope.menu);
	$scope.profile=1;
	$scope.apps=[]; $scope.modules=[]; $scope.resources=[];
	$http.get('../hhrr/api/getAll/SysApp').then(function (response) {$scope.apps = response.data.data});
	$http.get('../hhrr/api/getAll/SysModule').then(function (response) {$scope.modules = response.data.data});
	$http.get('../hhrr/api/getAll/SysResource').then(function (response) {$scope.resources = response.data.data});

	$scope.showMenu = function (r) {
		if (r.module && $scope.modules.length) {
			var selected = $filter('filter')($scope.modules, {id: r.module});
			return selected.length ? selected[0].name : 'Ninguno';  
		} else {return r.module || 'Ninguno'}
	};


}

angular
.module('payrollApp')
.controller('resourcesCtrl',  ['$rootScope', '$scope', '$filter', '$http', 'payrollService',  resourcesCtrl]);
