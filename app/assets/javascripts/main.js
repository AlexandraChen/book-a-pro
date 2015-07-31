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

	$("button.review").on("click", function(event){
		$(event.currentTarget).next().toggle()
	})

	$(".prof-pic-medium").mouseenter(function(e){
		console.log("mousein");
		$(e.currentTarget.children[1].children[0]).fadeOut()
	})
		$(".prof-pic-medium").mouseleave(function(e){
		console.log("mouseout");
		$(e.currentTarget.children[1].children[0]).fadeIn()
	})
})