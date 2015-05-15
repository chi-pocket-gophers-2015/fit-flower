function flowerPic() {

  var request = $.ajax({
    method: "post",
    url: "/flower-logic"
  });

  request.success(function(response){
    console.log(response);
    $('.flower').hide();
    $('#' + response.flower_id).show();
    $('#goal').html(response.goal);
    $('#burned').html(response.burned);
  });

}


$(document).ready(function() {
  $('.flower').hide();

  flowerPic();
  var intervalId = window.setInterval(function(){flowerPic();}, 60000);

  $('#logout-form').submit(function(event){
    clearInterval(intervalId);
  });



});
