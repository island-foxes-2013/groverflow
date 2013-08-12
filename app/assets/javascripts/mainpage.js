$(function() {
  var borderColors = ['Green', 'Orange', 'Blue', 'Purple', 'Red'];
  var backgroundColors = ['rgb(0, 204, 0)', 'rgb(255, 192, 77)', 'rgb(153, 153, 255)', 'rgb(230, 0, 230)', 'rgb(255, 117, 117)'];
  var borders = $('.question-summary');

  borders.each(function() {
    var colorIndex = Math.floor(Math.random() * borderColors.length);
    $(this).css("border-color", borderColors[colorIndex]);
    $(this).css("background-color", backgroundColors[colorIndex]);
  });

  // $('form').each(function() {
  //   var colorIndex = Math.floor(Math.random() * borderColors.length);
  //   $(this).css("background-color", backgroundColors[colorIndex]);
  // });
});
