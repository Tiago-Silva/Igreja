/**
 * 
 */
function deuCerto(dadosResposta) {
	alert("Turma deletada com sucesso");
	window.location.reload();
};
function deletar(id) {
	$(function() {
		$( "#dialog-confirm" ).dialog({
		resizable: false,
		height:170,
		modal: true,
		buttons: {
		"Sim": function() {
			//$.get("RemoveAluno?idalunos=" + id, deuCertoAluno);
		$( this ).dialog($.get("RemoveTurma?idturmas=" + id, deuCerto), "close" );
		},
		Cancelar: function() {
		$( this ).dialog( "close" );
		}
		}
		});
		$("#name").text(id);
	});
	//window.setTimeout("location.reolad()", 6000);
};
//Deleta Aluno pelo ID
function deuCertoMembro(dadosResposta) {
	$("#msg").text("Membro Deletado com Sucesso");
	$("#name").css("display", "none");
	window.location.reload();
};
function deletarMembro(id,nome) {
		console.log("Chamando o metodo deleta");
		
		// Canvas e contexto
	      var canvas = document.getElementById('meu_canvas');
	      var context = canvas.getContext('2d');
	      context.clearRect(0, 0, canvas.width, canvas.height);
	      
	      // Carregar a imagem
	      var imagem = new Image();
	      imagem.src = 'fotoMembro?idmembro=' + id;
	      
	      imagem.onload = function() {
	         // Começar na posição 20
	         var x = 0;
	         context.drawImage(imagem, x, 0, 128, 180);
	         
	      };
		
		$(function() {
			$( "#dialog-confirm" ).dialog({
			resizable: false,
			height:270,
			modal: true,
			buttons: {
			"Sim": function() {
				//$.get("RemoveAluno?idalunos=" + id, deuCertoAluno);
			$( this ).dialog($.post("RemoveMembro?idmembro=" + id, deuCertoMembro), "close" );
			},
			Cancelar: function() {
			$( this ).dialog( "close" );
			}
			}
			});
			$("#name").text(nome);
		});
		
	//window.setTimeout("location.reolad()", 6000);
};

function editarMembro(id) {
	$.getJSON("ListaTodosMembrosJson/" + id, function(data){
		for(var i = 0; i < data.length; i++) {
			
			$("#idmembro").val(data[i].idmembro);
			$("#foto").val($.get("fotoMembro?idmembro=" + data[i].idmembro));
			$("#nome").val(data[i].nome);
			$("#cpf").val(data[i].cpf);
			$("#rg").val(data[i].rg);
			$("#orgaorg").val(data[i].orgaorg);
			$("#naturalidade").val(data[i].naturalidade);
			$("#nascimento").val(data[i].nascimento);
			$("#endereco").val(data[i].endereco);
			$("#bairro").val(data[i].bairro);
			$("#cep").val(data[i].cep);
			$("#cidade").val(data[i].cidade);
			$("#telefone").val(data[i].telefone);
			$("#celular").val(data[i].celular);
			$("#batismo").val(data[i].batismo);
			console.log(data[i].nome);
		}
	});
	$(function() {
		 
		 $( ".dialog-edit" ).dialog({
			 resizable: false,
			 height: 650,
			 width: 1250,
			 modal: true,
			 buttons: {
			 "Salvar": function() {
			
			 $( this ).dialog(deuCertoMembro, "close" );
			 
			 },
			 Cancel: function() {
			 $( this ).dialog( "close" );
			 }
			 }
			 });
	});
	
};