<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center" class="ui-widget">
	<sf:form modelAttribute="usuario" action="#" enctype="multipart/form-data">
		<fieldset>
			<legend>Cadastro de Usuario</legend>
			<table>
				<tr>
					<td colspan="10" style="background: aqua;">Cadastro de Login e Senha de Usuários</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="login">Login:<span class="erro" style="font-size: 20px;">*</span></label>
						<sf:input title="Digite o login" id="login" path="login" />
					</td>
					
					<td>
						<label for="senha">Senha:<span class="erro" style="font-size: 20px;">*</span></label>
						<sf:input id="senha" path="senha" />
					</td>
				</tr>
				
				<tr>
					<td colspan="10" style="background: aqua;">Dados de Nascimento</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="naturalidade">Cidade: </label>
						<sf:input id="naturalidade" path="naturalidade" />
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
					</td>
				</tr>
				
				<tr>
					<td colspan="10" style="background: aqua;">Endereço Atual</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="endereco">Endereço: </label>
						<sf:input id="endereco" path="endereco" />
					</td>
					
					<td colspan="2">
						<label for="bairro">Bairro: </label>
						<sf:input id="bairro" path="bairro" />
					</td>
					
					<td>
						<label for="cep">CEP: </label>
						<sf:input id="cep" path="cep" />
					</td>
				</tr>
					
				<tr>
					<td colspan="3">
						<label for="cidade">Cidade: </label>
						<sf:input id="cidade" path="cidade" />
					</td>
					
					<td>
						<label for="estado">UF: </label>
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
				
				<tr>
					<td colspan="10" style="background: aqua;">Dados Relacionados a  Igreja</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="igreja">Igreja: <span class="erro" style="font-size: 20px;">*</span></label>
						<sf:select path="igrejaBean.idigreja">
							<option>Selecione...</option>
							<c:forEach items="${igrejas}" var="igreja">
								<option value="${igreja.idigreja}">
									<c:out value="${igreja.nome}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
				
					<td>
						<label for="batismo">Data-Batismo: </label>
						<sf:input class="data" id="batismo" path="batismo" />
					</td>
					
					<td>
						<label for="batismo_espirito">Batismo-Espí­rito: </label>
						<sf:select path="batismo_espirito">
							<option>Selecione...</option>
							<c:forEach items="${batismoEspirito}" var="batismoEspirito">
								<option value="${batismoEspirito}">
									<c:out value="${batismoEspirito}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
					
					<td>
						<label for="funcao">Função: </label>
						<sf:select path="funcao">
							<option>Selecione...</option>
							<c:forEach items="${funcoes}" var="funcoes">
								<option value="${funcoes}">
									<c:out value="${funcoes}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
				</tr>
			</table>
		</fieldset>
		<button type="submit" class="btSalvar" >Salvar</button>
		<button type="reset" class="btSalvar">Limpar</button>
	</sf:form>
</div>