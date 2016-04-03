//angular.module('formSignup',['ngAnimate','ui.router','constSer'])
//.config(function($stateProvider,$urlRouterProvider) {
//  $stateProvider
//    .state('signup',{
//      url:'/signup',
//      templateUrl:'signup-form.html',
//      controller:'formController'
//    })
//    .state('signup.basic',{
//      url:'/basic',
//      templateUrl:'signup-basic.html'
//    })
//    .state('signup.idinfo',{
//      url:'/idinfo',
//      templateUrl:'signup-id.html'
//    })
//    .state('signup.verification',{
//      url:'/verification',
//      templateUrl:'signup-veri.html'
//    });
//  $urlRouterProvider.otherwise('/signup/basic');
//})
//.controller('formController',function($scope,$interval,fieldConst,degreeConst,teAgeConst) {
//  $scope.formData = {
//    field:"钢琴",
//    sex:"male",
//    degree:"专科",
//    teachingAge:"0~1年"
//  };
//
//  $scope.chkPwd = function () {
//    if ($scope.checkPwd === $scope.formData.pwd) {
//      return true;
//    } else {
//      return false;
//    }
//  };
//
//  $scope.timecount = 5;
//
//  $scope.processForm = function() {
//    $interval(function () {
//      $scope.timecount--
//      console.log($scope.timecount)
//      if($scope.timecount===0) {window.location='../index.html'}
//    },1000,5,true)
//
//
//  };
//  $scope.fieldOpts = fieldConst.query();
//  $scope.degreeOpts = degreeConst.query();
//  $scope.teAgeOpts = teAgeConst.query();
//});