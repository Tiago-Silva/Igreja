<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center" class="ui-widget">
	<sf:form modelAttribute="igreja" action="AlteraIgreja">
		<fieldset>
			<legend>Edição de Igrejas</legend>
			<table>
				<tr>
					<td><input type="hidden" id="idigreja" name="idigreja" value="${igreja.idigreja}"/></td>
				</tr>
				<tr>
					<td colspan="10" style="background: aqua;">Dados da Igreja</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="nome">Nome: </label>
						<sf:input title="Digite o Nome" id="nome" path="nome" />
					</td>
					
					<td>
						<label for="cnpj">CNPJ: </label>
						<sf:input id="cnpj" path="cnpj" />
					</td>
					
					<td>
						<label for="telefone">Telefone: </label>
						<sf:input class="telefone" id="telefone" path="telefone" />
					</td>
					
					<td>
						<label for="celular">Celular: </label>
						<sf:input class="telefone" id="celular" path="celular" />
					</td>
					
				<tr>
					<td colspan="10" style="background: aqua;">Endereço da Igreja</td>
				</tr>
				<tr>
					<td colspan="2">
						<label for="endereco">Endereço: </label>
						<sf:input id="endereco" path="endereco" />
					</td>
					
					<td colspan="2">
						<label for="bairro">Bairro: </label>
						<sf:input id="bairro" path="bairro" />
					</td>
					
					<td width="15%">
						<label for="cep">CEP: </label>
						<sf:input id="cep" path="cep" />
					</td>
					
					<td colspan="2">
						<label for="cidade">Cidade: </label>
						<sf:input id="cidade" path="cidade" />
					</td>					
					
					<td width="10%">
						<label for="estado">UF:</label>
						<sf:select path="estado">
							<option>Selecione...</option>
							<c:forEach items="${estados}" var="estado">
								<option value="${estado}">
									<c:out value="${estado}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
				</tr>
				
				<tr>
					<td colspan="10" style="background: aqua;">Tipo de Igreja e o Pastor da Igreja</td>
				</tr>
				<tr>
					<td>
						<label for="tipo">Tipo: </label>
						<sf:select path="tipoIgreja">
							<option>Selecione...</option>
							<c:forEach items="${tipos}" var="tipo">
								<option value="${tipo}">
									<c:out value="${tipo}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
					
					<td>
						<label for="pastor">Pastor: </label>
						<sf:select path="pastorBean.idpastor">
							<option>...Selecione...</option>
							<c:forEach items="${pastores}" var="pastor">
								<option value="${pastor.idpastor}">
									<c:out value="${pastor.nome}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
				</tr>
			</table>
		</fieldset>
		<button type="submit" id="btSalvar">Salvar</button>
	</sf:form>
</div>