app.factory('MembroService', function($resource) {
		
		return $resource(':url/:idigreja/:first/:max',{url: '@url', idigreja: '@idigreja', first: '@first', max: '@max'},
				{
					listaMembro: {
						method: 'GET',
						params: {
							url: '@url',
							idigreja: '@idigreja',
							first: '@first',
							max: '@max'
						},
						isArray: true
					},
					listaTodosMembros: {
						method: 'GET',
						params: {
							url: '@url',
							first: '@first',
							max: '@max'
						},
						isArray: true
					},
					listaMembroParaGerarCartao: {
						method: 'GET',
						params: {
							url: '@url',
							idigreja: '@idigreja'
						},
						isArray: true
					},
					quantidadeListaMembro: {
						method: 'GET',
						params: {
							url: '@url',
							idigreja: '@idigreja'
						},
						isArray: true,
						headers: {
							'Accept': 'application/json; charset=UTF-8',
							'Content-Type': 'application/json; charset=UTF-8'
						}
					},
					quantidadeRegistroTodosMembros: {
						method: 'GET',
						params: {
							url: '@url'
						},
						isArray: true,
						headers: {
							'Accept': 'application/json; charset=UTF-8',
							'Content-Type': 'application/json; charset=UTF-8'
						}
					},
					removeMembro: {
						method: 'DELETE',
						params: {
							url: '@url',
							idigreja: '@idigreja'
						},
						headers: {
							'Content-Type': 'application/json; charset=UTF-8'
						}
					}
				}
		);
	
});