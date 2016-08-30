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
    ev.preventDefault();
    ev.stopPropagation();

    $('.header-nav').toggleClass('is-open');
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

};

$(document).ready(ready);

$(document).on('page:load', ready);
