/**
 * 
 */
$(function() {
var availableTags = [
"Domingo", "Segunda-Feira", "Terça-Feira", "Quarta-Feira", "Quinta-Feira", "Sexta-Feira", "Sábado"];
$( "#dia" ).autocomplete({
source: availableTags
});
});