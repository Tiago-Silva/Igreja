/**
 * 
 */
$(function() {

	// define pager options
	var pagerOptions = {
		// target the pager markup - see the HTML block below
		container : $(".pager"),
		// output string - default is '{page}/{totalPages}'; possible variables:
		// {page}, {totalPages}, {startRow}, {endRow} and {totalRows}
		output : '{startRow} - {endRow} / {filteredRows} ({totalRows})',
		// if true, the table will remain the same height no matter how many
		// records are displayed. The space is made up by an empty
		// table row set to a height to compensate; default is false
		fixedHeight : true,
		// remove rows from the table to speed up the sort of large tables.
		// setting this to false, only hides the non-visible rows; needed if you
		// plan to add/remove rows with the pager enabled.
		removeRows : false,
		// go to page selector - select dropdown that sets the current page
		cssGoto : '.gotoPage'
	};

	// Initialize tablesorter
	// ***********************
	$("table").tablesorter({
		theme : 'blue',
		headerTemplate : '{content} {icon}', // new in v2.7. Needed to add
												// the bootstrap icon!
		widthFixed : true,
		widgets : [ 'zebra', 'filter' ]
	})

	// initialize the pager plugin
	// ****************************
	.tablesorterPager(pagerOptions);

	// Add two new rows using the "addRows" method
	// the "update" method doesn't work here because not all rows are
	// present in the table when the pager is applied ("removeRows" is false)
	// ***********************************************************************
	var r, $row, num = 50, row = '<tr><td>Student{i}</td><td>{m}</td><td>{g}</td><td>{r}</td><td>{r}</td><td>{r}</td><td>{r}</td><td><button type="button" class="remove" title="Remove this row">X</button></td></tr>'
			+ '<tr><td>Student{j}</td><td>{m}</td><td>{g}</td><td>{r}</td><td>{r}</td><td>{r}</td><td>{r}</td><td><button type="button" class="remove" title="Remove this row">X</button></td></tr>';
	$('button:contains(Add)').click(function() {
		// add two rows of random data!
		r = row.replace(/\{[gijmr]\}/g, function(m) {
			return {
				'{i}' : num + 1,
				'{j}' : num + 2,
				'{r}' : Math.round(Math.random() * 100),
				'{g}' : Math.random() > 0.5 ? 'male' : 'female',
				'{m}' : Math.random() > 0.5 ? 'Mathematics' : 'Languages'
			}[m];
		});
		num = num + 2;
		$row = $(r);
		$('table').find('tbody').append($row).trigger('addRows', [ $row ]);
		return false;
	});

	// Delete a row
	// *************
	$('table').delegate('button.remove', 'click', function() {
		var t = $('table');
		// disabling the pager will restore all table rows
		t.trigger('disable.pager');
		// remove chosen row
		$(this).closest('tr').remove();
		// restore pager
		t.trigger('enable.pager');
	});

	// Destroy pager / Restore pager
	// **************
	$('button:contains(Destroy)').click(function() {
		// Exterminate, annhilate, destroy!
		// http://www.youtube.com/watch?v=LOqn8FxuyFs
		var $t = $(this);
		if (/Destroy/.test($t.text())) {
			$('table').trigger('destroy.pager');
			$t.text('Restore Pager');
		} else {
			$('table').tablesorterPager(pagerOptions);
			$t.text('Destroy Pager');
		}
		return false;
	});

	// Disable / Enable
	// **************
	$('.toggle').click(function() {
		var mode = /Disable/.test($(this).text());
		$('table').trigger((mode ? 'disable' : 'enable') + '.pager');
		$(this).text((mode ? 'Enable' : 'Disable') + 'Pager');
		return false;
	});
	$('table').bind('pagerChange', function() {
		// pager automatically enables when table is sorted.
		$('.toggle').text('Disable');
	});
	var colocaFocu = function(){
		$(this).css("border-color", "#7EE1FA");
	};
	var tiraFocu = function() {
		$(this).css("border-color", "");
	};
	$("input").focusin(colocaFocu);
	$("input").focusout(tiraFocu);

});