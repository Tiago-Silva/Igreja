<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center" class="ui-widget">
	<sf:form modelAttribute="usuario" action="salvaUsuario" enctype="multipart/form-data" id="usuario">
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
						<sf:password id="senha" path="senha" />
					</td>
					
					<td>
						<label for="imagem">Imagem: </label>
						<input type="file" id="imagem" name="imagem"/>
					</td>
				</tr>
				
				
				<tr>
					<td colspan="10" style="background: aqua;">Dados Relacionados a  Igreja</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="igreja">Igreja: <span class="erro" style="font-size: 20px;">*</span></label>
						<sf:select path="igrejaIdigreja">
							<option>Selecione...</option>
							<c:forEach items="${igrejas}" var="igreja">
								<option value="${igreja.idigreja}">
									<c:out value="${igreja.nome}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
				</tr>
				
				<tr>
					<td colspan="10" style="background: aqua;">Dados Relacionados ao Perfil do usuário - Permissões de acesso</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="permissao">Permissão: <span class="erro" style="font-size: 20px;">*</span></label>
						<select name="permissao">
							<option>Selecione...</option>
							<c:forEach items="${roles}" var="role">
								<option value="${role}">
									<c:out value="${role}" />
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</table>
		</fieldset>
		<button type="submit" class="btSalvar" >Salvar</button>
		<button type="reset" class="btSalvar">Limpar</button>
	</sf:form>	
</div>