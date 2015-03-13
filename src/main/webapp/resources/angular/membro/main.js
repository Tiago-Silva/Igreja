var app = angular.module('Igreja', ['ngResource', 'ui.bootstrap', 'ngRoute']);


app.config(function($routeProvider) {
	
	
	$routeProvider.when('/',{
		templateUrl: '/igreja/views/home.jsp'
	});
	
	$routeProvider.when('/ListaMembroSede',{
		templateUrl: '/igreja/views/membro/ListaMembro.jsp',
		controller: 'listaMembro'
	});
	
	$routeProvider.when('/BuscaMembroCongregacao', {
		templateUrl: '/igreja/views/caixa/CaixaCadastroPesquisa.jsp',
		controller: 'listaBuscaMembro'
	});
	
	$routeProvider.when('/ListaMembroCongregacao',{
		templateUrl: '/igreja/views/membro/ListaMembro.jsp',
		controller: 'listaMembro'
	});
	
	$routeProvider.when('/ListaTodosMembros',{
		templateUrl: '/igreja/views/membro/ListaMembro.jsp',
		controller: 'listaMembro'
	});
	
	$routeProvider.when('/pesquisaCartaoMembroPorNome',{
		templateUrl: '/igreja/views/dizimo/RelatorioDizimo.jsp',
		controller: 'geraCartaoMembro'
	});
	
	$routeProvider.when('/pesquisaCartaoMembro',{
		templateUrl: '/igreja/views/dizimo/RelatorioDizimo.jsp',
		controller: 'geraCartaoMembro'
	});
	
	$routeProvider.otherwise({redirectTo: '/'});
	
});