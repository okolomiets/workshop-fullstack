'use strict'

angular.module 'myWorkshopAppApp'
.config ($routeProvider) ->
  $routeProvider
  .when '/students',
    templateUrl: 'app/student/student.html'
    controller: 'StudentCtrl'
