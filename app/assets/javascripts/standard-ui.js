// close is-opened items if not clicked within
$(document).on('click', 'html', function(ev) {
  //Hide the menus if visible
  $('.is-open').toggleClass('is-open');
});

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

$(document).on('click', '.expanded', function(ev) {
  ev.preventDefault();
  ev.stopPropagation();
});

$(document).on('click', '[data-modal="close"]', function(ev) {
  ev.preventDefault();
  ev.stopPropagation();

  $('html').toggleClass('has-modal');
  $('#modal').remove();
});

$(document).on('click', '.advanced', function(ev) {
  ev.preventDefault();
  ev.stopPropagation();

  $(".search").toggleClass('is-open');
});

//this function will toggle the nearest input
$(document).on('click', '[data-checkbox-toggle]', function(ev)) {
  ev.preventDefault();
  ev.stopPropagation();

  $(this).closest('input').).attr('colspan', function(index, attr){
    return attr == 6 ? null : 6;
  });
}

$(document).on('click', '[toggle-price]', function(event){
  ev.preventDefault();
  ev.stopPropagation();

  $(this).html("<%= escape_javascript(render(:partial => 'pages/top_link')) %>");
});
