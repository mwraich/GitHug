$(document).on('page:load ready', function() {

  $('.sent_message').hide();

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

  $('.unread').on('click',function(){
  $(this).parent().submit();
  });

  $('#sent_message_show').on('click', function(){
    $('#show-inbox').hide();
    $('.sent_message').fadeIn(1000);
  });

  $('#show-inbox-button').on('click', function(){
    $('.sent_message').hide();
    $('#show-inbox').fadeIn(1000);
  });
});
