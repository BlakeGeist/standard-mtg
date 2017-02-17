// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require tinymce

$(document).on('ready page:load', function() {

  $('#openMobileMenuLink').on('click', function(ev) {
    ev.preventDefault();
    ev.stopPropagation();

    $('.header-nav').toggleClass('is-open');
  });

  $('.quick-menu-control').on('click', function(ev) {
    $('.quick-menu').toggleClass('is-open');

    ev.preventDefault();
    ev.stopPropagation();
  });

  // i had to go up to this level because content that was being loaded after the intial load was not firing anything
  $(document).on('change', '.pcard_checkbox', function(ev){
    $(this).closest(".add-to-collection").toggleClass('hide-add');
  });

  $(document).on('change', '.add-to-collection-amount', function(ev){
    //on select change
    $(this).closest('form').trigger('submit');
  });

  // resize menu after scroll down
  $(function() {
    $(window).scroll(function() {
      if ($(this).scrollTop() > 100) /* .header-top height */ {
        $('body').addClass('scrolled');
      } else {
        $('body').removeClass('scrolled');
      }
    });
  });

});

// close is-opened items if not clicked within
$(document).on('click', 'html', function(ev) {
  //Hide the menus if visible
  $('.is-open').toggleClass('is-open');
});

$(document).on('click', '.advanced', function(ev) {
  ev.preventDefault();
  ev.stopPropagation();

  $(".search").toggleClass('is-open');
});
