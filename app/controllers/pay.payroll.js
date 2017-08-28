'use strict';
function payrollCtrl($scope, $filter, $http, editableOptions, editableThemes, $q, payrollService){

	//reset variables
	$scope.initVars = function(){
		$scope.payroll = {"idplanilla":"","idtipoplanilla":"","periodo":"1","fechainicio":"","fechafin":"","fechapago":"","estado":"3"};

		$scope.planilla={"idplanilla":"","idtipoplanilla":"","periodo":"1","fechainicio":"","fechafin":"","fechapago":"","estado":"3"};
		$scope.month="";
		$scope.titulo_planilla="";
		$scope.total=0;
		$scope.templates =
		[ { name: 'mantenimiento.html', url: '../rrhh/app/partial/rrhh/Recibo.tpl.html'}];
		$scope.templatesRecibo = $scope.templates[0];
		$scope.showPayroll=true;    
	};
	$scope.initVars();

	$scope.resetForm = function(){
		$scope.frm.$setUntouched();
		$scope.frm.$setPristine();
	};

	$scope.types=[];
	$scope.loadTypes = function () {return $scope.types.length ? null : $http.get('../planilla/api/payrolltypes').success(function (data) {$scope.types = data.data})};
	$scope.loadTypes();

	$scope.payrolls = [];
	$scope.loadPayrolls = function(){return $scope.payrolls.length ? null : $http.get('../planilla/api/payrolls').success(function (data) {$scope.payrolls = data.data})};
	$scope.loadPayrolls();

	$scope.employees = [];
	$scope.loadEmployees = function(){return $scope.employees.length ? null : $http.get('../planilla/api/employees').success(function (data) {$scope.employees = data.data})};
	$scope.loadEmployees();

	$scope.consulta_planilla = function(){
		new Noty({text:'falta consulta planilla, get all planillas!',type:'error',theme:'relax',timeout:2000,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show();
		ServicesRecusrsosHumanos.getAll("planillas")
		.then(function(resource){
			$scope.payrolls=resource.data.payrolls;
		}, function(error){
		});
	};

	$scope.genera_planilla = function(id){
		new Noty({text:'Noty: Generador de planillas!',type:'success',theme:'relax',timeout:750,animation:{open:'animated bounceInRight',close:'animated bounceOutRight'}}).show();
		return;

		switch ($scope.planilla.idtipoplanilla) {
			case '3':
			$scope.request="planilla/aguinaldo"
			break;
			case '4':
			$scope.request="planilla/aguinaldo";
			break;
			case '5':
			$scope.request="planilla/bono";
			break;
			case '6':
			$scope.request="planilla/horasextras";
			break;
			default:
			$scope.request="planilla";
		}
		$scope.typeSubmit=1;
		console.log("Generar Planilla...", $scope.request,JSON.stringify($scope.planilla));
		ServicesRecusrsosHumanos
		.fetch(JSON.stringify($scope.planilla),$scope.typeSubmit,$scope.request)
		.then(function(response){
			if(response.status == 200){
				alertify.success("Planilla Generada...");
			}
			else{
				if (response.status == 404){
					alertify.error("Planilla ya existe!");
				}else{
					alertify.error("Se produjo un error...");
					console.log(JSON.stringify(response));
				};
			};
			$scope.consulta();
		});
	};

	$scope.consulta = function(){
		$scope.fecha_pago=$filter('date')($scope.planilla.fechapago,"yyyy-MM-dd", 'UTC');
		$scope.get_payroll_header();
		$http({
			method: 'GET',
			url: '../rrhh/backend_rrhh/api/?_url=/planilla',
			params:{idtipoplanilla:$scope.planilla.idtipoplanilla,fechapago:$scope.fecha_pago}
		})
		.then(function successCallback(response) {
			$scope.payrolls=response.data.payrolls;
			$scope.getTotal();
			if ($scope.payrolls.length==0){alertify.alert("La planilla no existe. Utilice el boton para generar la planilla.")};
		}, function errorCallback(response) {
			alertify.error("Se produjo un error...");
		});
	};

	$scope.recibo=function(employee){
		$scope.showPayroll=false;
		$scope.idempleado=employee.idempleado;
		$scope.nombre=employee.nombre;
		$scope.puesto=employee.puesto;
		$scope.bruto=employee.bruto;
		$scope.ing=employee.Tot_Ing;
		$scope.ded=employee.Tot_Ded;
		$scope.Neto=employee.Neto;
		$scope.fecha_pago=$filter('date')($scope.planilla.fechapago,"yyyy-MM-dd", 'UTC');
		$scope.tipo_planilla=$scope.planilla.idtipoplanilla;
		$http({
			method: 'GET',
			url: '../rrhh/backend_rrhh/api/?_url=/rec_ing',
			params:{idtipoplanilla:$scope.tipo_planilla,fechapago:$scope.fecha_pago,idempleado:$scope.idempleado}
		})
		.then(function successCallback(response) {
			$scope.ingresos=response.data.ingresos;
			if ($scope.ingresos.length==0){alertify.alert("No hay datos...")};
		}, function errorCallback(response) {
			alertify.error("Se produjo un error...");
		});
		$http({
			method: 'GET',
			url: '../rrhh/backend_rrhh/api/?_url=/rec_ded',
			params:{idtipoplanilla:$scope.tipo_planilla,fechapago:$scope.fecha_pago,idempleado:$scope.idempleado}
		})
		.then(function successCallback(response) {
			$scope.deducciones=response.data.deducciones;
			if ($scope.deducciones.length==0){alertify.alert("No hay datos...")};
		}, function errorCallback(response) {
			alertify.error("Se produjo un error...");
		});
		ServicesRecusrsosHumanos.openModal(true, 400,750);
	};

	$scope.closeModal = function(){
		$scope.showPayroll=true;
		ServicesRecusrsosHumanos.openModal(false)
	};

	$scope.elimina_planilla = function(){
		var resp;
		$scope.typeSubmit=3;
		console.log("Eliminar Planilla...", JSON.stringify($scope.payrolls[0]));
		alertify.set({ labels: {
			ok     : "Aceptar",
			cancel : "Cancelar"
		} });
		alertify.confirm("Seguro que desea eliminar la planilla?", function (e) {
			if (e) {
				ServicesRecusrsosHumanos
				.fetch(JSON.stringify($scope.payrolls[0]),$scope.typeSubmit,"planillas")
				.then(function(response){
					if(response.status == 200){
						alertify.success("Planilla Eliminada...");
						$scope.initVars();
						$scope.getTotal();
						$scope.resetForm();
					}
					else{
						alertify.error("Se produjo un error...");
						console.log(JSON.stringify(response));
					};
				});
			} else {
				alertify.error("No la elimine!");
			}
		});
	};

	$scope.getTotal = function(){
		$scope.tot_salario=0;
		$scope.tot_bruto=0;
		$scope.tot_ingresos=0;
		$scope.tot_deducciones=0;
		$scope.total=0;
		angular.forEach($scope.payrolls, function(value, key){
			$scope.tot_salario+=parseFloat(value.salario);
			$scope.tot_bruto+=parseFloat(value.bruto);
			$scope.tot_ingresos+=parseFloat(value.Tot_Ing);
			$scope.tot_deducciones+=parseFloat(value.Tot_Ded);
			$scope.total+=parseFloat(value.Neto);
		});
		return
	}

	$scope.aplicar_cambios = function(){
		alertify.success("Aplicando cambios...");
		$scope.typeSubmit=3;
		ServicesRecusrsosHumanos
		.fetch(JSON.stringify($scope.payrolls[0]),$scope.typeSubmit,"planillas")
		.then(function(response){
			if(response.status == 200){
				$scope.genera_planilla();
			}else{
				alertify.error("Se produjo un error...");
				console.log(JSON.stringify(response));
			};
		});
	}; 

	$scope.get_payroll_header = function(){
		var M = $filter('date')($scope.planilla.fechapago,"M", 'UTC');
		switch(M){
			case "1": $scope.month = "Enero"; break;
			case "2": $scope.month = "Febrero"; break;
			case "3": $scope.month = "Marzo"; break;
			case "4": $scope.month = "Abril"; break;
			case "5": $scope.month = "Mayo"; break;
			case "6": $scope.month = "Junio"; break;
			case "7": $scope.month = "Julio"; break;
			case "8": $scope.month = "Agosto"; break;
			case "9": $scope.month = "Septiembre"; break;
			case "10": $scope.month = "Octubre"; break;
			case "11": $scope.month = "Noviembre"; break;
			case "12": $scope.month = "Diciembre";
		};
		$scope.titulo_planilla=$('#tit option:selected').text()+" "+$scope.month;
	};
	};
	angular
	.module('payrollApp')
	.controller('payrollCtrl', ['$scope', '$filter', '$http', '$q', 'payrollService', payrollCtrl]);