<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center" class="ui-widget">
	<sf:form modelAttribute="pastor" action="salvaPastor">
		<fieldset>
			<legend>Cadastro de Pastores</legend>
			<table>
				<tr>
					<td colspan="10" style="background: aqua;">Documentos Pessoais</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="nome">Nome:<span class="erro" style="font-size: 20px;">*</span><sf:errors path="nome" cssClass="erro"/></label>
						<sf:input title="Digite o Nome" id="nome" path="nome" />
					</td>
					
					<td colspan="1">
						<label for="cpf">CPF:<span class="erro" style="font-size: 20px;">*</span><sf:errors path="cpf" cssClass="erro"/> </label>
						<sf:input id="cpf" path="cpf" />
					</td>
					
					<td colspan="1">
						<label for="rg">RG: </label>
						<sf:input id="rg" path="rg" />
						<sf:errors path="rg" cssClass="erro"/>
					</td>
					
					<td>
						<label for="orgaorg">Orgão RG: </label>
						<sf:select path="orgaorg">
							<option>Selecione...</option>
							<c:forEach items="${orgaoRg}" var="orgaoRg">
								<option value="${orgaoRg}">
									<c:out value="${orgaoRg}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
					<td>
						<label for="orgaorgestado">UF-RG: </label>
						<sf:select path="orgaorgestado">
							<option>UF...</option>
							<c:forEach items="${estados}" var="estado">
								<option value="${estado}">
									<c:out value="${estado}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
					
				</tr>
				
				<tr>
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
					<td colspan="10" style="background: aqua;">Dados de Nascimento</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="naturalidade">Cidade: </label>
						<sf:input id="naturalidade" path="naturalidade" />
						<sf:errors path="naturalidade" cssClass="erro"/>
					</td>
					
					<td>
						<label for="estado_natural">UF: </label>
						<sf:select path="estado_natural">
							<option>Selecione...</option>
							<c:forEach items="${estados}" var="estado">
								<option value="${estado}">
									<c:out value="${estado}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
					
					<td>
						<label for="nascimento">Data-Nascimento: </label>
						<sf:input id="nascimento" class="data" path="nascimento" />
						<sf:errors path="nascimento" cssClass="erro"/>
					</td>
				</tr>
				
				<tr>
					<td colspan="10" style="background: aqua;">Endereço Atual</td>
				</tr>
				<tr>
					<td colspan="2">
						<label for="endereco">Endereço: </label>
						<sf:input id="endereco" path="endereco" />
						<sf:errors path="endereco" cssClass="erro"/>
					</td>
					
					<td colspan="2">
						<label for="bairro">Bairro: </label>
						<sf:input id="bairro" path="bairro" />
						<sf:errors path="bairro" cssClass="erro"/>
					</td>
					
					<td width="10%">
						<label for="cep">CEP: </label>
						<sf:input id="cep" path="cep" />
						<sf:errors path="cep" cssClass="erro"/>
					</td>
					
					<td colspan="2">
						<label for="cidade">Cidade: </label>
						<sf:input id="cidade" path="cidade" />
						<sf:errors path="cidade" cssClass="erro"/>
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
						<sf:errors path="telefone" cssClass="erro"/>
					</td>
					
					<td>
						<label for="celular">Celular: </label>
						<sf:input class="telefone" id="celular" path="celular" />
						<sf:errors path="celular" cssClass="erro"/>
					</td>
				</tr>
				
				<tr>
					<td colspan="10" style="background: aqua;">Data da Consagração</td>
				</tr>
				<tr>
					<td>
						<label for="consagracao">Consagração: </label>
						<sf:input class="data" id="consagracao" path="consagracao" />
					</td>
				</tr>
			</table>
		</fieldset>
		<button type="submit" id="btSalvar">Salvar</button>
		<button type="reset" class="btSalvar">Limpar</button>
	</sf:form>
</div>