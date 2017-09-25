'use strict';

angular
.module('payrollApp')
.run(['$rootScope', '$state', '$stateParams', '$localStorage', 'payrollService', 'Idle', function ($rootScope, $state, $stateParams, $localStorage, payrollService, Idle){
	$rootScope.$state=$state; $rootScope.$stateParams=$stateParams; document.body.style.zoom="100%";
	$rootScope.$on('$stateChangeStart', function(event, toState, toParams, fromState, fromParams, options){
		// console.log('From:',fromState.name,'To:',toState.name);
		if (toState.data.Auth){if (!$rootScope.user.loggedIn){new Noty({text:'Por favor autentíquese!',type:'warning',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show();event.preventDefault();$state.go('login')}	else if(payrollService.checkResource(toState.name)==-1){event.preventDefault(); $state.go('err.403')}};
		if (toState.name=='app.dashboard'&&!$rootScope.user.loggedIn){new Noty({text:'Por favor autentíquese!',type:'warning',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show();event.preventDefault();$state.go('login')};
		if (fromState.name=='session.lockscreen'&&!$rootScope.user.loggedIn){event.preventDefault()};
		if (toState.name=='session.lockscreen'&&!$rootScope.user.loggedIn){event.preventDefault();payrollService.resetUser();$state.go('login')};
		if ($rootScope.user.loggedIn){payrollService.checkToken().then(function(response){if (performance.navigation.type==1&&fromState.name!='login'&&toState.name!='user.lockscreen'){payrollService.loadSidebar()}},function(response){new Noty({text:'Error: '+response.data.message,type:'error',timeout:3000,animation:{open:'animated fadeIn',close:'animated fadeOut'}}).show();event.preventDefault();payrollService.resetUser();$state.go('login')})};
	});
	$rootScope.$on('$stateChangeSuccess', function (event, toState, toParams, fromState, fromParams){window.scrollTo(0,0)});
	$rootScope.$on('$stateChangeError', function(event){$state.go('err.404')});
}]);