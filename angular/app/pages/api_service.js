'use strict';

angular.module('api.app',[]).
  service('$api', function($http, $q, $rootScope, $location, $window) {
     // set environment
    $rootScope.environment = window.BS_ENV;

    // set API host based on environment
    if ($rootScope.environment === 'dev') {
      $rootScope.api_host = "http://localhost:3000/";
    } else if ($rootScope.environment === 'prod') {
      $rootScope.api_host = "http://hidden-cliffs-5922.herokuapp.com/"; //come back here and update host for production
    }

    this.call = function() {
      var args = Array.prototype.slice.call(arguments);
      var url = $rootScope.api_host + args.shift().replace(/^\//,'');
      var method = typeof(args[0]) === 'string' ? args.shift() : 'GET';
      var params = typeof(args[0]) === 'object' ? args.shift() : {};
      var callback = typeof(args[0]) === 'function' ? args.shift() : function(response) { return response; };

      //create promise object
      var deferred = $q.defer();

      //hack for meta/data hash
      // params.callback = 'CORS';

      var cors_callback = function(response) {
        // response = response.replace(/^CORS\(/,'').replace(/\)$/,'');
        // var parsed_response = JSON.parse(response);

        deferred.resolve(callback(response));
      };

      // make actual HTTP call with promise
      if (method === 'GET') { $http.get(url, { params: params }).success(cors_callback); }
      else if (method === 'HEAD') { $http.head(url, { params: params }).success(cors_callback); }
      else if (method === 'DELETE') { $http.delete(url, { params: params }).success(cors_callback); }
      else if (method === 'POST') { $http.post(url, params, {}).success(cors_callback); }
      else if (method === 'PUT') { $http.put(url, params, {}).success(cors_callback); }

      return deferred.promise;
    };

    this.get_bowls = function() {
      return this.call("/bowls");
    };

    this.get_bowl = function(bowl_id) {
      return this.call("/bowls/"+bowl_id);
    };

    this.get_people = function() {
      return this.call("/people")
    };

    this.get_person = function(person_id) {
      return this.call("/people/"+person_id)
    }

  });
