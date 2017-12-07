'use strict';
function catDeductionCtrl($rootScope, $scope, $filter, $http, payrollService) {
	$scope.initVars=function(){
		$scope.deductions=[];$scope.types=[];$scope.inserted = {id:'',name:'',type: null, description:'', isMandatory: null};$scope.action='PUT';
		};
	$scope.loadArrays=function(){
		$http.get('../hhrr/api/getAll/CatDeductionType').then(function (response) {$scope.types = response.data.data});
		$http.get('../hhrr/api/getAll/CatDeduction').then(function (response) {$scope.deductions = response.data.data});
		};
	$scope.showType = function (d) {
		if (d.type && $scope.types.length) { var selected = $filter('filter')($scope.types, {id: d.type});	return selected.length ? selected[0].name : 'Vacío';}
		else {return d.type || 'Sin tipo';	}
	};

	$scope.add=function(){
		// console.log($scope.deductions.length, $scope.deductions); console.log('New id:',$scope.deductions[$scope.deductions.length-1].id*1 +1);
		$scope.inserted = {id: $scope.deductions[$scope.deductions.length-1].id*1 +1,name:'',type: null, description:'', isMandatory: null};
		$scope.deductions.push($scope.inserted);
		$scope.action='POST';
		// $('#addDedForm').modal('show');
		};

	$scope.remove=function (index) {
		$scope.deductions.splice(index, 1);
		};

	$scope.checkName = function (data, id) {
		console.log('Check Name',data,id);
	};

	$scope.save = function (data, id) {
		console.log('Save...',data,id, 'Action:',$scope.action);
		// angular.forEach($scope.deductions, function(value, key){
		// 	if (data==value.name) {
		// 		new Noty({text:'Ya existe - hacer update!',type:'info',theme:'relax',timeout:700,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show().on('onClose', function() {return false;}); }
		// 	});
		angular.extend(data, {id: id});
		if ($scope.action=='POST'){
			$http.post('../hhrr/api/deduction', data).then(function(response){new Noty({text:response.data.message, type:response.data.type  ,theme:'relax',timeout:1000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show().on('onClose', function() {});
			},function(response){new Noty({text:'Error: '+response.data.error.errorInfo[2], type:'error',theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show().on('onClose', function() {$scope.remove(id)});	});
			$scope.action='PUT';
		}else{
			$http.put('../hhrr/api/deduction', data).then(function(response){new Noty({text:response.data.message, type:response.data.type,theme:'relax',timeout:1000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show().on('onClose', function() {});
			},function(response){new Noty({text:'Error al actualizar!...'+response.data.error.errorInfo[2], type:'error',theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show().on('onClose', function() {$scope.remove(id)});});
		}};
	$scope.run=function(){
		$scope.initVars();
		$scope.loadArrays();
		};
	
	$scope.run();

}

angular
.module('payrollApp')
.controller('catDeductionCtrl',  ['$rootScope', '$scope', '$filter', '$http', 'payrollService',  catDeductionCtrl]);
