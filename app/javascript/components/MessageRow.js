import React from "react"
import PropTypes from "prop-types"

export const MessageRow = props => {
  const { message } = props;

  return (
    <tr>
      <td>{message.sender}</td>
      <td>{message.subject}</td>
      <td>{message.body}</td>
      <td>{message.createdAt}</td>
    </tr>
  );
}
