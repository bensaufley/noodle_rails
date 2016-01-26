(function($) {
  'use strict';

  var addOption = function() {
    var optText = prompt('Enter new option\'s text:'),
        $this = $(this);
    if (!!optText) {
      $.ajax({
        url: $this.data('path'),
        type: 'post',
        data: {
          option: {
            text: optText
          }
        },
        success: function(data) {
          $this.closest('.noodle').replaceWith(data.html);
        }
      })
    }
  };

  $(function() {
    $('main')
      .on('click tap', '#add-option', addOption)
      .on('ajax:success', '.noodle', function(e, data) {
        if (data.html) { $(e.target).closest('.noodle').replaceWith(data.html); }
      })
  });
})(jQuery);
