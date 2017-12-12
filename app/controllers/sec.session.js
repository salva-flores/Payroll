'use strict';

function sessionCtrl($window, $rootScope, $scope, $state, $http, $localStorage, payrollService, Idle) {
	$scope.run = function() {
		if (Idle.running()){Idle.unwatch()};
		if ($state.current.name=="session.lockscreen"&&$scope.user.loggedIn==false){$scope.show=false;return};
		if ($state.current.name=="session.lockscreen"){$scope.temp=$scope.user;$scope.user.loggedIn=false;}else{payrollService.resetUser()};
		$scope.show=true; $scope.showSpinner = false;
		document.getElementById("1").focus();
		$scope.formData={};
		$scope.formData.from='admin@hngsystems.com'; 
		$scope.formData.name='Admin'; 
		$scope.formData.email='';  
		$scope.formData.subject='Recuperación de Contraseña'; 
		$scope.formData.message='Ha solicitado una URL para recuperación de contraseña: http://localhost/hhrr/#!/';
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
		// console.info( user.firstName.substr(0,user.firstName.indexOf(' '))+' '+user.lastName.substr(0,user.lastName.indexOf(' ')));
		// $scope.name=user.firstName.substr(0,user.firstName.indexOf(' '))+' '+user.lastName;
		// console.info($scope.name);
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
	$scope.changePassword = function(){	};
	$scope.passwordRecovery = function(){
		// create and store new time stamped reset token;
		// send email with password reset URL;
		// user navigates to reset URL;
		// if (resetToken is valid? and  reset token !expired?) {	allow password change; delete reset token; email user change confirmation;} else {restart the process};
		};
	$scope.sendMail = function(){
		$scope.submitted = true; $scope.showSpinner = true;
		$http({	method : 'POST', url : 'api/sendMail.php', data : $.param($scope.formData), headers : { 'Content-Type': 'application/x-www-form-urlencoded' }})
		.then(function(response){	
			console.log('then',response);
			new Noty({text:'Se ha enviado un Link a su correo. ', type: response.status==200 ? 'success' : 'error' ,theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}})
			.show().on('onClose', function() {$state.go('login')});
		}, function (response){
			console.log('error...',response);
		});
		};
	
	$scope.block = function(){
		((c)=>{
		let $ = c.getContext('2d'), w = c.width = window.innerWidth, h = c.height = window.innerHeight, pi2 = Math.PI*2, random = t=>Math.random()*t, binRandom = (f)=>Math.random()<f,
		arr = new Array(500).fill().map((p)=>{return {p: {x: random(w), y: random(h)}, v: {x: random(.5) * (binRandom(.5)?1:-1), y: random(.5) * (binRandom(.5)?1:-1)}, s: random(1)+2, o: random(1)+.3 }});
		function draw(){
			(h !== innerHeight || w!==innerWidth) && (w=c.width=innerWidth,h=c.height=innerHeight);
			$.fillStyle="#222";$.fillRect(0,0,w,h);arr.forEach(p=>{p.p.x+=p.v.x;p.p.y+=p.v.y;if(p.p.x > w || p.p.x < 0) p.v.x *=-1;if(p.p.y > h || p.p.y < 0) p.v.y *=-1;$.beginPath();$.arc(p.p.x,p.p.y,p.s,0,pi2);$.closePath();	$.fillStyle = "rgba(255,255,255,"+p.o+")";$.fill();})
			requestAnimationFrame(draw)}
		draw();	})(c)
		};
	$scope.run();
	}

angular
.module('payrollApp')
.controller('sessionCtrl', ['$window','$rootScope', '$scope', '$state', '$http', '$localStorage', 'payrollService', 'Idle', sessionCtrl]);
