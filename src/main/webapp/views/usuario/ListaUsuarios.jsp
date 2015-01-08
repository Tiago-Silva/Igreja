<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
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

<div align="center" style="width: 100%;">
	<div align="center" class="ui-tabela" style="width: 50%">
		<div class="tabH" id="legenda">Lista de Usuários Cadastrados</div>

		<table class="tablesorter">
			<thead>
				<tr>
					<!-- datatableCount -->
					<th width="10">ID:</th>
					<th>Login</th>
					<th>Permissao</th>
					<th width="10">Igreja</th>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN_SEDE','ROLE_SECRETARIO_SEDE')">
					<th>Ações</th>
					</sec:authorize>
				</tr>
			</thead>
			<tbody>
				<!-- Data Show Row-->
				<c:forEach items="${usuarios}" var="usuario">
					<tr class="listas">
						<td align="center" class="qt_total"
							style="text-align: center;">${usuario.idusuario}</td>
						<td align="center" class="nome_aluno">${usuario.login}</td>
						<td align="center" class="nome_aluno"></td>
						<td align="center">${usuario.igrejaIdigreja}</td>
						
						<sec:authorize access="hasAnyRole('ROLE_ADMIN_SEDE','ROLE_SECRETARIO_SEDE')">
						<td><a href="#">
								<img src="<c:url value="/resources/img/icones/delet.png"/>" />
						</a> &nbsp;|
							<a
							href="<c:url value="#"/>">
								<img src="<c:url value="/resources/img/icones/edit.png"/>" />
							</a></td>
						</sec:authorize>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td class="pager" colspan="5"><img
						src="<c:url value="/resources/jquery/tablesorter/pager/icons/first.png"/>"
						class="first" /> <img
						src="<c:url value="/resources/jquery/tablesorter/pager/icons/prev.png"/>"
						class="prev" /> <span class="pagedisplay"></span> <!-- this can be any element, including an input -->
						<img
						src="<c:url value="/resources/jquery/tablesorter/pager/icons/next.png"/>"
						class="next" /> <img
						src="<c:url value="/resources/jquery/tablesorter/pager/icons/last.png"/>"
						class="last" /> <select class="pagesize">
							<option selected="selected" value="05">5</option>
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
				</tr>
			</tfoot>
		</table>

	</div>
</div>

<div class="resumo" align="center">
	Quantidade de Usuários: <span class="total-itens">0</span>
</div>

<div id="dialog-confirm" title="Confirmação de exclusão"
	style="display: none">
	<canvas id="meu_canvas" width="150" height="150"></canvas>
	<p>
	<span id="msg">Você realmente deseja excluir o membro(a): </span>
	<span id="name">0</span>
	</p>
</div>
