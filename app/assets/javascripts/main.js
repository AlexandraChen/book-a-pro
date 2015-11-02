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

  $('a[href^="#why"]').on('click',function (event) {
    event.preventDefault()
    var target = this.hash
    var $target = $(target)
    $('html, body').stop().animate({
      'scrollTop': $target.offset().top
    }, 900, 'swing', function () {
      window.location.hash = target
   })
  })

})