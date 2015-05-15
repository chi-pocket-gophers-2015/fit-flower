function flowerPic {

  $('.flower').hide();

  var request = $.ajax({
    method: "post",
    url: "/flower-logic"
  });

  request.success(function(response){
    flowerId = response.flower_id
  });

  $('#' + flowerId).show();

}


$(document).ready(function() {

  var intervalId = window.setInterval(flowerPic, 60000);

  $('#logout-form').submit(function(event){
    clearInterval(intervalId);
  });



});
