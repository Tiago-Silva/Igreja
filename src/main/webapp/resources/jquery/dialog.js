/**
 * 
 */
$(document).ready(function() {
	var destaque = function() {
		$(this).css("background", "LightGreen");
	};
	var tiraDestaque = function() {
		$(this).css("background", "");
	};

	$(".listas").hover(destaque, tiraDestaque);
	
});

$(function() {
	$("#dialog-form")
			.dialog(
					{
						autoOpen : false,
						height : 400,
						width : 450,
						modal : true
					});
	$("#create-user").button().click(function() {
		$("#dialog-form").dialog("open");
	});

});

function novoMembro() {
	$(function() {
		$( "#dialog-novoMembro" ).dialog({
		resizable: false,
		height:650,
		width: 1320,
		modal: true
		});
	});
	//window.setTimeout("location.reolad()", 6000);
};