import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },
  
  received(data) {
    const html = `<li>${data.content.text}</li>`;
    const comments = document.getElementById("comment-field");
    const newComment = document.getElementById("comment_text");
    comments.insertAdjacentHTML("afterbegin", html);
    newComment.value = "";
  }
});
