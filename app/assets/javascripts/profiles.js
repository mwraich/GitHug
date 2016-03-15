

// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('page:load ready', function() {

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
