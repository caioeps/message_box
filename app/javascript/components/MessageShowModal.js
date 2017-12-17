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
        }}>
        <div className="container-fluid">
          <div className="row">
            <div className="col s12">
              <button
                className="btn red right"
                onClick={dismissMessageModal}>
                Fechar
              </button>
            </div>
          </div>
          <div className="row">
            <div className="col s12">
              <h2>{message.subject}</h2>
              <div className="divider" />
              <p>{message.body}</p>
            </div>
          </div>
          <div className="row">
            <div className="col s12 center">
              <button
                className="btn red"
                onClick={dismissMessageModal}>
                OK
              </button>
            </div>
          </div>
        </div>
      </ReactModal>
    );
  } else {
    return null;
  }
}


