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

  archiveMessage(message) {
    const archiveUrl = '/messages/archives';

    $.ajax({
      method: 'POST',
      url: archiveUrl,
      data: { id: message.id },
      success: response => {
        this.setState((prevState, props) => {
          const { messages } = this.state;
          const messageIndex = messages.indexOf(message);

          messages.splice(messageIndex, 1);

          return {
            messages: messages
          };
        });

        Materialize.toast('Mensagem arquivada!', 3000);
      }
    });
  }

  showMessageModal(message) {
    const messageUrl = `/messages/${message.id}`;
    const { messages } = this.state;

    $.ajax({
      method: 'GET',
      url: messageUrl,
      success: message => {
        this.setState((prevState, props) => {
          return {
            messages: messages.map(msg => {
              if(msg.id === message.id) {
                return { ...msg, read: true};
              } else {
                return msg;
              }
            }),
            currentMessage: message,
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
          archiveMessage={this.archiveMessage.bind(this)}
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
