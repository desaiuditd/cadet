$.post("GetCompletedTests",
		{ requestType : "getresults" },
		function(data,textStatus,xhr) {

			try {
				 {
					var src = $("#getresults").html();
					var template = Handlebars.compile(src);
					var output = template(data);
					$("#tblResults tbody").append(output);
				}
			} catch(e) { bootbox.alert(e.status+"\n"+e.message); }
	});

