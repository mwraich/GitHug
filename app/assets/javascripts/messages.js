$(document).on('page:load ready', function() {
  // $('.reply_form').hide();
  var sender = $('.recipient_id').html();
  var subject = $('.subject_line').html();

  $('.reply').on('click', function(eventHandler){
    eventHandler.preventDefault();

    $.ajax({
      url: '/messages',
      type: 'GET',
      // data: "script",
      success: function(){
        // var sender = $('.sender_id').html();
        $('.reply_to').val(sender);

        // var subject = $('.subject_line').html();
        $('.reply_line').val(subject);
        $('.reply_form').show();
      }

    });
  });
});
