'use strict';

function sessionCtrl($window, $rootScope, $scope, $state, $http, $localStorage, payrollService, Idle) {
	$scope.run = function() {
		if (Idle.running()){Idle.unwatch()};
		if ($state.current.name=="session.lockscreen"&&$scope.user.loggedIn==false){$scope.show=false;return};
		if ($state.current.name=="session.lockscreen"){$scope.temp=$scope.user;$scope.user.loggedIn=false;}else{payrollService.resetUser()};
		$scope.show=true;
		document.getElementById("1").focus();
		$scope.formData={};
		$scope.formData.from='admin@hngsystems.com'; $scope.formData.name='Admin'; $scope.formData.email='';  $scope.formData.subject='Recuperación de Contraseña'; $scope.formData.message='Ha solicitado una URL para recuperación de contraseña.';
		// $scope.result = 'hidden'; $scope.resultMessage='';  $scope.submitButtonDisabled = false; $scope.submitted = false;
		};
	$scope.unblock = function(){
		$scope.user.userName=$scope.temp.userName;
		payrollService.fetch('POST','login',JSON.stringify($scope.user)).then(function(response){$scope.loginSuccess(response.data.user)},function(response){$scope.loginFail(response)});
		};
	$scope.login = function(){
		payrollService.fetch('POST','login',JSON.stringify($scope.user)).then(function(response){$scope.loginSuccess(response.data.user)},function(response){$scope.loginFail(response)});
		};
	$scope.loginSuccess = function(user, fromState){
		Idle.watch();
		payrollService.setCredentials(user);
		payrollService.checkToken();
		payrollService.loadSidebar();
		$state.go('app.dashboard');
		};
	$scope.loginFail = function(response){
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
	$scope.passwordRecovery = function(){
		// create and store new time stamped reset token;
		// send email with password reset URL;
		// user navigates to reset URL;
		// if (resetToken is valid? and  reset token !expired?) {	allow password change; delete reset token; email user change confirmation;} else {restart the process};
		};
	$scope.sendMail = function(){
		$scope.submitted = true; $scope.submitButtonDisabled = true;
		$http({	method : 'POST', url : 'api/sendMail.php', data : $.param($scope.formData), headers : { 'Content-Type': 'application/x-www-form-urlencoded' }})
		.then(function(response){	
			console.log('then',response);
			if (response.data.success) { $scope.submitButtonDisabled = true; $scope.resultMessage = data.message; $scope.result='bg-success';} 
			else {$scope.submitButtonDisabled = false; $scope.resultMessage = data.message; $scope.result='bg-danger';}
		}, function (response){
			console.log('error...',response);
			$scope.submitButtonDisabled = false; 	$scope.resultMessage = 'Failed :( Please fill out all the fields.'; $scope.result='bg-danger';
		});
		};
	$scope.run();
	}

angular
.module('payrollApp')
.controller('sessionCtrl', ['$window','$rootScope', '$scope', '$state', '$http', '$localStorage', 'payrollService', 'Idle', sessionCtrl]);
