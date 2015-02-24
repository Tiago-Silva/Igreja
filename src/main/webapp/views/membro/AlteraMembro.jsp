<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center" class="ui-widget">
	<sf:form modelAttribute="membro" action="AlteraMembro" enctype="multipart/form-data">
		<fieldset>
			<legend>Edição de Membros</legend>
			<table>
				<tr>
					<td><input type="hidden" id="idmembro" name="idmembro" value="${membro.idmembro}"/></td>
				</tr>
				<tr>
					<td><canvas id="meu_canvas" width="150" height="150"></canvas></td>
				</tr>
				<tr>
					<td colspan="10" style="background: aqua;">Documentos Pessoais</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="nome">Nome: </label>
						<sf:input title="Digite o Nome" id="nome" path="nome" />
					</td>
					
					<td>
						<label for="cpf">CPF: </label>
						<sf:input id="cpf" path="cpf" />
					</td>
					
					<td>
						<label for="rg">RG: </label>
						<sf:input id="rg" path="rg" />
					</td>
					
					<td>
						<label for="orgaorg">Org�o RG: </label>
						<sf:select path="orgaorg">
							<option value="${membro.orgaorg}">${membro.orgaorg}</option>
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
							<option value="${membro.orgaorgestado}">${membro.orgaorgestado}</option>
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
						<label for="civil">Estado Civil: </label>
						<sf:select path="civil">
							<option value="${membro.civil}">${membro.civil}</option>
							<c:forEach items="${estadoCivil}" var="estadoCivil">
								<option value="${estadoCivil}">
									<c:out value="${estadoCivil}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
					
					<td>
						<label for="sexo">Sexo: </label>
						<sf:select path="sexo">
							<option value="${membro.sexo}">${membro.sexo}</option>
							<c:forEach items="${sexo}" var="sexo">
								<option value="${sexo}">
									<c:out value="${sexo}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
					
					<td>
						<label for="imagem">Imagem: </label>
						<input type="file" id="imagem" name="imagem"/>
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
							<option value="${membro.estado_natural}">${membro.estado_natural}</option>
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
					<td colspan="10" style="background: aqua;">Endere�o Atual</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="endereco">Endere�o: </label>
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
							<option value="${membro.estado}">${membro.estado}</option>
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
					<td colspan="10" style="background: aqua;">Dados Relacionados � Igreja</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="igreja">Igreja: </label>
						<sf:select path="igrejaBean.idigreja">
							<option value="${membro.igrejaBean.idigreja}">${membro.igrejaBean.nome}</option>
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
						<label for="batismo_espirito">Batismo-Esp�rito: </label>
						<sf:select path="batismo_espirito">
							<option value="${membro.batismo_espirito}">${membro.batismo_espirito}</option>
							<c:forEach items="${batismoEspirito}" var="batismoEspirito">
								<option value="${batismoEspirito}">
									<c:out value="${batismoEspirito}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
					
					<td>
						<label for="funcao">Fun��o: </label>
						<sf:select path="funcao">
							<option value="${membro.funcao}">${membro.funcao}</option>
							<c:forEach items="${funcoes}" var="funcoes">
								<option value="${funcoes}">
									<c:out value="${funcoes}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
				</tr>
				
				<tr>
					
					<td>
						<label for="funcao">Situa��o: </label>
						<sf:select path="situacao">
							<option value="${membro.situacao}">${membro.situacao}</option>
							<c:forEach items="${situacao}" var="situacao">
								<option value="${situacao}">
									<c:out value="${situacao}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
					
					<td colspan="3">
						<label for="descricao">Descri��o:</label>
						<sf:textarea id="descricao" path="descricao"/>
					</td>
				</tr>
			</table>
		</fieldset>
		<button type="submit" id="btSalvar">Salvar</button>
	</sf:form>
</div>
<script>
      // Canvas e contexto
      var canvas = document.getElementById('meu_canvas');
      var context = canvas.getContext('2d');
      var idmembro = $("#idmembro").val();
      
      // Carregar a imagem
      var imagem = new Image();
      imagem.src = 'fotoMembro?idmembro=' + idmembro;
      imagem.onload = function() {
         // Come�ar na posi��o 20
         var x = 0;
         context.drawImage(imagem, x, 0, 128, 180);
         
      };
   </script>