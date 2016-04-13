'use strict';

import React from 'react';

import './Loading.css';

class Loading extends React.Component {

  renderLoading() {
    return (<div className='loading-container'><div className='loading'>Loading&#8230;</div></div>);
  }

  render() {
    return this.props.isLoading ? this.renderLoading() : React.Children.only(this.props.children);
  }

}

export default Loading;
