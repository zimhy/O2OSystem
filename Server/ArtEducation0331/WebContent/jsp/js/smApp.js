angular.module('smApp',['ngAnimate','ui.router','ui.date','constSer'])
  .config(function ($stateProvider,$urlRouterProvider) {
    $stateProvider
      .state('sm',{
        url:'/sm',
        templateUrl:'sm-sidebar.html',
        controller:'smController'
      })
      .state('sm.teacherManager',{
        url:'/teacherManager',
        templateUrl:'teacherManager.html'
      })
      .state('sm.classManager',{
        url:'/classManager',
        templateUrl:'classManager.html'
      })
      .state('sm.studentManager',{
        url:'/studentManager',
        templateUrl:'studentManager.html'
      })
      .state('sm.teacherDetail',{
        url:'/teacherDetail',
        templateUrl:'teacherDetail.html'
      })
      .state('sm.classDetail',{
        url:'/classDetail',
        templateUrl:'classDetail.html'
      })
      .state('sm.studentDetail',{
        url:'/studentDetail',
        templateUrl:'studentDetail.html'
      });
    $urlRouterProvider.otherwise('/sm/teacherManager');
  })
  .controller('smController',function ($scope,fieldConst,degreeConst,teAgeConst) {
    $scope.profileInfo = {};



    $scope.fieldOpts = fieldConst.query();
    $scope.degreeOpts = degreeConst.query();
    $scope.teAgeOpts = teAgeConst.query();

    $scope.profileSubmit = function () {

    };
    $scope.idSubmit = function () {

    };

    $scope.idInfo = {};
  });