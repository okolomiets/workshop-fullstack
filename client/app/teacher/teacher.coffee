'use strict'

angular.module 'myWorkshopAppApp'
.config ($routeProvider) ->
  $routeProvider
  .when '/teachers',
    templateUrl: 'app/teacher/teacher.html'
    controller: 'TeacherCtrl'
