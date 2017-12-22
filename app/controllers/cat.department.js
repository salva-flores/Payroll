'use strict';
function catDepartmentCtrl($rootScope, $scope, $filter, $http, payrollService) {
	$scope.initVars=function(){
		$scope.units=[]; $scope.inserted={id:'',name:'',description:''}; $scope.action='PUT';
		};
	$scope.loadArrays=function(){
		$http.get('../hhrr/api/getAll/CatCompanyUnit').then(function (response) {$scope.units=response.data.data});
		};
	$scope.add=function(){
		$scope.inserted = {id: $scope.units[$scope.units.length-1].id*1 +1,name:'',description:''};
		$scope.units.push($scope.inserted);
		$scope.action='POST';
		};
	$scope.edit=function(){
		$scope.action='PUT';
		console.log('Do this');
	}
	$scope.remove=function (index) {
		$scope.units.splice(index, 1);
		};
	$scope.checkName = function (data, id) {
		console.log('Check Name',data,id);
		};
	$scope.save = function (data, id) {
		console.log('Save...',data,id, 'Action:',$scope.action);
		// angular.forEach($scope.units, function(value, key){
		// 	if (data==value.name) {
		// 		new Noty({text:'Ya existe - hacer update!',type:'info',theme:'relax',timeout:700,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show().on('onClose', function() {return false;}); }
		// 	});
		angular.extend(data, {id: id});
		if ($scope.action=='POST'){
			$http.post('../hhrr/api/department', data)
				.then(function(response){new Noty({text:response.data.message, type:response.data.type  ,theme:'relax',timeout:500,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show().on('onClose', function(){})}
				,function(response){new Noty({text:'Error: '+response.data.error.errorInfo[2], type:'error',theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show().on('onClose', function(){$scope.remove(id)})});
			$scope.action='PUT';
		}else{
			$http.put('../hhrr/api/department', data)
				.then(function(response){new Noty({text:response.data.message, type:response.data.type,theme:'relax',timeout:500,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show().on('onClose', function(){})}
				,function(response){new Noty({text:'Error al actualizar!...'+response.data.error.errorInfo[2], type:'error',theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show().on('onClose', function(){$scope.remove(id)})});
		}};
	
	$scope.run=function(){
		$scope.initVars();
		$scope.loadArrays();
		};
	
	$scope.run();

}

angular
.module('payrollApp')
.controller('catDepartmentCtrl',  ['$rootScope', '$scope', '$filter', '$http', 'payrollService',  catDepartmentCtrl]);