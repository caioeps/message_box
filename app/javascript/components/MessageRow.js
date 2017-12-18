import React from "react"
import PropTypes from "prop-types"
import Time from 'react-time'

export class MessageRow extends React.Component {
  _toggleArchiveMessage(event) {
    const { toggleArchiveMessage, message } = this.props;
    event.stopPropagation();
    toggleArchiveMessage(message);
  }

  _showMessageModal(event) {
    const { showMessageModal, message } = this.props;
    event.stopPropagation();
    showMessageModal(message);
  }

  archiveOrUnarchiveIcon() {
    const { message } = this.props;
    return message.archived ? 'unarchive' : 'archive';
  }

  archiveOrUnarchiveTooltipMessage() {
    const { message } = this.props;
    return message.archived ? 'Mover para caixa de entrada' : 'Arquivar';
  }

  render(){
    const { message } = this.props;

    return (
      <tr
        className="message-row"
        onClick={this._showMessageModal.bind(this)}
        data-read={message.read}
      >
        <td>{message.sender.email}</td>
        <td>{message.subject}</td>
        <td><Time value={message.createdAt} format="DD/MM/YYYY"/></td>
        <td className="actions">
          <i
            onClick={this._toggleArchiveMessage.bind(this)}
            className="material-icons red-text text-lighten-1 tooltipped"
            data-tooltip={this.archiveOrUnarchiveTooltipMessage()}>
            {this.archiveOrUnarchiveIcon()}
          </i>
        </td>
      </tr>
    );
  }
}
