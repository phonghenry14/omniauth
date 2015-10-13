angular.module('demoApp').factory('Task', function($resource){
    return $resource('/api/v1/tasks/:taskId');
});
angular.module('demoApp').controller('TasksCtrl', function($scope, Task){
    $scope.tasks = Task.query();

    $scope.create = function(title, content){
        Task.save({title: title, content: content}, function(task) {
            $scope.tasks.push(task);
        });
    };
});
