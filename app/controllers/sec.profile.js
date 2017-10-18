'use strict';

function profileCtrl($scope, $filter, $http, $q, payrollService) {

	$scope.action='PUT';
	$scope.profiles = [];
	$scope.loadProfiles = function () {$http.get('../hhrr/api/getAll/SecProfile').then(function (response) {$scope.profiles = response.data.data})};
	$scope.showprof = function (prof){$scope.prof=prof};
	$scope.add = function () {
		$scope.action='POST';
		$scope.inserted = {id:$scope.profiles.length + 1,name:'',description:'',state:'1'};
		$scope.profiles.push($scope.inserted)};
	
	$scope.save = function (data, id, name, description, state) {
		if ($scope.action=='POST'){
			angular.extend(data, {id: id}, {name: name}, {description: description}, {state: state});
			return $http.post('../hhrr/api/profile', data).then(function(response){
				new Noty({text:'Registro agregado: '+response.data, type:'error',theme:'relax',timeout:1000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show();
			}).error(function(response){
				new Noty({text:'Error al agregar: '+response.data, type:'error',theme:'relax',timeout:3000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show();
			});
		}else{
			angular.extend(data, {id: id}, {password:pass}, {employee_id:0});
			return $http.put('../hhrr/api/profile', data).then(function(response){
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
			results.push($http.post('/saveprofile', profile));
		}
		return; // $q.all(results);
		};
	$scope.loadProfiles();
	}

angular
.module('payrollApp')
.controller('profileCtrl', ['$scope', '$filter', '$http',  'payrollService' , profileCtrl]);
