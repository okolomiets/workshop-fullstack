"use strict"

# Services 
mainServices = angular.module("teacherServices", ["ngResource"])
mainServices.factory "Teacher", [
  "$resource"
  ($resource) ->
    return $resource("data/teachers/:teacherId.json", {},
      query:
        method: "GET"
        params:
          teacherId: "teachers"
        isArray: true
    )
]