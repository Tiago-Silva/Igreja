<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div align="center">
	<div align="center" class="ui-tabela">
		<div class="tabH">Lista de Pastores Cadastrados</div>

		<table class="tablesorter">
			<thead>
				<tr>
					<!-- datatableCount -->
					<th width="80">ID:</th>
					<th width="100">Nome</th>
					<th width="10">CPF</th>
					<th width="10">RG</th>
					<th width="100">Endereço</th>
					<th width="100">Bairro</th>
					<th width="10">CEP</th>
					<th width="100">Cidade</th>
					<th width="100">Telefone</th>
					<th width="100">Celular</th>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SECRETARIO')">
					<th width="100">Ações</th>
					</sec:authorize>
				</tr>
			</thead>
			<tbody>
				<!-- Data Show Row-->
				<c:forEach items="${pastores}" var="pastor">
					<tr class="listas">
						<td align="center" width="5%" class="qt_total"
							style="text-align: center; height: 45px;">${pastor.idpastor}</td>
						<td align="center" class="nome_aluno" width="15%">${pastor.nome}</td>
						<td align="center">${pastor.cpf}</td>
						<td align="center">${pastor.rg}</td>
						<td align="center" width="15%">${pastor.endereco}</td>
						<td align="center" width="15%">${pastor.bairro}</td>
						<td align="center" width="15%">${pastor.cep}</td>
						<td align="center" width="5%">${pastor.cidade}</td>
						<td align="center">${pastor.telefone}</td>
						<td align="center">${pastor.celular}</td>
						<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SECRETARIO')">
						<td width="40%">
							<a
							href="<c:url value="mostraPastor?idpastor=${pastor.idpastor}"/>">
								<img src="<c:url value="/resources/img/icones/edit.png"/>" />
							</a></td>
						</sec:authorize>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td class="pager" colspan="11"><img
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
	Quantidade de Pastores: <span class="total-itens">0</span>
</div>