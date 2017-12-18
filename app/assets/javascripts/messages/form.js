let messageBodyTextArea = $('form.message-form textarea');

if(messageBodyTextArea.length > 0) {
  CKEDITOR.replace('message[body]');
}
