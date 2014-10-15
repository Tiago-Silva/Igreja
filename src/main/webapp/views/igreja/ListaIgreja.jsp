<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div align="left" style="padding-left: 2%; width: 100%; padding-right: 2%;">
	<div align="center" class="ui-tabela" style="width: 100%">
		<div class="tabH">Lista de Igrejas Cadastradas</div>

		<table class="tablesorter">
			<thead>
				<tr>
					<!-- datatableCount -->
					<th width="10">ID:</th>
					<th width="100">Nome</th>
					<th width="10">CNPJ</th>
					<th width="100">Endereço</th>
					<th width="100">Bairro</th>
					<th width="10">CEP</th>
					<th width="100">Cidade</th>
					<th width="100">Telefone</th>
					<th width="100">Celular</th>
					<th width="100">Tipo</th>
					<th width="100">Pastor</th>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SECRETARIO')">
					<th width="100">Ações</th>
					</sec:authorize>
				</tr>
			</thead>
			<tbody>
				<!-- Data Show Row-->
				<c:forEach items="${igrejas}" var="igreja">
					<tr class="listas">
						<td align="center" width="5%" class="qt_total"
							style="text-align: center; height: 45px;">${igreja.idigreja}</td>
						<td align="center" class="nome_aluno" width="100%">${igreja.nome}</td>
						<td align="center">${igreja.cnpj}</td>
						<td align="center" width="15%">${igreja.endereco}</td>
						<td align="center" width="5%">${igreja.bairro}</td>
						<td align="center" width="5%">${igreja.cep}</td>
						<td align="center" width="5%">${igreja.cidade}</td>
						<td align="center">${igreja.telefone}</td>
						<td align="center">${igreja.celular}</td>
						<td align="center">${igreja.tipoIgreja}</td>
						<td align="center" width="10%">${igreja.pastorBean.idpastor}</td>
						<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SECRETARIO')">
						<td width="40%">
							<a
							href="<c:url value="mostraIgreja?idigreja=${igreja.idigreja}"/>">
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
					</select></td>
				</tr>
			</tfoot>
		</table>

	</div>
</div>

<div class="resumo" align="center">
	Quantidade de Igrejas: <span class="total-itens">0</span>
</div>