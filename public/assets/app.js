var app = new function() {
	var endpoint = "api.php";
	var submit = $('button.btn-default');

	var reflectResponse = function(data) {
		if (!$.isArray(data)) {
			submit.addClass('btn-warning');
			console.log(data);
			return;
		}

		submit.removeClass('btn-warning');
		var container = $('tbody').html('');
		var rows = '';
		for (var i = 0; i < data.length; i++) {
			var v = '"ry' + i + '[]"';
			rows += '<tr><td>' + data[i][0] + '<input type="hidden" name='+v+' value="'+data[i][0]+'" /></td> <td><input type="text" name='+v+' value="'+data[i][1]+'" /></td> <td><input type="text" name='+v+' value="'+data[i][2]+'" /></td> <td><input type="text" name='+v+' value="'+data[i][3]+'" /></td></tr>';
		}
		container.html(rows);
	};

	var setSubmit = function() {
		submit.on('click', function(event) {
			submit.prop("disabled",true);
			var payload = $('form').serialize();
			var jqxhr = $.post(endpoint , payload, reflectResponse)

  			.fail(function(data) {
				console.log(data);
  			})
  			.always(function() {
				submit.prop("disabled", false);
  			});
			event.preventDefault();
		});
	};

	var fetchRegistration = function() {
		var jqxhr = $.get(endpoint+'&registrasie', reflectResponse)

		.fail(function(data) {
			console.log(data);
		});
	};

	this.init = function() {
		fetchRegistration();
		setSubmit();
	};
};

$(app.init);