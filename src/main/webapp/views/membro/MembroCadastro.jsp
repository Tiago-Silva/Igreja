<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="span12">
	<sf:form modelAttribute="membro" action="salvaMembro" enctype="multipart/form-data" cssClass="span12">
		<fieldset class="span12">
			<legend>Cadastro de Membros</legend>
			<table align="left" class="table row-fluid">
				<tr class="span12">
					<td class="span12" style="background: aqua;">Documentos Pessoais</td>
				</tr>
				<tr class="span12">
					<td class="span3">
						<label for="nome">Nome: <span class="erro" style="font-size: 20px;">*</span><sf:errors path="nome" cssClass="erro"/></label>
						<sf:input title="Digite o Nome" id="nome" path="nome" />
					</td>
					
					<td class="span3">
						<label for="cpf">CPF: <span class="erro" style="font-size: 20px;">*</span><sf:errors path="cpf" cssClass="erro"/></label>
						<sf:input id="cpf" path="cpf" />
					</td>
					
					<td class="span3">
						<label for="rg">RG: </label>
						<sf:input id="rg" path="rg" />
					</td>
					
					<td class="span2">
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
					<td class="span1">
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
				<tr class="span12">					
					<td class="span3">
						<label for="civil">Estado Civil: </label>
						<sf:select path="civil">
							<option>Selecione...</option>
							<c:forEach items="${estadoCivil}" var="estadoCivil">
								<option value="${estadoCivil}">
									<c:out value="${estadoCivil}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
					
					<td class="span3">
						<label for="sexo">Sexo: </label>
						<sf:select path="sexo">
							<option>Selecione...</option>
							<c:forEach items="${sexo}" var="sexo">
								<option value="${sexo}">
									<c:out value="${sexo}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
					
					<td class="span3">
						<label for="imagem">Imagem: </label>
						<input type="file" id="imagem" name="imagem"/>
					</td>
					
					<td class="span2">
						<a href="#" onclick="abreWebCam();">Tire foto com sua web-cam</a>
					</td>
				</tr>
				
				<tr class="span12">
					<td colspan="10" style="background: aqua;">Dados de Nascimento</td>
				</tr>
				<tr class="span12">
					<td class="span4">
						<label for="naturalidade">Cidade: </label>
						<sf:input id="naturalidade" path="naturalidade" />
					</td>
					
					<td class="span4">
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
					
					<td class="span4">
						<label for="nascimento">Data-Nascimento: </label>
						<sf:input id="nascimento" class="data" path="nascimento" />
					</td>
				</tr>
				
				<tr class="span12">
					<td colspan="10" style="background: aqua;">Endereï¿½o Atual</td>
				</tr>
				<tr class="span12">
					<td class="span3">
						<label for="endereco">Endereï¿½o: </label>
						<sf:input id="endereco" path="endereco" />
					</td>
					
					<td class="span3">
						<label for="bairro">Bairro: </label>
						<sf:input id="bairro" path="bairro" />
					</td>
					
					<td class="span2">
						<label for="cep">CEP: </label>
						<sf:input id="cep" path="cep" />
					</td>
					
					<td class="span2">
						<label for="cidade">Cidade: </label>
						<sf:input id="cidade" path="cidade" />
					</td>
					
					<td class="span2">
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
				</tr>
					
				<tr class="span12">
					
					<td class="span6">
						<label for="telefone">Telefone: </label>
						<sf:input id="telefone" class="telefone" path="telefone" />
					</td>
					
					<td class="span6">
						<label for="celular">Celular: </label>
						<sf:input class="telefone" id="celular" path="celular" />
					</td>
				</tr>
				
				<tr class="span12">
					<td colspan="10" style="background: aqua;">Dados Relacionados aï¿½ Igreja</td>
				</tr>
				<tr class="span12">
					<td class="span3">
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
				
					<td class="span3">
						<label for="batismo">Data-Batismo: </label>
						<sf:input class="data" id="batismo" path="batismo" />
					</td>
					
					<td class="span3">
						<label for="batismo_espirito">Batismo-Espï¿½rito: </label>
						<sf:select path="batismo_espirito">
							<option>Selecione...</option>
							<c:forEach items="${batismoEspirito}" var="batismoEspirito">
								<option value="${batismoEspirito}">
									<c:out value="${batismoEspirito}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
					
					<td class="span3">
						<label for="funcao">Funï¿½ï¿½o: </label>
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
				
				<tr class="span12">
					
					<td class="span3">
						<label for="funcao">Situaï¿½ï¿½o: </label>
						<sf:select path="situacao">
							<option>Selecione...</option>
							<c:forEach items="${situacao}" var="situacao">
								<option value="${situacao}">
									<c:out value="${situacao}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
					
					<td class="span3">
						<label for="descricao">Descriï¿½ï¿½o:</label>
						<sf:textarea id="descricao" path="descricao"/>
					</td>
				</tr>
				
			</table>
		</fieldset>
		<button type="submit" class="btn btn-primary" >Salvar</button>
		<button type="reset" class="btn btn-info">Limpar</button>
	</sf:form>
</div>