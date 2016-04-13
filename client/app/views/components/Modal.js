'use strict';

import React from 'react';

class Modal extends React.Component {

  constructor(props) {
    super(props);
    this._handleClick = this._handleClick.bind(this);
  }

  _handleClick(e) {
    if (e.target == this.refs.modal) {
      this.props.closeModal();
    }
  }

  render() {
    return ( !this.props.isOpen ? null :
      (
        <div className={this.props.outerClass} onClick={this._handleClick} ref='modal'>
          <div className={this.props.innerClass}>
            {this.props.children}
          </div>
        </div>
      )
    );
  }

}

export default Modal;
