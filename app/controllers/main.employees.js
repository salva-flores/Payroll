'use strict';

function employeesCtrl($scope, $http, $filter, payrollService) {
	$scope.initVars = function () {
		$scope.step=1;$scope.action='POST';$scope.academicLevels=[];$scope.jobs=[];$scope.units=[];$scope.shifts=[];$scope.professions=[];$scope.employees=[];$scope.employee={};
		$scope.jobs.length ? null : $http.get('../hhrr/api/job').then(function (response) {$scope.jobs = response.data.data});
		$scope.units.length ? null : $http.get('../hhrr/api/unit').then(function (response) {$scope.units = response.data.data});
		$scope.shifts.length ? null : $http.get('../hhrr/api/getAll/CatWorkingHours').then(function (response) {$scope.shifts = response.data.data});
		$scope.professions.length ? null : $http.get('../hhrr/api/getAll/CatProfession').then(function (response) {$scope.professions = response.data.data});
		$scope.academicLevels.length ? null : $http.get('../hhrr/api/getAll/CatAcademicLevel').then(function (response) {$scope.academicLevels = response.data.data});
		$scope.gender = [{id:'1',name: 'Masculino'},{id:'2',name: 'Femenino'}];
		$scope.maritalStatus = [{id:'1',name: 'Soltero'},{id:'2',name: 'Casado'},{id:'3',name: 'Divorciado'},{id:'4',name: 'Viudo'}];
		$scope.loadEmployees();
		};
	$scope.loadEmployees = function(){
		$http.get('../hhrr/api/employee').then(function (response) {$scope.employees = response.data.data})};
	$scope.showJob = function (employee) {
		if (employee.job && $scope.jobs.length) {var selectedJob = $filter('filter')($scope.jobs, {id: employee.job}); return selectedJob.length ? selectedJob[0].name : 'Ninguno'} else {return employee.job || 'Ninguno'}};
	$scope.showUnit = function (employee) {
		if (employee.companyUnit && $scope.units.length) {var selectedUnit = $filter('filter')($scope.units, {id: employee.companyUnit}); return selectedUnit.length ? selectedUnit[0].name : 'Ninguno'} else {return employee.companyUnit || 'Ninguno'}};
	$scope.addEmployee = function () {
		$scope.frm.$setUntouched();$scope.frm.$setPristine();
		$scope.employee={};$scope.action='POST'; $scope.canEditEmployee=true; $scope.accion = "Agregar";};
		$('#employeeForm').on('shown.bs.modal', function () { $('#empName').focus()});
	$scope.edit = function(e){ 
		$scope.frm.$setUntouched();$scope.frm.$setPristine();
		$scope.employee=e;$scope.employee.joined=new Date($scope.employee.joined); 
		$scope.employee.salary=$scope.employee.salary*1;
		$scope.action='PUT';$scope.accion = "Editar";
		};
	$scope.saveEmployee = function (employee) {
		if ($scope.action=='POST'){
			$http.post('../hhrr/api/employee', employee).then(function(response){	new Noty({text:response.data.message, type: response.status==200 ? 'success' : 'error' ,theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show().on('onClose', function() {$('#employeeForm').modal('hide')});
			},function(response){new Noty({text:'Error: '+response.data.error.errorInfo[2], type:'error',theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show().on('onClose', function() {$('#employeeForm').modal('hide')});	});
		}else{
			$http.put('../hhrr/api/employee', employee).then(function(response){new Noty({text:'Registro actualizado!', type:'success',theme:'relax',timeout:500,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show().on('onClose', function() {$('#employeeForm').modal('hide')});
			},function(response){new Noty({text:'Error al actualizar!...'+response.data.error.errorInfo[2], type:'error',theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show().on('onClose', function() {$('#employeeForm').modal('hide')});});
			$scope.action='POST';
		}};
	$scope.removeEmployee = function (employee) {
		$scope.employees.splice(employee, 1);
		};
	$scope.filterEmployee = function (employee) {
		return employee.isDeleted !== true;
		};
	$scope.deleteEmployee = function (id) {
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
	$scope.nextStep = function (s) {
		$scope.step=$scope.step+s;
		};
	$scope.initVars();
}

angular
.module('payrollApp')
.controller('employeesCtrl', ['$scope', '$http', '$filter', 'payrollService', employeesCtrl]);
