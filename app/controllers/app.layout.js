'use strict';

function layoutCtrl($scope, $rootScope, $localStorage, $interval, $window) {

	var tick = function() {$scope.clock = Date.now()};
	tick();
	$interval(tick, 1000);

	$scope.close = function() {
		$rootScope.user.loggedIn=false;
		$window.close(); window.close();
		open('/', '_self').close();
		};
}	

angular
.module('payrollApp')
.controller('layoutCtrl', ['$scope', '$localStorage', '$rootScope', '$interval', '$window', layoutCtrl]);
