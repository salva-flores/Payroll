'use strict';

function employeeDeductionCtrl($scope, $rootScope, $http, $filter, $state, payrollService) { 
	$scope.run=function(){
		document.getElementById("1").focus();
		$scope.initVars();
		};
	$scope.initVars=function(){
		$scope.showEmpDeds=false; $scope.showAddDed=false;$scope.employees=[];$scope.deductions=[];$scope.empDeds=[];$scope.isEditing=false;
		$http.get('../hhrr/api/getAll/MainEmployee').then(function(response){$scope.employees = response.data.data}, function(response){ console.log('Hubo un error al cargar los Empleados!')});
		// $http.get('../hhrr/api/getAll/CatDeduction').then(function (response) {$scope.deductions = response.data.data});
		};
	$scope.showEmpDed=function(id){
		payrollService.checkToken().then(function(response){},function(response){$state.go('login')});
		$scope.showEmpDeds=true;
		$http.get('../hhrr/api/getAll/CatDeduction').then(function (response) {
			$scope.deductions = response.data.data; 
			$http.get('../hhrr/api/dedByEmp/'+id).then(function(response){
				$scope.empDeds=response.data.data; $scope.disableOptions();
				if(!$scope.empDeds.length){new Noty({text:'No hay datos.', type:'info',theme:'relax',timeout:100,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show().on('onClose', function() {});}
				}, function(response){ console.log('Hubo un error al cargar las deducciones del empleado!')});
			});
		};
	$scope.disableOptions = function() {//Para deshabilitar opciones del combo box al momento de agregar deducciones... 
		angular.forEach($scope.empDeds, function(value, key){
			var ded=value.deduction;
			angular.forEach($scope.deductions, function(value, key){if (ded == value.id){angular.extend(value, {isAssigned:'1'})}else{};  }  )});
		};
	$scope.addDed=function(id){
		$scope.action='POST';$scope.isAdding=true;$scope.showAddDed=true;$scope.isEditing=false;
		$scope.inserted = {id:'', amount:'', balance: '', deduction:'', employee:id, fees:'', feesPayed:'', isActive:'1', isFirst:'0', isSecond:'0', start:'', totalDebt:''};
		$scope.ded = $scope.inserted;
		$scope.addDedFrm.$setUntouched();
		$scope.addDedFrm.$setPristine();
		document.getElementById("1").focus();
		// $scope.empDeds.push($scope.inserted); enable if using x-editable
		$('#addDedFrm').modal('show')
		};
	$scope.editDed=function(d,i,j){console.log(d,i,j);
		$scope.action='PUT';$scope.ded=d;$scope.isEditing=true;
		$scope.ded.amount=$scope.ded.amount*1; $scope.ded.fees=$scope.ded.fees*1; $scope.ded.start=new Date($filter('date')($scope.ded.start, 'yyyy-MM-dd')+'T'+$filter('date')("00:00:00" , 'HH:mm:ss')); $scope.ded.feesPayed=$scope.ded.feesPayed*1; $scope.ded.totalDebt=$scope.ded.totalDebt*1; $scope.ded.balance=$scope.ded.balance*1;
		// $scope.ded.isFirst*1==0?$scope.d.isFirst=false:$scope.d.isFirst=true;
		// $scope.ded.isSecond*1==0?$scope.d.isSecond=false:$scope.d.isSecond=true;
		if (j==1){$('#addDedFrm').modal('show')}
		};
	$scope.showDeduction = function (d) {
		if (d.deduction && $scope.deductions.length) {
		 var selected = $filter('filter')($scope.deductions, {id: d.deduction}); 
		 return selected.length ? selected[0].name : 'Vacío';}
		else {return d.deduction || 'Sin Asignar';	}
		};
	$scope.checkDed = function(ded,f) {
		// angular.forEach($scope.empDeds, function(value, key){if (ded == value.deduction){console.log('Ya tiene',$scope.showDeduction(value));return 'Ya tiene'}}); 
		};
	$scope.removeDed = function (index) {
			$scope.empDeds.splice(index, 1);
		};		
	$scope.validateDed=function(data){
		console.log('Validate:',data);
		if (!data) {return 'Campo requerido'};
	};
	$scope.saveDed=function(){
		// if ($scope.ded.isFisrt){$scope.ded.isFirst='1'}else{$scope.ded.isFirst='0'};
		// if ($scope.ded.isSecond){$scope.ded.isSecond='1'}else{$scope.ded.isSecond='0'};
		$scope.ded.balance=$scope.ded.balance*1;$scope.ded.feesPayed=$scope.ded.feesPayed*1;$scope.ded.totalDebt=$scope.ded.totalDebt*1;
		console.log($scope.action,$scope.ded);
		if ($scope.action=='PUT'){
			payrollService.fetch('PUT','empDed',$scope.ded)
			.then(function(response){	new Noty({text:'Registro modificado',type:'success',theme:'relax',timeout:1000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show().on('onShow', function(){})}
			,function(response){if(response.isValid==false){$state.go('login')}else{new Noty({text:'Error... '+response.data.message,type:'error',theme:'relax',timeout:1000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show().on('onClose', function(){})}});
			}else{
			payrollService.fetch('POST','empDed',$scope.ded)
			.then(function(response){	new Noty({text:'Registro agregado',type:'success',theme:'relax',timeout:1000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show().on('onShow', function(){$scope.empDeds.push($scope.inserted)})}
			,function(response){if(response.isValid==false){$state.go('login')}else{new Noty({text:'Error... '+response.data.message,type:'error',theme:'relax',timeout:1000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show().on('onClose', function(){})}});
			};
		$scope.showAddDed=false;
		$('#addDedFrm').modal('hide')
		};

	$scope.run();
};

angular
.module('payrollApp')
.controller('employeeDeductionCtrl', ['$scope', '$rootScope', '$http', '$filter', '$state', 'payrollService', employeeDeductionCtrl]);


// Las deducciones tienen los siguientes atributos
// 1. el valor o porcentaje. Si es un porcentaje hay que especificar a que ingreso le aplica? puede ser del salario nominal, ingreso neto o bruto, ingreso por ventas o comisiones,,, 
// 2. periodicidad: cada cuanto se calcula la deduccion. semanal, quincenal o mensual
// 3. que puede ser permanente o por un numero finito de pagos. 
// 4. la fecha en que inicia a procesarce la deduccion, cuando es un numero finito de pagos.
// 5. EL monto total de la deuda
// 6. Cada vez que se hace la deduccion, se actualiza el saldo de la misma asi como el numero de cuotas pagadas



// 1. Una cuota fija, permanente o recurrente indefinidamente, por ejemplo un AFP
// 2. Un porcentaje que se aplica al salario del empleado que 
// 3. Una cuota fija por determinado numero de cuotas, por ejemplo el pago del Impuesto municipal o una letra de la cooperativa

