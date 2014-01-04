angular.module("bowlApp")
  .controller("PeopleShowController", function ($scope, $api, $routeParams) {
    $api.get_person($routeParams.id).then(function(response) {
      $scope.person = response;
    });

  });
