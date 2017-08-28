'use strict';
function userCtrl($scope, $filter, $http, payrollService, $resource, DTOptionsBuilder, DTColumnDefBuilder) {
	$scope.initVars = function () {
		$scope.action='PUT';
		$scope.isEmployee=false;
		$scope.canEditUser=true;
		$scope.users = [];
		$scope.profiles = [];
		$scope.employees = [];
		$scope.notUsers = [];
		$scope.user={avatar:'',email:'',employeeId:'',firstName:'',id:'',isActive:1,lastName:'',password:'',phone:'',profileId:'',userName:''}
		$scope.loadUsers();
		$scope.loadProfiles();
		$scope.loadEmployees();
		$scope.loadNotUsers();
		};
	$scope.initUser = function() {$scope.user={avatar:'',email:'',employeeId:'',firstName:'',id:'',isActive:1,lastName:'',password:'',phone:'',profileId:'',userName:''}};
	$scope.loadUsers = function () {return $http.get('../planilla/api/user').then(function (response) {$scope.users = response.data.data})};
	$scope.loadProfiles = function () {return $scope.profiles.length ? null : $http.get('../planilla/api/profile').then(function (response) {$scope.profiles = response.data.data})};
	$scope.loadEmployees = function () {return $scope.employees.length ? null : $http.get('../planilla/api/employee').then(function (response) {$scope.employees = response.data.data})};
	$scope.loadNotUsers = function () {return $scope.notUsers.length ? null : $http.get('../planilla/api/notUser').then(function (response) {$scope.notUsers = response.data.data})};
	$scope.showProfile = function (user) {
		if (user.profileId && $scope.profiles.length) {
			var selectedProfile = $filter('filter')($scope.profiles, {id: user.profileId});
			return selectedProfile.length ? selectedProfile[0].name : 'Ninguno';  
		} else {return user.profileId || 'Ninguno'}
		};
	$scope.showEmployee = function (user) {
		if (user.employeeId && $scope.employees.length) {
			var selectedEmployee = $filter('filter')($scope.employees, {id: user.employeeId});
			return selectedEmployee.length ? selectedEmployee[0].firstName : 'Ninguno';  
		} else {return user.employeeId || 'Ninguno'}
		};
	$scope.showNotUser = function (user) {
		if (user.employeeId && $scope.employees.length) {
			var selectedNotUser = $filter('filter')($scope.employees, {id: user.employeeId});
			$scope.user.firstName=selectedNotUser[0].firstName;
			$scope.user.email=selectedNotUser[0].email;
			$scope.user.phone=selectedNotUser[0].mobilePhone;
		}else{
			$scope.user.employeeId='';
			$scope.user.firstName='';
			$scope.user.email='';
			$scope.user.phone='';
		}
		};
	$scope.addUser = function () {
		$scope.initUser();
		$scope.action='POST';
		$scope.canEditUser=true;
		$scope.accion = "Agregar";
		};

		$scope.editUser = function(u){
			$scope.canEditUser = false;
			$scope.user=u;
			$scope.action='PUT';
			$scope.typeSubmit = 2;
			$scope.accion = "Editar";
			$scope.tempPass=$scope.user.password;
			$scope.user.password="";
			$scope.userName = $scope.showEmployee(u);
		};

	$scope.saveUser = function (user) {
		var selected = $filter('filter')($scope.employees, {id: user.employeeId});
		if (selected[0].gender==1){user.avatar="man.png"}else{user.avatar="female.png"};
		if (user.password.length==0){user.password=$scope.tempPass};
		if ($scope.action=='POST'){
			return $http.post('../planilla/api/user', user).then(function(response){
				new Noty({text:response.data.message, type: response.status==200 ? 'success' : 'error' ,theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show();
			},function(response){
				new Noty({text:'Error:'+response.data.errorInfo[2], type:'error',theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show();
			});
		}else{
			return $http.put('../planilla/api/user', user).then(function(response){
				new Noty({text:'Registro actualizado!'+response.data, type:'success',theme:'relax',timeout:500,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show();
			},function(response){
				new Noty({text:'Error al actualizar!...'+response.message, type:'error',theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show();
			});
		};
		$scope.action=='PUT';
		};
	$scope.removeUser = function (user) {$scope.users.splice(user, 1)};
	$scope.filterUser = function (user) {return user.isDeleted !== true};
	$scope.deleteUser = function (id) {
		var filtered = $filter('filter')($scope.users, {id: id});
		if (filtered.length) {filtered[0].isDeleted = true}
		};
	$scope.cancel = function () {
		for (var i = $scope.users.length; i--;) {
			var user = $scope.users[i];
			if (user.isDeleted) {delete user.isDeleted};
			if (user.isNew) {$scope.users.splice(i, 1)}}
		};
	$scope.saveTable = function () {
		var results = [];
		for (var i = $scope.users.length; i--;) {
			var user = $scope.users[i];
			if (user.isDeleted) {$scope.users.splice(i, 1)};
			if (user.isNew) {user.isNew = false};
			results.push($http.post('/saveUser', user));
		}
		return; // $q.all(results);
		};
	$scope.initVars();
}

angular
.module('payrollApp')
.controller('userCtrl', ['$scope', '$filter', '$http', 'payrollService', '$resource', 'DTOptionsBuilder', 'DTColumnDefBuilder' , userCtrl]);
