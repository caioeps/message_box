import React from "react";
import PropTypes from "prop-types";
import ReactModal from "react-modal";


export const MessageShowModal = props => {
  const { dismissMessageModal, message } = props;

  if(!!message) {
    return (
      <ReactModal
        ariaHideApp={false}
        contentLabel={message && message.subject}
        isOpen={!!message}
        style={{
          overlay: {
            'margin-left': '300px'
          }
        }}
      >
        <h2>{message.subject}</h2>
        <p>{message.body}</p>
        <button
          className="btn red"
          onClick={dismissMessageModal}>
          Fechar
        </button>
      </ReactModal>
    );
  } else {
    return null;
  }
}


