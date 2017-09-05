'use strict';

function overtimePayrollCtrl($scope, $rootScope, $filter, $http, $state, payrollService) {
	$scope.initVars = function() {
		$scope.today = new Date();
		$scope.showPayroll = false;
		$scope.showReqs = false;
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
		$('input[name="daterange"]').daterangepicker({locale: { format: 'YYYY-MM-DD' },startDate: $scope.startDate}).on('change', function(e) {$scope.calcReqs(e.currentTarget.value);});
		};
	$scope.calcPayroll = function () {
		$scope.showPayroll=true;
		var este = $scope.requests[0].employeeId, totDev=0;
		$scope.payroll=[]; $scope.tot=[];
		for (var k = 0; k <= $scope.overtime.length - 1; k++) {$scope.tot[k]=0};
		$scope.payrollRecord={employeeId:este,firstName:$scope.requests[0].firstName,salary:$scope.requests[0].salary};
		for (var i = 0; i <= $scope.requests.length - 1; i++) {
			if ($scope.requests[i].employeeId!=este) {
				for (var j = 0; j <= $scope.overtime.length - 1; j++) {totDev=totDev+$scope.tot[j]};
				angular.extend($scope.payrollRecord, {tot:$scope.tot}, {totDev:totDev});	
				$scope.payroll.push($scope.payrollRecord);
				este = $scope.requests[i].employeeId; 
				$scope.tot=[]; $scope.totDev=0; totDev=0;
				for (var k = 0; k <= $scope.overtime.length - 1; k++) {$scope.tot[k]=0}; 
				$scope.payrollRecord={employeeId:este,firstName:$scope.requests[i].firstName,salary:$scope.requests[i].salary};
			};
			for (var k = 0; k <= $scope.overtime.length - 1; k++) {$scope.tot[k] = $scope.tot[k]+$scope.requests[i].u[k]};
		};
		for (var j = 0; j <= $scope.overtime.length - 1; j++) {totDev=totDev+$scope.tot[j]};
		angular.extend($scope.payrollRecord, {tot:$scope.tot}, {totDev:totDev});	
		$scope.payroll.push($scope.payrollRecord);
		// console.log($scope.payroll);
		$scope.initPayrollTable();
		};
	$scope.calcReqs = function (rango) {
		$scope.showPayroll=false; $scope.showState=false; $scope.requests = [];
		return $http.get('../hhrr/api/overtime').then(function (response) {$scope.overtime = response.data.data; $scope.loadRequests(rango)});
		};
	$scope.loadRequests = function (rango) {
		return $http.get('../hhrr/api/overReqByRange/'+rango)
		.then(function (response) {
			$scope.requests = response.data.data; 
			if ($scope.requests.length) {
				for (var i = 0; i <= $scope.requests.length - 1; i++) {$scope.calcDetail(i)};
				new Noty({text:'Calculando...',type:'info',layout:'topLeft',theme:'relax',timeout:750,progressBar:false,animation:{open:'animated fadeInDown',close:'animated fadeOutUp'}})
				.show()
				.on('onClose', function() {$('#planilla').collapse('show');$scope.showPrinter=true;$scope.initReqsTable();$scope.showReqs=true;});
			};
		}, function(response) {
			new Noty({text:response.data.message,type:'error',layout:'topLeft',theme:'relax',timeout:750,progressBar:false,animation:{open:'animated fadeInDown',close:'animated fadeOutUp'}}).show();
			$scope.showPayroll=false;
		});
		};
	$scope.calcDetail = function (i) {
		$http.get('../hhrr/api/overDetail/'+$scope.requests[i].id).then(function (response) {$scope.detail = response.data.data;$scope.calcOver(i)});
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
		var totalHoras = $filter('number')($scope.totalHoras/60/60/1000,1), tot = totalHoras*1, a=0, isHoliday=false;
		var dStart = new Date($filter('date')($scope.detail[0].activityDate, 'yyyy-MM-dd')+'T'+$filter('date')($scope.detail[0].startTime, 'HH:mm:ss'));
		var dEnd = new Date($filter('date')($scope.detail[$scope.detail.length-1].activityDate, 'yyyy-MM-dd')+'T'+$filter('date')($scope.detail[$scope.detail.length-1].endTime, 'HH:mm:ss'));
		$scope.t = []; $scope.u = [];  
		for (var k = 0; k <= $scope.overtime.length - 1; k++) {$scope.t[k] = 0;$scope.u[k] =0};
		for (var k = 0; k <= $scope.overtime.length - 2; k++) {
			var oEnd = new Date($filter('date')(dStart, 'yyyy-MM-dd')+'T'+$filter('date')($scope.overtime[k].end, 'HH:mm:ss'));
			diff = $filter('number')((oEnd.getTime() - dStart.getTime())/60/60/1000,1)*1;
			if (dStart.getTime()<oEnd.getTime()){	if (tot>diff) {a=diff} else {a=tot}; tot=tot-a; dStart = oEnd} else if ($filter('number')(diff,0)*1==-16){a=tot};
			// console.log('diff',diff,'tot',tot,$scope.overtime[k].name,'acum',a);
			if (oEnd.getDay()==0||oEnd.getDay()==6||isHoliday) {$scope.t[$scope.overtime.length-1]=$scope.t[$scope.overtime.length-1]+a } else {$scope.t[k] = $scope.t[k] + a};
			if (oEnd.getDay()==0||oEnd.getDay()==6||isHoliday) {$scope.u[$scope.overtime.length-1]=$scope.u[$scope.overtime.length-1]+a*(1+$scope.overtime[$scope.overtime.length-1].percent*1)*$scope.requests[i].salary/30/8} else { $scope.u[k] = $scope.u[k] +a*(1+$scope.overtime[k].percent*1)*$scope.requests[i].salary/30/8};
		}
		var totalDevengado=0;
		for (var k = 0; k <= $scope.overtime.length - 1; k++) {totalDevengado = totalDevengado + $scope.t[k]*(1+$scope.overtime[k].percent*1)*$scope.requests[i].salary/30/8};
		angular.extend($scope.requests[i], {t:$scope.t}, {u:$scope.u}, {totalHoras:totalHoras},{totDev:totalDevengado});
		};
	$scope.changeState = function(req){
		$scope.showDetail=true; $scope.req=req; $scope.enableUpdateButton=false;
		if (req==0){$scope.showState=false;$scope.showDetail=false;$scope.showPayroll=true} else {$scope.loadDetail($scope.req);$scope.showState=true};
		};
	$scope.loadDetail = function (req) {
		$http.get('../hhrr/api/overDetail/'+req.id).then(function (response) {$scope.detail = response.data.data;$scope.showReqs=true});
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
	$scope.initReqsTable = function() {
		console.log($scope.requests);
		if ($scope.instantiate>0){console.log($scope.instantiate);$('#reqsTable').DataTable().destroy()};
		$('#reqsTable').DataTable( {  
			data: $scope.requests,
			columns: [
				{data:'firstName',className:'text-left'},
				{data:'salary', render: function (data, type, row) {return $filter('number')(data,2)}},
				{data:'date',className:'text-left'},
				{data:'estimatedTime'},
				{data:'totalHoras'},
				{data:'t.0', render: function (data, type, row) {return data>0 ? $filter('number')(data,2) : '-' }},
				{data:'t.1', render: function (data, type, row) {return data>0 ? $filter('number')(data,2) : '-' }},
				{data:'t.2', render: function (data, type, row) {return data>0 ? $filter('number')(data,2) : '-' }},
				{data:'t.3', render: function (data, type, row) {return data>0 ? $filter('number')(data,2) : '-' }},
				{data:'totDev', render: function (data, type, row) {return $filter('number')(data,2)}}
				],
			"footerCallback": function ( row, data, start, end, display ) {
				var api = this.api(), data;
				var intVal = function ( i ) {return typeof i === 'string'  ? i.replace(/[\$,]/g, '')*1 : typeof i === 'number' ?  i : 0};
				var totI = api
				.column( 5, { page: 'current'} ).data().reduce( function (a, b) {return intVal(a) + intVal(b)}, 0 );
				$( api.column( 5 ).footer() ).html($filter('number')(totI, 2) );
				var totII = api
				.column( 6, { page: 'current'} ).data().reduce( function (a, b) {return intVal(a) + intVal(b)}, 0 );
				$( api.column( 6 ).footer() ).html($filter('number')(totII, 2) );
				var totIII = api
				.column( 7, { page: 'current'} ).data().reduce( function (a, b) {return intVal(a) + intVal(b)}, 0 );
				$( api.column( 7 ).footer() ).html($filter('number')(totIII, 2) );
				var totIV = api
				.column( 8, { page: 'current'} ).data().reduce( function (a, b) {return intVal(a) + intVal(b)}, 0 );
				$( api.column( 8 ).footer() ).html($filter('number')(totIV, 2) );
				var total = api
				.column( 9 ).data().reduce( function (a, b) {return intVal(a) + intVal(b)}, 0 );
				var pageTotal = api
				.column( 9, { page: 'current'} ).data().reduce( function (a, b) {return intVal(a) + intVal(b)}, 0 );
				$( api.column( 9 ).footer() ).html('L.'+$filter('number')(pageTotal, 2) +' de (L.'+ $filter('number')(total, 2) +' total)');
			},
		} ).draw();
		};
	$scope.initPayrollTable = function() {
		if ($scope.instantiate>0){console.log($scope.instantiate);$('#payrollTable').DataTable().destroy()};
		$('#payrollTable').DataTable( {  
			data: $scope.payroll,
			columns: [
				{data:'firstName',className:'text-left'},
				{data:'salary', render: function (data, type, row) {return $filter('number')(data,2)}},
				// {data: 'salary', render: function (data, type, row) {return (data/30/8).toFixed(2)}}, 
				{data: 'salary', render: function (data, type, row) {return $filter('number')(data/30/8,2)}}, 
				{data:'tot.0', render: function (data, type, row) {return data>0 ? $filter('number')(data,2) : '-' }},
				{data:'tot.1', render: function (data, type, row) {return data>0 ? $filter('number')(data,2) : '-' }},
				{data:'tot.2', render: function (data, type, row) {return data>0 ? $filter('number')(data,2) : '-' }},
				{data:'tot.3', render: function (data, type, row) {return data>0 ? $filter('number')(data,2) : '-' }},
				{data:'totDev', render: function (data, type, row) {return $filter('number')(data,2)}}
			],
			"footerCallback": function ( row, data, start, end, display ) {
				var api = this.api(), data;
				var intVal = function ( i ) {return typeof i === 'string'  ? i.replace(/[\$,]/g, '')*1 : typeof i === 'number' ?  i : 0};
				var totSal = api
				.column( 1, { page: 'current'} ).data().reduce( function (a, b) {return intVal(a) + intVal(b)}, 0 );
				$( api.column( 1 ).footer() ).html('L.'+$filter('number')(totSal, 2) );
				var totI = api
				.column( 3, { page: 'current'} ).data().reduce( function (a, b) {return intVal(a) + intVal(b)}, 0 );
				$( api.column( 3 ).footer() ).html('L.'+$filter('number')(totI, 2) );
				var totII = api
				.column( 4, { page: 'current'} ).data().reduce( function (a, b) {return intVal(a) + intVal(b)}, 0 );
				$( api.column( 4 ).footer() ).html('L.'+$filter('number')(totII, 2) );
				var totIII = api
				.column( 5, { page: 'current'} ).data().reduce( function (a, b) {return intVal(a) + intVal(b)}, 0 );
				$( api.column( 5 ).footer() ).html('L.'+$filter('number')(totIII, 2) );
				var totIV = api
				.column( 6, { page: 'current'} ).data().reduce( function (a, b) {return intVal(a) + intVal(b)}, 0 );
				$( api.column( 6 ).footer() ).html('L.'+$filter('number')(totIV, 2) );
				var total = api
				.column( 7 ).data().reduce( function (a, b) {return intVal(a) + intVal(b)}, 0 );
				var pageTotal = api
				.column( 7, { page: 'current'} ).data().reduce( function (a, b) {return intVal(a) + intVal(b)}, 0 );
				$( api.column( 7 ).footer() ).html('L.'+$filter('number')(pageTotal, 2) +' de (L.'+ $filter('number')(total, 2) +' total)');
			}
		} ).draw();
		$scope.instantiate++;
		$scope.showPayroll=true;
		};
	$scope.initVars();
};

angular
.module('payrollApp')
.controller('overtimePayrollCtrl', ['$rootScope', '$scope', '$filter', '$http', 'payrollService', overtimePayrollCtrl]);
