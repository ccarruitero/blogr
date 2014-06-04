$(function() {
  var comments = {
    init: function() {
      $('#comments-btn').on('click', this.getComments);
    },

    getComments: function() {
      var url = window.location + '/get_comments';
      var that = this;

      $.ajax({
        url: url
      }).success(function(data) {
        for (var i=0; i < data.length; i++) {
          comments.renderComment(data[i]);
        }
      }).fail(function() {
        console.log('oops and error was ocurred');
      });
    },

    renderComment: function(comment) {
      var commentDiv = document.createElement('div');
      var commentWrap = document.getElementById('comments-wrap');
      var commentContent = document.createTextNode(comment.body);

      commentDiv.appendChild(commentContent);
      commentWrap.appendChild(commentDiv);
    }
  }

  comments.init();
});
