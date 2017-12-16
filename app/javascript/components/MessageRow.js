import React from "react"
import PropTypes from "prop-types"
import Time from 'react-time'

export const MessageRow = props => {
  const { message } = props;

  return (
    <tr>
      <td>{message.senderId}</td>
      <td>{message.subject}</td>
      <td><Time value={message.createdAt} format="DD/MM/YYY"/></td>
    </tr>
  );
}
