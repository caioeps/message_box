import React from "react"
import PropTypes from "prop-types"

import { MessageRow } from "./MessageRow";
import { Uuid } from "../helpers/Uuid";

export const MessageTable = props => {
  const { toggleArchiveMessage, headings, messages, showMessageModal } = props;

  if(messages.length < 1) {
    return (
      <div className="row">
        <div className="col s12">
          <h3 className="center">
            Ops! Parece que não há nada por aqui! :(
          </h3>
        </div>
      </div>
    );
  }

  return (
    <div className="row">
      <div className="col s12">
        <table className="highlight messages-table">
          <thead>
            <tr>
              <th>Remetente</th>
              <th>Assunto</th>
              <th>Enviada em</th>
              <th>Ações</th>
            </tr>
          </thead>
          <tbody>
            {
              messages.map(message => {
                return (
                  <MessageRow
                    toggleArchiveMessage={toggleArchiveMessage}
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

