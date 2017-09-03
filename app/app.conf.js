'use strict';

angular
.module('payrollApp')
.config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {
	$urlRouterProvider.otherwise('/');
	$stateProvider
	.state('prueba', {
		url: '/prueba', templateUrl: 'app/views/prueba.html',controller: 'overtimePayrollCtrl',
		resolve: {deps: ['$ocLazyLoad', function ($ocLazyLoad) {return $ocLazyLoad.load('app/controllers/overtime.payroll.js')}]},
		data: {Auth:false,title: 'Prueba'}
		})
	.state('login', {
		url: '/',templateUrl: 'app/views/sec.login.html', controller: 'sessionCtrl',	
		resolve: {deps: ['$ocLazyLoad', function ($ocLazyLoad) {return $ocLazyLoad.load('app/controllers/sec.session.js')}]},
		data: {appClasses: 'bg-white usersession',contentClasses: 'full-height',Auth:false}
		})
	.state('app', {
		abstract: true,templateUrl: 'app/common/app.layout.html',controller: 'layoutCtrl',
		resolve: {deps: ['$ocLazyLoad', function ($ocLazyLoad) {return $ocLazyLoad.load('app/controllers/app.layout.js')}]},
		data:{Auth:true}
		})
	.state('app.dashboard', {
		url: '/dash',templateUrl: 'app/views/app.dashboard.html',	controller: 'dashboardCtrl',
		resolve: {
			parametros: ['$rootScope','$http', function($rootScope, $http){return $http.get('../hhrr/api/overParams/'+$rootScope.user.employee)}],
			deps: ['parametros','$ocLazyLoad', function (parametros, $ocLazyLoad) {
				return $ocLazyLoad.load([
					{insertBefore: '#load_styles_before',files:['src/vendor/bootstrap-daterangepicker/daterangepicker.css']},
					{serie:true,files:['src/vendor/Charts/Chart.js','src/vendor/bootstrap-daterangepicker/moment.min.js','src/vendor/bootstrap-daterangepicker/daterangepicker.js']}
				]).then(function () {return $ocLazyLoad.load('app/controllers/app.dashboard.js')});
			}]
		},
		data: {Auth: false,title: 'Dashboard'}
		})
	.state('app.charts', {
		url: '/charts',templateUrl: 'app/views/app.charts.html', controller: 'chartsCtrl',
		resolve: {
			deps: ['$ocLazyLoad', function ($ocLazyLoad) {
				return $ocLazyLoad.load([
					{insertBefore: '#load_styles_before',files:['src/vendor/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css']},
					{serie:true,files:['src/vendor/Charts/Chart.js','src/vendor/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js']},
				]).then(function () {return $ocLazyLoad.load('app/controllers/app.charts.js')});
			}]
		},
		data: {Auth: true,title: 'Gráficos de Indicadores'}
		})
	.state('app.charts.nvd3', {
		url: '/nvd3', templateUrl: 'views/charts-nvd3.html',
		resolve: {
			deps: ['$ocLazyLoad', function ($ocLazyLoad) {
				return $ocLazyLoad.load([
					{insertBefore: '#load_styles_before', files: ['src/vendor/nvd3/nv.d3.min.css'	]},
					{name: 'nvd3', serie: true, files: ['src/vendor/d3/d3.min.js','src/vendor/nvd3/nv.d3.min.js',	'src/vendor/angular-nvd3/dist/angular-nvd3.min.js']}
				]).then(function () {return $ocLazyLoad.load('scripts/controllers/nvd3.js')});
			}]
		},
		data: {title: 'Nvd3 Charts'}
		})
	.state('app.over', {
		template: '<div ui-view></div>',	abstract: true,	url: '/overtime',
		})	
	.state('app.over.request', {
		url: '/request', templateUrl: 'app/views/overtime.request.html', controller: 'overtimeRequestCtrl',
		resolve: {
			parametros: ['$rootScope','$http', function($rootScope, $http){return $http.get('../hhrr/api/overParams/'+$rootScope.user.employee)}],
			deps: ['parametros', '$ocLazyLoad', function (parametros, $ocLazyLoad) {return $ocLazyLoad.load('app/controllers/overtime.request.js')}]
		},
		data: {title: 'Solicitud de Horas Extras'}
		})
	.state('app.over.approve', {	
		url: '/approve', templateUrl: 'app/views/overtime.approve.html', controller: 'overtimeApproveCtrl',
		resolve: {
			deps: ['$ocLazyLoad', function ($ocLazyLoad) {
				return $ocLazyLoad.load([
					{insertBefore: '#load_styles_before',files:['src/vendor/bootstrap-daterangepicker/daterangepicker.css']},
					{serie:true,files:['src/vendor/bootstrap-daterangepicker/moment.min.js','src/vendor/bootstrap-daterangepicker/daterangepicker.js']},
				]).then(function () {return $ocLazyLoad.load('app/controllers/overtime.approve.js')});
			}]
		},
		data: {title: 'Aprobación de Horas Extras'}
		})
	.state('app.over.detail', {	
		url: '/detail',	templateUrl: 'app/views/overtime.detail.html', controller: 'overtimeDetailCtrl',
		resolve: {deps: ['$ocLazyLoad', function ($ocLazyLoad) {return $ocLazyLoad.load('app/controllers/overtime.detail.js')}]},
		data: {title: 'Detalle de Horas Extras'}
		})
	.state('app.over.payroll', {	
		url: '/payroll', templateUrl: 'app/views/overtime.payroll.html', controller: 'overtimePayrollCtrl',
		resolve: {
			deps: ['$ocLazyLoad', function ($ocLazyLoad) {
				return $ocLazyLoad.load([
					{insertBefore: '#load_styles_before',files:['src/vendor/bootstrap-daterangepicker/daterangepicker.css']},
					{serie:true,files:['src/vendor/bootstrap-daterangepicker/moment.min.js','src/vendor/bootstrap-daterangepicker/daterangepicker.js']},
				]).then(function () {return $ocLazyLoad.load('app/controllers/overtime.payroll.js')});
			}]
		},
		data: {title: 'Cálculo de Planilla de Horas Extras'}
		})
	.state('app.over.authorize', {	
		url: '/authorize', templateUrl: 'app/views/overtime.authorize.html', controller: 'overtimeAuthorizeCtrl',
		resolve: {	deps: ['$ocLazyLoad', function ($ocLazyLoad) { return $ocLazyLoad.load('app/controllers/overtime.authorize.js')	}]},
		data: {title: 'Horas Extras'}
		})
	.state('app.assign', {
		template: '<div ui-view></div>',	abstract: true,	url: '/assign'
		})	
	.state('app.assign.deduction', {
		url: '/deduction', templateUrl: 'app/views/deduction.html', controller: 'deductionCtrl',
		resolve: {	deps: ['$ocLazyLoad', function ($ocLazyLoad) {return $ocLazyLoad.load('app/controllers/deduction.js')}]},
		data: {title: 'Deducciones del empleado'}
		})
	.state('app.cat', {
		template: '<div ui-view></div>',	abstract: true,	url: '/cat'
		})
	.state('app.cat.ajustes', {
		url: '/ajustes', templateUrl: 'app/views/cat.ajustes.html',
		data: {title: 'Catalogo de Ajustes'}
		})
	.state('app.cat.companies', {
		url: '/companies', templateUrl: 'app/views/cat.company.html', 
		resolve: {
			deps: ['$ocLazyLoad', function ($ocLazyLoad) {
				return $ocLazyLoad.load([
					{insertBefore: '#load_styles_before', files: ['src/vendor/clockpicker/dist/bootstrap-clockpicker.min.css']},
					{serie: true,	files: [	'src/vendor/clockpicker/dist/jquery-clockpicker.min.js']}
				]).then(function () {return $ocLazyLoad.load('app/controllers/cat.company.js')});
			}]
		},
		data: {title: 'Empresas'}
		})
	.state('app.cat.employees', {
		url: '/employees', templateUrl: 'app/views/main.employees.html', controller: 'employeesCtrl',
		resolve: {	deps: ['$ocLazyLoad', function ($ocLazyLoad) {return $ocLazyLoad.load('app/controllers/main.employees.js')}]},
		data: {title: 'Empleados'}
		})
	.state('app.cat.empresas', {
		url: '/empresas', templateUrl: 'app/views/Empresa.html',
		resolve: {	deps: ['$ocLazyLoad', function ($ocLazyLoad) {return $ocLazyLoad.load('src/vendor/jquery.maskedinput/dist/jquery.maskedinput.min.js')	.then(function () {return $ocLazyLoad.load('app/controllers/catCompany.js')})}]},
		data: {title: 'Empresas'}
		})
	.state('app.conf', {
		template: '<div ui-view></div>',	abstract: true,	url: '/config'
		})
	.state('app.conf.sidebar', {
		url: '/sidebar', templateUrl: 'app/views/app.dashboard.html',
		data: {title: 'Sidebar Menu'}
		})
	.state('app.conf.parameters', {
		url: '/paramaters', templateUrl: 'app/views/app.dashboard.html',
		resolve: {	deps: ['$ocLazyLoad', function ($ocLazyLoad) {	return $ocLazyLoad.load('app/controllers/app.dashboard.js')}]},
		data: {title: 'Parámetros'}
		})
	.state('app.conf.resources', {
		url: '/resources', templateUrl: 'app/views/conf.resources.html', controller: 'resourcesCtrl',
		resolve: {	deps: ['$ocLazyLoad', function ($ocLazyLoad) {return $ocLazyLoad.load('app/controllers/conf.resources.js')}]},
		data: {title: 'Configuracion de Recursos'}
		})
	.state('app.pay', {
		template: '<div ui-view></div>', abstract: true, url: '/pay'
		})
	.state('app.pay.isr', {
		url: '/isr', templateUrl: 'app/views/app.dashboard.html',
		resolve: {	deps: ['$ocLazyLoad', function ($ocLazyLoad) {return $ocLazyLoad.load('app/controllers/app.dashboard.js')}]},
		data: {title: 'Cálculo del ISR'}
		})
	.state('app.pay.payroll', {
		url: '/payroll', templateUrl: 'app/views/pay.payroll.html', controller: 'payrollCtrl',
		resolve: {	deps: ['$ocLazyLoad', function ($ocLazyLoad) {return $ocLazyLoad.load('app/controllers/pay.payroll.js')	}]},
		data: {title: 'Cálculo de Planillas'}
		})
	.state('app.sec', {
		template: '<div ui-view></div>',	abstract: true,	url: '/security'
		})
	.state('app.sec.profiles', {
		url: '/profiles', templateUrl: 'app/views/sec.profile.html', controller: 'ControllerCatalogoPerfil',
		resolve: {	deps: ['$ocLazyLoad', function ($ocLazyLoad) {return $ocLazyLoad.load('app/pages/CatalogoPerfiles/CatalogoPerfil.js')}]},
		data: {title: 'Perfiles'}
		})
	.state('app.sec.users', {
		url: '/users', templateUrl: 'app/views/user.html', controller: 'userCtrl',
		resolve: {	deps: ['$ocLazyLoad', function ($ocLazyLoad) {return $ocLazyLoad.load('app/controllers/sec.user.js')}]},
		data: {title: 'Usuarios'}
		})
	.state('user', {
		templateUrl: 'app/common/session.html',
		})
	.state('user.signup', {
		url: '/signup', templateUrl: 'app/views/sec.signup.html', controller: 'sessionCtrl',
		resolve: {	deps: ['$ocLazyLoad', function ($ocLazyLoad) {return $ocLazyLoad.load('app/controllers/sec.session.js')}]},
		data: {appClasses: 'bg-white usersession',contentClasses: 'full-height'}
		})
	.state('user.forgot', {
		url: '/forgot', templateUrl: 'app/views/sec.forgot.html',
		resolve: {	deps: ['$ocLazyLoad', function ($ocLazyLoad) {return $ocLazyLoad.load('app/controllers/sec.session.js')}]},
		data: {appClasses: 'bg-white usersession', contentClasses: 'full-height'}
		})
	.state('user.lockscreen', {
		url: '/lockscreen', templateUrl: 'app/views/sec.lockscreen.html',
		resolve: {	deps: ['$ocLazyLoad', function ($ocLazyLoad) {return $ocLazyLoad.load('app/controllers/sec.session.js')}]},
		data: {appClasses: 'usersession', contentClasses: 'full-height', Auth:false}
		})
	.state('err', {
		abstract: true, templateUrl: 'app/common/app.layout.html', controller: 'layoutCtrl',
		resolve: {	deps: ['$ocLazyLoad', function ($ocLazyLoad) {return $ocLazyLoad.load('app/controllers/app.layout.js')}]},
		data:{Auth:false}
		})
	.state('err.403', {
		url: '/403', templateUrl: 'app/views/error-403.html',
		data: {title: 'Acceso denegado!', appClasses: 'usersession', contentClasses: 'no-padding'}
		})
	.state('err.404', {
		url: '/404', templateUrl: 'app/views/error-404.html',
		data: {title: 'Página no encontrada', appClasses: 'usersession', contentClasses: 'no-padding'}
		})
	.state('err.500', {
		url: '/500', templateUrl: 'app/views/error-500.html',
		data: {title: 'Error!', appClasses: 'usersession', contentClasses: 'full-height'}
		})
	}])
.config(['IdleProvider','KeepaliveProvider', function (IdleProvider, KeepaliveProvider) {
	IdleProvider.idle(60*15); IdleProvider.timeout(1); KeepaliveProvider.interval(2);
	}])
.config(['$ocLazyLoadProvider', function ($ocLazyLoadProvider) {
	$ocLazyLoadProvider.config({debug: false,events: false});
	}]);
