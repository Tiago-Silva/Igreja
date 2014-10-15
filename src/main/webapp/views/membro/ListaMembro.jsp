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
<script type="text/javascript">
$(document).ready(function() {

	$.getJSON("ListaMembrosIgrejaSedeJson/1", function(data) {

		var tabela = document.getElementById("tbody");
		var obj;
		
		for (var i = 0; i < data.length; i++) {
			obj = {"membros" : [
			        				{"idmembro" : data[i][0], "nome" : data[i][1], "cpf" : data[i][2], "rg" : data[i][3], "endereco" : data[i][7],
				        				"bairro" : data[i][9], "cidade" : data[i][6], "telefone" : data[i][17], "celular" : data[i][19]}
			        			]};

			console.log(obj.membros[i].nome);
		}

	});
});
</script>

<div align="left" style="padding-left: 2%; width: 100%; padding-right: 2%;">
	<div align="center" class="ui-tabela" style="width: 100%">
		<div class="tabH" id="legenda">Lista de Membros Cadastrados - ${igrejaNome} </div>

		<table class="tablesorter">
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
					<th width="100">Igreja</th>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN_SEDE','ROLE_SECRETARIO_SEDE')">
					<th width="100">Ações</th>
					</sec:authorize>
				</tr>
			</thead>
			<tbody>
				<!-- Data Show Row-->
				<c:forEach items="${membros}" var="membro">
					<tr class="listas">
						<td align="center" width="2%" class="qt_total"
							style="text-align: center; height: 45px;">${membro.idmembro}</td>
						<td align="center" class="nome_aluno" width="15%">${membro.nome}</td>
						<td align="center">${membro.cpf}</td>
						<td align="center">${membro.rg}</td>
						<td align="center" width="15%">${membro.endereco}</td>
						<td align="center" width="15%">${membro.bairro}</td>
						<td align="center" width="5%">${membro.cidade}</td>
						<td align="center">${membro.telefone}</td>
						<td align="center">${membro.celular}</td>
						<td align="center">${membro.situacao}</td>
						<td align="center" width="5%">${membro.igrejaBean.idigreja}</td>
						<sec:authorize access="hasAnyRole('ROLE_ADMIN_SEDE','ROLE_SECRETARIO_SEDE')">
						<td width="40%"><a href="#" onclick="deletarMembro(${membro.idmembro},'${membro.nome}');">
								<img src="<c:url value="/resources/img/icones/delet.png"/>" />
						</a> &nbsp;|
							<a
							href="<c:url value="mostraMembro?idmembro=${membro.idmembro}"/>">
								<img src="<c:url value="/resources/img/icones/edit.png"/>" />
							</a></td>
						</sec:authorize>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td class="pager" colspan="12"><img
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
