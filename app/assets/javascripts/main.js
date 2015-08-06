$(document).ready(function () {
	$("#search").on("click", function(){
		$(this).val("")
	})

	$("button.review").on("click", function(event){
		$(event.currentTarget).next().toggle()
	})

	$(".prof-pic-medium").mouseenter(function(e){
		$(e.currentTarget.children[1]).fadeOut()
		$(e.currentTarget.children[0].children[0]).css({color: "black"})
		$(e.currentTarget.children[0].children[1]).css({color: "#B10DC9"})
	})
		$(".prof-pic-medium").mouseleave(function(e){
		$(e.currentTarget.children[1]).fadeIn()
		$(e.currentTarget.children[0].children[0]).css({color: "white"})
		$(e.currentTarget.children[0].children[1]).css({color: "white"})
	})

	$(window).scroll(function () {
      if ($(this).scrollTop() > 100) {
          $('.scrollup').fadeIn();
      } else {
          $('.scrollup').fadeOut();
      }
    });
    $('.scrollup').click(function () {
      $("html, body").animate({
          scrollTop: 0
      }, 600);
      return false;
  	});

  $("button.review-btn").on("click",function(){
		$(".reviews-form").toggle();
	})

  $("#make-reservation").on("click",function(){
		$(".reservation-form").toggle()
	})

	$("#user-reservations").on("click", function(){
		$("#user-reservations").toggle()
	})

	$("#pro-reservations").on("click", function(){
		$(".my-reservations").toggle()
	})

	$(".view-reservation").on("click", function(event){
		$(event.currentTarget).next().toggle()
	})

	$('#search-form').on("submit",function(event){
		event.preventDefault()
	})


})