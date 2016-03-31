angular.module('constSer',['ngResource'])
  .factory('fieldConst',['$resource',function($resource) {
    return $resource('../fieldConst.json', {}, {
      query: {method: 'GET', isArray: true}
    });
  }])
  .factory('degreeConst',['$resource',function($resource) {
    return $resource('../degreeConst.json', {}, {
      query: {method: 'GET', isArray: true}
    });
  }])
  .factory('teAgeConst',['$resource',function($resource) {
    return $resource('../teAgeConst.json', {}, {
      query: {method: 'GET', isArray: true}
    });
  }]);
