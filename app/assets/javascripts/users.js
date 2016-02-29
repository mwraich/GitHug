// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('page:load ready', function() {
$('#search-form').on('submit', function(e) {
  e.preventDefault();
$.ajax({
  url: '/users?search=' + $('#search').val(),
  type:'GET',
  dataType: 'script'
});


})
})
