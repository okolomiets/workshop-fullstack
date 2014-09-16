'use strict'

describe 'Controller: TeacherCtrl', ->

  # We use a newly-defined toEqualData Jasmine matcher.
  # When the toEqualData matcher compares two objects,
  # it takes only object properties into account and ignores methods.

  beforeEach ->
    @addMatchers toEqualData: (expected) ->
      return angular.equals @actual, expected


  # load the controller's module
  beforeEach module 'myWorkshopAppApp' 
  beforeEach module 'socketMock'

  TeacherCtrl = undefined
  scope = undefined
  $httpBackend = undefined

  # Initialize the controller and a mock scope
  beforeEach inject (_$httpBackend_, $controller, $rootScope) ->
    $httpBackend = _$httpBackend_
    $httpBackend.expectGET('data/teachers/teachers.json').respond [
      {
        "id": "1",
        "imageUrl": "data/img/teachers/1.jpg",
        "name": "Maya",
        "class": "Language"
      },
      {
        "id": "2",
        "imageUrl": "data/img/teachers/2.jpg",
        "name": "Olga",
        "class": "History"
      }
    ]
    scope = $rootScope.$new()
    TeacherCtrl = $controller 'TeacherCtrl',
      $scope: scope

  it 'should attach a list of teachers to the scope', ->
    $httpBackend.flush()
    expect(scope.teachers.length).toBe 2
    expect(scope.teachers).toEqualData [
      {
        "id": "1",
        "imageUrl": "data/img/teachers/1.jpg",
        "name": "Maya",
        "class": "Language"
      },
      {
        "id": "2",
        "imageUrl": "data/img/teachers/2.jpg",
        "name": "Olga",
        "class": "History"
      }
    ]

  it 'should set the default value of orderProp model', ->
    expect(scope.orderProp).toBe('class')
