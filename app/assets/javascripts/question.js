$(document).ready(function() {
  var id_objects = $('.answer_id')
  var ids = []
  for (var i = 0; i < id_objects.length; i++){
    ids.push($(id_objects[i]).text());
  }

  $.ajax({
    url: '/answer_comments',
    data: ids,
    dataType: 'json',
    type: 'post'
  }).done(function(e){
    console.log("he")
    console.log(e);
  });
});
