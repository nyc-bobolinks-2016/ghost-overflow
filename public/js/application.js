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
    var route = $(this).parent().attr('action')
    $(this).hide()
    $.ajax({
      url: route,
      method: 'get'
    }).done(function(response){
      $(response).appendTo("#new_form_container")

      var element = document.getElementById('new_form_container')
      element.scrollIntoView( {block: 'start', behavior: 'smooth'} )
    })
  })

  $("#new_form_container").on('click', '#answer_button', function(event){
    event.preventDefault()
    var route = $(this).parent().attr('action')
    $.ajax({
      url: route,
      method: 'post',
      data: $(this).parent().serialize()
    }).done(function(response){
      $(response).appendTo('.answer_append')
      $("#new_form_container").empty()
      $('.new_answer').show()
    })
  })

  $("#new_form_container").on('click', '#cancel_answer_button', function(event){
    event.preventDefault()
    $(this).parent().parent().parent().parent().empty()
    $('.new_answer').show()
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
    var $newCommentFormDiv = $(this)
    $.ajax({
      url: route,
      method: 'post',
      data: $(this).find('form').serialize()
    }).done(function(response){
      $(".comments_container").append(response)
      $newCommentFormDiv.empty()
      $newCommentFormDiv.parent().find('.new_comment_button').show()
    })
  })

  $(".new_comment_form").on('click', '#cancel_comment_button', function(event){
    $(this).parent().parent().parent().empty();
    $(".comments_on_questions").find('.new_comment_button').show();
  })

  $(".comment_on_answer_button").click(function(event){
    $(this).hide()
    $(this).parent().find('.comment_on_answer_form').show()
  })

  $(".cancel_comment_on_answer").click(function(event){
    event.preventDefault()
    $(this).parent().hide()
    $(this).parent().parent().find(".comment_on_answer_button").show()
  })

  $(".comment_on_answer_form").submit(function(event){
    event.preventDefault()
    var route = $(this).attr('action')
    var $answerListItem = $(this).parent()
    $.ajax({
      method: 'post',
      url: route,
      data: $(this).serialize()
    }).done(function(response){
      $answerListItem.find('.comment_on_answer_form').find("input[type=text]").val('')
      $answerListItem.find('.comment_on_answer_form').hide()
      $answerListItem.find('.comment_on_answer_button').show()
      $answerListItem.find(".comments_on_answers").append(response)
    })
  })

  $(".delete_answer").click(function(event){
    event.preventDefault()
    $answerListItemToDelete = $(this).parent()
    var route = $(this).attr('href')
    $.ajax({
      url: route,
      method: 'get'
    }).done(function(){
      $answerListItemToDelete.remove()
    })
  })

  $(document).on('click', '.delete_item',function(event){
    event.preventDefault()
    $individualCommentToDelete = $(this).parent().parent()
    var route = $(this).attr('href')
    $.ajax({
      url: route,
      method: 'get'
    }).done(function(){
      $individualCommentToDelete.remove()
    })
  })

});
