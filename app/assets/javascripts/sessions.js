$(document).on('page:load ready', function() {
  $(function(){
      $(".logoTyped").typed({
        strings: ["GitHub", "GitHug^1000<br>Are you DTC?^1000 <br>DTC: Down to code.^1000<br>Login now."],
        typeSpeed: 100,
        cursorChar: "",
        backDelay: 1000
      });
  });

  $(".power-icon").hide().delay(12000).queue(function(n) {
    $(this).show(); n();
  });

});
