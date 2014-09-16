'use strict'

describe 'Controller: MainCtrl', ->

  # We use a newly-defined toEqualData Jasmine matcher.
  # When the toEqualData matcher compares two objects,
  # it takes only object properties into account and ignores methods.

  beforeEach ->
    @addMatchers toEqualData: (expected) ->
      return angular.equals @actual, expected


  # load the controller's module
  beforeEach module 'myWorkshopAppApp' 
  beforeEach module 'socketMock' 

  MainCtrl = undefined
  scope = undefined
  $httpBackend = undefined

  # Initialize the controller and a mock scope
  beforeEach inject (_$httpBackend_, $controller, $rootScope) ->
    $httpBackend = _$httpBackend_
    $httpBackend.expectGET('data/students/students.json').respond [
      {
        "birthday": "2004-04-02",
        "id": "1",
        "imageUrl": "data/img/students/1.jpg",
        "name": "Maryna"
      },
      {
        "birthday": "2004-06-12",
        "id": "2",
        "imageUrl": "data/img/students/2.jpg",
        "name": "Kate"
      },
      {
        "birthday": "2004-01-10",
        "id": "3",
        "imageUrl": "data/img/students/3.jpg",
        "name": "Lisa"
      },
      {
        "birthday": "2004-12-12",
        "id": "4",
        "imageUrl": "data/img/students/4.jpg",
        "name": "Michael"
      }
    ]
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl',
      $scope: scope

  it 'should attach a list of students to the scope', ->
    $httpBackend.flush()
    expect(scope.students.length).toBe 4
    expect(scope.students).toEqualData [
      {
        "birthday": "2004-04-02",
        "id": "1",
        "imageUrl": "data/img/students/1.jpg",
        "name": "Maryna"
      },
      {
        "birthday": "2004-06-12",
        "id": "2",
        "imageUrl": "data/img/students/2.jpg",
        "name": "Kate"
      },
      {
        "birthday": "2004-01-10",
        "id": "3",
        "imageUrl": "data/img/students/3.jpg",
        "name": "Lisa"
      },
      {
        "birthday": "2004-12-12",
        "id": "4",
        "imageUrl": "data/img/students/4.jpg",
        "name": "Michael"
      }
    ]

  it 'should set the default value of orderProp model', ->
    expect(scope.orderProp).toBe('name')
