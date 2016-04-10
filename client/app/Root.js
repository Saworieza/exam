import React from 'react';
import { Provider } from 'react-redux';
import { ReduxRouter } from 'redux-react-router';
import routes from './routes';
import DevTools from './utils/DevTools';

export default class Root extends React.Component {

  constructor() {
    super();
  }

  renderDebug() {
    if (__DEVTOOLS__) {
      return (
        <DevTools />
      );
    } else {
      return null;
    }
  }

  render() {
    return (<Provider store={this.props.store}>
        <div>
          <ReduxRouter>
            {routes}
          </ReduxRouter>
          {this.renderDebug()}
        </div>
      </Provider>);
  }

}
