// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('page:load ready', function() {
  $('#pair-search').hide();
  $('#date-search').hide();
  $('input[type="radio"]').click(function() {
    if ($(this).attr("value") == "pair") {
        $("#pair-search").show();
        $("#date-search").hide();
    }
    else {
        $("#date-search").show();
          $("#pair-search").hide();
    }
  $('#search-form').on('submit', function(e) {
    e.preventDefault();
  $.ajax({
    url: '/profiles?search=' + $('#search').val(),
    type:'GET',
    dataType: 'script',
    success:function(data){
    $('#users').html(data);
  }
  });
  })
  });
});
