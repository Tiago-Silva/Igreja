/**
 * 
 */
$(document).ready(function() {
var tabelaJson = function start() {
		$.getJSON("ListaTodosMembrosJson", function(data){
			
			for(var i = 0; i < data.length; i++) {
				$("tbody").append(
						"<tr class='listas'>" +
							"<td align='center' width='2%' class='qt_total' style='text-align: center; height: 45px;'>" + data[i].idmembro + "</td>" +
							"<td>" + data[i].nome + "</td>" +
							"<td>" + data[i].cpf + "</td>" +
							"<td>" + data[i].rg + "</td>" +
							"<td>" + data[i].endereco + "</td>" +
							"<td>" + data[i].bairro + "</td>" +
							"<td>" + data[i].cep + "</td>" +
							"<td>" + data[i].cidade + "</td>" +
							"<td>" + data[i].telefone + "</td>" +
							"<td>" + data[i].celular + "</td>" +
							"<td>" + data[i].igrejaIdigreja + "</td>" +
						"</tr>"
				);
			}
		});
	};
	$(tabelaJson);
});