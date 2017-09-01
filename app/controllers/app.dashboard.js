'use strict';

function dashboardCtrl($scope, $rootScope, $http, $filter, $state, payrollService, parametros) { 

	

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
};

angular
.module('payrollApp')
.controller('dashboardCtrl', ['$scope', '$rootScope', '$http', '$filter', '$state', 'payrollService', 'parametros', dashboardCtrl]);
