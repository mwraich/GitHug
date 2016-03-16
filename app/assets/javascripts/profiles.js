

// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('page:load ready', function() {

// Responsive Nav Bar
  $(".new_message").toggle();
  $(".message-to-button").on('click', function(e){

    $(".new_message").toggle();
  });

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

// Form Functionality
  $('#showLocation').hide();
  $('#showGenderAndBirthday').hide();
  $('#showAboutMe').hide();
  $('#showLanguage').hide();
  $('#showPreferences').hide();

  $('#nameNext').click(function(){
    $('#showFirstName').hide();
    $('#showGenderAndBirthday').show(1000);
  });

  $('#birthdayNext').click(function(){
    $('#showGenderAndBirthday').hide();
    $('#showAboutMe').show(1000);
  });

  $('#aboutMeNext').click(function(){
    $('#showAboutMe').hide();
    $('#showLanguage').show(1000);
  });


    $('#languageNext').click(function(){
      $('#showLanguage').hide();
      $('#showPreferences').show(1000);
    });



// Slideshow
  $('.bxslider').bxSlider();


//Search Function
  $('#pair-search').hide();
  $('#date-search').hide();
  $('.index-users').hide();
  $('input[type="radio"]').click(function() {
    if ($(this).attr("value") == "pair") {
        $("#pair-search").fadeIn(1000);
        $("#date-search").hide();
    }else{
      $("#date-search").fadeIn(1000);
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
          $('.index-users').show();
        }else{

          $("#search-result").html("Sorry, nobody matches your search");
        }
      }
    });
  });
  //
  // // url: '/profiles?search=' + $('#search').val(),
  // // type:'GET',
  // // dataType: 'script',
  });
  });


  $(document).ready(function () {
     $('#new_profile').validate();
     console.log("Hello")
  });
