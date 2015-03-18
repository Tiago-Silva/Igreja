<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
.form-membro p {
	font-size: 130%;
	background: aqua;
}

</style>

<form class="row-fluid form-membro" ng-submit="salvaMembro()">
	<fieldset>
		<legend>Cadastro de Membros</legend>
		
		<div class="controls">
			<p class="span12">Documentos Pessoais</p>
		</div>
		
		<div class="controls controls-row" align="left">
		
			<div class="span3">
				<label for="nome">Nome: <span class="erro" style="font-size: 20px;">*</span> </label>
				<input ng-required="true" class="span12" title="Digite o Nome" ng-model="nome" placeholder="Nome"/>
			</div>
				
			<div class="span3">
				<label for="cpf">CPF: <span class="erro" style="font-size: 20px;">*</span> </label>
				<input class="span12" id="cpf" placeholder="CPF" ng-model="cpf"/>
			</div>
			<div class="span3">
				<label for="rg">RG: </label>
				<input class="span12" id="rg" placeholder="RG" ng-model="rg"/>
			</div>
			<div class="span2">
				<label for="orgaorg">Orgão RG: </label>
				<select class="span12" ng-model="orgaorg">
					<option>Selecione...</option>
				</select>
			</div>
			<div class="span1">
				<label for="estadoRG">UF-RG: </label>
				<select class="span10" ng-change="selectUFRG()" ng-model="estadoRG" ng-options="estado.sigla for estado in estadoJson">
					<option value="">..UF...</option>
				</select>
			</div>
			
		</div>
		
		<div class="controls controls-row">
			
			<div class="span3">
				<label for="estadoCivil">Estado Civil: </label>
				<select class="span12" ng-change="selectEstadoCivil()" ng-model="estadoCivil" ng-options="estadoCivil.estado for estadoCivil in estadoCivil">
					<option value="">..Selecione...</option>
				</select>
			</div>
			
			<div class="span3">
				<label for="sexo">Sexo: </label>
				<select class="span12" ng-change="selectSexo()" ng-model="sexo" ng-options="sexo.sexo for sexo in sexo">
					<option value="">..Selecione...</option>
				</select>
			</div>
			
			<div class="span2">
				<a href="#" onclick="abreWebCam();">Tire foto com sua web-cam</a>
			</div>
			
		</div>
		
		<div class="controls">
			<p class="span12">Dados de Nascimento</p>
		</div>
		
		<div class="controls controls-row" align="left">
		
			<div class="span3">
				<label for="naturalidade">Cidade: </label>
				<input class="span12" id="naturalidade" placeholder="Cidade"/>
			</div>
			
			<div class="span3">
				<label for="estado_natural">UF: </label>
				<select class="span12">
					<option>Selecione...</option>
						<option value="${estado}">
							<c:out value="${estado}" />
						</option>
				</select>
			</div>
			
			<div class="span3">
				<label for="nascimento">Data-Nascimento: </label>
				<input class="span12" id="nascimento" class="data" placeholder="Nascimento"/>
			</div>
			
		</div>
		
		<div class="controls">
			<p class="span12">Endereço Atual</p>
		</div>
		
		<div class="controls controls-row" align="left">
		
			<div class="span3">
				<label for="endereco">Endereço: </label>
				<input class="span12" id="endereco" placeholder="Endereço"/>
			</div>
			
			<div class="span3">
				<label for="bairro">Bairro: </label>
				<input class="span12" id="bairro" placeholder="Bairro"/>
			</div>
			
			<div class="span2">
				<label for="cep">CEP: </label>
				<input class="span12" id="cep" placeholder="CEP"/>
			</div>
			
			<div class="span4">
				<label for="cidade">Cidade: </label>
				<input class="span12" id="cidade" placeholder="Cidade"/>
			</div>
			
		</div>
		
		<div class="controls controls-row" align="left">
			
			<div class="span3">
				<label for="estado">UF: </label>
				<select class="span12">
					<option>...Estado...</option>
					<option value="${estado}">
					</option>
				</select>
			</div>
			
			<div class="span3">
				<label for="telefone">Telefone: </label>
				<input class="span12 telefone" placeholder="Telefone"/>
			</div>
			
			<div class="span2">
				<label for="celular">Celular: </label>
				<input class="span12 telefone" placeholder="Celular"/>
			</div>
			
		</div>
		
		<div class="controls">
			<p class="span12">Dados Relacionados a Igreja</p>
		</div>
		
		<div class="controls controls-row" align="left">
		
			<div class="span3">
				<label for="igreja">Igreja: <span class="erro" style="font-size: 20px;">*</span></label>
				<select ng-required="true" class="span12" ng-model="igreja">
					<option>Selecione...</option>
						<option value="${igreja.idigreja}">
							<c:out value="${igreja.nome}" />
						</option>
				</select>
			</div>
			
			<div class="span3">
				<label for="batismo">Data-Batismo: </label>
				<input class="span12" class="data" id="batismo" placeholder="Data-Batismo"/>
			</div>
			
			<div class="span3">
				<label for="batismo_espirito">Batismo-Espírito: </label>
				<select class="span12">
					<option>Selecione...</option>
						<option value="${batismoEspirito}">
							<c:out value="${batismoEspirito}" />
						</option>
				</select>
			</div>
			
			<div class="span3">
				<label for="funcao">Função: </label>
				<select class="span12">
					<option>Selecione...</option>
						<option value="${funcoes}">
							<c:out value="${funcoes}" />
						</option>
				</select>
			</div>
			
		</div>
		
		<div class="controls controls-row" align="left">
			
			<div class="span3">
				<label for="funcao">Situação: </label>
				<select class="span12">
					<option>Selecione...</option>
						<option value="${situacao}">
							<c:out value="${situacao}" />
						</option>
				</select>
			</div>
			
			<div class="span3">
				<label for="descricao">Descrição:</label>
				<textarea class="span12" id="descricao" placeholder="Breve Descrição do Membro - atribuições,vida cristã e etc..."></textarea>
			</div>
			
		</div>
						
		</fieldset>
		<button type="submit" class="btn btn-primary" >Salvar</button>
		<button type="reset" class="btn btn-info">Limpar</button>
</form>