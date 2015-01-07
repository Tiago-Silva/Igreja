<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#formDizimo").submit(function(e) {

		$.post("salvaDizimoJson", $(this).serialize(), function(caixa) {

			console.log(caixa.descricacao);
			
			$("#moviMes").last().append(
					'<td align="center" width="15%" style="color: blue;">' + caixa.idcaixa + '</td>' +
					'<td width="15%" style="color: blue;">' + caixa.data + '</td>' +
					'<td width="15%" style="color: blue;">' + caixa.descricacao + '</td>' +
					'<td width="15%" style="color: blue;">' + caixa.valor + '</td>' +
					'<td width="15%" style="color: red;">' + '</td>' +
					'<td>' + '</td>' +
					'<td>' + '</td>' 
			);
			
		});
		
	e.preventDefault();
	$("#formDizimo")[0].reset();
	});

	
	$("#formMovimentacoes").submit(function(e) {

		$.post("salvaCaixaJson", $(this).serialize(), function(caixa) {

			if(caixa.tipo == "ENTRADA") {
				
				$("#moviMes").last().append(
						'<td align="center" width="15%" style="color: blue;">' + caixa.idcaixa + '</td>' +
						'<td width="15%" style="color: blue;">' + caixa.data + '</td>' +
						'<td width="15%" style="color: blue;">' + caixa.descricacao + '</td>' +
						'<td width="15%" style="color: blue;">' + caixa.valor + '</td>' +
						'<td width="15%" style="color: red;">' + '</td>' +
						'<td>' + '</td>' +
						'<td>' + '</td>' 
				);
				
			} else if(caixa.tipo == "SAIDA") {
				
				$("#moviMes").last().append(
						'<td align="center" width="15%" style="color: red;">' + caixa.idcaixa + '</td>' +
						'<td width="15%" style="color: red;">' + caixa.data + '</td>' +
						'<td width="15%" style="color: red;">' + caixa.descricacao + '</td>' +
						'<td width="15%" style="color: blue;">' + '</td>' +
						'<td width="15%" style="color: red;">' + caixa.valor + '</td>' +
						'<td>' + '</td>' +
						'<td>' + '</td>' 
				);
			}
			
		});
		
	e.preventDefault();
	$("#formMovimentacoes")[0].reset();
	});
});

</script>

