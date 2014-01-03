angular.module("bowlApp")
  .controller("NavBarController", function ($scope, $location) {
    $scope.active_tab = function(tab) {
      if (tab === 'people' && (/^\/people$/).test($location.path())) { return "active"; }
      if (tab === 'home' && (/^\/$/).test($location.path())) { return "active"; }
      if (tab === 'bowls' && (/^\/bowls$/).test($location.path())) { return "active"; }
    };
  });
