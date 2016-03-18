
// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/$(document).on('page:load ready', function() {

$(document).on('page:load ready', function() {

// Message pop-up
  $('.message-to-button').on('click', function(){
    $('.new_message_pop_up').toggleClass('new_message_pop_up_expanded');
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

// Slideshow
  $('.bxslider').bxSlider();

  $('#login-notice').delay(1000).slideUp(1000);


  $('#imageslideshow').hide();

  $('#profile-images').click(function(){
    $("#dim-page").css("opacity",0.6).fadeIn(100, function(){
      $('#imageslideshow').css({'position':'absolute', 'display':'block', 'z-index': 99999});
    });


    var presentIndex = 0,
      photos = $('.container div'),
      photoAmount = photos.length;

      function nextPhoto() {
        var photo = $('.container div').eq(presentIndex);
        photos.hide();
        photo.css('display','inline-block');
      }

      $('.right_arrow').click(function() {
        presentIndex++;
          if (presentIndex > photoAmount - 1) {
            presentIndex = 0;
          }
        nextPhoto();
      });

      $('.left_arrow').click(function(){
        presentIndex--;
          if (presentIndex < 0){
            presentIndex = photoAmount - 1;
          }
        nextPhoto();
      });
    });

    $('.x').click(function(){
      $("#dim-page").css("opacity",0).fadeOut(50, function(){
        $('#imageslideshow').css('display', 'none');
    });
  });

// AJAX call for search - if search isn't returning results this is liking getting broken
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
          console.log("fail")
          $(".index-users").html("Sorry, nobody matches your search");
        }
      }
    });
  });
  });

  $(document).ready(function () {
    $('.gender_validation').click(function() {
      $(this).siblings('input:checkbox').prop('checked', false);
    });
       $('#new_profile').validate({
         rules: {
           'profile[first_name]': {
             required: true,
             minlength: 2
           },
           'profile[last_name]': {
             required: true,
             minlength: 2
           },
            'profile[location]': {
              required: true,
              minlength: 2
            },
          'profile[birthday]': {
              check_date_of_birth: true,
              require: true
            },
            'profile[operating_system]': {
              minlength: 1
            },
            'profile[about_me]': {
              required: true,
              minlength: 5,
              maxlength: 500
            }
         }
       })
    });
