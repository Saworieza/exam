$(document).ready(function (){
  $('#select-exam-type-search').on('change', function (e) {
    var select_clazz = $('#select-result');
    var selected = $(this).val();
    console.log(selected);
    if (selected == "" || selected == undefined) {
      $(select_clazz).addClass('hidden');
    } else {
      $(select_clazz).removeClass('hidden');
    }
  });
});
