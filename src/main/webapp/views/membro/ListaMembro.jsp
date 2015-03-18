<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script type="text/ng-template" id="modal.html">
	<div class="modal-header">
            <h3 class="modal-title" align="center">Confirmação de exclusão</h3>
        </div>
        <div class="modal-body">
			<span id="msg">Você realmente deseja excluir o membro(a): </span>
			<span>{{nomeMembro}}</span>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" ng-click="ok()">Excluir</button>
            <button class="btn btn-warning" ng-click="cancel()">Cancelar</button>
        </div>    
</script>

<style>
	@-moz-document url-prefix() {
	  fieldset { display: table-cell; }
	}
	
	p{
		padding-top: 15px;
		font-family: sans-serif, OpenSymbol;
		font-size: 12px;
		font-weight: bold;
		padding-left: 0%;
		float: left:
	}
	canvas {
		float: left;
		margin: 1px 1px 0 0;
		padding: 1px;
	}

</style>
	
	<div class="table-responsive pagination pagination-centered" style="width: 100%">
		<div id="legenda">Lista de Membros Cadastrados - ${igrejaNome} </div>
		
		
		<label for="seach">Itens por página</label>
		<input type="number" min="1" max="100" class="form-control" ng-model="pageSize" ng-change="pageChanged()">
		
		<table class="table table-striped table-bordered table-hover table-condensed">
			<thead>
				<tr>
					<!-- datatableCount -->
					<th width="10">ID:</th>
					<th width="100">Nome</th>
					<th width="10">CPF</th>
					<th width="10">RG</th>
					<th width="100">Endereço</th>
					<th width="100">Bairro</th>
					<th width="100">Cidade</th>
					<th width="100">Telefone</th>
					<th width="100">Celular</th>
					<th width="10">Situação</th>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN_SEDE','ROLE_SECRETARIO_SEDE')">
					<th width="10">Ações</th>
					</sec:authorize>
				</tr>
			</thead>
			<tbody ng-repeat="membro in membroSede">
				<!-- Data Show Row-->
					<tr class="listas">
						<td align="center" width="2%" class="qt_total"
							style="text-align: center; height: 45px;">{{membro.membro.idmembro}}</td>
						<td align="center" class="nome_aluno" width="20%">{{membro.membro.nome}}</td>
						<td align="center">{{membro.membro.cpf}}</td>
						<td align="center">{{membro.membro.rg}}</td>
						<td align="center" width="20%">{{membro.membro.endereco}}</td>
						<td align="center" width="15%">{{membro.membro.bairro}}</td>
						<td align="center" width="5%">{{membro.membro.cidade}}</td>
						<td align="center">{{membro.membro.telefone}}</td>
						<td align="center">{{membro.membro.celular}}</td>
						<td align="center">{{membro.membro.situacao}}</td>
						<sec:authorize access="hasAnyRole('ROLE_ADMIN_SEDE','ROLE_SECRETARIO_SEDE')">
						<td width="10%"><a ng-href="" ng-click="deletaMembro('sm',membro.membro)">
								<img src="<c:url value="/resources/img/icones/delet.png"/>" />
						</a> &nbsp;|
							<a
							href="<c:url value="mostraMembro?idmembro={{membro.membro.idmembro}}"/>">
								<img src="<c:url value="/resources/img/icones/edit.png"/>" />
							</a></td>
						</sec:authorize>
					</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="12">
						<pagination total-items="bigTotalItems" ng-change="pageChanged()" ng-model="currentPage" max-size="maxSize" 
					class="pagination-sm" boundary-links="true" rotate="false" num-pages="numPages"></pagination>
					</td>
				</tr>
			</tfoot>
		</table>
		
		<div ng-show="erroMembro != null">
			<alert type="danger" close="closeAlert($index)">{{erroMembro}}</alert>
		</div>

	</div>

<div class="resumo" align="center">
	Quantidade de Membros: <span class="total-itens">0</span>
</div>

<div id="dialog-confirm" title="Confirmação de exclusão"
style="display: none">
<canvas id="meu_canvas" width="150" height="150"></canvas>
<p>
<span id="msg">Você realmente deseja excluir o membro(a): </span>
<span id="name">0</span>
</p>
</div>