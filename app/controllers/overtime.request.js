'use strict';

function overtimeRequestCtrl($scope, $rootScope, $filter, $http, $state, payrollService, parametros) {

	$scope.initVars = function() {
		$scope.status=[];
		$scope.today = new Date();
		$scope.overtimeStart=parametros.data.data[0].Permitido;
		$scope.maxOverPerWeek=parametros.data.data[0].Semana;
		$scope.empName=parametros.data.data[0].Empleado;
		$scope.os = new Date($filter('date')($scope.today, 'yyyy-MM-dd')+'T'+$scope.overtimeStart);
		$scope.fecha = $filter('date')($scope.today, 'dd-MMMM-yyyy');
		$scope.hora = $scope.os;
		$scope.totalHorasDetalle = 0;
		$scope.requests=[];
		$scope.request = {id:'',employeeId:$rootScope.user.employee,date:'',startTime:'',estimatedTime:'',requestedBy:'',class:'Normal',description:'',state:'',decidedBy:'',decisionDate:'',authorizedBy:'',authorizationDate:'',payDate:'',observations:''};
		$scope.detail = [];
		$scope.activity = {id:'',requestId:'',entryDate:'',activityDate:'',startTime:'',startTimeStamp:'',endTime:'',endTimeStamp:'',activities:''};
		$scope.isAdmin=false;
		// $scope.showReqs=true;
		// $scope.showDetail=false;
		$scope.enableCloseButton=false;
		$scope.loadOvertime ();
		$scope.loadRequests();
		};
	$scope.loadOvertime = function () {
		payrollService.fetch('GET','overtime')
		.then(function(response) { $scope.overtime = response.data.data}, function(response) { new Noty({text:'Error... '+response.message,type:'error',theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show()});
		};
	$scope.loadRequests = function () { 
		if($rootScope.user.userName=='root' ){payrollService.fetch('GET','allOvertimeRequest').then(function(response){$scope.requests=response.data.data;$scope.isAdmin=true;$scope.calculate()},function(response){console.log('Hubo un error!')})}
		else{$http.get('../planilla/api/overReqById/'+$rootScope.user.employee).then(function (response) {$scope.requests=response.data.data;$scope.calculate();})};
		};
	$scope.loadDetail = function () {
		payrollService.fetch('GET','overDetail/'+$scope.activity.requestId).then(function(response){
			$scope.detail=response.data.data;
			var length = $scope.detail.length;
			if ($scope.detail.length){
				var startTime = $scope.detail[length-1].endTime;
				$scope.activity.startTime = new Date($filter('date')($scope.request.date, 'yyyy-MM-dd')+'T'+startTime);
				$scope.activity.endTime = new Date($filter('date')($scope.request.date, 'yyyy-MM-dd')+'T'+startTime);
				$scope.activity.endTime.setHours($scope.activity.endTime.getHours()+1);
				$scope.minStart = $scope.activity.startTime;
				$scope.minEnd = new Date($filter('date')($scope.request.date, 'yyyy-MM-dd')+'T'+$filter('date')($scope.activity.startTime, 'HH:mm:ss'));
				$scope.minEnd.setMinutes($scope.minEnd.getMinutes()+1);
				$scope.validateDetail();
			}
		},function(response){console.log('Error:',response)});
		};
	$scope.saveRequest = function (h) {
		$scope.request.startTime=$filter('date')(h, 'HH:mm:ss');
		$scope.request.date=$filter('date')($scope.today, 'yyyy-MM-dd');
		payrollService.fetch('POST','overReq',JSON.stringify($scope.request))
		.then(function(response){$scope.loadRequests();$scope.notifyBoss()},function(response){
			if(response.isValid==false){$state.go('login')}else{new Noty({text:'Error... '+response.data.message,type:'error',theme:'relax',timeout:3000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}})
			.show().on('onClose', function() {$('#overReqForm').modal('hide')})};
			});
		};
	$scope.notifyBoss = function () {
		$http.get('../planilla/api/employeeBoss/'+$rootScope.user.employee).then(function (response) {
			new Noty({text:'Su solicitud ha sido enviada a '+response.data.data[0].email, type: response.data.status==200 ? 'success' : 'error' ,theme:'relax',timeout:3000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}})
			.show().on('onClose', function() {$('#overReqForm').modal('hide')});
			//Hacer API para mandar el correo
		});
		};
	$scope.addRequest = function(frm){
		$scope.estado='';frm.$setPristine();frm.$setUntouched();
		$scope.request = {id:'',employeeId:$rootScope.user.employee,date:'',startTime:'',estimatedTime:'',requestedBy:'',class:'Normal',description:'',state:'',decidedBy:'',decisionDate:'',authorizedBy:'',authorizationDate:'',payDate:'',observations:''};
		$('#overReqForm').on('shown.bs.modal', function () { $('#estTime').focus()});
		};
	$scope.refreshScreen = function(frm) {
		$scope.estado='';frm.$setPristine();frm.$setUntouched();$scope.fillDetail($scope.request);
		};
	$scope.fillDetail = function(r){
		$scope.request = r;
		$scope.activity.requestId=r.id;
		$scope.fecha = $filter('date')(r.date, 'dd-MMMM-yyyy');
		$scope.hora = new Date($filter('date')(r.date, 'yyyy-MM-dd')+'T'+r.startTime);
		$scope.activity.startTime = $scope.hora;
		$scope.activity.startTime = $scope.hora;
		$scope.hora2 = new Date($filter('date')(r.date, 'yyyy-MM-dd')+'T'+r.startTime);
		$scope.hora2.setHours($scope.hora2.getHours()+1);
		$scope.activity.endTime = $scope.hora2;
		$scope.activity.activityDate = new Date($filter('date')(r.date, 'yyyy-MM-dd')+'T'+r.startTime);
		$scope.minStart = $scope.hora;
		$scope.minEnd = new Date($filter('date')(r.date, 'yyyy-MM-dd')+'T'+$filter('date')($scope.activity.startTime, 'HH:mm:ss'));
		$scope.minEnd.setMinutes($scope.minEnd.getMinutes()+1);
		$scope.loadDetail();
		};
	$scope.addDetailRow = function (detailForm) {
		$scope.activity.entryDate=$filter('date')(new Date(), 'yyyy-MM-dd');
		$scope.activity.activityDate=$filter('date')($scope.activity.activityDate, 'yyyy-MM-dd');
		$scope.activity.startTime=$filter('date')($scope.activity.startTime, 'HH:mm:ss');
		$scope.activity.endTime=$filter('date')($scope.activity.endTime, 'HH:mm:ss');
		payrollService.fetch('POST','overDetail',JSON.stringify($scope.activity)).then(function(response){$scope.loadDetail();document.getElementById("actDesc").focus()},function(response){if(response.isValid==false){$state.go('login')}else{new Noty({text:'Error... '+response.message,type:'error',theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show()}});
		$scope.enableCloseButton = true;
		$scope.resetAct();
		detailForm.$setUntouched();
		detailForm.$setPristine();
		};
	$scope.validateDetail = function() {
		$scope.status=[]; $scope.totalHoras=0;
		var startTime=$filter('date')($scope.activity.startTime, 'HH:mm:ss');
		for (var i=0; i<=($scope.detail.length-1); i++){
			var dStart = new Date($scope.detail[i].activityDate+'T'+$scope.detail[i].startTime);
			var dEnd = new Date($scope.detail[i].activityDate+'T'+$scope.detail[i].endTime);
			var diff = (dEnd - dStart);
			if (diff<0){ 
				diff=diff+24*60*60*1000;
				$scope.activity.activityDate = new Date($filter('date')($scope.detail[i].activityDate, 'yyyy-MM-dd')+'T'+$filter('date')($scope.activity.endTime, 'HH:mm:ss'));
				$scope.activity.activityDate.setDate($scope.activity.activityDate.getDate()+1);
			};
			$scope.totalHoras=$scope.totalHoras+diff;
		};
		var horas = $filter('number')($scope.totalHoras/60/60/1000,1); var estimado = $filter('number')($scope.request.estimatedTime,1);
		if ($scope.detail.length) { $scope.calcOver(); $scope.enableCloseButton=true };
		$scope.estado=angular.fromJson($scope.status); 
		if ($scope.request.state=='Cerrada'){
			$scope.enableCloseButton=false;
			// var texto = 'La solicitud está Cerrada. Tiene un total de '+horas+' horas. \n'; 
			// new Noty({text:texto,type:'warning',theme:'relax',timeout:4000,animation:{open:'animated fadeInDown',close:'animated fadeOutDown'}}).show();
		} else {
			horas=horas*1; estimado=estimado*1;
			// var texto = 'El detalle de actividades tiene '+horas+' horas. \n';
			if (horas>=estimado){
				// new Noty({text:texto,type:'warning',theme:'relax',timeout:4000,animation:{open:'animated fadeInDown',close:'animated fadeOutDown'}}).show();
				$scope.enableCloseButton=true;
			} else {
				var texto = 'El detalle tiene '+horas+' horas. \n\r'+'Por favor ingrese las actividades realizadas para completarlo.';
				// new Noty({text:texto ,type:'success',theme:'relax',timeout:2500,animation:{open:'animated fadeInDown',close:'animated fadeOutDown'}}).show();
			};
		}};
	$scope.calcOver = function() {
		var dStart = new Date($filter('date')($scope.detail[0].activityDate, 'yyyy-MM-dd')+'T'+$filter('date')($scope.detail[0].startTime, 'HH:mm:ss'));
		var dEnd = new Date($filter('date')($scope.detail[$scope.detail.length-1].activityDate, 'yyyy-MM-dd')+'T'+$filter('date')($scope.detail[$scope.detail.length-1].endTime, 'HH:mm:ss'));
		var tot = $scope.totalHoras*1; var diff = 0; var j = 0;
		$scope.t = []; $scope.u=0;
		for (j = 0; j <= $scope.overtime.length - 1; j++) {$scope.t[j] = 0};
		for (j = 0; j <= $scope.overtime.length - 2; j++) {
			var oStart = new Date($filter('date')(dStart, 'yyyy-MM-dd')+'T'+$filter('date')($scope.overtime[j].start, 'HH:mm:ss'));
			var oEnd = new Date($filter('date')(dStart, 'yyyy-MM-dd')+'T'+$filter('date')($scope.overtime[j].end, 'HH:mm:ss'));
			diff = oEnd.getTime() - dStart.getTime();
			if (diff < 0) {diff = diff+24*60*60*1000}; 
			tot = tot - diff; var horas = $filter('number')(diff/60/60/1000,1);
			$scope.t[j] = $scope.t[j] + horas*1;
			if (tot < 0) {$scope.t[j] = $scope.t[j] + $filter('number')(tot/60/60/1000,1)*1};
			if ($scope.t[j] < 0){ $scope.t[j] = 0};
			dStart = oEnd; 
		};
		for (j = 0; j <= $scope.overtime.length - 1; j++) {
			var $l=$scope.overtime[j].name+': '+$scope.t[j]; $scope.status.push($l);
		};
		var $l='Total: '+$filter('number')($scope.totalHoras/60/60/1000,1); $scope.status.push($l);
		};
	$scope.closeRequest = function() {
		$scope.request.state="Cerrada";
		angular.extend($scope.request,	{decidedBy:''}, {decisionDate:''}, {authorizedBy:''}, {authorizationDate:''});
		payrollService.fetch('PUT','overReq',$scope.request)
		.then(function(response){
			new Noty({text:response.message,type:response.type,theme:'relax',timeout:100,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}})
			.show()
			.on('onClose', function() {
				new Noty({text:"Send employee email", type: 'error', theme:'relax',timeout:100,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}})
				.show().on('onClose', function() { $scope.loadRequests(); $('#overDetailForm').modal('hide')});
				});
			},function(response){console.log('Hubo un error!',response)});	
			$scope.enableCloseButton=false;
		};
	$scope.closeDetail = function (detailForm) {
		// $scope.showDetail=false;
		detailForm.$setUntouched();
		detailForm.$setPristine();
		$scope.activity = {id:'',requestId:'',entryDate:'',activityDate:'',startTime:'',startTimeStamp:'',endTime:'',endTimeStamp:'',activities:''};
		$scope.estado='';
		$scope.enableCloseButton=false;
		// $scope.showList=true;
		};
	$scope.resetForm = function(frm) { 
		$scope.initVars(); frm.$setUntouched(); frm.$setPristine(); document.getElementById("1").focus();
		};
	$scope.resetAct = function() {
		$scope.activity.activityDate = new Date($scope.activity.activityDate+'T'+$scope.activity.startTime);
		$scope.activity.startTime = new Date($filter('date')($scope.activity.activityDate, 'yyyy-MM-dd')+'T'+$filter('date')($scope.activity.endTime, 'HH:mm:ss'));
		$scope.activity.endTime = new Date($filter('date')($scope.activity.activityDate, 'yyyy-MM-dd')+'T'+$filter('date')($scope.activity.startTime, 'HH:mm:ss'));
		$scope.activity.endTime.setHours($scope.activity.endTime.getHours()+1);
		$scope.minStart = new Date($filter('date')($scope.activity.activityDate, 'yyyy-MM-dd')+'T'+$filter('date')($scope.activity.startTime, 'HH:mm:ss'));
		$scope.minEnd = new Date($filter('date')($scope.activity.activityDate, 'yyyy-MM-dd')+'T'+$filter('date')($scope.activity.startTime, 'HH:mm:ss'));
		$scope.minEnd.setMinutes($scope.minEnd.getMinutes()+1);
		$scope.activity.activities=[];
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

	$scope.calcFooter = function() {};
	$scope.initVars();
	};

angular
.module('payrollApp')
.controller('overtimeRequestCtrl', ['$rootScope', '$scope', '$filter', '$http', '$state', 'payrollService', 'parametros', overtimeRequestCtrl]);
