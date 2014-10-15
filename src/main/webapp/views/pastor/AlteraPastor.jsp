<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center" class="ui-widget">
	<sf:form modelAttribute="pastor" action="AlteraPastor">
		<fieldset>
			<legend>Edição de Pastores</legend>
			<table>
				<tr>
					<td><input type="hidden" id="idpastor" name="idpastor" value="${pastor.idpastor}"/></td>
				</tr>
				<tr>
					<td colspan="10" style="background: aqua;">Dados Pessoais</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="nome">Nome: </label>
						<sf:input title="Digite o Nome" id="nome" path="nome" />
					</td>
					
					<td colspan="1">
						<label for="cpf">CPF: </label>
						<sf:input id="cpf" path="cpf" />
					</td>
					
					<td colspan="1">
						<label for="rg">RG: </label>
						<sf:input id="rg" path="rg" />
					</td>
					
					<td colspan="1">
						<label for="orgaorg">Orgão RG: </label>
						<sf:input id="orgaorg" path="orgaorg" />
					</td>
					
					<td>
						<label for="estadoCivil">Estado Civil: </label>
						<sf:select path="estadoCivil">
							<option>Selecione...</option>
							<c:forEach items="${civil}" var="civil">
								<option value="${civil}">
									<c:out value="${civil}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="naturalidade">Naturalidade: </label>
						<sf:input id="naturalidade" path="naturalidade" />
					</td>
					
					<td>
						<label for="nascimento">Nascimento: </label>
						<sf:input id="nascimento" class="data" path="nascimento" />
					</td>
				</tr>
				
				<tr>
					<td colspan="10" style="background: aqua;">Endereço Atual</td>
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
					
					<td width="10%">
						<label for="cep">CEP: </label>
						<sf:input id="cep" path="cep" />
					</td>
					
					<td colspan="2">
						<label for="cidade">Cidade: </label>
						<sf:input id="cidade" path="cidade" />
					</td>
					
				</tr>
				<tr>
					<td>
						<label for="cidade">UF: </label>
						<sf:select path="estado">
							<option>Selecione...</option>
							<c:forEach items="${estados}" var="estado">
								<option value="${estado}">
									<c:out value="${estado}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
					
					<td>
						<label for="telefone">Telefone: </label>
						<sf:input id="telefone" class="telefone" path="telefone" />
					</td>
					
					<td>
						<label for="celular">Celular: </label>
						<sf:input class="telefone" id="celular" path="celular" />
					</td>
				</tr>
			</table>
		</fieldset>
		<button type="submit" id="btSalvar">Salvar</button>
	</sf:form>
</div>