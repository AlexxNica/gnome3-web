$(document).ready(function() {
  $('.video-splash').hide();
  $('#slick-show').click(function() {
    $('.video-splash').show();
    $('#splash').hide();
    return false;
  });
});
