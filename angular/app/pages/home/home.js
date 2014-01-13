'use strict';

angular.module('bowlApp')
  .controller('MainCtrl', function ($scope, $location, $api, $document) {
    window.$document = $document;
  });
