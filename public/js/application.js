$(document).ready(function() {
  $('#registration_form').submit(function(event){
    event.preventDefault()
    $.ajax({
      method: 'post',
      url: '/users/new',
      data: $(this).serialize()
    }).done(function(){
      window.location.href = '/'
    }).fail(function(jqXHR, textStatus, errorThrown){
       alert(errorThrown)
    })
  })



  $('.new_answer').on('click', function(event){
    event.preventDefault();
    var $post = $(this)
    $.ajax({
      url: '/answers/new',
      method: 'get'
    }).done(function(response){
      $(response).appendTo("#new_form_container")
    })
  })




















});
