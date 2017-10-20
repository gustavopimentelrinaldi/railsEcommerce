//= require jquery3
//= require popper
//= require bootstrap.growl
//= require rails-ujs

$(document).ready(function(){
    $.(document)
    .ajaxStart(function(){
        $('#.global-spin').fadeIn('slow');
    })
    .ajaxStop(function(){
        $.('#global-spin').fadeOut('slow');
    });
});