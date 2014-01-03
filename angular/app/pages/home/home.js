'use strict';

angular.module('bowlApp')
  .controller('MainCtrl', function ($scope, $location, $api) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
