'use strict';

function sessionCtrl($window, $rootScope, $scope, $state, $http, $localStorage, payrollService, Idle) {

	$scope.run = function() {
		if (Idle.running()){Idle.unwatch()};
		if ($state.current.name=="user.lockscreen"&&$scope.user.loggedIn==false){$scope.show=false;return};
		if ($state.current.name=="user.lockscreen"){$scope.temp=$scope.user;$scope.user.loggedIn=false;}else{payrollService.resetUser()};
		$scope.show=true;
		document.getElementById("1").focus();
		};
	$scope.unblock = function(){
		$scope.user.userName=$scope.temp.userName;
		payrollService.fetch('POST','login',JSON.stringify($scope.user)).then(function(response){$scope.success(response.data.user)},function(response){$scope.error(response)})
		};
	$scope.login = function(){
		payrollService.fetch('POST','login',JSON.stringify($scope.user)).then(function(response){$scope.success(response.data.user)},function(response){$scope.error(response)});
		};
	$scope.success = function(user, fromState){
		Idle.watch();
		payrollService.setCredentials(user);
		payrollService.checkToken();
		payrollService.loadSidebar();
		$state.go('app.dashboard');
		};
	$scope.error = function(response){
		// $scope.checkAttempts();
		// $scope.attempts++;
		// if ($scope.attempts==5){	$scope.show=false;	$localStorage.empresa = 'centec' };
		// if ($localStorage.empresa == 'centec'){new Noty({text:'Se ha bloqueado el acceso!, Contacte al Administrador!',type:'error',theme:'relax',timeout:6000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show(); return};
		new Noty({text:'Credenciales inválidas!',type:'error',theme:'relax',timeout:1000,progressBar:false,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show();
		$scope.user = {};
		document.getElementById("1").focus();
		};
	$scope.logout = function() {
		payrollService.resetUser();	state.go('login');
		};
	$scope.signup = function(){
		new Noty({text:'Crear cuenta... pendiente de desarrollar!',type:'error',theme:'relax',timeout:6000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show();
		};
	$scope.run();
}

angular
.module('payrollApp')
.controller('sessionCtrl', ['$window','$rootScope', '$scope', '$state', '$http', '$localStorage', 'payrollService', 'Idle', sessionCtrl]);
