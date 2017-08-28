'use strict';

function chartsCtrl($scope, $rootScope, $http, $filter, $state, payrollService) {
	Chart.defaults.global.defaultColor = '#00aabb';
	Chart.defaults.global.defaultFontFamily = '"Trebuchet MS", "Verdana", "Arial", sans-serif';
	Chart.defaults.global.defaultFontSize = 10;
	Chart.defaults.global.tooltips.titleFontSize = 12;
	Chart.defaults.global.tooltips.bodyFontSize = 12;
	Chart.defaults.global.title.display = true;
	$scope.showBarChart=false;
	$scope.showLineChart=false;
	$scope.bar=[];
	$scope.line=[];
	$scope.setColor= function() {
		if($scope.showBarChart){
			$scope.showBarChart=!$scope.showBarChart;
			$scope.showBar();
		}else{
			$scope.showLineChart=!$scope.showLineChart;
			$scope.showLine();
		}
		};
	$('#cp').colorpicker({align:'right' }).on('changeColor', function(e) {$scope.myColor=e.color.toString('hex');$scope.setColor();});
	$scope.barGraph = function() {
		$scope.labels=[];$scope.data=[];$scope.data2=[];
		for (var i = $scope.bar.length; i--;){
			$scope.labels.push($scope.bar[i].Usuario);
			$scope.data.push($scope.bar[i].Horas);
			$scope.data2.push($scope.bar[i].Solicitudes);
		};
		var ctx = document.getElementById('barChart').getContext('2d');
		var chart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels:$scope.labels,
				datasets:[{label: 'Horas Extras', backgroundColor:$scope.myColor, data:$scope.data}]
			},
			options: {title:{text:'Horas Extras por Empleado, '+$filter('date')($scope.clock, 'MMMM')}}
			});
		};
	$scope.lineGraph = function() {
		$scope.labels=[];$scope.data=[];$scope.data2=[];
		var horas=0;
		var i=0;
		for (i = 0; i < $scope.line.length; i++){
			$scope.labels.push($filter('date')($scope.line[i].date, 'd-MMM'));
			$scope.data.push($scope.line[i].Horas); 
			horas=horas+($scope.line[i].Horas-0);
			$scope.data2.push(horas);
		};
		var ctx = document.getElementById('lineChart').getContext('2d');
		var chart = new Chart(ctx, {
			type: 'line',
			data: {
				labels : $scope.labels,
				datasets : [
					{label: 'Diario', backgroundColor: 'rgba(220,220,220,0.2)', borderWidth:1, data:$scope.data},
					{label: 'Acumulado', backgroundColor: $scope.myColor , borderWidth:1,data:$scope.data2}
				]},
			options: {title:{text:'Horas Extras por Día'}}
			});
		};
	$scope.loadBarData = function () {return  $http.get('../planilla/api/overtimeBar').then(function (response) {$scope.bar = response.data.data;$scope.barGraph()})};
	$scope.loadLineData = function () {return  $http.get('../planilla/api/overtimeLine').then(function (response) {$scope.line = response.data.data;$scope.lineGraph()})};
	$scope.showBar = function	(){
		$scope.showBarChart=!$scope.showBarChart;
		$scope.showLineChart=false;
		$scope.graphTitle = "Horas Extras por Empleado, "+$filter('date')($scope.clock, 'MMMM');
		$scope.barOptions = {scaleShowGridLines: false,barShowStroke: false};
		angular.extend($scope.barOptions, $scope.globalOptions);
		$scope.bar=[];
		$scope.loadBarData();
		};
	$scope.showLine = function (){
		$scope.showBarChart=false;
		$scope.showLineChart=!$scope.showLineChart;
		$scope.graphTitle = "Horas Extras por Día, "+ $filter('date')($scope.clock, 'MMMM');
		$scope.lineOptions = {scaleShowGridLines: false,bezierCurve: true,pointDotRadius: 2,datasetStrokeWidth: 1};
		angular.extend($scope.lineOptions, $scope.globalOptions);
		$scope.line =[];
		$scope.loadLineData();
		};
};

angular
.module('payrollApp')
.controller('chartsCtrl', ['$scope', '$rootScope', '$http', '$filter', '$state', 'payrollService', chartsCtrl]);
