import React from "react"
import PropTypes from "prop-types"

import { MessageTable } from './MessageTable';

export default class MessageTableContainer extends React.Component {
  constructor(props) {
    super();
    this.state = { messages: props.messages }
  }

  render () {
    const { headings } = this.props;
    const { messages } = this.state;

    return (
      <MessageTable
        messages={messages}
        headings={headings}
      />
    );
  }
}
