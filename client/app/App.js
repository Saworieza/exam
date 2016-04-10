'use strict';

import React from 'react';

class App extends React.Component {
  render() {
    return React.Children.only(this.props.children);
  }
}

export default App;
