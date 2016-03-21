
// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/$(document).on('page:load ready', function() {

$(document).on('page:load ready', function() {

// Message pop-up
  $('.new_message_pop_up_expanded').hide();
  $('.message-to-button').on('click', function(){
    $('.new_message_pop_up_expanded').slideToggle();
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

    $('#languageNext').click(function(){
      $('#showLanguage').hide();
      $('#showPreferences').show(1000);
  });

  // For previous button
    $('#birthdayPrevious').click(function(){
      $('#showFirstName').show(1000);
      $('#showGenderAndBirthday').hide();
    });

    $('#aboutMePrevious').click(function(){
      $('#showGenderAndBirthday').show(1000);
      $('#showAboutMe').hide();
    });

    $('#languagePrevious').click(function(){
      $('#showAboutMe').show(1000);
      $('#showLanguage').hide();
    });

    $('#preferencesPrevious').click(function(){
      $('#showLanguage').show(1000);
      $('#showPreferences').hide();
    });

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
    });

    // $('#add-partner').hide
    var partnerPreference = $('#profile_date');
    // var pairPreference = $('#profile_paired_programmer');
    //
    // var initialPartner = partnerPreference.is(':checked');
    // var initialPair = pairPreference.is(':checked');

    // var addPartner = $("#add-partner")[initialPartner ? "removeClass" : "addClass"]("hide");
    //
    // var addPartnerInputs = addPartner.find("input").attr('disabled', !initialPartner);
    //
    // partnerPreference.click(function() {
    //   addPartner[this.checked ? "removeClass" : "addClass"]('hide');
    //   addPartnerInputs.attr("disabled", :this.checked);
    // });

  $('.edit_profile').validate({
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
          required: true
        },
        'profile[operating_system]': {
          required: true,
          minlength: 1
        },
        'profile[about_me]': {
          required: true,
          minlength: 5,
          maxlength: 500
        },
      }
  });

  $.validator.addMethod("check_date_of_birth", function(value, element) {
    if (this.optional(element)) {
      return true;
    }
    var birthday = $("#profile_birthday").val();
    var birthdaydate = Date.parse(birthday);
    var difference = Date.now() - birthdaydate;
    var ageYear = new Date(difference);
    var age = Math.abs(ageYear.getUTCFullYear() - 1970);
    return age > 18;
  }, "You must be at least 18 years of age.");


  //Search form validation
  $('#search-form').validate({
    rules: {
      'search[language]': {
        required: true,
        minlength: 1
      },
      'search[operating_system]': {
        required: true,
        minlength: 1
      },
      'search[min_age]': {
        required: true,
        min: 18
      },
      'search[max_age]': {
        required: true,
        max: 100
      },
      'search[city]': {
        required: true,
        minlength: 1
      },
      'search[province]': {
        required:true
      }
    }
  });

  // Slideshow
    $('.bxslider').bxSlider();

    $('#login-notice').delay(1000).slideUp(1000);

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
