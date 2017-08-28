'use strict';

function layoutCtrl($scope, $rootScope, $localStorage, $interval, $window) {

	var tick = function() {$scope.clock = Date.now()};
	tick();
	$interval(tick, 1000);

	$scope.salir = function() {
		$window.close(); window.close();
		$rootScope.user.loggedIn=false;
		open('/', '_self').close();
		};
}	

angular
.module('payrollApp')
.controller('layoutCtrl', ['$scope', '$localStorage', '$rootScope', '$interval', '$window', layoutCtrl]);
