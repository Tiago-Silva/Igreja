
app.controller('listaMembro', function($scope, $http, MembroService, $log, $modal, $location) {
   
	$scope.pageSize = 5;
	
	$scope.mostraMensagem = false;
	
	$log.log("Parametro de outra pagina: " + window.sessionStorage.getItem('idigreja'));
    
    
    var idigrejaCongregacao = 1;
    
    
    if(window.sessionStorage.getItem('idigreja') != null) {
    	idigrejaCongregacao = window.sessionStorage.getItem('idigreja');
	}
    window.sessionStorage.removeItem('idigreja');
    
    function quantidadeListaMembro(idigreja) {
    	
    	MembroService.quantidadeListaMembro({url: 'QuantidadeListaMembro', idigreja: idigreja}).
    	
    		$promise.then(
    			function(data) {
    				$scope.bigTotalItems = data * 2;
    				$log.log("Data: " + data);
    			},
    			function(error) {
    				$scope.erroMembro = "Houver um problema no serviço. Tente mais tarde ou entre em contato com o administrador da aplicação";
    			}
    		);
    	
    };
    
    function quantidadeRegistroTodosMembros() {
    	
    	MembroService.quantidadeRegistroTodosMembros({url: 'QuantidadeRegistroTodosMembros'}).
		$promise.then(
			function(data) {
				$scope.bigTotalItems = data * 2;
				   
				console.log("Items: " + data);
			},
			function(error) {
				$scope.erroMembro = "Houver um problema no serviço. Tente mais tarde ou entre em contato com o administrador da aplicação";
			}
		);
    }
    
    function listaMembro(inicio, maximo) {
    	
    	$scope.membroSede = MembroService.listaMembro({url: 'ListaMembrosIgrejaSedeJson', idigreja: idigrejaCongregacao, first: inicio, max: maximo}, function() {
    		
    	}, function(error) {
    		$scope.erroMembro = "Houver um problema na requisição do serviço. Tente mais tarde ou entre em contato com o administrador da aplicação";
    	});
    };
    
    function listaTodosMembros(inicio, maximo) {
    	
    	$scope.membroSede = MembroService.listaTodosMembros({url: 'ListaTodosMembros', first: inicio, max: maximo}, function() {
    		
    	}, function(error) {
    		$scope.erroMembro = "Houver um problema na requisição do serviço. Tente mais tarde ou entre em contato com o administrador da aplicação";
    	});
    };
    
    $log.log($location.url());
    
    if($location.url() == '/ListaTodosMembros') {
    	quantidadeRegistroTodosMembros();
    	listaTodosMembros(0,$scope.pageSize);
    } else {
    	quantidadeListaMembro(idigrejaCongregacao);
    	listaMembro(0,$scope.pageSize);
    }
    
    $scope.setPage = function (pageNo) {
      $scope.currentPage = pageNo;
    };

    $scope.pageChanged = function() {
      $log.log('Page changed to: ' + $scope.currentPage);
      console.log('Paginas: ' + $scope.pageSize);
      
      if($scope.currentPage == null) {
    	  $scope.currentPage = 1;
      }
      
      var inicio = ($scope.currentPage * $scope.pageSize) - $scope.pageSize;
      
      if($location.url() == '/ListaTodosMembros') {
    	  listaTodosMembros(inicio,$scope.pageSize);
      } else {
    	  listaMembro(inicio,$scope.pageSize);
      }
    };

    $scope.maxSize = 10;
    
    $scope.bigCurrentPage = 1;
    
    $scope.deletaMembro = function (size,membro,$event) {
    	
    	$log.info('Membro modal: ' + membro.nome);
    	
	    var modalInstance = $modal.open({
	      templateUrl: 'modal.html',
	      controller: 'ModalInstanceCtrl',
	      size: 'sm',
	      resolve: {
	        items: function () {
	          return membro;
	        }
	      }
	    });

	    modalInstance.result.then(function (selectedItem) {
	    }, function () {
	      $log.info('Modal dismissed at: ' + new Date());
	    });
	    
	 };
	 
});

app.controller('menu', function($scope, $log) {
	$scope.status = {
	    isopen: false
	  };

	  $scope.toggled = function(open) {
	    $log.log('Dropdown is now: ', open);
	  };

	  $scope.toggleDropdown = function($event) {
	    $event.preventDefault();
	    $event.stopPropagation();
	    $scope.status.isopen = !$scope.status.isopen;
	  };
	  
	  $scope.isCollapsed = false;
	  
});

/* Retorna uma lista de membro por igreja no formato json usando $http
app.controller('listaMembro', function($scope, $http, $resource) {
   
   $http.get('ListaMembrosIgrejaSedeJson/1').success(function(data) {
	   $scope.membroSede = data;
       console.log(data);
   }).error(function(data) {
	   $scope.erro = "Ouve um erro na requisição dos dados";
   });
   
});*/