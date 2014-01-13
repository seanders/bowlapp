angular.module('d3', [])
  .service('d3Service', function ($rootScope, $window, $q) {
    console.log("FUCK YOU");
    var deferred = $q.defer();

    function onScriptLoad () {
      $rootScope.$apply(function () {d.resolve(window.d3); });
    }
  });
