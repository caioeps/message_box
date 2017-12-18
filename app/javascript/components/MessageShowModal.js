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
        isOpen={!!message}>
        <div className="container-fluid">
          <div className="row">
            <div className="col s12 m8">
              <h2>
                {message.subject}
              </h2>
            </div>
            <div className="col s12 m4">
              <button
                className="waves-effect waves-teal btn-flat btn-flat right"
                onClick={dismissMessageModal}>
                <i className="material-icons text-lighten-2 deep-purple-text">close</i>
              </button>
            </div>
          </div>
          <div className="row">
            <div className="col s12">
              <p className="small">
                {message.sender.email}
              </p>
              <div className="divider" />
              <p dangerouslySetInnerHTML={{__html: message.body}} />
            </div>
          </div>
          <div className="row">
            <div className="col s12 center">
              <button
                className="lighten-2 deep-purple btn"
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


