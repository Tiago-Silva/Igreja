<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">

	$(document).ready(function() {

		var form = document.getElementById("formCaixaPesquisa");

		var url = document.location.host;

		if(form.action == 'http://' + url + '/igreja/BuscaObreirosCongregacao') {

			var legenda = document.getElementById("legenda");
			var tdTexto = document.getElementById("tdTexto");
			
			legenda.innerHTML = "Pesquisa obreiros por igreja e função";
			tdTexto.innerHTML = "Selecione o nome da Igreja e a função para efetuar a pesquisa";
			
		}
		
	});

</script>

<div align="center" class="ui-widget">
	<sf:form modelAttribute="caixa" action="${action}" id="formCaixaPesquisa">
		<fieldset>
			<legend id="legenda">Pesquisa Congregação</legend>
			<table>
				<tr>
					<td colspan="10" style="background: aqua;" id="tdTexto">Pesquisa por nome da Congregação</td>
				</tr>
				<tr>
					<td colspan="3"><label for="igreja">Igreja: </label> <sf:select
							path="${igreja_idigreja}">
							<option>..Selecione...</option>
							<c:forEach items="${igrejas}" var="igreja">
								<option value="${igreja.idigreja}">
									<c:out value="${igreja.nome}" />
								</option>
							</c:forEach>
						</sf:select></td>
					<c:if test="${action == 'BuscaObreirosCongregacao'}">
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
					</c:if>
				</tr>
			</table>
		</fieldset>
		<button type="submit" id="btSalvar">Pesquisar</button>
		<button type="reset" class="btSalvar">Limpar</button>
	</sf:form>
</div>