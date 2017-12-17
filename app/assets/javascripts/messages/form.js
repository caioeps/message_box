let messageBodyTextArea = $('form.message-form textarea');

if(messageBodyTextArea.length > 0) {
  messageBodyTextArea.froalaEditor({
    placeholderText: 'Digite aqui sua mensagem'
  });
}
