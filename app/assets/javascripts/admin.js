$(document).on('click', '.add-set-to-starndard', function(ev) {
  ev.preventDefault();
  ev.stopPropagation();
  $(this).parent().submit();
});
