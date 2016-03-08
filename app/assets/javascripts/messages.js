$(document).on('page:load ready', function() {


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
});
