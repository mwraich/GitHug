

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

  //Front end New Profile Form Validations
  // var profileForm = document.forms[0];
  // console.log(profileForm);
  //
  // profileForm.onsubmit = function processForm(eventHandler) {
  //   eventHandler.preventDefault();
  //
  //
  //   var profileFirstName = profileForm.profile_first_name;
  //   var profileFirstNameValue = profileForm.profile_first_name.value;
  //
  //   var profileLastName = profileForm.profile_last_name;
  //   var profileLastNameValue = profileForm.profile_last_name.value;
  //
  //   var profileLocation = profileForm.profile_location;
  //   var profileLocationValue = profileForm.profile_location.value;
  //
  //   var profileBirthday = profileForm.profile_birthday;
  //   var profileBirthdayValue = profileForm.profile_birthday.value;
  //
  //   // Birthday validation method
  //   function mustBeLegal(birthday) {
  //     var difference = Date.now() - birthday;
  //     var ageYear = new Date(difference);
  //     var age = Math.abs(ageYear.getUTCFullYear() - 1970);
  //     return age;
  //   }
  //   var birthdaydate = Date.parse(profileBirthdayValue);
  //
  //   var age = mustBeLegal(birthdaydate);
  //
  //   // Operating system validation
  //   var radiobuttons = document.getElementsByName('profile[operating_system]');
  //   var i = 0;
  //   while (i < radiobuttons.length) {
  //     if (radiobuttons[i].checked)
  //     var buttonschecked = true;
  //     i++;
  //   }
  //   console.log(buttonschecked)


    //Gender button validation
//     var validateButton = false;
//     $('.gender_validation').each(function(){
//       if ($(this).is(':checked')) {
//         validateButton = true;
//       }
//     });
//
//
//     if (profileFirstNameValue === "" || profileFirstNameValue === null) {
//       var errorFirstName = document.getElementById('errorFirstName');
//       errorFirstName.innerHTML = 'Please Enter First Name!';
//       profileFirstName.focus();
//       errorFirstName.style.color = 'red';
//
//     }else if(profileLastNameValue === "" || profileLastNameValue === null){
//       var errorLastName = document.getElementById('errorLastName');
//       errorLastName.innerHTML = 'Please Enter Last Name!';
//       profileLastName.focus();
//       errorLastName.style.color = 'red';
//
//     }else if(profileLocationValue === "" || profileLocationValue === null){
//       var errorLocation = document.getElementById('errorLocation');
//       errorLocation.innerHTML = 'Please Enter Location!';
//       profileLocation.focus();
//       errorLocation.style.color = 'red';
//
//     }else if(validateButton !== true) {
//       var errorGender = document.getElementById('errorGender');
//       errorGender.innerHTML = 'Please select a Gender';
//       errorGender.focus();
//       errorGender.style.color = 'red';
//
//     }else if(profileBirthdayValue === "" || profileBirthdayValue === null || age < 18){
//       var errorBirthday = document.getElementById('errorBirthday');
//       errorBirthday.innerHTML = 'You must be Eighteen!';
//       profileBirthday.focus();
//       errorBirthday.style.color = 'red';
//
//     }else if(buttonschecked !== true) {
//       var errorOperating = document.getElementById('errorOperating');
//       errorOperating.innerHTML = 'Please choose an Operating System';
//       errorOperating.focus();
//       errorOperating.style.color = 'red';
//     }
//     else{
//       profileForm.submit(function(eventHandler) {
//         return false;
//       });
//   }
//
//   // Gender Validations
//   $('.gender_validation').click(function() {
//     $(this).siblings('input:checkbox').prop('checked', false);
//   });
//

//
