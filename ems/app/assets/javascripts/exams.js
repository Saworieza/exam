$(document).ready(function () {
  $('#select-exam-type').on('change', function (e) {
    var select_clazz = $('#select-exam-clazz');
    var selected = $(this).val();
    if (selected == 'Core') {
      $(select_clazz).removeClass('hidden');
    } else {
      $(select_clazz).addClass('hidden');
    }
  });
});
