$(document).on('click', '.toggle-section', function(ev) {
  ev.preventDefault();
  ev.stopPropagation();
  $(this).closest('section').toggleClass('is-open expanded');
});

$(document).on('click', '[data-expand]', function(ev) {
  ev.preventDefault();
  ev.stopPropagation();
  $(this).closest('.expanded').toggleClass('is-open');
});

// modals
$(document).on('click', 'html', function(ev) {
  //close and clear the modal
  $('html').toggleClass('has-modal');
  $('#modal').remove();
});



$(document).on('click', '[data-modal="close"]', function(ev) {
  ev.preventDefault();
  ev.stopPropagation();

  $('html').toggleClass('has-modal');
  $('#modal').remove();
});

$(document).on('click', '.expanded', function(ev) {
  ev.preventDefault();
  ev.stopPropagation();
});
