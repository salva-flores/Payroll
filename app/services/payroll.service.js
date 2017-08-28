'use strict';

function payrollService($q, $http, $rootScope, $localStorage, $state) {
	var service = {};
	var api_url = '../planilla/api/';
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
	service.resetUser = function() {$rootScope.user = {id:'',userName:'',fname:'',lname:'',email:'',avatar:'myAvatar.png',profile:'',employee:'',token:'',loggedIn:false}};
	service.setCredentials = function(user) {
		$rootScope.user = {id:user.id,userName:user.userName,fname:user.firstName,lname:'',email:user.email,avatar:user.avatar,profile:user.profileId,employee:user.employeeId,token:user.token,loggedIn:true};
		$localStorage.user = $rootScope.user;
		};
	service.loadSidebar = function(){//Need to fix: Make an API that retuens all resources and put them in the token...
		$rootScope.menu = [];
		$rootScope.list = [];
		$rootScope.menu.length ? null : $http.get('../planilla/api/mainResource').then(function(response){$rootScope.menu = response.data.data});
		$rootScope.list.length ? null : $http.get('../planilla/api/resourceById/'+$rootScope.user.profile).then(function(response){$rootScope.list = response.data.data});
		};
	service.checkResource = function(i) {if(angular.isDefined($rootScope.list)){return JSON.stringify($rootScope.list).indexOf(i)}else{return 0}};
	service.openModal = function(show, width, height){
		if(show){$("body").css("overflow","hidden");$(".scroll").css({height: (height-125)});$(".alpha.modal").fadeIn("slow").find(".modal").css({width:width,height:height,marginLeft:-(width/2),marginTop:0})}
		else{$(".alpha.modal").fadeOut("slow",function(){$("body").css("overflow-y","scroll")})};
		};
	return service;
};

angular
.module('payrollApp')
.factory('payrollService', ['$q', '$http', '$rootScope', '$localStorage', '$state', payrollService]);