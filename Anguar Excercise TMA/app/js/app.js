(function () {

    var app = angular.module("myApp", ['ngMaterial', 'ngResource']);

    app.config(function($mdThemingProvider) {
        $mdThemingProvider.theme('dark-grey').backgroundPalette('blue').dark();
    });

    app.factory('myService', function ($resource) {
        var factory = {
            fetchList: function (URI) {
                return $resource(URI);
            }
        };
        return factory;

    });

    app.controller('myController', ['$scope', '$mdDialog', 'myService','$mdSidenav', '$resource', function ($scope, $mdDialog, myService,$mdSidenav, $resource) {

        var REST_LIST_POEM_URI = 'http://localhost:9200/list/poem/_search';
        var REST_POEM_URI = 'http://localhost:9200/list/poem/';

        var REST_LIST_STORY_URI = 'http://localhost:9200/list/story/_search';
        var REST_STORY_URI = 'http://localhost:9200/list/story/';

        var REST_LIST_SONG_URI = 'http://localhost:9200/list/song/_search';
        var REST_SONG_URI = 'http://localhost:9200/list/song/';

        var REST_LIST_ALL_URI = "http://localhost:9200/list/_search";

        $scope.pageSearch = 'search.html';
        $scope.view = 'poem.html';

        $scope.menuItems = ["Poem", "Song", "Story"];
        $scope.customFullscreen = false;
        $scope.hideDetail = true;
        $scope.hideList = false;
        var position = -1;

        $scope.hideAdd = true;
        $scope.data = {id : '', title: '', author: '', category: 'Romantic', content: ''};

        function fetch(URI) {
            alert($scope.function + " completed");
            if (URI == REST_POEM_URI){
                fetchData(REST_LIST_POEM_URI);
            }else if (URI == REST_LIST_SONG_URI){
                fetchData(REST_LIST_SONG_URI);
            }else{
                fetchData(REST_LIST_STORY_URI);
            }
        }

        function fetchData(URI){
            if (URI == REST_LIST_ALL_URI){
                myService.fetchList(URI).get().$promise.then(
                    function (data) {
                        $scope.listAll = data;
                    },
                    function (err) {

                    }
                );
            }else{
                myService.fetchList(URI).get().$promise.then(
                    function (data) {
                        $scope.listData = data;
                    },
                    function (err) {

                    }
                );
            }
        }

        function addNew(URI, data, list) {
            $scope.function = "add";
            var max = 1;
            for (var i=0;i<list.length;i++){
                if (parseInt(list[i]._id) > max) max = parseInt(list[i]._id);
            }
            myService.fetchList(URI+(max+1)).save({id: (max+1), title : data.title, author: data.author, category: data.category, content: data.content},function () {
                fetch(URI);
            });
        }

        function updateData(URI, dataId, data){
            $scope.function = "update";
            myService.fetchList(URI+dataId).save({id: dataId, title : data.title, author: data.author, category: data.category, content: data.content}, function () {
                fetch(URI);
            });
        }

        function deleteData(URI, dataId){
            $scope.function = "delete";
            myService.fetchList(URI+dataId).delete({id: dataId}, function (){
                fetch(URI);
            });
        }
        fetchData(REST_LIST_POEM_URI);

        $scope.onMenuItemClicked = function(index) {
            $scope.hideList = false;
            $scope.view = 'poem.html';
            $scope.hideDetail = true;
            $scope.hideAdd = true;
            if (index == $scope.menuItems[0]){
                $scope.item = index;
                fetchData(REST_LIST_POEM_URI);
                $scope.listCategory = ('Romantic Resistance Affection Poetry Fleer').split(' ').map(function (categoly) {
                    return {value: categoly};
                });
            }else if (index == $scope.menuItems[1]){
                $scope.item = index;
                fetchData(REST_LIST_SONG_URI);
                $scope.listCategory = ('Pop Rock Jazz Blues R&B/Soul HipHop Country Dance').split(' ').map(function (categoly) {
                    return {value: categoly};
                });
            }else{
                $scope.item = index;
                fetchData(REST_LIST_STORY_URI);
                $scope.listCategory = ('Adventure Legend').split(' ').map(function (categoly) {
                    return {value: categoly};
                });
            }
        }

        $scope.onMenuItemClicked("Poem");

        $scope.showPageAdd = function () {
            $scope.data = {id : '', title: '', author: '', category: 'Romantic', content: ''};
            $scope.hideDetail = true;
            if ($scope.hideAdd == true) {
                $scope.hideAdd = false;
            } else {
                $scope.hideAdd = true;
            }
            $scope.hideList = true;
        };

        $scope.clickDetail = function (id) {
            $scope.hideList = true;
            $scope.hideAdd = true;
            if (position != id) {
                $scope.hideDetail = false;
                position = id;
            } else {
                $scope.hideDetail = !$scope.hideDetail;
            }

            for (var i = 0; i < $scope.listData.hits.hits.length; i++) {
                if (id == $scope.listData.hits.hits[i]._id) {
                    $scope.data.id = $scope.listData.hits.hits[i]._source.id;
                    $scope.data.title = $scope.listData.hits.hits[i]._source.title;
                    $scope.data.author = $scope.listData.hits.hits[i]._source.author;
                    $scope.data.category = $scope.listData.hits.hits[i]._source.category;
                    $scope.data.content = $scope.listData.hits.hits[i]._source.content;
                }
            }
        };

        $scope.onClickItemList = function(id, ev){
            var confirm = $mdDialog.confirm()
                .title('You want to choose ?')
                .targetEvent(ev)
                .ok('Detail')
                .cancel('Delete');

            $mdDialog.show(confirm).then(function() {
                $scope.clickDetail(id);
            }, function() {
                $scope.clickDelete(id);
            });
        }

        // ================== CRUD ======================= //

        // ========= UPDATE ========= //
        $scope.updatePoem = function (id, data) {
            if ($scope.select == "poem") {
                updateData(REST_POEM_URI, id, data);
            } else if ($scope.select == "song") {
                updateData(REST_SONG_URI, id, data);
            } else {
                updateData(REST_STORY_URI, id, data);

            }
            $scope.hideDetail = true;
        };

        // ========= DELETE ========= //
        $scope.clickDelete = function (id) {
            var confirm = $mdDialog.confirm()
                .title('Would you like to delete')
                .ok('YES')
                .cancel('I think again');

            $mdDialog.show(confirm).then(
                function () {
                    if ($scope.item == $scope.menuItems[0]) {
                        deleteData(REST_POEM_URI, id);
                    } else if ($scope.item == $scope.menuItems[1]) {
                        deleteData(REST_SONG_URI, id);
                    } else {
                        deleteData(REST_STORY_URI, id);
                    }
                },
                function () {

                }
            );
        };

        // ========= SUBMIT ADD ========= //
        $scope.submitAdd = function (data, list) {
            if ($scope.item == $scope.menuItems[0]) {
                addNew(REST_POEM_URI, data, list);
            } else if ($scope.item == $scope.menuItems[1]) {
                addNew(REST_SONG_URI, data, list);
            } else {
                addNew(REST_STORY_URI, data, list);
            }

            $scope.hideAdd = true;
            $scope.hideList = false;
        };



        // ================== SEARCH ======================= //
        $scope.clickSearch = function () {
            $scope.hideSearch = false;
            $scope.view = $scope.pageSearch;

            $scope.listAll = myService.fetchList(REST_LIST_ALL_URI);
        };

        $scope.hidenTable = true;
        $scope.term = '';
        $scope.criteria = '';

        $scope.selection = ('Title Author Category Content').split(' ').map(function (select) {
            return {value: select};
        });

        $scope.submitSearch = function () {
            $scope.list = [];
            if ($scope.term != null && $scope.term != ""){
                for (var i=0;i<$scope.listAll.hits.hits.length;i++){
                    if ($scope.criteria == "Title") {
                        if ($scope.listAll.hits.hits[i]._source.title.toUpperCase().search($scope.term.toUpperCase()) > -1) {
                            $scope.list.push($scope.listAll.hits.hits[i]);
                        }
                    } else if ($scope.criteria == "Author") {
                        if ($scope.listAll.hits.hits[i]._source.author.toUpperCase().search($scope.term.toUpperCase()) > -1) {
                            $scope.list.push($scope.listAll.hits.hits[i]);
                        }
                    } else if ($scope.criteria == "Category") {
                        if ($scope.listAll.hits.hits[i]._source.category.toUpperCase().search($scope.term.toUpperCase()) > -1) {
                            $scope.list.push($scope.listAll.hits.hits[i]);
                        }
                    } else {
                        if ($scope.listAll.hits.hits[i]._source.content.toUpperCase().search($scope.term.toUpperCase()) > -1) {
                            $scope.list.push($scope.listAll.hits.hits[i]);
                        }
                    }
                }
                $scope.hidenTable = false;
            }else{
                $mdDialog.show(
                    $mdDialog.alert()
                        .parent(angular.element(document.querySelector('#popupContainer')))
                        .clickOutsideToClose(true)
                        .title('Term is empty')
                        .textContent('You should not leave Term blank')
                        .ok('Retry')
                );
            }
        }

        //Display
        $scope.showToolbar = function(){
            return $mdSidenav('left').toggle();
        }
    }]);
})()

