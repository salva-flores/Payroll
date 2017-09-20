'use strict';

function employeesCtrl($scope, $http, $filter, payrollService) {

	$scope.initVars = function () {
		$scope.action='PUT';
		$scope.jobs = [];
		$scope.units = [];
		$scope.employees = [];
		$scope.employee={};
		$scope.loadUnits();
		$scope.loadJobs();
		$scope.loadEmployees();
		};
	$scope.loadUnits = function () {
		return $scope.units.length ? null : $http.get('../hhrr/api/unit').then(function (response) {$scope.units = response.data.data});
		};
	$scope.loadJobs = function () {
		return $scope.jobs.length ? null : $http.get('../hhrr/api/job').then(function (response) {$scope.jobs = response.data.data});
		};
	$scope.loadEmployees = function () {
		return $scope.employees.length ? null : $http.get('../hhrr/api/employee').then(function (response) {$scope.employees = response.data.data});
		};
	$scope.showJob = function (employee) {
		if (employee.job && $scope.jobs.length) {
			var selectedJob = $filter('filter')($scope.jobs, {id: employee.job});
			return selectedJob.length ? selectedJob[0].name : 'Ninguno';  
		} else {return employee.job || 'Ninguno'}
		};
	$scope.showUnit = function (employee) {
		if (employee.companyUnit && $scope.units.length) {
			var selectedUnit = $filter('filter')($scope.units, {id: employee.companyUnit});
			return selectedUnit.length ? selectedUnit[0].name : 'Ninguno';  
		} else {return employee.companyUnit || 'Ninguno'}
		};
	$scope.addemployee = function () {
		$scope.initemployee(); $scope.action='POST';	$scope.canEditemployee=true; $scope.accion = "Agregar";
		};

	$scope.editemployee = function(u){
		$scope.canEditemployee = false;
		$scope.employee=u;
		$scope.action='PUT';
		$scope.typeSubmit = 2;
		$scope.accion = "Editar";
		$scope.tempPass=$scope.employee.password;
		$scope.employee.password="";
		$scope.employeeName = $scope.showEmployee(u);
		};

	$scope.saveemployee = function (employee) {
		var selected = $filter('filter')($scope.employees, {id: employee.employeeId});
		if (selected[0].gender==1){employee.avatar="man.png"}else{employee.avatar="female.png"};
		if (employee.password.length==0){employee.password=$scope.tempPass};
		if ($scope.action=='POST'){
			return $http.post('../hhrr/api/employee', employee).then(function(response){
				new Noty({text:response.data.message, type: response.status==200 ? 'success' : 'error' ,theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show();
			},function(response){
				new Noty({text:'Error:'+response.data.errorInfo[2], type:'error',theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show();
			});
		}else{
			return $http.put('../hhrr/api/employee', employee).then(function(response){
				new Noty({text:'Registro actualizado!'+response.data, type:'success',theme:'relax',timeout:500,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show();
			},function(response){
				new Noty({text:'Error al actualizar!...'+response.message, type:'error',theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show();
			});
		};
		$scope.action=='PUT';
		};
		
	$scope.removeemployee = function (employee) {
		$scope.employees.splice(employee, 1);
		};
	$scope.filteremployee = function (employee) {
		return employee.isDeleted !== true;
		};
	$scope.deleteemployee = function (id) {
		var filtered = $filter('filter')($scope.employees, {id: id});
		if (filtered.length) {filtered[0].isDeleted = true}
		};
	$scope.cancel = function () {
		for (var i = $scope.employees.length; i--;) {
			var employee = $scope.employees[i];
			if (employee.isDeleted) {delete employee.isDeleted};
			if (employee.isNew) {$scope.employees.splice(i, 1)}}
		};
	$scope.saveTable = function () {
		var results = [];
		for (var i = $scope.employees.length; i--;) {
			var employee = $scope.employees[i];
			if (employee.isDeleted) {$scope.employees.splice(i, 1)};
			if (employee.isNew) {employee.isNew = false};
			results.push($http.post('/saveemployee', employee));
		}
		return; // $q.all(results);
		};
	$scope.initVars();
}

angular
.module('payrollApp')
.controller('employeesCtrl', ['$scope', '$http', '$filter', 'payrollService', employeesCtrl]);
