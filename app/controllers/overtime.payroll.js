'use strict';

function overtimePayrollCtrl($scope, $rootScope, $filter, $http, $state, payrollService) {
	$scope.initVars = function() {
		$scope.today = new Date();
		$scope.showPayroll = false;
		$scope.showState = false;
		$scope.showPrinter = false;
		$scope.month = $scope.today.getMonth();
		$scope.overtime = [];
		$scope.requests = [];
		$scope.detail = [];
		$scope.totalHoras = 0;
		$scope.overPayHeader=[];
		$scope.overPayDetail=[];
		$scope.rango="";
		$scope.startDate= $filter('date')($scope.today, 'yyyy-MM-dd');  ;
		$scope.endDate="";
		};
	$scope.calcPayroll = function (rango) {
		$scope.showPayroll=false;
		$scope.showState=false;
		$scope.requests = [];
		return $http.get('../hhrr/api/overtime').then(function (response) {
			$scope.overtime = response.data.data; $scope.loadRequests(rango)});
		};
	$scope.loadRequests = function (rango) {
		return $http.get('../hhrr/api/overReqByRange/'+rango)
		.then(function (response) {
			$scope.requests = response.data.data; 
			if ($scope.requests.length) {
				for (var i = 0; i <= $scope.requests.length - 1; i++) {$scope.loadDetail(i)};
				new Noty({text:'Calculando la Planilla...',type:'info',layout:'topLeft',theme:'relax',timeout:750,progressBar:false,animation:{open:'animated fadeInDown',close:'animated fadeOutUp'}})
				.show()
				.on('onClose', function() {$('#planilla').collapse('show');$scope.showPrinter=true;$scope.showPayroll=true});
			};
		}, function(response) {
			new Noty({text:response.data.message,type:'error',layout:'topLeft',theme:'relax',timeout:750,progressBar:false,animation:{open:'animated fadeInDown',close:'animated fadeOutUp'}}).show();
			$scope.showPayroll=false;
		});
		};
	$scope.loadDetail = function (i) {
		return $http.get('../hhrr/api/overDetail/'+$scope.requests[i].id)
		.then(function (response) {
			$scope.detail = response.data.data;
			// $scope.calcOver(i);
			$scope.calcOver(i);
		});
		};
	$scope.calcOver = function(i) {
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
				var isHoliday = false;
				if (oEnd.getDay()==0||oEnd.getDay()==6||isHoliday) {
				$scope.t[$scope.overtime.length-1]=$scope.t[$scope.overtime.length-1]+horas*1;
				if (tot < 0) {$scope.t[$scope.overtime.length-1]=$scope.t[$scope.overtime.length-1]+$filter('number')(tot/60/60/1000,1)*1}; 
				// if ($scope.t[$scope.overtime.length-1]<0) {$scope.t[$scope.overtime.length-1] = 0}; hay un bug... 
				} else {
					$scope.t[k] = $scope.t[k] + horas*1;
					if (tot < 0) {$scope.t[k] = $scope.t[k] + $filter('number')(tot/60/60/1000,1)*1};
					if ($scope.t[k] < 0){ $scope.t[k] = 0};
				};
				dStart = oEnd; 
			};
			var totalDevengado=0;
			for (var k = 0; k <= $scope.overtime.length - 1; k++) {totalDevengado = totalDevengado + $scope.t[k]*(1+$scope.overtime[k].percent*1)*$scope.requests[i].salary/30/8};
			angular.extend($scope.requests[i], {t:$scope.t}, {totalHoras:totalHoras},{totDev:totalDevengado});
			$scope.estado=angular.fromJson($scope.status);
			};
		};
	$scope.changeState = function(req){
		// if (req==0){$scope.showState=false;$scope.showPayroll=true} else {$scope.showState=true;$scope.showPayroll=false};
		if (req==0){$scope.showState=false;$scope.showPayroll=true} else {$scope.showState=true};
		$scope.req=req;
		};
	$scope.updateState = function(req){
		angular.extend(req, {authorizedBy:$rootScope.user.id},{authorizationDate:$filter('date')(new Date(),'yyyy-MM-dd hh:mm:ss')});
		$http.put('../hhrr/api/overReq/', req)
		.then(function(response){
			new Noty({text:response.data.message,type:response.type,theme:'relax',timeout:100,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}})
			.show()
				.on('onClose', function() {
					$scope.showState=false;$scope.showPayroll=true;
					new Noty({text:"Send employee email", type: 'error', theme:'relax',timeout:100,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}})
					.show();
				});
			},function(response){console.log('Hubo un error!')});	
		// $scope.reset();
	};

	$scope.resetForm = function() {};
	$scope.initVars();
	$('input[name="daterange"]').daterangepicker({locale: { format: 'YYYY-MM-DD' },startDate: $scope.startDate}).on('change', function(e) {$scope.calcPayroll(e.currentTarget.value)});
};

angular
.module('payrollApp')
.controller('overtimePayrollCtrl', ['$rootScope', '$scope', '$filter', '$http', 'payrollService', overtimePayrollCtrl]);
