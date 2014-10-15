<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
	canvas {
		display: none;
	}
	video, #photo, #startbutton {
		display: block;
		float: left;
		border: 10px solid #fff;
		border-radius: 10px;
	}
	#startbutton {
		background: green;
		border: none;
		color: #fff;
		margin: 100px 20px 20px 20px;
		padding: 10px 20px;
		font-size: 20px;
	}
	#container {
		display: none;
		overflow: hidden;
		width: 880px;
		margin: 20px auto;
	}
</style>
	
	
	
<div id="container">
	<video id="video"></video>
	<button id="startbutton">Tire photo</button>
	<canvas id="canvas"></canvas>
	<img src="http://placekitten.com/g/320/261" id="photo" alt="photo">
</div>
<div align="center" class="ui-widget" id="cadMembro">
	<sf:form modelAttribute="membro" action="salvaMembro" enctype="multipart/form-data">
		<fieldset>
			<legend>Cadastro de Membros</legend>
			<table>
				<tr>
					<td colspan="10" style="background: aqua;">Documentos Pessoais</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="nome">Nome: <span class="erro" style="font-size: 20px;">*</span><sf:errors path="nome" cssClass="erro"/></label>
						<sf:input title="Digite o Nome" id="nome" path="nome" />
					</td>
					
					<td>
						<label for="cpf">CPF: <span class="erro" style="font-size: 20px;">*</span><sf:errors path="cpf" cssClass="erro"/></label>
						<sf:input id="cpf" path="cpf" />
					</td>
					
					<td>
						<label for="rg">RG: </label>
						<sf:input id="rg" path="rg" />
					</td>
					
					<td>
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
					<td>
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
				<tr>					
					<td>
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
					
					<td>
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
					
					<td>
						<label for="imagem">Imagem: </label>
						<input type="file" id="imagem" name="imagem"/>
					</td>
					
					<td>
						<a href="#" onclick="abreWebCam();">Tire foto com sua web-cam</a>
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
							<option>Selecione...</option>
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
					<td colspan="10" style="background: aqua;">Endereço Atual</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="endereco">Endereço: </label>
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
							<option>Selecione...</option>
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
					<td colspan="10" style="background: aqua;">Dados Relacionados a  Igreja</td>
				</tr>
				<tr>
					<td colspan="3">
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
				
					<td>
						<label for="batismo">Data-Batismo: </label>
						<sf:input class="data" id="batismo" path="batismo" />
					</td>
					
					<td>
						<label for="batismo_espirito">Batismo-Espí­rito: </label>
						<sf:select path="batismo_espirito">
							<option>Selecione...</option>
							<c:forEach items="${batismoEspirito}" var="batismoEspirito">
								<option value="${batismoEspirito}">
									<c:out value="${batismoEspirito}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
					
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
					
				</tr>
				
				<tr>
					
					<td>
						<label for="funcao">Situação: </label>
						<sf:select path="situacao">
							<option>Selecione...</option>
							<c:forEach items="${situacao}" var="situacao">
								<option value="${situacao}">
									<c:out value="${situacao}" />
								</option>
							</c:forEach>
						</sf:select>
					</td>
					
					<td colspan="3">
						<label for="descricao">Descrição:</label>
						<sf:textarea id="descricao" path="descricao"/>
					</td>
				</tr>
			</table>
		</fieldset>
		<button type="submit" class="btSalvar" >Salvar</button>
		<button type="reset" class="btSalvar">Limpar</button>
	</sf:form>
</div>

<script type="text/javascript">
function abreWebCam() {

	
	(function() {
		  var container = document.querySelector('#container');
		  if(container.style.display = 'none') {
			container.style.display = 'block';
		  }
		  var streaming = false,
		      video        = document.querySelector('#video'),
		      cover        = document.querySelector('#cover'),
		      canvas       = document.querySelector('#canvas'),
		      photo        = document.querySelector('#photo'),
		      startbutton  = document.querySelector('#startbutton'),
		      width = 320,
		      height = 0;

		  navigator.getMedia = ( navigator.getUserMedia || 
		                         navigator.webkitGetUserMedia ||
		                         navigator.mozGetUserMedia ||
		                         navigator.msGetUserMedia);

		  navigator.getMedia(
		    { 
		      video: true, 
		      audio: false 
		    },
		    function(stream) {
		      if (navigator.mozGetUserMedia) { 
		        video.mozSrcObject = stream;
		      } else {
		        var vendorURL = window.URL || window.webkitURL;
		        video.src = vendorURL.createObjectURL(stream);
		      }
		      video.play();
		    },
		    function(err) {
		      console.log("An error occured! " + err);
		    }
		  );

		  video.addEventListener('canplay', function(ev){
		    if (!streaming) {
		      height = video.videoHeight / (video.videoWidth/width);
		      video.setAttribute('width', width);
		      video.setAttribute('height', height);
		      canvas.setAttribute('width', width);
		      canvas.setAttribute('height', height);
		      streaming = true;
		    }
		  }, false);

		  function takepicture() {
		    canvas.getContext('2d').drawImage(video, 0, 0, canvas.width, canvas.height);
		    var data = canvas.toDataURL('image/png');
		    document.querySelector('#photo').src = data;
		  }

		  startbutton.addEventListener('click', function(ev){
		  	takepicture();
		    ev.preventDefault();
		  }, false);

		})();	
};
</script>