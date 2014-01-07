angular.module("bowlApp")
  .controller("BowlShowController", function ($scope, $api, $routeParams) {
    $api.get_bowl($routeParams.id).then(function(response) {
      $scope.bowl = response;
    });
  });
