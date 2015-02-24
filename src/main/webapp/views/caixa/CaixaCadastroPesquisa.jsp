<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form>
		<fieldset>
			<legend id="legenda">Pesquisa Congregação</legend>
			<table>
				<tr>
					<td colspan="10" style="background: aqua;" id="tdTexto">{{tipoDePesquisa}}</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="igreja">Igreja: </label> 
						<select ng-change="selectIgrejaCongregacao()" ng-model="igreja" ng-options="igreja.igreja.nome for igreja in igrejaCongregacao">
							<option value="">..Selecione...</option>
						</select>
					</td>
					<c:if test="${action == 'BuscaObreirosCongregacao'}">
						<td>
						<label for="funcao">Função: </label>
							<select>
								<option>Selecione...</option>
								<c:forEach items="${funcoes}" var="funcoes">
									<option value="${funcoes}">
										<c:out value="${funcoes}" />
									</option>
								</c:forEach>
							</select>
					</td>
					</c:if>
				</tr>
			</table>
		</fieldset>
		<button class="btn btn-primary" ng-click="buscaMembroCongregacao()">Pesquisar</button>
		<button type="reset" class="btSalvar">Limpar</button>
	</form>
</div>