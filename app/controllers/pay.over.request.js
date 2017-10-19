'use strict';
/*
Reglas del negocios a considerar. Verificación en HHEE.
- Maximo de Horas Extras a la semana [Default: Ley, admin] ok-en el catalogo de jornadas de trabajo
- No tener solicitudes abiertas. Esta validacion es requerida al momento de hacer la solicitud -pendiente.
- Requiere aprobación si está en horario habil - pendiente.
- Quien Aprueba [Default : Jefe inmediato, Definido por el admin] definir Roles (por el momento el sistema busca al jefe inmediato del empleado.) 
- Quien Autoriza [Default: Gerente General, Definido por el admin] definir Roles (por el momento el sistema busca al gerente general)
*/
function overtimeRequestCtrl($scope, $rootScope, $filter, $http, $state, payrollService, parametros) {
	$scope.run = function(){
		$scope.initVars();
		// $scope.loadOvertime();
		};
	$scope.initVars = function() {
		$scope.status=[];
		$scope.today = new Date();
		if ($scope.user.userName=='root'){$scope.overtimeStart='';$scope.maxOverPerWeek='16';$scope.empName=''}else{$scope.overtimeStart=parametros.data.data[0].Permitido;$scope.maxOverPerWeek=parametros.data.data[0].Semana;$scope.empName=parametros.data.data[0].Empleado	};
		$scope.os = new Date($filter('date')($scope.today, 'yyyy-MM-dd')+'T'+$scope.overtimeStart);
		$scope.fecha = $filter('date')($scope.today, 'dd-MMMM-yyyy');
		$scope.hora = $scope.os;
		$scope.totalHorasDetalle = 0;
		$scope.requests=[];
		$scope.request = {id:'',employeeId:$rootScope.user.employee,date:'',startTime:'',estimatedTime:'',requestedBy:'',class:'Normal',description:'',state:'',decidedBy:'',decisionDate:'',authorizedBy:'',authorizationDate:'',payDate:'',observations:''};
		$scope.detail = [];
		$scope.activity = {id:'',requestId:'',entryDate:'',activityDate:'',startTime:'',startTimeStamp:'',endTime:'',endTimeStamp:'',activities:''};
		$scope.isAdmin=false;
		$scope.showReqs=false;
		$scope.enableCloseButton=false;
		$scope.email={}; 
		$scope.email.from='sflores@hngsystems.com'; $scope.email.name='Admin'; $scope.email.email='';  $scope.email.subject='Solicitud de Horas Extras'; $scope.email.message='Tiene una solicitud de Horas Extras.';
		$scope.holidays=[];
		$http.get('../hhrr/api/getAll/CatHoliday').then(function(response){ $scope.holidays = response.data.data; $scope.loadOvertime(); },function(response){console.log('Hubo un error al cargar el Catálogo de Feriados!')});
		};
	$scope.loadOvertime = function () {
		payrollService.fetch('GET','overtime').
		then(function(response){$scope.overtime=response.data.data;$scope.loadRequests()},
		function(response){new Noty({text:'Error... '+response.message,type:'error',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show()});
		};
	$scope.loadRequests = function () { 
		if($rootScope.user.userName=='root' || $rootScope.user.profile=='1'){payrollService.fetch('GET','allOvertimeRequest').then(function(response){$scope.requests=response.data.data;$scope.isAdmin=true;$scope.calculate()},function(response){console.log('Hubo un error!')})}
		else{$http.get('../hhrr/api/overReqById/'+$rootScope.user.employee).then(function (response) {$scope.requests=response.data.data;$scope.calculate()})};
		};
	$scope.calculate = function () {
		if ($scope.requests.length) {for (var i = 0; i <= $scope.requests.length - 1; i++) {$scope.calcDetail(i)}};
		};
	$scope.calcDetail = function (i) {
		$http.get('../hhrr/api/overDetail/'+$scope.requests[i].id).then(function(response){$scope.detail=response.data.data;$scope.calcOver(i);$scope.showReqs=true});
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
			angular.forEach($scope.holidays, function(value, key){if (dEnd.getDate()*1==value.day*1 && dEnd.getMonth()*1+1==value.month*1){isHoliday=true}}); 
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
	$scope.calcFooter = function() {};
	$scope.addRequest = function(frm){
		$scope.estado='';frm.$setPristine();frm.$setUntouched();
		$scope.request = {id:'',employeeId:$rootScope.user.employee,date:'',startTime:'',estimatedTime:'',requestedBy:'',class:'Normal',description:'',state:'',decidedBy:'',decisionDate:'',authorizedBy:'',authorizationDate:'',payDate:'',observations:''};
		$('#overReqForm').on('shown.bs.modal', function () { $('#reqDate').focus()});
		};
	$scope.saveRequest = function (h) {
		$scope.request.startTime=$filter('date')(h, 'HH:mm:ss');
		// $scope.request.date=$filter('date')($scope.today, 'yyyy-MM-dd'); se comenta y se agrega la siguiente linea para habilitar el ingreso de otras fechas.
		$scope.request.date=$filter('date')($scope.request.date, 'yyyy-MM-dd');
		payrollService.fetch('POST','overReq',JSON.stringify($scope.request))
		.then(function(response){$scope.loadRequests();$scope.notifyBoss();
			new Noty({text:'Registro agregado',type:'success',theme:'relax',timeout:1000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}})
			.show().on('onClose', function() {$('#overReqForm').modal('hide')});
		},function(response){
			if(response.isValid==false){$state.go('login')}else{new Noty({text:'Error... '+response.data.message,type:'error',theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}})
			.show().on('onClose', function() {$('#overReqForm').modal('hide')})};
			});
		};
	$scope.notifyBoss = function () {
		$http.get('../hhrr/api/employeeBoss/'+$rootScope.user.employee).then(function (response) {
			$scope.email.email=response.data.data[0].email;
			$http({	method : 'POST', url : 'api/sendMail.php', data : $.param($scope.email), headers : { 'Content-Type': 'application/x-www-form-urlencoded' }})
			.then(function(response){	
				console.log('then',response);
				new Noty({text:'Su solicitud ha sido enviada a '+response.data.data[0].email, type: response.data.status==200 ? 'success' : 'error' ,theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}})
				.show().on('onClose', function() {$('#overReqForm').modal('hide')});
			}, function (response){
				console.log('error...',response);
			});
		});
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
		// var horas = $filter('number')($scope.totalHoras/60/60/1000,1), estimado = $filter('number')($scope.request.estimatedTime,1);
		if ($scope.detail.length) { $scope.enableCloseButton=true };
		if ($scope.request.state=='Cerrada'){$scope.enableCloseButton=false}
		// else {horas=horas*1; estimado=estimado*1;	if (horas>=estimado){$scope.enableCloseButton=true}};
		};
	$scope.closeRequest = function() {
		$scope.request.state="Cerrada";
		angular.extend($scope.request,	{decidedBy:''}, {decisionDate:''}, {authorizedBy:''}, {authorizationDate:''});
		payrollService.fetch('PUT','overReq',$scope.request)
		.then(function(response){
			new Noty({text:response.message,type:response.type,theme:'relax',timeout:100,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}})
			.show();
			// .on('onClose', function() {
			// 	new Noty({text:"Send employee email", type: 'error', theme:'relax',timeout:100,animation:{open:'animated bounceInRight',close:'animated bounceOutLeft'}})
			// 	.show().on('onClose', function() { $scope.loadRequests(); $('#overDetailForm').modal('hide')});
			// 	});
			},function(response){console.log('Hubo un error!',response)});	
			$scope.enableCloseButton=false;
		};
	$scope.closeDetail = function (detailForm) {
		$scope.showDetailRow=false;
		$scope.showDetail=false;
		detailForm.$setUntouched();
		detailForm.$setPristine();
		$scope.activity = {id:'',requestId:'',entryDate:'',activityDate:'',startTime:'',startTimeStamp:'',endTime:'',endTimeStamp:'',activities:''};
		$scope.estado='';
		$scope.enableCloseButton=false;
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
	$scope.run();
	};

angular
.module('payrollApp')
.controller('overtimeRequestCtrl', ['$rootScope', '$scope', '$filter', '$http', '$state', 'payrollService', 'parametros', overtimeRequestCtrl]);
