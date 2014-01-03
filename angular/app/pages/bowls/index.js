angular.module("bowlApp")
  .controller("BowlsIndexController", function ($scope, $location, $api) {
    $api.get_bowls().then(function(response) {
      $scope.bowls = response;
    });
  });
