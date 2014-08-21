// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require openlayers-rails
//= require js-routes
//= require bootstrap
//= require select2
//= require tracking
//= require jquery_nested_form
//= require_tree .

$(document).ready(function() {
  $(".select-select2").select2();
  $(".select-select2").on("change", function() {
    $container = $(this).prev(".select2-container");
    $container.height($container.children(".select2-choices").height());
  });
});
