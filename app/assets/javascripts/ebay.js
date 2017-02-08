

  $(document).on('click', '[data-make-active]', function(ev) {
    event.preventDefault();
    event.stopPropagation();
    $("." + $(this).data("make-active")).parrent().toggleClass('is-active');
  });
