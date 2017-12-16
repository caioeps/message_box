import React from "react"
import PropTypes from "prop-types"

import { MessageRow } from "./MessageRow";
import { Uuid } from "../helpers/Uuid";

export const MessageTable = props => {
  const { headings, messages } = props;

  return (
    <table className="stripped highlight">
      <thead>
        {
          headings.map(header => {
            return (
              <th>
                <td>{header}</td>
              </th>
            );
          })
        }
      </thead>
      <tbody>
        {
          messages.map(message => {
            return (
              <MessageRow message={message} key={Uuid.generate()} />
            );
          })
        }
      </tbody>
    </table>
  );
}

