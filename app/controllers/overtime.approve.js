'use strict';

function overtimeApproveCtrl($scope, $rootScope, $filter, $http, $state, payrollService) {
	$scope.initVars = function() {
		$scope.requests=[];
		$scope.showDetail=false;
		$scope.hora='';
		$scope.estado='';
		$scope.fecha=$filter('date')(new Date(),'dd-MMMM-yyyy');
		if($rootScope.user.userName=='root' || $rootScope.user.profile==1){payrollService.fetch('GET','allOvertimeRequest').then(function(response){$scope.requests=response.data.data},function(response){console.log('Hubo un error!')})}
			else{payrollService.fetch('GET','pendingOvertimeRequestbyBoss/'+$rootScope.user.employee).then(function(response){$scope.requests=response.data.data},function(response){console.log('Hubo un error!')})};
		$scope.loadOvertime();
		$scope.loadRequests();
	};
	$scope.loadOvertime = function () {
		payrollService.fetch('GET','overtime').then(function(response) { $scope.overtime = response.data.data}, function(response) { new Noty({text:'Error... '+response.message,type:'error',theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show()});
	};
	$scope.loadRequests = function () { 
		if($rootScope.user.userName=='root' ){payrollService.fetch('GET','allOvertimeRequest').then(function(response){$scope.requests=response.data.data;$scope.isAdmin=true;$scope.calculate()},function(response){console.log('Hubo un error!')})}
		else{$http.get('../planilla/api/overReqById/'+$rootScope.user.employee).then(function (response) {$scope.requests=response.data.data;$scope.calculate();})};
	};
	$scope.calculate = function () {
		if ($scope.requests.length) {for (var i = 0; i <= $scope.requests.length - 1; i++) {$scope.calcDetail(i)}};
	};
	$scope.calcDetail = function (i) {
		return $http.get('../planilla/api/overDetail/'+$scope.requests[i].id).then(function (response) {$scope.detail = response.data.data;	$scope.calc(i)});
	};
	$scope.calc = function(i) {
		$scope.status=[]; $scope.totalHoras=0;
		for (var j=0; j<=($scope.detail.length-1); j++){
			var diff = 0; var dStart = new Date($scope.detail[j].activityDate+'T'+$scope.detail[j].startTime);
			var dEnd = new Date($scope.detail[j].activityDate+'T'+$scope.detail[j].endTime);
			var diff = (dEnd - dStart);
			if (diff < 0) { diff=diff+24*60*60*1000 };
			$scope.totalHoras=$scope.totalHoras+diff;
			var tot = $scope.totalHoras*1;
		};
		var totalHoras = $filter('number')($scope.totalHoras/60/60/1000,1);
		if ($scope.detail.length) { 
			var dStart = new Date($filter('date')($scope.detail[0].activityDate, 'yyyy-MM-dd')+'T'+$filter('date')($scope.detail[0].startTime, 'HH:mm:ss'));
			var dEnd = new Date($filter('date')($scope.detail[$scope.detail.length-1].activityDate, 'yyyy-MM-dd')+'T'+$filter('date')($scope.detail[$scope.detail.length-1].endTime, 'HH:mm:ss'));
			$scope.t = []; 
			for (var k = 0; k <= $scope.overtime.length - 1; k++) {$scope.t[k] = 0};
				for (var k = 0; k <= $scope.overtime.length - 2; k++) {
					var oStart = new Date($filter('date')(dStart, 'yyyy-MM-dd')+'T'+$filter('date')($scope.overtime[k].start, 'HH:mm:ss'));
					var oEnd = new Date($filter('date')(dStart, 'yyyy-MM-dd')+'T'+$filter('date')($scope.overtime[k].end, 'HH:mm:ss'));
					diff = oEnd.getTime() - dStart.getTime();
					if (diff < 0) {diff = diff+24*60*60*1000}; 
					tot = tot - diff; var horas = $filter('number')(diff/60/60/1000,1);
					$scope.t[k] = $scope.t[k] + horas*1;
					if (tot < 0) {$scope.t[k] = $scope.t[k] + $filter('number')(tot/60/60/1000,1)*1};
					if ($scope.t[k] < 0){ $scope.t[k] = 0};
					dStart = oEnd; 
				};
				var totalDevengado=0;
				for (var k = 0; k <= $scope.overtime.length - 1; k++) {totalDevengado = totalDevengado + $scope.t[k]*(1+$scope.overtime[k].percent*1)*$scope.requests[i].salary/30/8};
					angular.extend($scope.requests[i], {t:$scope.t}, {totalHoras:totalHoras},{totDev:totalDevengado});
				$scope.estado=angular.fromJson($scope.status);
			};
		};
	$scope.refresh = function(){
			if($rootScope.user.userName=='root' || $rootScope.user.profile==1){payrollService.fetch('GET','allOvertimeRequest').then(function(response){$scope.requests=response.data.data},function(response){console.log('Hubo un error!')})}
				else{payrollService.fetch('GET','pendingOvertimeRequestbyBoss/'+$rootScope.user.employee).then(function(response){$scope.requests=response.data.data},function(response){console.log('Hubo un error!')})};
		};
	$scope.reset = function(frm) {
			$scope.initVars(); frm.$setUntouched(); frm.$setPristine(); document.getElementById("1").focus();
		};
	$scope.changeState = function(req) {
			$scope.showDetail=true; $scope.req=req; $scope.estado= 'Empleado: '+req.firstName+' Fecha: '+$filter('date')(req.date,'dd-MMM-yyyy' )+'Estimado: '+req.estimatedTime;
			$scope.loadDetail($scope.req);
		};
	$scope.loadDetail = function (req) {
			payrollService.fetch('GET','overDetail/'+req.id).then(function(response) {$scope.detail=response.data.data; $scope.calcOver(req.id)},function(response) {console.log('Error:',response)});
		};
	$scope.calcOver = function(i) {
		$scope.totalHoras=0;
		for (var j=0; j<=($scope.detail.length-1); j++){
			var diff = 0; var dStart = new Date($scope.detail[j].activityDate+'T'+$scope.detail[j].startTime);
			var dEnd = new Date($scope.detail[j].activityDate+'T'+$scope.detail[j].endTime);
			var diff = (dEnd - dStart);
			if (diff < 0) { diff=diff+24*60*60*1000 }; $scope.totalHoras=$scope.totalHoras+diff; var tot = $scope.totalHoras*1;
		};
		if ($scope.detail.length) { 
			var dStart = new Date($filter('date')($scope.detail[0].activityDate, 'yyyy-MM-dd')+'T'+$filter('date')($scope.detail[0].startTime, 'HH:mm:ss'));
			var dEnd = new Date($filter('date')($scope.detail[$scope.detail.length-1].activityDate, 'yyyy-MM-dd')+'T'+$filter('date')($scope.detail[$scope.detail.length-1].endTime, 'HH:mm:ss'));
			$scope.t = []; $scope.status=[];
			for (var k = 0; k <= $scope.overtime.length - 1; k++) {$scope.t[k] = 0};
				for (var k = 0; k <= $scope.overtime.length - 2; k++) {
					var oStart = new Date($filter('date')(dStart, 'yyyy-MM-dd')+'T'+$filter('date')($scope.overtime[k].start, 'HH:mm:ss'));
					var oEnd = new Date($filter('date')(dStart, 'yyyy-MM-dd')+'T'+$filter('date')($scope.overtime[k].end, 'HH:mm:ss'));
					diff = oEnd.getTime() - dStart.getTime();
					if (diff < 0) {diff = diff+24*60*60*1000}; tot = tot - diff; var horas = $filter('number')(diff/60/60/1000,1); $scope.t[k] = $scope.t[k] + horas*1;
					if (tot < 0) {$scope.t[k] = $scope.t[k] + $filter('number')(tot/60/60/1000,1)*1};
					if ($scope.t[k] < 0){ $scope.t[k] = 0}; dStart = oEnd; 
				};
				for (j = 0; j <= $scope.overtime.length - 1; j++) {var $l=$scope.overtime[j].name+': '+$scope.t[j]; $scope.status.push($l)}; var totalDevengado=0;
				for (var k = 0; k <= $scope.overtime.length - 1; k++) {totalDevengado = totalDevengado + $scope.t[k]*(1+$scope.overtime[k].percent*1)*$scope.req.salary/30/8};
				var texto = '. El detalle tiene '+$filter('number')($scope.totalHoras/60/60/1000,1)+' horas.'+' Total devengado: '+$filter('number')(totalDevengado,1);
				$scope.estado=$scope.estado+$scope.status; $scope.estado=$scope.estado+texto;
				new Noty({text:texto,type:'success',layout:'centerLeft',theme:'relax',timeout:2500,animation:{open:'animated fadeInDown',close:'animated fadeOutDown'}}).show();
			};
		};
	$scope.updateState = function(req){
					angular.extend(req,
						{decidedBy:$rootScope.user.id},
						{decisionDate:$filter('date')(new Date(),'yyyy-MM-dd hh:mm:ss')},
						{authorizedBy:0},
						{authorizationDate:''});
					payrollService.fetch('PUT','overReq',req)
					.then(function(response){
						new Noty({text:response.data.message,type:response.type,theme:'relax',timeout:100,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}})
						.show()
						.on('onClose', function() {
							$scope.showState=!$scope.showState;
							new Noty({text:"Send employee email", type: 'error', theme:'relax',timeout:100,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}})
							.show();
						});
					},function(response){console.log('Hubo un error!')});	
	};
	$scope.closeDetail = function (stateForm) {
		$scope.showDetail=false; stateForm.$setUntouched(); stateForm.$setPristine();
	};
	$scope.notify = function () {
		$http.get('../planilla/api/employeeBoss/'+$rootScope.user.employee).success(function (response) {new Noty({text:'Enviar notificación a...'+response.data.data[0].email, type: response.status==200 ? 'success' : 'error' ,theme:'relax',timeout:3000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show()});
	};
	$scope.initVars();
}

angular
.module('payrollApp')
.controller('overtimeApproveCtrl', ['$rootScope', '$scope', '$filter', '$http', '$state', 'payrollService', overtimeApproveCtrl]);
