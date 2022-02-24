$( document ).ready(function() {
  Shiny.addCustomMessageHandler(
  'update_background', function(message) {
    $('body').css({
      'background-image':'url(' + message +')', 
      'background-repeat':'repeat',
      'background-attachment':'fixed'
    });
});
});
