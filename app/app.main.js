'use strict';

angular
.module('payrollApp')
.controller('AppCtrl', ['$rootScope', '$scope', '$http', '$state', '$localStorage', 'payrollService', 'Idle', 
	function AppCtrl($rootScope, $scope, $http, $state, $localStorage, payrollService, Idle) {
		$scope.mobileView = 767; $scope.kpi = []; $scope.apps = []; 
		$scope.app = {
			id:'1',name: 'App Manager', author: 'salva_flores@yahoo.com', version: '1.0.0', year: (new Date()).getFullYear(), api:'../hhrr/api/',
			layout: {id:'1',isSmallSidebar: false,isChatOpen: false,isFixedHeader: true,isFixedFooter: true,isStaticSidebar: false,isRightSidebar: false,isOffscreenOpen: false,isConversationOpen: false,isQuickLaunch: false,sidebarTheme: '',headerTheme: '',isFullScreen: false},
			isMessageOpen: false,	isConfigOpen: false, isConfigVisible: false
		};
		if (angular.isDefined($localStorage.user)) {$rootScope.user = $localStorage.user} else {$localStorage.user = $rootScope.user};
		if (angular.isDefined($localStorage.layout)) {$scope.app.layout = $localStorage.layout; $scope.a=$scope.app.layout.id;} else {$scope.a=0; $localStorage.layout = $scope.app.layout};
		$rootScope.$watch('user', function () {$localStorage.user = $rootScope.user}, true);
		$scope.$watch('app.layout', function () {$localStorage.layout = $scope.app.layout}, true);
		$scope.$watch('app.layout.isChatOpen', function () {if ($scope.app.layout.isChatOpen) {$http.get('../hhrr/api/kpi').then(function (response) {$scope.kpi=response.data.data})}},true);
		$scope.$on('IdleTimeout', function() {new Noty({text: 'Por seguridad...', type: 'error', timeout: 1500, animation: { open: 'animated bounceInRight', close: 'animated bounceOutRight'}}).on('afterShow', function() {Idle.unwatch();$state.go('session.lockscreen')}).show();});
		$http.get('../hhrr/api/getAll/SysApp').then(function (response) {$scope.apps = response.data.data; $scope.app.id=$scope.apps[$scope.a].id; $scope.app.name=$scope.apps[$scope.a].name; $scope.app.icon=$scope.apps[$scope.a].icon; });
		$scope.changeApp = function (index){new Noty({text:'Cargando la App...',layout: 'topCenter',type:'info',timeout:5,animation:{open:'animated bounceIn',close:'animated bounceOut'}}).on('afterShow', function() {$scope.app.layout.id=index; $scope.app.id=$scope.apps[index].id; $scope.app.name=$scope.apps[index].name; $scope.app.icon=$scope.apps[index].icon; $state.reload()}).show();}; 
	}]);