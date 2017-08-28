'use strict';

function employeesCtrl($scope, payrollService) {
	$scope.loadEmployees = function () {$scope.employees = []; payrollService.fetch('GET','employee').then(function(response){$scope.employees=response.data.data},function(response){console.log('Hubo un error!')})};

	$scope.loadEmployees();
}

angular
.module('payrollApp')
.controller('employeesCtrl', ['$scope', 'payrollService', employeesCtrl]);
