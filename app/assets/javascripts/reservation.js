$(function () {
	$("#make-reservation").on("click",function(){
		$(".reservation-form").toggle()
	})

	$("#show-reservations").on("click", function(){
		$(".my-reservations").toggle()
	})

	$(".view-reservation").on("click", function(event){
		$(event.currentTarget).next().toggle()
	})

	$("#search").on("click", function(){
		$(this).val("")
	})

})