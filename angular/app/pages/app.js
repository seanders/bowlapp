'use strict';

if (document.location.host === 'localhost:9000') {
  window.BS_ENV = 'dev';
} else {
  window.BS_ENV = 'prod';
}

angular.module('bowlApp', ['api.app'])
  .config(function ($routeProvider, $locationProvider, $httpProvider) {

    delete $httpProvider.defaults.headers.common['X-Requested-With'];

    $locationProvider.html5Mode(true);

    $routeProvider
      .when('/', {
        templateUrl: 'pages/home/home.html',
        controller: 'MainCtrl'
      })
      .when('/people', {
        templateUrl: 'pages/people/index.html',
        controller: "PeopleIndexController"
      })
      .when('/people/:id', {
        templateUrl: 'pages/people/show.html',
        controller: "PeopleShowController"
      })
      .when('/bowls', {
        templateUrl: 'pages/bowls/index.html',
        controller: "BowlsIndexController"
      })
      .when('/bowls/:id', {
        templateUrl: 'pages/bowls/show.html',
        controller: "BowlShowController"
      })
      .otherwise({
        redirectTo: '/'
      });
  });
