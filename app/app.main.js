'use strict';

angular
.module('payrollApp')
.controller('AppCtrl', ['$rootScope', '$scope', '$http', '$state', '$localStorage', 'payrollService', 'Idle', 
	function AppCtrl($rootScope, $scope, $http, $state, $localStorage, payrollService, Idle) {
		$scope.mobileView = 767;
		$scope.kpi = [];
		$scope.app = {
			name: 'Payroll',
			author: 'salva_flores@yahoo.com',
			version: '1.0.0',
			year: (new Date()).getFullYear(),
			layout: {
				isSmallSidebar: false,
				isChatOpen: false,
				isFixedHeader: true,
				isFixedFooter: true,
				isBoxed: false,
				isStaticSidebar: false,
				isRightSidebar: false,
				isOffscreenOpen: false,
				isConversationOpen: false,
				isQuickLaunch: false,
				sidebarTheme: '',
				headerTheme: '',
				isFullScreen: false
			},
			isMessageOpen: false,
			isConfigOpen: false,
			isConfigVisible: true
		};
		if (angular.isDefined($localStorage.layout)) {$scope.app.layout = $localStorage.layout} else {$localStorage.layout = $scope.app.layout};
		$scope.$watch('app.layout', function () {$localStorage.layout = $scope.app.layout}, true);
		if (angular.isDefined($localStorage.user)) {$rootScope.user = $localStorage.user} else {$localStorage.user = $rootScope.user};
		$scope.$watch('app.layout.isChatOpen', function () {if ($scope.app.layout.isChatOpen) {$http.get('../hhrr/api/kpi').then(function (response) {$scope.kpi=response.data.data})}},true);
		$rootScope.$watch('user', function () {$localStorage.user = $rootScope.user}, true);
		$scope.events = [];
		$scope.$on('IdleTimeout', function() {
			new Noty({text: 'Por seguridad...', type: 'error', timeout: 3000, animation: { open: 'animated bounceInRight', close: 'animated bounceOutRight'}})
			.on('afterShow', function() {Idle.unwatch();$state.go('user.lockscreen')})
			.show();
		});
	}]);