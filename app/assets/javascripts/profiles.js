// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('page:load ready', function() {
  $("#nav-mobile").html($("#nav-main").html());
    $("#nav-trigger span").click(function(){
      if ($("nav#nav-mobile ul").hasClass("expanded")) {
          $("nav#nav-mobile ul.expanded").removeClass("expanded").slideUp(250);
          $(this).removeClass("open");
      } else {
          $("nav#nav-mobile ul").addClass("expanded").slideDown(250);
          $(this).addClass("open");
      }
  });
  $('#login-notice').delay(1000).slideUp(1000);
// Slideshow
  var currentIndex = 0,
    items = $('.container div'),
    itemAmt = items.length;

    function cycleItems() {
      var item = $('.container div').eq(currentIndex);
      items.hide();
      item.css('display','inline-block');
    }

    $('.right_arrow').click(function() {
  
    currentIndex += 1;
    if (currentIndex > itemAmt - 1) {
      currentIndex = 0;
    }
    cycleItems();
  });





  $('#pair-search').hide();
  $('#date-search').hide();
  $('input[type="radio"]').click(function() {
    if ($(this).attr("value") == "pair") {
        $("#search-choice").fadeOut(1000);
        $("#first_option").fadeOut(1000);
        $("#pair-search").fadeIn(3000);
        $("#date-search").hide();


    }
    else {
      $("#search-choice").fadeOut(1000);
      $("#first_option").fadeOut(1000);
      $("#date-search").fadeIn(3000);
      $("#pair-search").hide();
    }
  $('#search-form').on('submit', function(e) {
    e.preventDefault();
    $.ajax({
      url: $(this).attr('action'),
      type: $(this).attr('method'),
      dataType:'script',
      data: $(this).serialize(),
      success: function(data) {
        if (data) {
          $("#date-search").hide();
          $("#pair-search").hide();
        }else{

          $("#search-result").html("Sorry, nobody matches your search");
        }
      }
    });
  });
});
});

// url: '/profiles?search=' + $('#search').val(),
// type:'GET',
// dataType: 'script',
