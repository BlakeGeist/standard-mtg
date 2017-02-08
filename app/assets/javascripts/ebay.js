
$(document).on('ready page:load', function() {

  $('[data-activate]').on('click', function(event){
    event.preventDefault();
    event.stopPropagation();
    $("." + $(this).data()).toggleClass('is-active');
  });

});
