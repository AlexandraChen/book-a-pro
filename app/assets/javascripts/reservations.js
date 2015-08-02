
	$("#reservation_user").click(function(){
		$(this).after("<br> <%= render partial: 'reservations/reservation_form', locals: {reservation: @reservation}%>")
		$(".reservation-form").show()
	})

	