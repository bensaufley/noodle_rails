//= require jquery
//= require jquery_ujs
//= require noodles
//= require_self

(function($) {
  'use strict';

  $.ajaxSetup({
    dataType: 'json'
  });

  $(function() {
    $('<link>', {
      rel: 'stylesheet',
      href: 'https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'
    }).appendTo(document.body);
  });
})(jQuery);
