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
//= require turbolinks
//= require_tree .

var ready = function() {
  $('#openMobileMenuLink').on('click', function(ev) {
    $('.header-nav').toggleClass('is-open');

    ev.preventDefault();
    ev.stopPropagation();
  });

  $('.advanced').on('click', function(ev) {
    $('.search').toggleClass('is-open');

    ev.preventDefault();
    ev.stopPropagation();
  });

$('.quick-menu-control').on('click', function(ev) {
  $('.quick-menu').toggleClass('is-open');

  ev.preventDefault();
  ev.stopPropagation();
});



  $('.expanded').click(function(event){
       event.stopPropagation();
  });

  // close is-opened items if not clicked within
  $('html').click(function() {
    //Hide the menus if visible
    $('.is-open').removeClass('is-open');
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

  //this is not used
  $('.arrowRight').on("click", function(ev) {
    $setId = $(this).parent().parent().data('setId')
    var $thisSetWrapper = $('[data-set-id=' + $setId + '] .cards-container');
    var $thisMarginDistance = parseInt(($thisSetWrapper).css('marginLeft'));
    var $thisContainerRightClickCount = Math.abs($thisMarginDistance) / 228

    $thisSetWrapper.animate({'marginLeft': '-=228px'});
    ev.preventDefault();
    ev.stopPropagation();

    if ($thisContainerRightClickCount === 2) {
      $.getScript($('[data-set-id=' + $setId + '] .pagination .next_page').attr('href'));
    } else if ($thisContainerRightClickCount % 10 === 0) {
      $.getScript($('[data-set-id=' + $setId + '] .pagination .next_page').attr('href'));
    }
  });

  //this is not used
  $('.arrowLeft').on("click", function(ev) {
    ev.preventDefault();
    ev.stopPropagation();

    var $thisSetWrapper = $('[data-set-id=' + $setId + '] .cards-container');
    var $thisMarginDistance = parseInt(($thisSetWrapper).css('marginLeft'));

    if ($thisMarginDistance < 0) {
      $thisSetWrapper.animate({'marginLeft': '+=228px'});
    }
  });

};

$(document).ready(ready);

$(document).on('page:load', ready);
