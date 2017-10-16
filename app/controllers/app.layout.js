'use strict';

function layoutCtrl($scope, $rootScope, $localStorage, $interval, $window, payrollService) {

	var tick = function() {$scope.clock = Date.now()};
	tick();
	$interval(tick, 1000);

	$scope.close = function() {
		payrollService.resetUser();
		// $rootScope.user.loggedIn=false;
		$window.close(); window.close();
		open('/', '_self').close();
		};
}	

angular
.module('payrollApp')
.controller('layoutCtrl', ['$scope', '$localStorage', '$rootScope', '$interval', '$window', 'payrollService', layoutCtrl]);
