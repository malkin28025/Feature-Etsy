// make sure document is ready for jQuery to do its magic
$( document ).ready(function() {
  // hide the review form
  $("#new_review").hide();
  // make it appear in response to clicking on a link
  $("#new_review_link").click(function(event){
    event.preventDefault();
    $("#new_review").slideDown();
  })
});