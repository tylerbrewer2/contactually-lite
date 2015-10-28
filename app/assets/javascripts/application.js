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


var comChecker = function(){
  $(".email").each(function(){
    var currentEmail = $(this).text()
    if (currentEmail.substr(currentEmail.length - 4) !== ".com"){
      $(this).parent().fadeOut();
    }
  })
}

var showAll = function(){
  $(".firstName").each(function(){
    $(this).parent().fadeIn();
  })
}

$(document).ready(function(){
  $(".com").click(function(){
    comChecker();
  })

  $(".all").click(function(){
    showAll();
  })
})
