import React from "react"
import PropTypes from "prop-types"
import Time from 'react-time'

export class MessageRow extends React.Component {
  _archiveMessage() {
    const { archiveMessage, message } = this.props;
    archiveMessage(message);
  }

  _showMessageModal() {
    const { showMessageModal, message } = this.props;
    showMessageModal(message);
  }

  render(){
    const { message } = this.props;

    return (
      <tr onClick={this._showMessageModal.bind(this)}>
        <td>{message.sender.email}</td>
        <td>{message.subject}</td>
        <td><Time value={message.createdAt} format="DD/MM/YYY"/></td>
        <td>
          <i
            onClick={this._archiveMessage.bind(this)}
            className="material-icons red-text text-lighten-1 tooltipped"
            data-tooltip="Arquivar">
            archive
          </i>
        </td>
      </tr>
    );
  }
}
