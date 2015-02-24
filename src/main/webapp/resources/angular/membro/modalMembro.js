app.controller('ModalInstanceCtrl',function ($scope, $modalInstance, $log, items, MembroService) {
	
	
	$scope.nomeMembro = items.nome;
		
		var idigreja = items.idmembro;
	  $scope.ok = function (items) {
		  $log.info("id:  " + idigreja);
		  MembroService.removeMembro({url: 'RemoveMembro', idigreja: idigreja});
	  };

	  $scope.cancel = function () {
	    $modalInstance.dismiss('cancel');
	  };
});