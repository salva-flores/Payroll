'use strict';

function dashboardCtrl($scope, $rootScope, $http, $filter, $state, payrollService, parametros) { 
/*
	$scope.run = function () {
		$scope.initVars();
		$scope.loadOvertime();
		$scope.loadRequests('');
		};
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
		$scope.rango='';
		$scope.isAdmin=false;
		$scope.showReq=false;
		$scope.showReqs=true;
		$scope.showDetail=false;
		$scope.showState=false;
		$scope.showPayroll=false;
		$scope.showPeriod=false;
		$scope.enableCloseButton=false;
		};
	$scope.loadOvertime = function () {
		payrollService.fetch('GET','overtime')
		.then(function(response) { $scope.overtime = response.data.data}, function(response) { new Noty({text:'Error... '+response.message,type:'error',theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show()});
		};
	$scope.loadRequests = function (rango) {
		// console.log(rango);
		// if (rango!=''){$http.get('../hhrr/api/overReqByRange/'+rango).then(function(response){$scope.requests=response.data.data;$scope.calcReq()},function(response){console.log('Hubo un error!')})} 
		// else
		 if($rootScope.user.userName=='root' ){payrollService.fetch('GET','allOvertimeRequest').then(function(response){$scope.requests=response.data.data;$scope.isAdmin=true; $scope.calcReq()},function(response){console.log('Hubo un error!')})}
		else{$http.get('../hhrr/api/overReqById/'+$rootScope.user.employee).then(function (response) {$scope.requests=response.data.data;$scope.isAdmin=false;$scope.calcReq()})};
		};
	$scope.calcPayroll = function (rango) {
		$scope.showPayroll=false;
		$scope.showState=false;
		$scope.requests = [];
		return $http.get('../hhrr/api/overtime').then(function (response) {$scope.overtime = response.data.data; $scope.loadRequests(rango)});
		};
	$scope.calcReq = function () {
		if ($scope.requests.length) { 
			for (var i = 0; i <= $scope.requests.length - 1; i++) {$scope.calcDet(i)};
		}};
	$scope.calcDet = function (i) {
		return $http.get('../hhrr/api/overDetail/'+$scope.requests[i].id).then(function (response) {$scope.detail = response.data.data;	$scope.calcRow(i)});
		};
	$scope.calcRow = function(i) {
		$scope.status=[]; $scope.totalHoras=0;
		for (var j=0; j<=($scope.detail.length-1); j++){
			var diff = 0; 
			var dEnd = new Date($scope.detail[j].activityDate+'T'+$scope.detail[j].endTime);
			var dStart = new Date($scope.detail[j].activityDate+'T'+$scope.detail[j].startTime);
			diff = (dEnd - dStart);
			if (diff < 0) { diff=diff+24*60*60*1000 };
			$scope.totalHoras=$scope.totalHoras+diff;
		};
		if ($scope.detail.length){
			var totalHoras = $filter('number')($scope.totalHoras/60/60/1000,1), tot = totalHoras*1, a=0, isHoliday=false;
			var dStart = new Date($filter('date')($scope.detail[0].activityDate, 'yyyy-MM-dd')+'T'+$filter('date')($scope.detail[0].startTime, 'HH:mm:ss'));
			var dEnd = new Date($filter('date')($scope.detail[$scope.detail.length-1].activityDate, 'yyyy-MM-dd')+'T'+$filter('date')($scope.detail[$scope.detail.length-1].endTime, 'HH:mm:ss'));
			$scope.t = []; 
			for (var k = 0; k <= $scope.overtime.length - 1; k++) {$scope.t[k] = 0};
			for (var k = 0; k <= $scope.overtime.length - 2; k++) {
				var oEnd = new Date($filter('date')(dStart, 'yyyy-MM-dd')+'T'+$filter('date')($scope.overtime[k].end, 'HH:mm:ss'));
				diff = $filter('number')((oEnd.getTime() - dStart.getTime())/60/60/1000,1)*1;
				if (dStart.getTime()<oEnd.getTime()){	if (tot>diff) {a=diff} else {a=tot}; tot=tot-a; dStart = oEnd} else if (diff==-16){a=tot};
				if (oEnd.getDay()==0||oEnd.getDay()==6||isHoliday) {$scope.t[$scope.overtime.length-1]=$scope.t[$scope.overtime.length-1]+a } else {$scope.t[k] = $scope.t[k] + a};
			}
		}
		var totalDevengado=0;
		for (var k = 0; k <= $scope.overtime.length - 1; k++) {totalDevengado = totalDevengado + $scope.t[k]*(1+$scope.overtime[k].percent*1)*$scope.requests[i].salary/30/8};
		angular.extend($scope.requests[i], {t:$scope.t}, {totalHoras:totalHoras},{totDev:totalDevengado});
		};
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
		})};
	$scope.addReq = function(frm){
		$scope.estado='';
		$scope.resetForm(frm);
		showReq=true;
		$scope.request = {id:'',employeeId:$rootScope.user.employee,date:'',startTime:'',estimatedTime:'',requestedBy:'',class:'Normal',description:'',state:'',decidedBy:'',decisionDate:'',authorizedBy:'',authorizationDate:'',payDate:'',observations:''};
		};
	$scope.saveReq = function (h) {
		$scope.request.startTime=$filter('date')(h, 'HH:mm:ss');
		$scope.request.date=$filter('date')($scope.today, 'yyyy-MM-dd');
		payrollService.fetch('POST','overReq',JSON.stringify($scope.request))
		.then(function(response){$scope.loadRequests();$scope.notifyBoss();showReq=false},function(response){
			if(response.isValid==false){$state.go('login')}else{new Noty({text:'Error... '+response.data.message,type:'error',theme:'relax',timeout:3000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}})
			.show().on('onClose', function() {showReq=false})};
			});
		};
	$scope.notifyBoss = function () {
		$http.get('../hhrr/api/employeeBoss/'+$rootScope.user.employee).then(function (response) {
			new Noty({text:'Su solicitud ha sido enviada a '+response.data.data[0].email, type: response.data.status==200 ? 'success' : 'error' ,theme:'relax',timeout:3000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}})
			.show().on('onClose', function() {$('#overReqForm').modal('hide')});
		});
		};
	$scope.changeState = function(req) {
		$scope.req=req;
		$scope.loadDetail($scope.req);
		$scope.showDetail=true; 
		$scope.showState=true;
		};
	$scope.updateState = function(req,s){
		if (s=='Aprobada') {angular.extend(req,{decidedBy:$rootScope.user.id},{decisionDate:$filter('date')(new Date(),'yyyy-MM-dd hh:mm:ss')},{authorizedBy:0},{authorizationDate:''})} 
		else if (s=='Autorizada') {angular.extend(req,{authorizedBy:$rootScope.user.id},{authorizationDate:$filter('date')(new Date(),'yyyy-MM-dd hh:mm:ss')})};
		payrollService.fetch('PUT','overReq',req)
		.then(function(response){
			$scope.loadRequests();	
			new Noty({text:response.data.message,type:response.type,theme:'relax',timeout:100,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}})
			.show()
			.on('onClose', function() {
				new Noty({text:"Send employee email", type: 'error', theme:'relax',timeout:100,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}})
				.show();
				$scope.showState=false;$scope.showDetail=false;
			});
		},function(response){console.log('Hubo un error!')});	
		};
	$scope.addDetail = function(r){
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
		$showDetail=true;
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
			var texto = 'La solicitud está Cerrada. Tiene un total de '+horas+' horas. \n'; 
			new Noty({text:texto,type:'warning',theme:'relax',timeout:4000,animation:{open:'animated fadeInDown',close:'animated fadeOutDown'}}).show();
		} else {
			horas=horas*1; estimado=estimado*1;
			var texto = 'El detalle de actividades tiene '+horas+' horas. \n';
			if (horas>=estimado){
				new Noty({text:texto,type:'warning',theme:'relax',timeout:4000,animation:{open:'animated fadeInDown',close:'animated fadeOutDown'}}).show();
				$scope.enableCloseButton=true;
			} else {
				var texto = 'El detalle tiene '+horas+' horas. \n\r'+'Por favor ingrese las actividades realizadas para completarlo.';
				new Noty({text:texto ,type:'success',theme:'relax',timeout:2500,animation:{open:'animated fadeInDown',close:'animated fadeOutDown'}}).show();
			};
		}};
	$scope.closeRequest = function() {
		$scope.request.state="Cerrada";
		payrollService.fetch('PUT','overReq',$scope.request)
		.then(function(response){
			$scope.loadRequests();	
			new Noty({text:response.message,type:response.type,theme:'relax',timeout:100,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}})
			.show()
			.on('onClose', function() {
				new Noty({text:"Send employee email", type: 'error', theme:'relax',timeout:100,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}})
				.show().on('onClose', function() { showDetail=false});
				});
			},function(response){console.log('Hubo un error!',response)});	
		$scope.enableCloseButton=false;
		};
	$scope.closeDetail = function (detailForm) {
		$scope.showDetail=false;
		$scope.enableCloseButton=false;
		detailForm.$setUntouched();
		detailForm.$setPristine();
		$scope.activity = {id:'',requestId:'',entryDate:'',activityDate:'',startTime:'',startTimeStamp:'',endTime:'',endTimeStamp:'',activities:''};
		$scope.estado='';
		};
	$scope.resetForm = function () {
	};
	$('input[name="daterange"]').daterangepicker({locale: { format: 'YYYY-MM-DD' },startDate: $scope.startDate}).on('change', function(e) {$scope.calcPayroll(e.currentTarget.value)});
	$scope.run();
*/
};

angular
.module('payrollApp')
.controller('dashboardCtrl', ['$scope', '$rootScope', '$http', '$filter', '$state', 'payrollService', 'parametros', dashboardCtrl]);
