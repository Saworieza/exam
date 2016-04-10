'use strict';

/* global window, document */
import React from 'react';
import ReactDOM from 'react-dom';
import Root from './Root';
import configureStore from './store';
import { actions } from './actions/login';

//To enable React extension
window.React = React;

//Reset css
import 'normalize.css';

const store = configureStore();

//Persistent authentication
let token = localStorage.getItem('token');
if (token !== null) {
  store.dispatch(actions.successfulLogin(token, window.location.pathname));
}

ReactDOM.render(
  <Root store={store} />,
  document.getElementById('app')
);
