'use strict';
function catOvertimeCtrl($rootScope, $scope, $filter, $http, payrollService) {
	$scope.profile=1;
	$scope.overtime=[];
	$http.get('../hhrr/api/getAll/CatOvertime').then(function (response) {$scope.overtime = response.data.data});
}

angular
.module('payrollApp')
.controller('catOvertimeCtrl',  ['$rootScope', '$scope', '$filter', '$http', 'payrollService',  catOvertimeCtrl]);
