'use strict';
	function profileCtrl($scope, $filter, $http, editableOptions, editableThemes, $q, payrollService) {
	editableThemes.bs3.inputClass = 'input-sm';
	editableThemes.bs3.buttonsClass = 'btn-sm';
	editableOptions.theme = 'bs3';
	$scope.users = [];
	$scope.profiles = [];
	$scope.action='PUT';
	$scope.loadUsers = function () {return $scope.users.length ? null : $http.get('../hhrr/api/user').success(function (data) {$scope.users = data})};
	$scope.loadProfiles = function () {return $scope.profiles.length ? null : $http.get('../hhrr/api/profile').success(function (data) {$scope.profiles = data.data})};
	$scope.add = function () {
		$scope.action='POST';
		$scope.inserted = {id:$scope.profiles.length + 1,name:'',description:'',state:'1'};
		$scope.profiles.push($scope.inserted)};
	
	$scope.save = function (data, id, name, description, state) {
		if ($scope.action=='POST'){
			angular.extend(data, {id: id}, {name: name}, {description: description}, {state: state});
			return $http.post('../hhrr/api/user', data).success(function(response){
				new Noty({text:'Registro agregado: '+response.data, type:'error',theme:'relax',timeout:1000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show();
			}).error(function(response){
				new Noty({text:'Error al agregar: '+response.data, type:'error',theme:'relax',timeout:3000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show();
			});
			// .then(handleSuccess, handleError('Error getting all users'));
		}else{
			angular.extend(data, {id: id}, {password:pass}, {employee_id:0});
			return $http.put('../hhrr/api/user', data).success(function(response){
				new Noty({text:'Registro actualizado!'+response.data, type:'error',theme:'relax',timeout:1000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show();
			}).error(function(response){
				new Noty({text:'Error al actualizar!...'+response.message, type:'error',theme:'relax',timeout:3000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show();
			})
		};
		$scope.action=='PUT';
		};
	$scope.remove = function (profile) {$scope.profiles.splice(profile, 1)};
	$scope.filter = function (profile) {return profile.isDeleted !== true};
	$scope.delete = function (id) {
		var filtered = $filter('filter')($scope.profiles, {id: id});
		if (filtered.length) {filtered[0].isDeleted = true}};
	$scope.cancel = function () {
		for (var i = $scope.profiles.length; i--;) {
			var profile = $scope.profiles[i];
			if (profile.isDeleted) {delete profile.isDeleted};
			if (profile.isNew) {$scope.profiles.splice(i, 1)}}
		};
	$scope.saveTable = function () {
		var results = [];
		for (var i = $scope.profiles.length; i--;) {
			var profile = $scope.profiles[i];
			if (profile.isDeleted) {$scope.profiles.splice(i, 1)};
			if (profile.isNew) {profile.isNew = false};
			results.push($http.post('/saveUser', profile));
		}
		return; // $q.all(results);
		};
	$scope.loadProfiles();
	}

angular
.module('payrollApp')
.controller('profileCtrl', ['$scope', '$filter', '$http', 'editableOptions', 'editableThemes', 'payrollService' , profileCtrl]);
