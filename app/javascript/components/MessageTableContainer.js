import React from "react"
import PropTypes from "prop-types"

import { MessageTable } from './MessageTable';
import { MessageShowModal } from './MessageShowModal';

export default class MessageTableContainer extends React.Component {
  constructor(props) {
    super();
    this.state = {
      messages: props.messages,
      currentMessage: null,
    }
  }

  toggleArchiveMessage(message) {
    const toggleArchiveUrl = `/messages/archives/toggle/${message.id}`;

    $.ajax({
      method: 'PATCH',
      url: toggleArchiveUrl,
      data: { id: message.id },
      success: messageFromServer => {
        this.setState((prevState, props) => {
          const { messages } = this.state;
          const messageIndex = messages.indexOf(message);

          messages.splice(messageIndex, 1);

          return {
            messages: messages
          };
        });

        Materialize
          .toast(
            this.toggleArchiveMessageToastMessage(messageFromServer),
            3000);
      }
    });
  }

  toggleArchiveMessageToastMessage(message) {
    return message.archived ?
      'Mensagem arquivada' : 'Mensagem enviada para caixa de entrada';
  }

  showMessageModal(message) {
    const messageUrl = `/messages/${message.id}`;
    const { messages } = this.state;

    $.ajax({
      method: 'GET',
      url: messageUrl,
      success: messageFromServer => {
        this.setState((prevState, props) => {
          return {
            messages: messages.map(msg => {
              if(msg.id === messageFromServer.id) {
                return { ...msg, read: messageFromServer.read };
              } else {
                return msg;
              }
            }),
            currentMessage: messageFromServer,
          };
        });
      }
    });
  }

  dismissMessageModal() {
    this.setState({ currentMessage: null });
  }

  render () {
    const { headings } = this.props;
    const { currentMessage, messages } = this.state;

    return (
      <div>
        <MessageTable
          toggleArchiveMessage={this.toggleArchiveMessage.bind(this)}
          messages={messages}
          headings={headings}
          showMessageModal={this.showMessageModal.bind(this)}
        />
        <MessageShowModal
          dismissMessageModal={this.dismissMessageModal.bind(this)}
          message={currentMessage}
        />
      </div>
    );
  }
}
