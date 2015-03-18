<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center">
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
				<tr ng-show="habilitaSelect">
				<td colspan="10" style="background: aqua;">Selecione o nome do
					Membro</td>
				</tr>
				<tr ng-show="habilitaSelect">
					<td>
						<label for="membro">Membro: </label> 
						<select ng-disabled="habilitaSelect" required="true" ng-change="selectMembroPorIgreja()" ng-model="membro" ng-options="membro.membro.nome for membro in membroPorIgreja">
							<option value="">..Selecione...</option>
						</select>
					</td>
				</tr>
			</table>
		</fieldset>
		<button type="submit" class="btn btn-primary" ng-disabled="habilita">Pesquisar</button>
		<button type="reset"class="btn btn-inverse">Limpar</button>
	</form>
</div>