$(document).on('page:load ready', function() {

  $('.sent_message').hide();

// This toggles the message area of an inbox message when you click the div
  $('.chat-message-content').toggle();
  $('.chat-message').on('click', function(e){
    $(this).next('.chat-message-content').toggle();
    if($(this).find('input[type=checkbox]').prop("checked") === true){

    }else{
    $(this).find('input[type=checkbox]').prop("checked", !$(this).find('input[type=checkbox]').prop("checked"));
    $('.edit_message').submit();
  }
  });


// This handles the the reply partial
  $(this).on('click','.reply', function(eventHandler){
    eventHandler.preventDefault();
    var self = $(this);

    $.ajax({
      url: $(self).attr('href'),
      type: 'GET',
      // dataType: "script",
      success: function(data){
        if ($(self).siblings('form').length == 0){
          $(data).insertAfter(self);
        }
      }

    });
  });

  // this handles the change in read status
  $('#sent_message_show').on('click', function(){
    $('#show-inbox').hide();
    $('.sent_message').fadeIn(1000);
  });

  $('#show-inbox-button').on('click', function(){
    $('.sent_message').hide();
    $('#show-inbox').fadeIn(1000);
  });

  $('#commit').on('click', function(eventHandler){
    eventHandler.preventDefault();
    eventHandler.stopPropagation();
  $.ajax({
    url: $(self).attr('action'),
    type: 'POST',
    dataType: 'script',
    data: $(self).serialize(),
  });
  });
});
