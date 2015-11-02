$(document).ready(function () {

  $("#reservation_user").click(function(){
    $(this).after("<br> <%= render partial: 'reservations/reservation_form', locals: {reservation: @reservation}%>")
    $(".reservation-form").show()
  })

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