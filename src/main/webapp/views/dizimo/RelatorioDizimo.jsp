<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">

	$(document).ready(function() {

		var form = document.getElementById("formCaixaDizimo");

		var url = document.location.host;

		console.log("PathName: " + document.location.pathname);
		
		if(form.action == 'http://' + url + '/igreja/cartaoMembroPorNome') {

			var legenda = document.getElementById("legenda");
			legenda.innerHTML = "Gerar cartão de Membro por Nome";
			
			$("#idIgreja").change(function() {

				var idigreja = document.getElementById("idIgreja");

				$.getJSON("ListaMembrosIgrejaJson/" + idigreja.value, function(data) {
					var idmembro = document.querySelector("#idmembro");

					idmembro.innerHTML = "";
					
					for(var i = 0; i < data.length; i++) {
					    var op = document.createElement('option');
					    op.text = data[i].pop();
					    op.value = data[i].shift();
					    idmembro.add(op,idmembro.selectedIndex);
					}
					 
				});
			});
		} else if(form.action == 'http://' + url + '/igreja/cartaoMembro') {
			
			var legenda = document.getElementById("legenda");
			legenda.innerHTML = "Gerar cartão de Membro por igreja - gera cartão de todos os membros da igreja selecionada";
		}
		
	});

</script>

<div align="center" class="ui-widget">
	<sf:form modelAttribute="caixa" action="${action}" id="formCaixaDizimo"
		target="_blank">
		<fieldset>
			<legend id="legenda">Gerar Relatório por Mês de acordo com a Igreja
				Selecionada</legend>
			<table>
				<tr>
					<td colspan="10" style="background: aqua;">Selecione o nome da
						Igreja</td>
				</tr>
				<tr>
					<td colspan="3"><label for="igreja">Igreja: </label> <sf:select id="idIgreja"
							path="${idigreja}">
							<option>..Selecione...</option>
							<c:forEach items="${igrejas}" var="igreja">
								<option value="${igreja.idigreja}">
									<c:out value="${igreja.nome}" />
								</option>
							</c:forEach>
						</sf:select></td>
				</tr>
				
				<c:if test="${action == 'cartaoMembroPorNome'}">
					<tr>
					<td colspan="10" style="background: aqua;">Selecione o nome do
						Membro</td>
					</tr>
					<tr>
						<td><label for="membro">Membro: </label> <sf:select id="idmembro"
								path="idmembro">
								<option>Selecione...</option>
							</sf:select></td>
					</tr>
				</c:if>
				
				<c:if test="${action == 'relatorioDizimo'}">
					<tr>
					<td colspan="10" style="background: aqua;">Digite um Mês com
						apenas dois caracteres - use números</td>
					</tr>
					<tr>
						<td><label for="mes">Mês </label> <sf:input id="mes"
								path="mes" /></td>
					</tr>
				</c:if>
			</table>
		</fieldset>
		<button type="submit" id="btSalvar">Pesquisar</button>
		<button type="reset" class="btSalvar">Limpar</button>
	</sf:form>
</div>