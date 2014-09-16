'use strict'

angular.module 'myWorkshopAppApp'
.config ($routeProvider) ->
  $routeProvider
  .when '/things',
    templateUrl: 'app/thing/thing.html'
    controller: 'ThingCtrl'
