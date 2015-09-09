$(document).ready(function() {

	$("#update_tweet").submit(function(event) {
		event.preventDefault();

		$('#submit-tweet-button').attr("disable", true);
		$('#submit-tweet-button').val("loading...");
		// $('#ajax-loader').show();

		$.ajax({
			url: "/update_tweet",
			method: "post",
			data: $(this).serialize(),
			success: function() {
				alert("Tweet submited");
			},
			error: function() {
				alert("Tweet not submitted");
			}
			
		}).done(function(){
			$('#submit-tweet-button').val("submit tweet");
		})

	});


});
