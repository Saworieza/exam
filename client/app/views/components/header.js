'use strict';

import React from 'react';

import './header.css';

export class InnerTitle extends React.Component {
  render() {
    return (
      <div className='inner-title'>{this.props.children}</div>
    );
  }
}

export class InnerHeader extends React.Component {
  render() {
    return (
      <div className='inner-header'>
        {this.props.children}
      </div>
    );
  }

}

export class InnerContent extends React.Component {
  render() {
    return (
      <div className='inner-content'>
        {this.props.children}
      </div>
    );
  }

}
