'use strict';

function catCompanyCtrl($scope, $filter, $http, editableOptions, editableThemes, $q) {
	var api_url="../../api/";

	$scope.clockOpt = { donetext: 'Done' };
	$scope.colorpickerOpt = { horizontal: true };
}


angular
.module('payrollApp')
.controller('catCompanyCtrl', ['$scope', '$filter', '$http', 'editableOptions', 'editableThemes', catCompanyCtrl]);
