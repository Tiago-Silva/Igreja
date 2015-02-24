

app.controller('listaBuscaMembro', function($scope, $http, MembroService, $log, $location, $window) {
	
	$scope.tipoDePesquisa = "Pesquisa de membro por nome da Congregação";
	
	$http.get('listaIgrejaPorTipo').success(function(data) {
	 	   $scope.igrejaCongregacao = data;
	    });
	
	var idigreja = null;
	
	$scope.selectIgrejaCongregacao = function() {
		
		idigreja = $scope.igreja.igreja.idigreja;
		
	};
	
	$scope.buscaMembroCongregacao = function() {
		window.sessionStorage.setItem('idigreja', idigreja);
		$log.log("Id da congregação: " + idigreja);
		$window.location.href = '/igreja/#/ListaMembroCongregacao';
	};
	
});