<div id="tabs">
	<ul>
		<li><a href="#tabs-1">Outras Movimentações</a></li>
		<li><a href="#tabs-2">Dizimo</a></li>
		<li><a href="#tabs-3">Mês Atual</a></li>
	</ul>
	<div id="tabs-1">
		<div align="center" class="ui-widget">
			<sf:form modelAttribute="caixa" id="formMovimentacoes">
				<fieldset>
					<legend>
						Cadastro No Livro Caixa &nbsp; &nbsp; &nbsp;
						<button type="submit" id="btSalvar">Salvar</button>
						<button type="reset" class="btSalvar">Limpar</button>
					</legend>

					<table>
						<tr>
							<td colspan="10" style="background: aqua;">Insira dados
								relacionados a movimentação financeira da Igreja - Especifique o
								tipo de Movimentação como de entrada ou saída</td>
						</tr>
						<tr>
							<td colspan="3"><label for="igreja">Igreja: </label> <select
									name="igreja.idigreja">
									<option>..Selecione...</option>
									<c:forEach items="${igrejas}" var="igreja">
										<option value="${igreja.idigreja}">
											<c:out value="${igreja.nome}" />
										</option>
									</c:forEach>
								</select></td>
							<td><label for="valor">Valor: </label> <input type="text" class="valor" id="valor"
									name="valor" /></td>

							<td><label for="tipo">Tipo: </label> <select name="tipo">
									<option>Selecione...</option>
									<c:forEach items="${tipo}" var="tipo">
										<option value="${tipo}">
											<c:out value="${tipo}" />
										</option>
									</c:forEach>
								</select></td>

							<td><label for="inicio">Data: </label> <input type="text" class="inicio"
									name="data" /></td>
						</tr>
						<tr>
							<td><label for="descricao">Descrição: </label> <textarea rows="0" cols="1" id="descricacao" name="descricacao">
							</textarea></td>
						</tr>
					</table>


				</fieldset>
			</sf:form>
		</div>
	</div>
	
	<!-- Tabela para cadastro de Dizimo -->
	<div id="tabs-2">
		<div align="center" class="ui-widget">
			<sf:form modelAttribute="dizimo" id="formDizimo">
				<fieldset>
					<legend>Cadastro de Dizimos</legend>
					<table>
						<tr>
							<td colspan="10" style="background: aqua;">Cadastre abaixo
								os dizimos devolvidos pelos membros</td>
						</tr>
						<tr>
							<td><label for="membro">Membro: </label> <select
									name="membroBean.idmembro">
									<option>Selecione...</option>
									<c:forEach items="${membros}" var="membro">
										<option value="${membro.idmembro}">
											<c:out value="${membro.nome}" />
										</option>
									</c:forEach>
								</select></td>
							<td><label for="valor">Valor: </label> <input type="text" class="valor" id="valor"
									name="valor" /></td>

							<td><label for="data">Data: </label> <input type="text" id="inicio"
									name="data" /></td>
						</tr>
					</table>
				</fieldset>
				<button type="submit" class="btSalvar">Salvar</button>
				<button type="reset" class="btSalvar">Limpar</button>
			</sf:form>
		</div>
	</div>
	
	<!-- Tabela que lista as movimentações do mês -->
	<div id="tabs-3">
		<div align="center">
			<div align="center" class="ui-tabela">

				<table class="tablesorter" id="moviMes">
					<thead>
						<tr>
							<!-- datatableCount -->
							<th width="80">ID:</th>
							<th width="10">Data</th>
							<th width="100">Descrição</th>
							<th width="100">Entrada</th>
							<th width="10">Saida</th>
							<th width="100">Total</th>
							<th width="100">Ações</th>
						</tr>
					</thead>
					<tbody>
						<!-- Data Show Row-->
						<c:forEach items="${caixas}" var="caixa">
							<tr class="listas">
								<c:if test="${caixa.tipo == 'SAIDA'}">
									<td align="center" width="5%" class="qt_total"
										style="text-align: center; height: 45px; color: red;">${caixa.idcaixa}</td>
										
									<td align="center" style="color: red;">${caixa.data}</td>
									
									<td align="center" width="15%" style="color: red;">${caixa.descricacao}</td>
									
									<td align="center" width="15%" style="color: blue;"></td>
									
									<td align="center" width="15%" style="color: red;"
										class="saida">${caixa.valor}</td>
								</c:if>
								<c:if test="${caixa.tipo == 'ENTRADA'}">
									<td align="center" width="5%" class="qt_total"
										style="text-align: center; height: 45px; color: blue;">${caixa.idcaixa}</td>
									
									<td align="center" style="color: blue;">${caixa.data}</td>
									
									<td align="center" width="15%" style="color: blue;">${caixa.descricacao}</td>
									
									<td align="center" width="15%" style="color: blue;"
										class="entrada">${caixa.valor}</td>
										
									<td align="center" width="15%" style="color: red;"></td>
								</c:if>
								<td align="center" width="5%"></td>
								<td width="40%"><a href=""> <img
										src="<c:url value="/resources/img/icones/edit.png"/>" />
								</a></td>
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
							</select> &nbsp;| Entrada: <span style="color: blue;">${totalEntradaMes}</span>
								&nbsp;| Saída: <span style="color: red;">${totalSaidaMes}</span>
								&nbsp;| Saldo Atual: <span style="color: green;">${saldoMes}</span>
								&nbsp;| Saldo Anterior: <span style="color: green;">${saldoAnterior}</span>
							</td>
						</tr>
					</tfoot>
				</table>

			</div>
		</div>
		<div class="resumo" align="center">
			Valor total: R$<span class="total">0</span> <br /> Valor total de
			Entrada: R$ <span class="totalEntrada" style="color: blue;">0</span>
			<br /> Valor total de Saída: R$ <span class="totalSaida"
				style="color: red;">0</span> <br /> Quantidade de Itens: <span
				class="total-itens">0</span> <br/>
			<a
			href="<c:url value="relatorioDizimo"/>" target="_blank">Relatório
			de Dizimos</a>
		</div>
	</div>
</div>


