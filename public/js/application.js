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

$(document).on('submit', '#answer_form', function(event){
  event.preventDefault();
  $.ajax({
    url: '/answers',
    method: 'post',
    data: $(this).serialize()
  }).done(function(response){
    console.log(response)
    $(response).appendTo('#new_form_container')
  });
})



$('.new_comment_button').submit(function(){
  event.preventDefault();
  var route = $(this).attr('action');
  var $parent = $(this).parent();
  $.ajax({
    url: route,
    method: 'get'
  }).done(function(response){
    $parent.find('.new_comment_form').html(response);
    $parent.find('.new_comment_button').hide();
  })
})


$(".new_comment_form").submit(function(){
  event.preventDefault();
  var route = $(this).children().children().attr('action');
  console.log(this);
  $.ajax({
    url: route,
    method: 'post',
    data: $(this).find('form').serialize()
  }).done(function(response){
    $(".comments_container").append(response)
    $()
  })
})

});
