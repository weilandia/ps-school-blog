// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require quill.global
//= require_tree .

$(document).on('turbolinks:load', function() {
  $(".js-heart-post").click(function(e) {
    e.preventDefault();
    $.ajax({
      method: "POST",
      url: $(this).data("url"),
      success: function(data) {
        var likeCount = data.post.like_count;
        $(".js-heart-count").text(likeCount);

        $(".fa-heart-o").removeClass("fa-heart-o").addClass("fa-heart");
      }
    });
  });
});
