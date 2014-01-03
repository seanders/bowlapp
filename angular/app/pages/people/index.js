angular.module("bowlApp")
  .controller("PeopleIndexController", function ($scope, $api) {
    $api.get_people().then(function(response) {
      $scope.people = response;
    });

    //initial column sorting
    $scope.col = 'right_pick_count';
    $scope.reverse = true; //desc

    $scope.sortColumn = function(col_name) {
      $scope.col = col_name;
      $scope.reverse = !$scope.reverse;
    }
  });
