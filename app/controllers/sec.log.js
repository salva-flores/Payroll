'use strict';

function logCtrl($scope, $http, $filter, payrollService) { 
	$scope.loadLog = function () {
		payrollService.fetch('GET','viewLog').then(function(response){$scope.log=response.data.data},function(response) {console.log('Error:',response)});
	}
};

angular
.module('payrollApp')
.controller('logCtrl', ['$scope', '$http', '$filter', 'payrollService', logCtrl]);
