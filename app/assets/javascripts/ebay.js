$(document).on('click', '[data-make-active]', function(ev) {
  event.preventDefault();
  event.stopPropagation();
  $(this).parent().parent().toggleClass('is-active');
});
