$(document).ready(function () {
  $('.ssin').each(function () {
    $(this).bind('click',function () {
      $('.signin').show();
    });
  });
  $('#dismiss').click(function () {
    $('.signin').hide();
  });
});