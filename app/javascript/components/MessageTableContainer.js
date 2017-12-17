import React from "react"
import PropTypes from "prop-types"

import { MessageTable } from './MessageTable';

export default class MessageTableContainer extends React.Component {
  constructor(props) {
    super();
    this.state = { messages: props.messages }
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
      }
    });
  }

  render () {
    const { headings } = this.props;
    const { messages } = this.state;

    return (
      <MessageTable
        archiveMessage={this.archiveMessage.bind(this)}
        messages={messages}
        headings={headings}
      />
    );
  }
}
