$(function() {
  var colors = ['Green', 'Orange', 'Yellow', 'Blue', 'Purple', 'Red'];
  var borders = $('.question-summary');

  borders.each(function() {
    $(this).css("border-color", colors[Math.floor(Math.random() * colors.length)]);
  });
});