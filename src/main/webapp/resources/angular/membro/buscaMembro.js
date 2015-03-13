

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

app.controller('geraCartaoMembro', function($scope, $http, MembroService, $log, $location) {
	
	$scope.habilita = true;
	
	$scope.mostra = false;
	
	$http.get('ListaTodasIgrejas').success(function(data) {
		$scope.todasIgrejas = data;
    });
	
	var idigreja = null;
	
	var idmembro = null;
	
	function listaMembro(idigreja) {
    	
    	$scope.membroPorIgreja = MembroService.listaMembroParaGerarCartao({url: 'ListaMembroGeraCartao', idigreja: idigreja}, function() {
    		
    	}, function(error) {
    		$scope.erroMembro = "Houver um problema na requisição do serviço. Tente mais tarde ou entre em contato com o administrador da aplicação";
    	});
    };
	
    
    if($location.url() == '/pesquisaCartaoMembroPorNome') {
    	
    	$log.log($scope.mostra);
    	
    	$scope.legenda = "Gerar cartão de membro de acordo com o nome da igreja e do membro";
    	
    	$scope.selectTodasIgrejas = function() {
    		
    		$scope.habilita = true;
    		
    		idigreja = $scope.igreja.igreja.idigreja;
    		
    		$log.log("idigreja: " + idigreja);
    		
    		listaMembro(idigreja);
    		
    	};
    	
    	$scope.selectMembroPorIgreja = function() {
    		
    		idmembro = $scope.membro.membro.idmembro;
    		
    		$scope.action = "cartaoMembroPorNome/" + idigreja + "/" + idmembro;
    		
    		$scope.habilita = false;
    	};
    	
    } else if ($location.url() == '/pesquisaCartaoMembro') {
    	
    	$log.log($scope.mostra);
    	
    	$scope.legenda = "Gerar cartão de membro de acordo com a igreja - gera de todos os membros da igreja selecionada";
    	
    	$scope.selectTodasIgrejas = function() {
    		
    		$scope.habilita = false;
    		
    		idigreja = $scope.igreja.igreja.idigreja;
    		
    		$scope.action = "cartaoMembro/" + idigreja;
    	};
    }
    
    
});