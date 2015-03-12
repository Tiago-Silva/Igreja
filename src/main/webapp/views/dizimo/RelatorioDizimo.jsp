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
	<form action="{{action}}" id="formCaixaDizimo"
		target="_blank">
		<fieldset>
			<legend>{{legenda}}</legend>
			<table>
				<tr>
					<td colspan="10" style="background: aqua;">Selecione o nome da
						Igreja</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="igreja">Igreja: </label> 
						<select ng-change="selectTodasIgrejas()" ng-model="igreja" ng-options="igreja.igreja.nome for igreja in todasIgrejas">
							<option value="">..Selecione...</option>
						</select>
					</td>
				</tr>
				
					<tr ng-show="mostra">
					<td colspan="10" style="background: aqua;">Selecione o nome do
						Membro</td>
					</tr>
					<tr>
						<td>
							<label for="membro">Membro: </label> 
							<select required="true" ng-change="selectMembroPorIgreja()" ng-model="membro" ng-options="membro.membro.nome for membro in membroPorIgreja">
								<option value="">..Selecione...</option>
							</select>
						</td>
					</tr>
				
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
		<button type="submit" class="btn btn-primary" ng-disabled="habilita">Pesquisar</button>
		<button type="reset" class="btSalvar">Limpar</button>
	</form>
</div>