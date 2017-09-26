'use strict';

angular
.module('payrollApp')
.controller('AppCtrl', ['$rootScope', '$scope', '$http', '$state', '$localStorage', 'payrollService', 'Idle', 
	function AppCtrl($rootScope, $scope, $http, $state, $localStorage, payrollService, Idle) {
		$scope.mobileView = 767; $scope.kpi = []; $scope.apps = [];
		$scope.app = {
			id:'1', name: 'Payroll', author: 'salva_flores@yahoo.com', version: '1.0.0', year: (new Date()).getFullYear(),
			layout: {isSmallSidebar: false,isChatOpen: false,isFixedHeader: true,isFixedFooter: true,isStaticSidebar: false,isRightSidebar: false,isOffscreenOpen: false,isConversationOpen: false,isQuickLaunch: false,sidebarTheme: '',headerTheme: '',isFullScreen: false},
			isMessageOpen: false,	isConfigOpen: false, isConfigVisible: true
		};
		if (angular.isDefined($localStorage.layout)) {$scope.app.layout = $localStorage.layout} else {$localStorage.layout = $scope.app.layout};
		$scope.$watch('app.layout', function () {$localStorage.layout = $scope.app.layout}, true);
		if (angular.isDefined($localStorage.user)) {$rootScope.user = $localStorage.user} else {$localStorage.user = $rootScope.user};
		$scope.$watch('app.layout.isChatOpen', function () {if ($scope.app.layout.isChatOpen) {$http.get('../hhrr/api/kpi').then(function (response) {$scope.kpi=response.data.data})}},true);
		$rootScope.$watch('user', function () {$localStorage.user = $rootScope.user}, true);
		$scope.$on('IdleTimeout', function() {
			new Noty({text: 'Por seguridad...', type: 'error', timeout: 1500, animation: { open: 'animated bounceInRight', close: 'animated bounceOutRight'}})
			.on('afterShow', function() {Idle.unwatch();$state.go('session.lockscreen')})
			.show();
		});
		$http.get('../hhrr/api/getAll/SysApp').then(function (response) {$scope.apps = response.data.data; $scope.app.id=$scope.apps[0].id; $scope.app.name=$scope.apps[0].name; $scope.app.icon=$scope.apps[0].icon; });
		$scope.changeApp = function (n){
			new Noty({text:'Cargando la App...',layout: 'topCenter',type:'info',timeout:5,animation:{open:'animated bounceIn',close:'animated bounceOut'}})
			.on('afterShow', function() {$scope.app.id=n.id; $scope.app.name=n.name; $scope.app.icon=n.icon; $state.reload()})
			.show();
			}; 
	}]);