'use strict';
function resourcesCtrl($rootScope, $scope, $filter, $http, payrollService, $resource, DTOptionsBuilder, DTColumnDefBuilder) {

    $scope.resources = [];
    $scope.resources.length ? null : $http.get('../planilla/api/resource').success(function (data) {$scope.resources = data.data});

    $scope.showMenu = function (r) {
        if (r.typeId && $scope.resources.length) {
            var selected = $filter('filter')($rootScope.menu, {id: r.typeId});
            return selected.length ? selected[0].name : 'Ninguno';  
        } else {return r.typeId || 'Ninguno'}
    };


}

angular
.module('payrollApp')
.controller('resourcesCtrl',  ['$rootScope', '$scope', '$filter', '$http', 'payrollService', '$resource', 'DTOptionsBuilder', 'DTColumnDefBuilder' , resourcesCtrl]);
