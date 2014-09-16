'use strict'

angular.module 'myWorkshopAppApp'
  .controller 'MainCtrl', ($scope, Student) ->
    $scope.students = Student.query()
    $scope.orderProp = "name"

#.controller 'MainCtrl', ($scope, $http, socket) ->
#  $scope.students = []
#
#  $http.get('/api/students').success (students) ->
#    $scope.students = students
#    socket.syncUpdates 'students', $scope.students
#
#  $scope.addThing = ->
#    console.log '$scope.newThing: ', $scope.newThing
#    return unless $scope.newThing
#    $http.post '/api/things',
#      name: $scope.newThing
#
#    $scope.newThing = ''
#
#  $scope.deleteThing = (thing) ->
#    $http.delete '/api/things/' + thing._id
#
#  $scope.$on '$destroy', ->
#    socket.unsyncUpdates 'thing'
