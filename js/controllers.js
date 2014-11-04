'use strict';

/* Controllers */

function FindPartnerCtrl($scope) {
    $scope.langs = [
        {"id": "es",
            "name": "Spanish"},
        {"id": "en",
            "name": "English"},
        {"id": "de",
            "name": "German"}
    ];

    $scope.address = {
        street: "7, avenue du docteur Hochet",
        city: "Antibes",
        latitude: "43.569898",
        longitude: "7.112489"
    };
}
