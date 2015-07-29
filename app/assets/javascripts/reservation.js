$(function () {
	$("#reservation").on("click",function(){
		$(this).hide()
		$(".reservation-form").show()
	})

	$("#show-reservations").on("click", function(){
		$(".my-reservations").show()
	})

})