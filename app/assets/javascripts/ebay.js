

  $(document).on('click', '[data-make-active]', function(ev) {
    event.preventDefault();
    event.stopPropagation();
    $("." + $(this).data("make-active")).parent().parent().toggleClass('is-active');
  });
