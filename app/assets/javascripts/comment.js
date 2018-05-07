$(document).on('ready', function(){
    $("#comments-link").on('click', function(event){
        event.preventDefault();
        $("#comment-section").fadeToggle(500);
        $("#comment_name").focus();
    });
   

});