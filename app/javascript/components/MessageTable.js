import React from "react"
import PropTypes from "prop-types"

import { MessageRow } from "./MessageRow";
import { Uuid } from "../helpers/Uuid";

export const MessageTable = props => {
  const { archiveMessage, headings, messages, showMessageModal } = props;

  return (
    <div className="row">
      <div className="col s12">
        <table className="highlight messages-table">
          <thead>
            <tr>
              {
                headings.map(header => {
                  return (
                    <th key={header}>{header}</th>
                  );
                })
              }
            </tr>
          </thead>
          <tbody>
            {
              messages.map(message => {
                return (
                  <MessageRow
                    archiveMessage={archiveMessage}
                    key={message.id}
                    message={message}
                    showMessageModal={showMessageModal}
                  />
                );
              })
            }
          </tbody>
        </table>
      </div>
    </div>
  );
}

