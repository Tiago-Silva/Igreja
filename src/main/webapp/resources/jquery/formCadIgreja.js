$(document).ready(function() {
    $(function() {
        $("#cpf").mask("999.999.999-99");
        $(".telefone").mask("(99)9999-9999");
        $("#telefoneResp").mask("(99)9999-9999");
        $("#rg").mask("99.999.999-99");
        $("#cnpj").mask("99.999.999/9999-99");
        $("#cep").mask("99.999-999");
    });
    
    $(function() {
        $(".data").datepicker({
            showAnim : "clip",
            firstDay : 0,
            dateFormat : "dd/mm/yy",
            dayNames : ["Domingo", "Segunda-Feira", "Terça-Feira", "Quarta-Feira", "Quinta-Feira", "Sexta-Feira", "Sábado"],
            dayNamesMin : ["D", "S", "T", "Q", "Q", "S", "S"],
            monthNames : ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
            monthNamesShort : ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"],
            showButtonPanel : true,
            currentText : "Hoje",
            closeText : "Fechar",
            changeMonth: true,
            changeYear: true,
            minDate: new Date(1960, 0, 1) ,
            maxDate: new Date(2014, 12, 31),
            defaultDate: new Date(1960, 0, 1),
            yearRange: '1950:2014',
            autoSize : true
        });
    });
    
    $("#nome").blur(function() {
        var nome = $("#nome").val();

        if (nome == null || nome.length < 9) {
            alert("Você precisa preencher este campo, minímo 10 caracteres");

            $(this).focus().css("border", "2px red solid");
        } else {
            $(this).css("border", "");
        }
    });
    
    $("#btSalvar").button();
    $(".btSalvar").button();
    
    $(".valor").maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:'.', affixesStay: false});
    
    $( "#tabs" ).tabs();

});

$(function() {
    $(".inicio").datepicker({
        showWeek : true,
        firstDay : 0,
        dateFormat : "dd/mm/yy",
        dayNames : ["Domingo", "Segunda-Feira", "Terça-Feira", "Quarta-Feira", "Quinta-Feira", "Sexta-Feira", "Sábado"],
        dayNamesMin : ["D", "S", "T", "Q", "Q", "S", "S"],
        monthNames : ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
        monthNamesShort : ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"],
        showButtonPanel : true,
        currentText : "Hoje",
        closeText : "Fechar",
        weekHeader : "#",
        autoSize : true
    });
});

$(function() {
    $("#inicio").datepicker({
        showWeek : true,
        firstDay : 0,
        dateFormat : "dd/mm/yy",
        dayNames : ["Domingo", "Segunda-Feira", "Terça-Feira", "Quarta-Feira", "Quinta-Feira", "Sexta-Feira", "Sábado"],
        dayNamesMin : ["D", "S", "T", "Q", "Q", "S", "S"],
        monthNames : ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
        monthNamesShort : ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"],
        showButtonPanel : true,
        currentText : "Hoje",
        closeText : "Fechar",
        weekHeader : "#",
        autoSize : true
    });
});

$(function() {
    $("#fim").datepicker({
        showWeek : true,
        firstDay : 0,
        dateFormat : "dd/mm/yy",
        dayNames : ["Domingo", "Segunda-Feira", "Terça-Feira", "Quarta-Feira", "Quinta-Feira", "Sexta-Feira", "Sábado"],
        dayNamesMin : ["D", "S", "T", "Q", "Q", "S", "S"],
        monthNames : ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
        monthNamesShort : ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"],
        showButtonPanel : true,
        currentText : "Hoje",
        closeText : "Fechar",
        weekHeader : "#",
        autoSize : true
    });
});

$(function(){
	var navigations = $('#navigations'),

	  pos = navigations.offset();
	  
	  $(window).scroll(function(){

	    if($(this).scrollTop() > pos.top+navigations.height() && navigations.hasClass('default')){

	      navigations.fadeOut('fast', function(){

	        $(this).removeClass('default').addClass('stabled').fadeIn('fast');

	      });
	    } else if($(this).scrollTop() <= pos.top && navigations.hasClass('stabled')){

	      navigations.fadeOut('fast', function(){

	        $(this).removeClass('stabled').addClass('default').fadeIn('fast');

	      });

	    }

	  });
	});

var atualizaDados = function() {
	var tabela = $(".tablesorter");
	var total = 0;
	var items = 0;
	tabela.each(function() {
		var carrinho = $(this);
		items = carrinho.find(".valor");
		
		for(var i = 0; i < items.length; i++) {
			var item = $(items[i]);
			var valor = parseFloat(item.text());
			total = total + valor;
		}
		
	});
	console.log("Valor total: " + total);
	$(".total").text(total);
	$(".itens-total").text(items.length);
	
};

var atualizaDadosMes = function() {
	var tabela = $(".tablesorter");
	var totalEntrada = 0;
	var totalSaida = 0;
	var itemsEntrada = 0;
	var itemsSaida = 0;
	tabela.each(function() {
		var carrinho = $(this);
		itemsEntrada = carrinho.find(".entrada");
		itemsSaida = carrinho.find(".saida");
		
		for(var i = 0; i < itemsEntrada.length; i++) {
			var item = $(itemsEntrada[i]);
			var valorEntrada = parseFloat(item.text());
			totalEntrada = totalEntrada + valorEntrada;
		}
		
		for(var i = 0; i < itemsSaida.length; i++) {
			var item = $(itemsSaida[i]);
			var valorSaida = parseFloat(item.text());
			totalSaida = totalSaida + valorSaida;
		}
		
	});
	console.log("Valor total Entrada: " + totalEntrada);
	console.log("Valor total Saída: " + totalSaida);
	$(".totalEntrada").text(totalEntrada);
	$(".totalSaida").text(totalSaida);
	
};


var atualizaDadoAno = function() {
	var tabela = $(".tablesorter");
	var total = 0;
	var items = 0;
	tabela.each(function() {
		var carrinho = $(this);
		items = carrinho.find(".valorAno");
		
		for(var i = 0; i < items.length; i++) {
			var item = $(items[i]);
			var valor = parseFloat(item.text());
			total = total + valor;
		}
		
	});
	console.log("Valor total: " + total);
	$(".totalAno").text(total);
	$(".itens-totalAno").text(items.length);
};

var quantidade_itens = function() {
	var total = $(".qt_total").length;
	$(".total-itens").text(total);
};


var pesquisar = function() {
	var nome = $("#pesquisa").text();
	var local = $(this);
	if(nome == local.find("td").text()) {
		var pes = loca.find("td").text();
		$("#pesquisa").text(pes);
	};
};

var colocaFocu = function(){
	$(this).css("border-color", "#7EE1FA");
};
var tiraFocu = function() {
	$(this).css("border-color", "");
};
var aposInicializado = function() {
	atualizaDadoAno();
	atualizaDadosMes();
	quantidade_itens();
	$("input").focusin(colocaFocu);
	$("input").focusout(tiraFocu);
	$("#descricacao").focusin(colocaFocu);
	$("#descricacao").focusout(tiraFocu);
};
$(aposInicializado);
