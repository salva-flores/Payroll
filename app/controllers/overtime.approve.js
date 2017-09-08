'use strict';

function overtimeApproveCtrl($scope, $rootScope, $filter, $http, $state, payrollService) {
	$scope.run = function(){
		$scope.initVars();
		new Noty({text:'Cargando data...',type:'info',layout:'topLeft',theme:'relax',timeout:1000,progressBar:false,animation:{open:'animated fadeInDown',close:'animated fadeOutUp'}}).show();
		$scope.loadOvertime();
		};
	$scope.initVars = function() {
		$scope.requests=[];
		$scope.showDetail=false;
		$scope.showReqs=false;
		$scope.hora='';
		$scope.estado='';
		$scope.fecha=$filter('date')(new Date(),'dd-MMMM-yyyy');
		$scope.rango="";
		$scope.startDate= $filter('date')(new Date(), 'yyyy-MM-dd');  ;
		$scope.endDate="";
		// $('input[name="daterange"]').daterangepicker({locale: { format: 'YYYY-MM-DD' },startDate: $scope.startDate}).on('change', function(e) {$scope.loadOvertime(e.currentTarget.value)});
		};
	$scope.loadOvertime = function () {
		payrollService.fetch('GET','overtime')
		.then(function(response) { 
			$scope.overtime = response.data.data;$scope.loadRequests()}, function(response) { new Noty({text:'Error... '+response.message,type:'error',theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show()});
		};
	$scope.loadRequests = function () { 
		$scope.showReqs=false;
		if($rootScope.user.userName=='root' || $rootScope.user.profile<=2){payrollService.fetch('GET','allOvertimeRequest').then(function(response){$scope.requests=response.data.data;$scope.isAdmin=true;$scope.calculate()},function(response){console.log('Hubo un error!')})}
		else{$http.get('../hhrr/api/overReqById/'+$rootScope.user.employee).then(function (response) {$scope.requests=response.data.data;$scope.calculate()})};
		};
	$scope.calculate = function () {
		if ($scope.requests.length) {for (var i = 0; i <= $scope.requests.length - 1; i++) {$scope.calcDetail(i)}};
		};
	$scope.calcDetail = function (i) {
		$http.get('../hhrr/api/overDetail/'+$scope.requests[i].id).then(function (response) {$scope.detail = response.data.data;	$scope.calcOver(i);$scope.showReqs=true});
		};
	$scope.calcOver = function(i) {
		$scope.status=[]; $scope.totalHoras=0;
		for (var j=0; j<=($scope.detail.length-1); j++){
			var diff = 0; 
			var dEnd = new Date($scope.detail[j].activityDate+'T'+$scope.detail[j].endTime);
			var dStart = new Date($scope.detail[j].activityDate+'T'+$scope.detail[j].startTime);
			diff = (dEnd - dStart);
			if (diff < 0) { diff=diff+24*60*60*1000 };
			$scope.totalHoras=$scope.totalHoras+diff;
		};
		if ($scope.totalHoras>0){
			var totalHoras = $filter('number')($scope.totalHoras/60/60/1000,1), tot = totalHoras*1, a=0, isHoliday=false;
			var dStart = new Date($filter('date')($scope.detail[0].activityDate, 'yyyy-MM-dd')+'T'+$filter('date')($scope.detail[0].startTime, 'HH:mm:ss'));
			var dEnd = new Date($filter('date')($scope.detail[$scope.detail.length-1].activityDate, 'yyyy-MM-dd')+'T'+$filter('date')($scope.detail[$scope.detail.length-1].endTime, 'HH:mm:ss'));
			$scope.t = []; 
			for (var k = 0; k <= $scope.overtime.length - 1; k++) {$scope.t[k] = 0};
			for (var k = 0; k <= $scope.overtime.length - 2; k++) {
				var oEnd = new Date($filter('date')(dStart, 'yyyy-MM-dd')+'T'+$filter('date')($scope.overtime[k].end, 'HH:mm:ss'));
				diff = $filter('number')((oEnd.getTime() - dStart.getTime())/60/60/1000,1)*1;
				if (dStart.getTime()<oEnd.getTime()){	if (tot>diff) {a=diff} else {a=tot}; tot=tot-a; dStart = oEnd} else if ($filter('number')(diff,0)*1==-16){a=tot};
				if (oEnd.getDay()==0||oEnd.getDay()==6||isHoliday) {$scope.t[$scope.overtime.length-1]=$scope.t[$scope.overtime.length-1]+a } else {$scope.t[k] = $scope.t[k] + a};
			}
			var totalDevengado=0;
			for (var k = 0; k <= $scope.overtime.length - 1; k++) {totalDevengado = totalDevengado + $scope.t[k]*(1+$scope.overtime[k].percent*1)*$scope.requests[i].salary/30/8};
			angular.extend($scope.requests[i], {t:$scope.t}, {totalHoras:totalHoras},{totDev:totalDevengado});
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
			$scope.showDetail=true; $scope.req=req; 
			$scope.loadDetail($scope.req);
		};
	$scope.loadDetail = function (req) {
			payrollService.fetch('GET','overDetail/'+req.id).then(function(response) {$scope.detail=response.data.data; $scope.calcOver(req.id)},function(response) {console.log('Error:',response)});
		};
	$scope.updateState = function(req){
		angular.extend(req,
			{decidedBy:$rootScope.user.id},
			{decisionDate:$filter('date')(new Date(),'yyyy-MM-dd hh:mm:ss')},
			{authorizedBy:0},
			{authorizationDate:''});
		payrollService.fetch('PUT','overReq',req)
		.then(function(response){
			$scope.showDetail=false;
			new Noty({text:response.data.message,type:response.type,theme:'relax',timeout:100,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}})
			.show();
			// .on('onClose', function() {
			// 	new Noty({text:"Send employee email", type: 'error', theme:'relax',timeout:100,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}})
			// 	.show();
			// });
		},function(response){console.log('Hubo un error!')});	
		};
	$scope.closeDetail = function (stateForm) {
		$scope.showDetail=false; 
		stateForm.$setUntouched(); stateForm.$setPristine();
		};
	$scope.notify = function () {
		$http.get('../hhrr/api/employeeBoss/'+$rootScope.user.employee).success(function (response) {new Noty({text:'Enviar notificación a...'+response.data.data[0].email, type: response.status==200 ? 'success' : 'error' ,theme:'relax',timeout:3000,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}}).show()});
		};
	$scope.run();
}

angular
.module('payrollApp')
.controller('overtimeApproveCtrl', ['$rootScope', '$scope', '$filter', '$http', '$state', 'payrollService', overtimeApproveCtrl]);
