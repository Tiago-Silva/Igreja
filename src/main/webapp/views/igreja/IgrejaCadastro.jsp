<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center" class="ui-widget">
	<sf:form modelAttribute="igreja" action="salvaIgreja">
		<fieldset>
			<legend>Cadastro de Igrejas</legend>
			<table>
				<tr>
					<td colspan="10" style="background: aqua;">Dados da Igreja</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="nome">Nome:<span class="erro" style="font-size: 20px;">*</span> </label>
						<sf:input title="Digite o Nome" id="nome" path="nome" />
						<sf:errors path="nome" cssClass="erro"/>
					</td>
					
					<td>
						<label for="cnpj">CNPJ:<span class="erro" style="font-size: 20px;">*</span> </label>
						<sf:input id="cnpj" path="cnpj" />
						<sf:errors path="cnpj" cssClass="erro"/>
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
						<label for="endereco">Endereço:<span class="erro" style="font-size: 20px;">*</span> </label>
						<sf:input id="endereco" path="endereco" />
						<sf:errors path="endereco" cssClass="erro"/>
					</td>
					
					<td colspan="2">
						<label for="bairro">Bairro:<span class="erro" style="font-size: 20px;">*</span> </label>
						<sf:input id="bairro" path="bairro" />
						<sf:errors path="bairro" cssClass="erro"/>
					</td>
					
					<td width="15%">
						<label for="cep">CEP: </label>
						<sf:input id="cep" path="cep" />
					</td>
					
					<td colspan="2">
						<label for="cidade">Cidade:<span class="erro" style="font-size: 20px;">*</span> </label>
						<sf:input id="cidade" path="cidade" />
						<sf:errors path="cidade" cssClass="erro"/>
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
					<td colspan="10" style="background: aqua;">Tipo de Igreja - Pastor da Igreja e a sua Fundação</td>
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
						<label for="pastor">Pastor:<span class="erro" style="font-size: 20px;">*</span> </label>
						<sf:select path="pastorBean.idpastor">
							<option>...Selecione...</option>
							<c:forEach items="${pastores}" var="pastor">
								<option value="${pastor.idpastor}">
									<c:out value="${pastor.nome}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
					
					<td>
						<label for="fundacao">Fundação: </label>
						<sf:input class="data" id="fundacao" path="fundacao" />
					</td>	
				</tr>
			</table>
		</fieldset>
		<button type="submit" id="btSalvar">Salvar</button>
		<button type="reset" class="btSalvar">Limpar</button>
	</sf:form>
</div>