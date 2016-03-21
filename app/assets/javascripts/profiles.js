
$(document).on('page:load ready', function() {
// Message pop-up
  $(".new_message").toggle();
  $(".message-to-button").on('click', function(){
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

      var form = $("#new_profile");

        form.validate({
        rules: {
          'profile[first_name]': {
            minlength: 2,
            required: true
          },
          'profile[last_name]': {
            minlength: 2,
            required: true
          },
          'profile[location]': {
            minlength: 2,
            required: true
          },
          'profile[birthday]': {
            check_date_of_birth: true,
            required: true
          },
          'profile[operating_system]': {
            minlength: 1,
            required: true
          },
          'profile[about_me]': {
            minlength: 5,
            maxlength: 500,
            required: true
          }
        }
    });


    // $( '#nameNext').click(function() {
    //   alert( "Valid: " + form.valid() );
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


// Slideshow
  $('.bxslider').bxSlider();

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
