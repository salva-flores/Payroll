'use strict';

function payrollService($q, $http, $rootScope, $localStorage, $state) {
	var service = {};
	var api_url = '../hhrr/api/';
	service.fetch = function(method, api, data) {
		var deferred = $q.defer();
		var req = {method:method,url:api_url+api,headers:{'Content-Type':'application/json;charset=utf-8'},data:data };
		$http(req).then(function(response){deferred.resolve(response)},function(response){deferred.reject(response)});
		return deferred.promise;
		};
	service.checkToken = function() {
		var deferred = $q.defer();
		$http.defaults.headers.common["token"]=$rootScope.user.token;
		$http.get(api_url+'validateToken').then(function(response){deferred.resolve(response)},function(response){deferred.reject(response)});
		return deferred.promise;
		};
	service.resetUser = function() {
		$rootScope.user = {id:'',userName:'',fname:'',lname:'',email:'',avatar:'myAvatar.png',profile:'',employee:'',token:'',loggedIn:false};
		};
	service.setCredentials = function(user) {
		$rootScope.user = {id:user.id,userName:user.userName,fname:user.firstName,lname:user.lastName,email:user.email,avatar:user.avatar,profile:user.profileId,employee:user.employeeId,token:user.token,loggedIn:true};
		$localStorage.user = $rootScope.user;
		};
	service.loadSidebar = function(){//Consider: Make an API that returns all resources and put them in the token...
		$http.get('../hhrr/api/mainResource').then(function(response){$rootScope.menu = response.data.data});
		if ($rootScope.user.userName=='root'){$http.get('../hhrr/api/resource').then(function(response){$rootScope.list = response.data.data})}
		else{$http.get('../hhrr/api/resourceById/'+$rootScope.user.profile).then(function(response){$rootScope.list = response.data.data})};
		};
	service.checkResource = function(i) {
		if(angular.isDefined($rootScope.list)){return JSON.stringify($rootScope.list).indexOf(i)}else{return 0};
		};
	
	service.calculate = function () {
		if ($scope.requests.length) {for (var i = 0; i <= $scope.requests.length - 1; i++) {$scope.calcDetail(i)}};
		};
	service.calcDetail = function (i) {
		$http.get('../hhrr/api/overDetail/'+$scope.requests[i].id).then(function (response) {$scope.detail = response.data.data;	$scope.calcOver(i)});
		};
	service.calcOver = function(i) {
		$scope.totalHoras=0;
		for (var j=0; j<=($scope.detail.length-1); j++){
			var diff = 0;
			var dEnd = new Date($scope.detail[j].endTimeStamp);
			var dStart = new Date($scope.detail[j].startTimeStamp);
			diff = (dEnd - dStart);
			$scope.totalHoras+=diff;
			var totalHoras = $filter('number')($scope.totalHoras/60/60/1000,1)}
		}

	return service;
};

angular
.module('payrollApp')
.factory('payrollService', ['$q', '$http', '$rootScope', '$localStorage', '$state', payrollService]);