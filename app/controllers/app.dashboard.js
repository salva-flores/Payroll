'use strict';

function dashboardCtrl($scope, $rootScope, $http, $filter, $state, payrollService) { 

	$scope.calculate = function () {if ($scope.requests.length) { for (var i = 0; i <= $scope.requests.length - 1; i++) {$scope.calcDetail(i)}}};
	$scope.calcDetail = function (i) {return $http.get('../planilla/api/overDetail/'+$scope.requests[i].id).then(function (response) {$scope.detail = response.data.data;	$scope.calc(i)})};
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

	$scope.loadOvertime = function () {
		payrollService.fetch('GET','overtime')
		.then(function(response) { $scope.overtime = response.data.data}, function(response) { new Noty({text:'Error... '+response.message,type:'error',theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show()});
		};
	$scope.loadRequests = function () { 
		if($rootScope.user.userName=='root' ){payrollService.fetch('GET','allOvertimeRequest').then(function(response){$scope.requests=response.data.data;$scope.isAdmin=true; $scope.calculate()},function(response){console.log('Hubo un error!')})}
		else{$http.get('../planilla/api/overReqById/'+$rootScope.user.employee).then(function (response) {$scope.requests=response.data.data;$scope.isAdmin=false;$scope.calculate()})};
		}
	$scope.calcFooter = function() {
			$('#reqsTable').DataTable( {
				data: $scope.requests,
				columns: [{data:'firstName'},{data:'date'},{data:'estimatedTime'},{data:'totalHoras'},{data:'t.0'},{data:'t.1'},{data:'t.2'},{data:'t.3'},{data:'salary'},{data:'totDev'},{data:'state'}],
				"footerCallback": function ( row, data, start, end, display ) {
					var api = this.api(), data;
					var intVal = function ( i ) {return typeof i === 'string'  ? i.replace(/[\$,]/g, '')*1 : typeof i === 'number' ?  i : 0};
					var total = api
					.column( 9 ).data().reduce( function (a, b) {return intVal(a) + intVal(b)}, 0 );
					var pageTotal = api
					.column( 9, { page: 'current'} ).data().reduce( function (a, b) {return intVal(a) + intVal(b)}, 0 );
					$( api.column( 9 ).footer() ).html(''+pageTotal +' ( L.'+ total +' total)'	);
				}
			} );
		};
	$scope.loadOvertime();
	$scope.loadRequests();

};

angular
.module('payrollApp')
.controller('dashboardCtrl', ['$scope', '$rootScope', '$http', '$filter', '$state', 'payrollService', dashboardCtrl]);


$(document).ready(function() {

} );