angular.module('tmApp',['ngAnimate','ui.router','ui.date'])
.config(function ($stateProvider,$urlRouterProvider) {
  $stateProvider
    .state('tm',{
      url:'/tm',
      templateUrl:'tm-sidebar.html',
      controller:'tmController'
    })
    .state('tm.profile',{
      url:'/profile',
      templateUrl:'tm-profile.html'
    })
    .state('tm.identity',{
      url:'/identity',
      templateUrl:'tm-identity.html'
    })
    .state('tm.coursePost',{
      url:'/postCourse',
      templateUrl:'tm-postCourse.html'
    })
    .state('tm.myCourse',{
      url:'/myCourse',
      templateUrl:'tm-myCourse.html'
    })
    .state('tm.historyCourse',{
      url:'/historyCourse',
      templateUrl:'tm-historyCourse.html'
    });
  $urlRouterProvider.otherwise('/tm/profile');
})
.controller('tmController',function ($scope) {
  $scope.profileInfo = {};



  $scope.profileSubmit = function () {

  };
  $scope.idSubmit = function () {

  };

  $scope.idInfo = {};
});
