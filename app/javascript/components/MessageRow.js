import React from "react"
import PropTypes from "prop-types"
import Time from 'react-time'

export const MessageRow = props => {
  const { message } = props;

  return (
    <tr>
      <td>{message.sender.email}</td>
      <td>{message.subject}</td>
      <td><Time value={message.createdAt} format="DD/MM/YYY"/></td>
      <td>
        <a
          href={`/messages/${message.id}/archive`}
          className="red-text text-lighten-1 tooltipped"
          data-method="patch"
          data-tooltip="Arquivar">
          <i className="material-icons">archive</i>
        </a>
      </td>
    </tr>
  );
}
