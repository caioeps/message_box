import React from "react"
import PropTypes from "prop-types"

import { MessageRow } from "./MessageRow";
import { Uuid } from "../helpers/Uuid";

export const MessageTable = props => {
  const { headings, messages } = props;

  return (
    <div className="row">
      <div className="col s12">
        <table className="highlight">
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
                  <MessageRow message={message} key={message.id} />
                );
              })
            }
          </tbody>
        </table>
      </div>
    </div>
  );
}

