'use strict'

angular.module 'myWorkshopAppApp'
  .controller 'TeacherCtrl', ($scope, Teacher) ->
    $scope.teachers = Teacher.query()
    $scope.orderProp = "name"
