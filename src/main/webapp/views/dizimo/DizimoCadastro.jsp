<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center" class="ui-widget">
	<sf:form modelAttribute="dizimo" action="salvaDizimo">
		<fieldset>
			<legend>Cadastro de Dizimos</legend>
			<table>
				<tr>
					<td colspan="10" style="background: aqua;">Cadastre abaixo os dizimos devolvidos pelos membros</td>
				</tr>
				<tr>
					<td>
						<label for="membro">Membro: </label>
						<sf:select path="membroBean.idmembro">
							<option>Selecione...</option>
							<c:forEach items="${membros}" var="membro">
								<option value="${membro.idmembro}">
									<c:out value="${membro.nome}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
					<td>
						<label for="valor">Valor: </label> 
						<sf:input id="valor" path="valor" />
					</td>
					
					<td>
						<label for="data">Data: </label>
						<sf:input id="inicio" path="data" />
					</td>
				</tr>	
			</table>
		</fieldset>
		<button type="submit" class="btSalvar" >Salvar</button>
		<button type="reset" class="btSalvar">Limpar</button>
	</sf:form>
</div>