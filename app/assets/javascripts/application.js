// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require semantic-ui
//= require turbolinks
//= require_tree .

$(document).ready(function() {



    // fix menu when passed
    $('.masthead')
      .visibility({
        once: false,
        onBottomPassed: function() {
          $('.fixed.menu').transition('fade in');
        },
        onBottomPassedReverse: function() {
          $('.fixed.menu').transition('fade out');
        }
      })
    ;

    // create sidebar and attach to menu open
    $('.ui.sidebar')
      .sidebar('attach events', '.toc.item')
    ;

    //Remove white navigation bar at smaller screen width, toggle vertical and horizontal menus
    $(window).resize(function(){
     if($(window).width()<700){
      $('#fixed').removeClass('visible');
      $('#fixed').addClass('hidden');
      $('#fixedUser').removeClass('fixed');
      $('#fixedUser').addClass('stackable');
     }
    });

    $(window).resize(function(){
     if($(window).width()>700){
      $('#fixedUser').removeClass('stackable');
      $('#fixedUser').addClass('fixed');
     }
    });

    $('.ui.basic.modal').modal('attach events', '.signup', 'show')

  });

    
