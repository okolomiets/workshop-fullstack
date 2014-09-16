"use strict"

# Services 
mainServices = angular.module("studentServices", ["ngResource"])
mainServices.factory "Student", [
  "$resource"
  ($resource) ->
    return $resource("data/students/:studentId.json", {},
      query:
        method: "GET"
        params:
          studentId: "students"
        isArray: true
    )
]