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
