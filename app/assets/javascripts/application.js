// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require select2
//= require jquery-ui
//= require turbolinks
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datepicker
//= require jquery.validationEngine
//= require jquery.validationEngine-ja
//= require bootstrap-filestyle
//= require_tree .


$(function($){
    $('.input-group.date').datepicker({
        language: 'ja',
        format: "yyyy-mm-dd",
        autoclose: true,
        todayHighlight: true,
        todayBtn: "linked"
    });
});