
$(document).on('ready page:load', function() {

  $('[data-make-active]').on('click', function(event){
    event.preventDefault();
    event.stopPropagation();
    $("." + $(this).data()).toggleClass('is-active');
  });

});
